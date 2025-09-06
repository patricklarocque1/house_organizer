import 'package:house_organizer/core/services/firebase_service.dart';
import 'package:house_organizer/core/services/hive_service.dart';
import 'package:house_organizer/core/services/notification_service.dart';
import 'package:house_organizer/core/services/offline_sync_service.dart';
import 'package:house_organizer/core/services/analytics_service.dart';
import 'package:house_organizer/core/services/performance_service.dart';
import 'package:house_organizer/data/models/task.dart';
import 'package:house_organizer/data/models/audit_log.dart';
import 'package:house_organizer/core/constants/app_constants.dart';
import 'package:uuid/uuid.dart';

class EnhancedTaskRepository {
  final FirebaseService _firebaseService = FirebaseService.instance;
  final HiveService _hiveService = HiveService.instance;
  final NotificationService _notificationService = NotificationService();
  final OfflineSyncService _syncService = OfflineSyncService.instance;
  final Uuid _uuid = const Uuid();

  // Get tasks for a specific house with offline-first strategy
  Stream<List<Task>> getTasksForHouse(String houseId) {
    // Primary: Local Hive storage for immediate response
    final localTasks = _hiveService.tasksBox.values
        .where((task) => task.houseId == houseId)
        .toList();

    // Create stream from local data
    final localStream = Stream.value(localTasks);

    // Secondary: Sync with Firestore in background
    _syncTasksFromFirestore(houseId);

    return localStream.asyncMap((localTasks) async {
      // Update local cache with remote data if available
      if (_syncService.getSyncStatus().isOnline) {
        try {
          final remoteTasks = await _getTasksFromFirestore(houseId);
          _updateLocalCache(remoteTasks);
          return remoteTasks;
        } catch (e) {
          // Return local data if remote fails
          return localTasks;
        }
      }
      return localTasks;
    });
  }

  // Get tasks for a specific user with offline-first strategy
  Stream<List<Task>> getTasksForUser(String userId, String houseId) {
    final localTasks = _hiveService.tasksBox.values
        .where((task) => task.houseId == houseId && task.assignedTo == userId)
        .toList();

    final localStream = Stream.value(localTasks);

    // Sync in background
    _syncTasksFromFirestore(houseId);

    return localStream.asyncMap((localTasks) async {
      if (_syncService.getSyncStatus().isOnline) {
        try {
          final remoteTasks = await _getUserTasksFromFirestore(userId, houseId);
          _updateLocalCache(remoteTasks);
          return remoteTasks;
        } catch (e) {
          return localTasks;
        }
      }
      return localTasks;
    });
  }

  // Create task with offline-first strategy
  Future<Task> createTask(Task task) async {
    return await _syncService.syncOperation(
      'create_task',
      () => _createTaskOnline(task),
      () => _createTaskOffline(task),
    );
  }

  Future<Task> _createTaskOnline(Task task) async {
    return await PerformanceService.monitorTaskOperation(
      'create_task_online',
      () async {
        final taskWithId = task.copyWith(id: _uuid.v4());
        final taskData = taskWithId.toJson();

        // Add to Firestore
        await _firebaseService.addDocument(AppConstants.tasksCollection, taskData);

        // Cache locally
        await _hiveService.tasksBox.put(taskWithId.id, taskWithId);

        // Schedule notifications
        await _notificationService.scheduleTaskReminder(taskWithId);

        // Log analytics
        await AnalyticsService.logTaskCreated(
          task.category.displayName,
          task.priority?.toString() ?? '0',
        );

        // Create audit log
        await _createAuditLog(
          'task_created',
          taskWithId.id,
          taskWithId.houseId,
          taskWithId.createdBy,
          taskData,
        );

        return taskWithId;
      },
    );
  }

  Future<Task> _createTaskOffline(Task task) async {
    return await PerformanceService.monitorTaskOperation(
      'create_task_offline',
      () async {
        final taskWithId = task.copyWith(id: _uuid.v4());
        
        // Cache locally
        await _hiveService.tasksBox.put(taskWithId.id, taskWithId);

        // Queue for sync when online
        _syncService.queueOperation(SyncOperation(
          type: SyncOperationType.create,
          collection: AppConstants.tasksCollection,
          data: taskWithId.toJson(),
        ));

        // Schedule notifications (will work offline)
        await _notificationService.scheduleTaskReminder(taskWithId);

        return taskWithId;
      },
    );
  }

  // Update task with offline-first strategy
  Future<Task> updateTask(Task task) async {
    return await _syncService.syncOperation(
      'update_task',
      () => _updateTaskOnline(task),
      () => _updateTaskOffline(task),
    );
  }

