import 'dart:typed_data';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:house_organizer/core/constants/app_constants.dart';

class FirebaseService {
  static FirebaseService? _instance;
  static FirebaseService get instance => _instance ??= FirebaseService._();

  FirebaseService._();

  bool _isInitialized = false;

  // Firebase instances
  FirebaseAuth get auth => FirebaseAuth.instance;
  FirebaseFirestore get firestore => FirebaseFirestore.instance;
  FirebaseMessaging get messaging => FirebaseMessaging.instance;
  FirebaseStorage get storage => FirebaseStorage.instance;

  // Collections
  CollectionReference get usersCollection =>
      firestore.collection(AppConstants.usersCollection);
  CollectionReference get housesCollection =>
      firestore.collection(AppConstants.housesCollection);
  CollectionReference get tasksCollection =>
      firestore.collection(AppConstants.tasksCollection);
  CollectionReference get listsCollection =>
      firestore.collection(AppConstants.listsCollection);
  CollectionReference get auditLogsCollection =>
      firestore.collection(AppConstants.auditLogsCollection);

  Future<void> initialize() async {
    if (_isInitialized) return;

    await Firebase.initializeApp();

    // Configure Firestore settings for Canadian region
    firestore.settings = const Settings(
      persistenceEnabled: true,
      cacheSizeBytes: Settings.CACHE_SIZE_UNLIMITED,
    );

    // Configure Firebase Storage for Canadian region
    storage.useStorageEmulator('localhost', 9199);

    _isInitialized = true;
  }

  // Auth methods
  Future<UserCredential> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    return await auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<UserCredential> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    return await auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<void> signOut() async {
    await auth.signOut();
  }

  Future<void> sendPasswordResetEmail(String email) async {
    await auth.sendPasswordResetEmail(email: email);
  }

  // Firestore methods
  Future<DocumentSnapshot> getDocument(String collection, String id) async {
    return await firestore.collection(collection).doc(id).get();
  }

  Future<QuerySnapshot> getCollection(
    String collection, {
    Query Function(Query)? queryBuilder,
    int? limit,
  }) async {
    Query query = firestore.collection(collection);

    if (queryBuilder != null) {
      query = queryBuilder(query);
    }

    if (limit != null) {
      query = query.limit(limit);
    }

    return await query.get();
  }

  Future<DocumentReference> addDocument(
    String collection,
    Map<String, dynamic> data,
  ) async {
    return await firestore.collection(collection).add(data);
  }

  Future<void> setDocument(
    String collection,
    String id,
    Map<String, dynamic> data,
  ) async {
    await firestore.collection(collection).doc(id).set(data);
  }

  Future<void> updateDocument(
    String collection,
    String id,
    Map<String, dynamic> data,
  ) async {
    await firestore.collection(collection).doc(id).update(data);
  }

  Future<void> deleteDocument(String collection, String id) async {
    await firestore.collection(collection).doc(id).delete();
  }

  // Real-time listeners
  Stream<QuerySnapshot> listenToCollection(
    String collection, {
    Query Function(Query)? queryBuilder,
    int? limit,
  }) {
    Query query = firestore.collection(collection);

    if (queryBuilder != null) {
      query = queryBuilder(query);
    }

    if (limit != null) {
      query = query.limit(limit);
    }

    return query.snapshots();
  }

  Stream<DocumentSnapshot> listenToDocument(String collection, String id) {
    return firestore.collection(collection).doc(id).snapshots();
  }

  // Messaging methods
  Future<String?> getToken() async {
    return await messaging.getToken();
  }

  Future<void> subscribeToTopic(String topic) async {
    await messaging.subscribeToTopic(topic);
  }

  Future<void> unsubscribeFromTopic(String topic) async {
    await messaging.unsubscribeFromTopic(topic);
  }

  // Storage methods
  Future<String> uploadFile(String path, Uint8List data) async {
    final ref = storage.ref().child(path);
    final uploadTask = ref.putData(data);
    final snapshot = await uploadTask;
    return await snapshot.ref.getDownloadURL();
  }

  Future<void> deleteFile(String path) async {
    final ref = storage.ref().child(path);
    await ref.delete();
  }
}
