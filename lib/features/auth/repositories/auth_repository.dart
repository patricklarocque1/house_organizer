import 'dart:math';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;

import 'package:house_organizer/core/services/firebase_service.dart';
import 'package:house_organizer/core/services/hive_service.dart';
import 'package:house_organizer/data/models/user.dart';
import 'package:house_organizer/data/models/house.dart';
import 'package:house_organizer/core/constants/app_constants.dart';
import 'package:house_organizer/core/logging.dart';

class AuthRepository {
  final FirebaseService _firebaseService = FirebaseService.instance;
  final HiveService _hiveService = HiveService.instance;
  final _log = buildLogger();

  // Auth state stream
  Stream<firebase_auth.User?> get authStateChanges {
    _log.d('🔐 AuthRepository: Getting auth state changes stream');
    final stream = _firebaseService.auth.authStateChanges();
    return stream.map((user) {
      _log.d(
          '🔐 AuthRepository: Auth state stream emitted - User: ${user?.uid ?? 'null'}');
      return user;
    });
  }

  // Current user
  firebase_auth.User? get currentUser => _firebaseService.auth.currentUser;

  // Sign in with email and password
  Future<User> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      _log.d('🔐 AuthRepository: Starting sign in with email: $email');
      final credential = await _firebaseService.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (credential.user == null) {
        _log.d('🔐 AuthRepository: Sign in failed - no user returned');
        throw Exception('Sign in failed');
      }

      _log.d(
          '🔐 AuthRepository: Firebase sign in successful, user ID: ${credential.user!.uid}');

      // Get user data from Firestore
      _log.d('🔐 AuthRepository: Fetching user data from Firestore');
      final userDoc = await _firebaseService.getDocument(
        AppConstants.usersCollection,
        credential.user!.uid,
      );

      if (!userDoc.exists) {
        _log.d('🔐 AuthRepository: User data not found in Firestore');
        throw Exception('User data not found');
      }

      final userData = userDoc.data() as Map<String, dynamic>;
      final userModel = User.fromJson(userData);
      _log.d(
          '🔐 AuthRepository: User data loaded: ${userModel.displayName} (${userModel.role})');

      // Cache user data locally
      _log.d('🔐 AuthRepository: Caching user data locally');
      await _hiveService.usersBox.put(userModel.id, userModel);
      _log.d('🔐 AuthRepository: User data cached successfully');

      return userModel;
    } catch (e) {
      _log.d('🔐 AuthRepository: Sign in failed: $e');
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
      _log.d('🔐 AuthRepository: Getting current user data');
      final user = currentUser;
      _log.d('🔐 AuthRepository: Current Firebase user: ${user?.uid ?? 'null'}');
      if (user == null) return null;

      // Try to get from local cache first
      _log.d('🔐 AuthRepository: Checking local cache for user ${user.uid}');
      final cachedUser = _hiveService.usersBox.get(user.uid);
      if (cachedUser != null) {
        _log.d(
            '🔐 AuthRepository: Found cached user: ${cachedUser.displayName}');
        return cachedUser;
      }

      // Get from Firestore
      _log.d('🔐 AuthRepository: Fetching user from Firestore');
      final userDoc = await _firebaseService.getDocument(
        AppConstants.usersCollection,
        user.uid,
      );

      if (!userDoc.exists) {
        _log.d('🔐 AuthRepository: User document does not exist in Firestore');
        return null;
      }

      final userData = userDoc.data() as Map<String, dynamic>;
      final userModel = User.fromJson(userData);
      _log.d(
          '🔐 AuthRepository: Loaded user from Firestore: ${userModel.displayName} (${userModel.role})');

      // Cache locally
      _log.d('🔐 AuthRepository: Caching user data locally');
      await _hiveService.usersBox.put(userModel.id, userModel);
      _log.d('🔐 AuthRepository: User data cached successfully');

      return userModel;
    } catch (e) {
      _log.d('🔐 AuthRepository: Error getting current user data: $e');
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

      final docRef = _firebaseService.firestore
          .collection(AppConstants.housesCollection)
          .doc();
      final createdHouse = house.copyWith(id: docRef.id);
      await _firebaseService.setDocument(
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
    final secureRandom = Random.secure();
    final buffer = StringBuffer();

    for (int i = 0; i < 6; i++) {
      buffer.write(chars[secureRandom.nextInt(chars.length)]);
    }

    return buffer.toString();
  }
}
