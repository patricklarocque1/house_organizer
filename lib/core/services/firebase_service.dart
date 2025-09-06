import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:house_organizer/core/constants/app_constants.dart';
import 'package:house_organizer/firebase_options.dart';
import 'package:house_organizer/core/config/emulator_config.dart';
import 'package:house_organizer/core/logging.dart';

class FirebaseService {
  static FirebaseService? _instance;
  static FirebaseService get instance => _instance ??= FirebaseService._();

  FirebaseService._();

  bool _isInitialized = false;
  final _log = buildLogger();

  // Firebase instances
  FirebaseAuth get auth {
    _log.d('🔥 FirebaseService: Getting auth instance, initialized: $_isInitialized');
    return FirebaseAuth.instance;
  }

  FirebaseFirestore get firestore {
    _log.d('🔥 FirebaseService: Getting firestore instance, initialized: $_isInitialized');
    return FirebaseFirestore.instance;
  }

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

  Future<void> initialize({EmulatorConfig? emulator}) async {
    _log.d('🔥 FirebaseService: Initializing Firebase');
    if (_isInitialized) {
      _log.d('🔥 FirebaseService: Already initialized');
      return;
    }

    // Use generated options to ensure correct config across platforms (incl. web)
    _log.d('🔥 FirebaseService: Initializing Firebase app');
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    _log.d('🔥 FirebaseService: Firebase app initialized');

    // Use emulators when explicitly enabled
    final enableEmulators = emulator?.useFirebaseEmulators ?? false;
    if (enableEmulators) {
      // Choose host based on platform
      String host = emulator?.hostDesktop ?? 'localhost';
      if (!kIsWeb && defaultTargetPlatform == TargetPlatform.android) {
        host = emulator?.hostAndroidEmulator ?? '10.0.2.2';
      } else if (!kIsWeb && defaultTargetPlatform == TargetPlatform.iOS) {
        host = emulator?.hostIOSSimulator ?? 'localhost';
      }
      try {
        firestore.useFirestoreEmulator(host, emulator?.firestorePort ?? 8080);
      } catch (_) {}
      try {
        auth.useAuthEmulator(host, emulator?.authPort ?? 9099);
      } catch (_) {}
      try {
        storage.useStorageEmulator(host, emulator?.storagePort ?? 9199);
      } catch (_) {}
    }

    // Configure Firestore settings for Canadian region
    firestore.settings = const Settings(
      persistenceEnabled: true,
      cacheSizeBytes: Settings.CACHE_SIZE_UNLIMITED,
    );

    // Additional storage/firestore configuration can go here

    _isInitialized = true;
    _log.d('🔥 FirebaseService: Initialization complete');
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
