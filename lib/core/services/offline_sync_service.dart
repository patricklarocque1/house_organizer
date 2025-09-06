import 'dart:async';
import 'package:house_organizer/core/services/firebase_service.dart';
import 'package:house_organizer/core/services/hive_service.dart';
import 'package:house_organizer/core/logging.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class OfflineSyncService {
  static final OfflineSyncService _instance = OfflineSyncService._internal();
  static OfflineSyncService get instance => _instance;

  OfflineSyncService._internal();

  final FirebaseService _firebaseService = FirebaseService.instance;
  final HiveService _hiveService = HiveService.instance;
  final Connectivity _connectivity = Connectivity();
  final _log = buildLogger();

  bool _isOnline = false;
  bool _isSyncing = false;
  Timer? _syncTimer;
  StreamSubscription<List<ConnectivityResult>>? _connectivitySubscription;

  // Sync queues for different operations
  final List<SyncOperation> _pendingOperations = [];
  final Map<String, DateTime> _lastSyncTimes = {};

  void initialize() {
    _log.d('🔄 OfflineSyncService: Initializing offline sync service');
    _startConnectivityMonitoring();
    _startPeriodicSync();
  }

  void dispose() {
    _connectivitySubscription?.cancel();
    _syncTimer?.cancel();
    _log.d('🔄 OfflineSyncService: Disposed offline sync service');
  }

  void _startConnectivityMonitoring() {
    _connectivitySubscription = _connectivity.onConnectivityChanged.listen(
      (List<ConnectivityResult> results) {
        final wasOnline = _isOnline;
        _isOnline = results.any((result) => result != ConnectivityResult.none);
        
        if (!wasOnline && _isOnline) {
          _log.d('🔄 OfflineSyncService: Connection restored, starting sync');
          _syncPendingOperations();
        } else if (wasOnline && !_isOnline) {
          _log.w('🔄 OfflineSyncService: Connection lost, switching to offline mode');
        }
      },
    );
  }

  void _startPeriodicSync() {
    _syncTimer = Timer.periodic(const Duration(minutes: 5), (timer) {
      if (_isOnline && !_isSyncing) {
        _syncPendingOperations();
      }
    });
  }

  // Generic sync operation for any data type
  Future<T> syncOperation<T>(
    String operationId,
    Future<T> Function() onlineOperation,
    Future<T> Function() offlineOperation,
  ) async {
    if (_isOnline) {
      try {
        _log.d('🔄 OfflineSyncService: Executing online operation: $operationId');
        final result = await onlineOperation();
        _lastSyncTimes[operationId] = DateTime.now();
        return result;
      } catch (e) {
        _log.w('🔄 OfflineSyncService: Online operation failed, trying offline: $e');
        return await offlineOperation();
      }
    } else {
      _log.d('🔄 OfflineSyncService: Executing offline operation: $operationId');
      return await offlineOperation();
    }
  }

  // Queue operations for later sync
  void queueOperation(SyncOperation operation) {
    _pendingOperations.add(operation);
    _log.d('🔄 OfflineSyncService: Queued operation: ${operation.type}');
  }

  // Sync all pending operations
  Future<void> _syncPendingOperations() async {
    if (_isSyncing || _pendingOperations.isEmpty) return;

    _isSyncing = true;
    _log.d('🔄 OfflineSyncService: Syncing ${_pendingOperations.length} pending operations');

    final operations = List<SyncOperation>.from(_pendingOperations);
    _pendingOperations.clear();

    for (final operation in operations) {
      try {
        await _executeSyncOperation(operation);
      } catch (e) {
        _log.e('🔄 OfflineSyncService: Failed to sync operation ${operation.type}: $e');
        // Re-queue failed operations
        _pendingOperations.add(operation);
      }
    }

    _isSyncing = false;
    _log.d('🔄 OfflineSyncService: Sync completed');
  }

  Future<void> _executeSyncOperation(SyncOperation operation) async {
    switch (operation.type) {
      case SyncOperationType.create:
        await _firebaseService.addDocument(operation.collection, operation.data);
        break;
      case SyncOperationType.update:
        await _firebaseService.updateDocument(
          operation.collection,
          operation.id!,
          operation.data,
        );
        break;
      case SyncOperationType.delete:
        await _firebaseService.deleteDocument(operation.collection, operation.id!);
        break;
    }
  }

  // Force sync all data
  Future<void> forceSyncAll() async {
    if (!_isOnline) {
      _log.w('🔄 OfflineSyncService: Cannot force sync - no internet connection');
      return;
    }

    _log.d('🔄 OfflineSyncService: Starting force sync');
    _isSyncing = true;

    try {
      await _syncPendingOperations();
      await _syncLocalData();
    } finally {
      _isSyncing = false;
      _log.d('🔄 OfflineSyncService: Force sync completed');
    }
  }

  Future<void> _syncLocalData() async {
    // Sync users
    await _syncUsers();
    // Sync houses
    await _syncHouses();
    // Sync tasks
    await _syncTasks();
    // Sync lists
    await _syncLists();
  }

  Future<void> _syncUsers() async {
    try {
      final localUsers = _hiveService.usersBox.values.toList();
      for (final user in localUsers) {
        final remoteDoc = await _firebaseService.getDocument('users', user.id);
        if (!remoteDoc.exists || remoteDoc.data()['updatedAt'] != user.updatedAt.toIso8601String()) {
          await _firebaseService.setDocument('users', user.id, user.toJson());
        }
      }
    } catch (e) {
      _log.e('🔄 OfflineSyncService: Failed to sync users: $e');
    }
  }

  Future<void> _syncHouses() async {
    try {
      final localHouses = _hiveService.housesBox.values.toList();
      for (final house in localHouses) {
        final remoteDoc = await _firebaseService.getDocument('houses', house.id);
        if (!remoteDoc.exists || remoteDoc.data()['updatedAt'] != house.updatedAt.toIso8601String()) {
          await _firebaseService.setDocument('houses', house.id, house.toJson());
        }
      }
    } catch (e) {
      _log.e('🔄 OfflineSyncService: Failed to sync houses: $e');
    }
  }

  Future<void> _syncTasks() async {
    try {
      final localTasks = _hiveService.tasksBox.values.toList();
      for (final task in localTasks) {
        final remoteDoc = await _firebaseService.getDocument('tasks', task.id);
        if (!remoteDoc.exists || remoteDoc.data()['updatedAt'] != task.updatedAt.toIso8601String()) {
          await _firebaseService.setDocument('tasks', task.id, task.toJson());
        }
      }
    } catch (e) {
      _log.e('🔄 OfflineSyncService: Failed to sync tasks: $e');
    }
  }

  Future<void> _syncLists() async {
    try {
      final localLists = _hiveService.listsBox.values.toList();
      for (final list in localLists) {
        final remoteDoc = await _firebaseService.getDocument('lists', list.id);
        if (!remoteDoc.exists || remoteDoc.data()['updatedAt'] != list.updatedAt.toIso8601String()) {
          await _firebaseService.setDocument('lists', list.id, list.toJson());
        }
      }
    } catch (e) {
      _log.e('🔄 OfflineSyncService: Failed to sync lists: $e');
    }
  }

  // Get sync status
  SyncStatus getSyncStatus() {
    return SyncStatus(
      isOnline: _isOnline,
      isSyncing: _isSyncing,
      pendingOperations: _pendingOperations.length,
      lastSyncTimes: Map.from(_lastSyncTimes),
    );
  }

  // Check if data is stale and needs refresh
  bool isDataStale(String operationId, Duration maxAge) {
    final lastSync = _lastSyncTimes[operationId];
    if (lastSync == null) return true;
    return DateTime.now().difference(lastSync) > maxAge;
  }
}

class SyncOperation {
  final SyncOperationType type;
  final String collection;
  final String? id;
  final Map<String, dynamic> data;
  final DateTime timestamp;

  SyncOperation({
    required this.type,
    required this.collection,
    this.id,
    required this.data,
    DateTime? timestamp,
  }) : timestamp = timestamp ?? DateTime.now();
}

enum SyncOperationType { create, update, delete }

class SyncStatus {
  final bool isOnline;
  final bool isSyncing;
  final int pendingOperations;
  final Map<String, DateTime> lastSyncTimes;

  SyncStatus({
    required this.isOnline,
    required this.isSyncing,
    required this.pendingOperations,
    required this.lastSyncTimes,
  });
}