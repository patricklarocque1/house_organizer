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

    try {
      // Use generated options to ensure correct config across platforms (incl. web)
      _log.d('🔥 FirebaseService: Initializing Firebase app');
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );
      _log.d('🔥 FirebaseService: Firebase app initialized');

      // Use emulators when explicitly enabled
      final enableEmulators = emulator?.useFirebaseEmulators ?? false;
      if (enableEmulators) {
        await _initializeEmulators(emulator!);
      }

      // Configure Firestore settings for Canadian region
      firestore.settings = const Settings(
        persistenceEnabled: true,
        cacheSizeBytes: Settings.CACHE_SIZE_UNLIMITED,
      );

      // Verify connection health
      await _verifyConnection();

      _isInitialized = true;
      _log.d('🔥 FirebaseService: Initialization complete');
    } catch (e) {
      _log.e('🔥 FirebaseService: Initialization failed: $e');
      // Initialize offline mode as fallback
      await _initializeOfflineMode();
      _isInitialized = true;
    }
  }

  Future<void> _initializeEmulators(EmulatorConfig emulator) async {
    try {
      // Choose host based on platform
      String host = emulator.hostDesktop;
      if (!kIsWeb && defaultTargetPlatform == TargetPlatform.android) {
        host = emulator.hostAndroidEmulator;
      } else if (!kIsWeb && defaultTargetPlatform == TargetPlatform.iOS) {
        host = emulator.hostIOSSimulator;
      }

      _log.d('🔥 FirebaseService: Connecting to emulators at $host');
      
      try {
        firestore.useFirestoreEmulator(host, emulator.firestorePort);
        _log.d('🔥 FirebaseService: Firestore emulator connected');
      } catch (e) {
        _log.w('🔥 FirebaseService: Firestore emulator connection failed: $e');
      }
      
      try {
        auth.useAuthEmulator(host, emulator.authPort);
        _log.d('🔥 FirebaseService: Auth emulator connected');
      } catch (e) {
        _log.w('🔥 FirebaseService: Auth emulator connection failed: $e');
      }
      
      try {
        storage.useStorageEmulator(host, emulator.storagePort);
        _log.d('🔥 FirebaseService: Storage emulator connected');
      } catch (e) {
        _log.w('🔥 FirebaseService: Storage emulator connection failed: $e');
      }
    } catch (e) {
      _log.e('🔥 FirebaseService: Emulator initialization failed: $e');
    }
  }

  Future<void> _verifyConnection() async {
    try {
      _log.d('🔥 FirebaseService: Verifying connection health');
      
      // Test Firestore connection
      await firestore.collection('_health_check').limit(1).get();
      
      // Test Auth connection
      await auth.authStateChanges().first.timeout(
        const Duration(seconds: 5),
      );
      
      _log.d('🔥 FirebaseService: Connection health verified');
    } catch (e) {
      _log.w('🔥 FirebaseService: Connection health check failed: $e');
      throw Exception('Firebase connection verification failed: $e');
    }
  }

  Future<void> _initializeOfflineMode() async {
    _log.w('🔥 FirebaseService: Initializing offline mode');
    
    // Configure Firestore for offline-only mode
    firestore.settings = const Settings(
      persistenceEnabled: true,
      cacheSizeBytes: Settings.CACHE_SIZE_UNLIMITED,
    );
    
    // Disable network requests
    await firestore.disableNetwork();
    
    _log.w('🔥 FirebaseService: Offline mode initialized');
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

  // Firestore methods with enhanced error handling
  Future<DocumentSnapshot> getDocument(String collection, String id) async {
    try {
      _log.d('🔥 FirebaseService: Getting document $id from $collection');
      final doc = await firestore.collection(collection).doc(id).get();
      _log.d('🔥 FirebaseService: Document retrieved successfully');
      return doc;
    } catch (e) {
      _log.e('🔥 FirebaseService: Failed to get document: $e');
      rethrow;
    }
  }

  Future<QuerySnapshot> getCollection(
    String collection, {
    Query Function(Query)? queryBuilder,
    int? limit,
  }) async {
    try {
      _log.d('🔥 FirebaseService: Getting collection $collection');
      Query query = firestore.collection(collection);

      if (queryBuilder != null) {
        query = queryBuilder(query);
      }

      if (limit != null) {
        query = query.limit(limit);
      }

      final snapshot = await query.get();
      _log.d('🔥 FirebaseService: Collection retrieved successfully (${snapshot.docs.length} documents)');
      return snapshot;
    } catch (e) {
      _log.e('🔥 FirebaseService: Failed to get collection: $e');
      rethrow;
    }
  }

  Future<DocumentReference> addDocument(
    String collection,
    Map<String, dynamic> data,
  ) async {
    try {
      _log.d('🔥 FirebaseService: Adding document to $collection');
      final docRef = await firestore.collection(collection).add(data);
      _log.d('🔥 FirebaseService: Document added successfully with ID: ${docRef.id}');
      return docRef;
    } catch (e) {
      _log.e('🔥 FirebaseService: Failed to add document: $e');
      rethrow;
    }
  }

  Future<void> setDocument(
    String collection,
    String id,
    Map<String, dynamic> data,
  ) async {
    try {
      _log.d('🔥 FirebaseService: Setting document $id in $collection');
      await firestore.collection(collection).doc(id).set(data);
      _log.d('🔥 FirebaseService: Document set successfully');
    } catch (e) {
      _log.e('🔥 FirebaseService: Failed to set document: $e');
      rethrow;
    }
  }

  Future<void> updateDocument(
    String collection,
    String id,
    Map<String, dynamic> data,
  ) async {
    try {
      _log.d('🔥 FirebaseService: Updating document $id in $collection');
      await firestore.collection(collection).doc(id).update(data);
      _log.d('🔥 FirebaseService: Document updated successfully');
    } catch (e) {
      _log.e('🔥 FirebaseService: Failed to update document: $e');
      rethrow;
    }
  }

  Future<void> deleteDocument(String collection, String id) async {
    try {
      _log.d('🔥 FirebaseService: Deleting document $id from $collection');
      await firestore.collection(collection).doc(id).delete();
      _log.d('🔥 FirebaseService: Document deleted successfully');
    } catch (e) {
      _log.e('🔥 FirebaseService: Failed to delete document: $e');
      rethrow;
    }
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
