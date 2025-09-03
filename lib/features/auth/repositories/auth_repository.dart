import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;

import 'package:house_organizer/core/services/firebase_service.dart';
import 'package:house_organizer/core/services/hive_service.dart';
import 'package:house_organizer/data/models/user.dart';
import 'package:house_organizer/data/models/house.dart';
import 'package:house_organizer/core/constants/app_constants.dart';

class AuthRepository {
  final FirebaseService _firebaseService = FirebaseService.instance;
  final HiveService _hiveService = HiveService.instance;

  // Auth state stream
  Stream<firebase_auth.User?> get authStateChanges => _firebaseService.auth.authStateChanges();

  // Current user
  firebase_auth.User? get currentUser => _firebaseService.auth.currentUser;

  // Sign in with email and password
  Future<User> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await _firebaseService.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (credential.user == null) {
        throw Exception('Sign in failed');
      }

      // Get user data from Firestore
      final userDoc = await _firebaseService.getDocument(
        AppConstants.usersCollection,
        credential.user!.uid,
      );

      if (!userDoc.exists) {
        throw Exception('User data not found');
      }

      final userData = userDoc.data() as Map<String, dynamic>;
      final userModel = User.fromJson(userData);

      // Cache user data locally
      await _hiveService.usersBox.put(userModel.id, userModel);

      return userModel;
    } catch (e) {
      throw Exception('Sign in failed: ${e.toString()}');
    }
  }

  // Create user with email and password
  Future<User> createUserWithEmailAndPassword({
    required String email,
    required String password,
    required String displayName,
    required String houseId,
    required UserRole role,
  }) async {
    try {
      final credential = await _firebaseService.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (credential.user == null) {
        throw Exception('User creation failed');
      }

      // Create user document in Firestore
      final userModel = User(
        id: credential.user!.uid,
        email: email,
        displayName: displayName,
        houseId: houseId,
        role: role,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        isActive: true,
      );

      await _firebaseService.setDocument(
        AppConstants.usersCollection,
        userModel.id,
        userModel.toJson(),
      );

      // Cache user data locally
      await _hiveService.usersBox.put(userModel.id, userModel);

      return userModel;
    } catch (e) {
      throw Exception('User creation failed: ${e.toString()}');
    }
  }

  // Sign out
  Future<void> signOut() async {
    try {
      await _firebaseService.signOut();
      await _hiveService.clearAllData();
    } catch (e) {
      throw Exception('Sign out failed: ${e.toString()}');
    }
  }

  // Send password reset email
  Future<void> sendPasswordResetEmail(String email) async {
    try {
      await _firebaseService.sendPasswordResetEmail(email);
    } catch (e) {
      throw Exception('Password reset failed: ${e.toString()}');
    }
  }

  // Get current user data
  Future<User?> getCurrentUserData() async {
    try {
      final user = currentUser;
      if (user == null) return null;

      // Try to get from local cache first
      final cachedUser = _hiveService.usersBox.get(user.uid);
      if (cachedUser != null) return cachedUser;

      // Get from Firestore
      final userDoc = await _firebaseService.getDocument(
        AppConstants.usersCollection,
        user.uid,
      );

      if (!userDoc.exists) return null;

      final userData = userDoc.data() as Map<String, dynamic>;
      final userModel = User.fromJson(userData);

      // Cache locally
      await _hiveService.usersBox.put(userModel.id, userModel);

      return userModel;
    } catch (e) {
      return null;
    }
  }

  // Update user profile
  Future<void> updateUserProfile(User user) async {
    try {
      await _firebaseService.updateDocument(
        AppConstants.usersCollection,
        user.id,
        user.toJson(),
      );

      // Update local cache
      await _hiveService.usersBox.put(user.id, user);
    } catch (e) {
      throw Exception('Profile update failed: ${e.toString()}');
    }
  }

  // Join house with join code
  Future<void> joinHouse(String joinCode, String userId) async {
    try {
      // Find house by join code
      final housesQuery = await _firebaseService.getCollection(
        AppConstants.housesCollection,
        queryBuilder: (query) => query.where('joinCode', isEqualTo: joinCode),
      );

      if (housesQuery.docs.isEmpty) {
        throw Exception('Invalid join code');
      }

      final houseDoc = housesQuery.docs.first;
      final houseData = houseDoc.data() as Map<String, dynamic>;
      final house = House.fromJson(houseData);

      // Update user's house ID
      final userDoc = await _firebaseService.getDocument(
        AppConstants.usersCollection,
        userId,
      );

      if (!userDoc.exists) {
        throw Exception('User not found');
      }

      final userData = userDoc.data() as Map<String, dynamic>;
      final user = User.fromJson(userData);

      final updatedUser = user.copyWith(
        houseId: house.id,
        updatedAt: DateTime.now(),
      );

      await updateUserProfile(updatedUser);

      // Add user to house residents list
      final updatedResidents = List<String>.from(house.residentIds ?? []);
      if (!updatedResidents.contains(userId)) {
        updatedResidents.add(userId);
      }

      final updatedHouse = house.copyWith(
        residentIds: updatedResidents,
        updatedAt: DateTime.now(),
      );

      await _firebaseService.updateDocument(
        AppConstants.housesCollection,
        house.id,
        updatedHouse.toJson(),
      );
    } catch (e) {
      throw Exception('Failed to join house: ${e.toString()}');
    }
  }

  // Create new house
  Future<House> createHouse({
    required String name,
    required String address,
    required String createdBy,
    String? description,
    String? phoneNumber,
    String? email,
  }) async {
    try {
      // Generate unique join code
      final joinCode = _generateJoinCode();

      final house = House(
        id: '', // Will be set by Firestore
        name: name,
        address: address,
        joinCode: joinCode,
        createdBy: createdBy,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        description: description,
        phoneNumber: phoneNumber,
        email: email,
        isActive: true,
      );

      final docRef = await _firebaseService.addDocument(
        AppConstants.housesCollection,
        house.toJson(),
      );

      final createdHouse = house.copyWith(id: docRef.id);

      // Update the document with the correct ID
      await _firebaseService.updateDocument(
        AppConstants.housesCollection,
        docRef.id,
        createdHouse.toJson(),
      );

      // Cache locally
      await _hiveService.housesBox.put(createdHouse.id, createdHouse);

      return createdHouse;
    } catch (e) {
      throw Exception('Failed to create house: ${e.toString()}');
    }
  }

  // Generate unique join code
  String _generateJoinCode() {
    const chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
    final random = DateTime.now().millisecondsSinceEpoch;
    final code = StringBuffer();
    
    for (int i = 0; i < 6; i++) {
      code.write(chars[random % chars.length]);
    }
    
    return code.toString();
  }
}