  Future<Task> _updateTaskOnline(Task task) async {
    return await PerformanceService.monitorTaskOperation(
      'update_task_online',
      () async {
        final updatedTask = task.copyWith(updatedAt: DateTime.now());
        final taskData = updatedTask.toJson();

        // Update Firestore
        await _firebaseService.updateDocument(
          AppConstants.tasksCollection,
          updatedTask.id,
          taskData,
        );

        // Update local cache
        await _hiveService.tasksBox.put(updatedTask.id, updatedTask);

        // Log analytics
        await AnalyticsService.logTaskCompleted(
          updatedTask.category.displayName,
          updatedTask.completedAt != null ? 5 : 0, // Mock completion time
        );

        // Create audit log
        await _createAuditLog(
          'task_updated',
          updatedTask.id,
          updatedTask.houseId,
          updatedTask.assignedTo ?? updatedTask.createdBy,
          taskData,
        );

        return updatedTask;
      },
    );
  }

  Future<Task> _updateTaskOffline(Task task) async {
    return await PerformanceService.monitorTaskOperation(
      'update_task_offline',
      () async {
        final updatedTask = task.copyWith(updatedAt: DateTime.now());
        
        // Update local cache
        await _hiveService.tasksBox.put(updatedTask.id, updatedTask);

        // Queue for sync
        _syncService.queueOperation(SyncOperation(
          type: SyncOperationType.update,
          collection: AppConstants.tasksCollection,
          id: updatedTask.id,
          data: updatedTask.toJson(),
        ));

        return updatedTask;
      },
    );
  }

  // Delete task with offline-first strategy
  Future<void> deleteTask(String taskId) async {
    await _syncService.syncOperation(
      'delete_task',
      () => _deleteTaskOnline(taskId),
      () => _deleteTaskOffline(taskId),
    );
  }

  Future<void> _deleteTaskOnline(String taskId) async {
    await PerformanceService.monitorTaskOperation(
      'delete_task_online',
      () async {
        // Delete from Firestore
        await _firebaseService.deleteDocument(AppConstants.tasksCollection, taskId);

        // Remove from local cache
        await _hiveService.tasksBox.delete(taskId);

        // Cancel notifications
        await _notificationService.cancelTaskReminders(taskId);

        // Create audit log
        await _createAuditLog(
          'task_deleted',
          taskId,
          '', // Will be filled from local data if available
          '', // Will be filled from local data if available
          {'taskId': taskId},
        );
      },
    );
  }

  Future<void> _deleteTaskOffline(String taskId) async {
    await PerformanceService.monitorTaskOperation(
      'delete_task_offline',
      () async {
        // Remove from local cache
        await _hiveService.tasksBox.delete(taskId);

        // Queue for sync
        _syncService.queueOperation(SyncOperation(
          type: SyncOperationType.delete,
          collection: AppConstants.tasksCollection,
          id: taskId,
          data: {'deleted': true},
        ));

        // Cancel notifications
        await _notificationService.cancelTaskReminders(taskId);
      },
    );
  }

  // Helper methods
  Future<List<Task>> _getTasksFromFirestore(String houseId) async {
    final snapshot = await _firebaseService.getCollection(
      AppConstants.tasksCollection,
      queryBuilder: (query) => query
          .where('houseId', isEqualTo: houseId)
          .orderBy('createdAt', descending: true),
    );

    return snapshot.docs
        .map((doc) => Task.fromLegacyJson(doc.data() as Map<String, dynamic>))
        .toList();
  }

  Future<List<Task>> _getUserTasksFromFirestore(String userId, String houseId) async {
    final snapshot = await _firebaseService.getCollection(
      AppConstants.tasksCollection,
      queryBuilder: (query) => query
          .where('houseId', isEqualTo: houseId)
          .where('assignedTo', isEqualTo: userId)
          .orderBy('createdAt', descending: true),
    );

    return snapshot.docs
        .map((doc) => Task.fromLegacyJson(doc.data() as Map<String, dynamic>))
        .toList();
  }

  void _updateLocalCache(List<Task> tasks) {
    for (final task in tasks) {
      _hiveService.tasksBox.put(task.id, task);
    }
  }

  Future<void> _syncTasksFromFirestore(String houseId) async {
    if (_syncService.getSyncStatus().isOnline) {
      try {
        final remoteTasks = await _getTasksFromFirestore(houseId);
        _updateLocalCache(remoteTasks);
      } catch (e) {
        // Silent fail - local data will be used
      }
    }
  }

  Future<void> _createAuditLog(
    String action,
    String resourceId,
    String houseId,
    String userId,
    Map<String, dynamic> data,
  ) async {
    try {
      final auditLog = AuditLog(
        id: _uuid.v4(),
        action: action,
        resourceType: 'task',
        resourceId: resourceId,
        userId: userId,
        houseId: houseId,
        timestamp: DateTime.now(),
        metadata: data,
      );

      await _firebaseService.addDocument(
        AppConstants.auditLogsCollection,
        auditLog.toJson(),
      );

      await _hiveService.auditLogsBox.put(auditLog.id, auditLog);
    } catch (e) {
      // Silent fail - audit logging is not critical
    }
  }

  // Get sync status
  SyncStatus getSyncStatus() => _syncService.getSyncStatus();

  // Force sync all tasks
  Future<void> forceSync() => _syncService.forceSyncAll();
}