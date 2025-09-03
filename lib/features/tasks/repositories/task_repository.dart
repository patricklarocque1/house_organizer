import 'package:house_organizer/core/services/firebase_service.dart';
import 'package:house_organizer/core/services/hive_service.dart';
import 'package:house_organizer/core/services/notification_service.dart';
import 'package:house_organizer/data/models/task.dart';
import 'package:house_organizer/data/models/audit_log.dart';
import 'package:house_organizer/core/constants/app_constants.dart';
import 'package:uuid/uuid.dart';

class TaskRepository {
  final FirebaseService _firebaseService = FirebaseService.instance;
  final HiveService _hiveService = HiveService.instance;
  final NotificationService _notificationService = NotificationService();
  final Uuid _uuid = const Uuid();

  // Get tasks for a specific house
  Stream<List<Task>> getTasksForHouse(String houseId) {
    return _firebaseService
        .listenToCollection(
          AppConstants.tasksCollection,
          queryBuilder: (query) => query
              .where('houseId', isEqualTo: houseId)
              .orderBy('createdAt', descending: true),
        )
        .map(
          (snapshot) => snapshot.docs
              .map((doc) => Task.fromJson(doc.data() as Map<String, dynamic>))
              .toList(),
        );
  }

  // Get tasks assigned to a specific user
  Stream<List<Task>> getTasksForUser(String userId, String houseId) {
    return _firebaseService
        .listenToCollection(
          AppConstants.tasksCollection,
          queryBuilder: (query) => query
              .where('houseId', isEqualTo: houseId)
              .where('assignedTo', isEqualTo: userId)
              .orderBy('dueDate', descending: false),
        )
        .map(
          (snapshot) => snapshot.docs
              .map((doc) => Task.fromJson(doc.data() as Map<String, dynamic>))
              .toList(),
        );
  }

  // Get tasks by status
  Stream<List<Task>> getTasksByStatus(String houseId, TaskStatus status) {
    return _firebaseService
        .listenToCollection(
          AppConstants.tasksCollection,
          queryBuilder: (query) => query
              .where('houseId', isEqualTo: houseId)
              .where('status', isEqualTo: status.name)
              .orderBy('dueDate', descending: false),
        )
        .map(
          (snapshot) => snapshot.docs
              .map((doc) => Task.fromJson(doc.data() as Map<String, dynamic>))
              .toList(),
        );
  }

  // Get overdue tasks
  Stream<List<Task>> getOverdueTasks(String houseId) {
    final now = DateTime.now();
    return _firebaseService
        .listenToCollection(
          AppConstants.tasksCollection,
          queryBuilder: (query) => query
              .where('houseId', isEqualTo: houseId)
              .where('status', whereIn: ['pending', 'inProgress'])
              .where('dueDate', isLessThan: now)
              .orderBy('dueDate', descending: false),
        )
        .map(
          (snapshot) => snapshot.docs
              .map((doc) => Task.fromJson(doc.data() as Map<String, dynamic>))
              .toList(),
        );
  }

  // Create a new task
  Future<Task> createTask({
    required String title,
    required String description,
    required TaskCategory category,
    required String houseId,
    required String createdBy,
    String? assignedTo,
    DateTime? dueDate,
    RepeatInterval? repeatInterval,
    int? priority,
    List<String>? tags,
    String? notes,
  }) async {
    try {
      final task = Task(
        id: _uuid.v4(),
        title: title,
        description: description,
        status: TaskStatus.pending,
        category: category,
        houseId: houseId,
        createdBy: createdBy,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        assignedTo: assignedTo,
        dueDate: dueDate,
        repeatInterval: repeatInterval ?? RepeatInterval.none,
        priority: priority ?? 1,
        tags: tags ?? [],
        notes: notes,
      );

      // Save to Firestore
      await _firebaseService.setDocument(
        AppConstants.tasksCollection,
        task.id,
        task.toJson(),
      );

      // Cache locally
      await _hiveService.tasksBox.put(task.id, task);

      // Create audit log
      await _createAuditLog(
        userId: createdBy,
        houseId: houseId,
        action: AuditAction.create,
        targetType: 'task',
        targetId: task.id,
        description: 'Created task: ${task.title}',
      );

      // Schedule notifications if task is assigned and has due date
      if (assignedTo != null) {
        await _notificationService.notifyTaskAssignment(task);
        if (dueDate != null) {
          await _notificationService.scheduleTaskReminder(task);
        }
      }

      return task;
    } catch (e) {
      throw Exception('Failed to create task: ${e.toString()}');
    }
  }

  // Update an existing task
  Future<Task> updateTask(Task task) async {
    try {
      final updatedTask = task.copyWith(updatedAt: DateTime.now());

      // Update in Firestore
      await _firebaseService.updateDocument(
        AppConstants.tasksCollection,
        task.id,
        updatedTask.toJson(),
      );

      // Update local cache
      await _hiveService.tasksBox.put(task.id, updatedTask);

      // Create audit log
      await _createAuditLog(
        userId: updatedTask.assignedTo ?? updatedTask.createdBy,
        houseId: updatedTask.houseId,
        action: AuditAction.update,
        targetType: 'task',
        targetId: task.id,
        description: 'Updated task: ${task.title}',
      );

      // Notify about task update
      await _notificationService.notifyTaskUpdate(updatedTask);

      return updatedTask;
    } catch (e) {
      throw Exception('Failed to update task: ${e.toString()}');
    }
  }

  // Mark task as complete
  Future<Task> completeTask(Task task, String completedBy) async {
    try {
      final completedTask = task.copyWith(
        status: TaskStatus.completed,
        completedAt: DateTime.now(),
        completedBy: completedBy,
        updatedAt: DateTime.now(),
      );

      // Update in Firestore
      await _firebaseService.updateDocument(
        AppConstants.tasksCollection,
        task.id,
        completedTask.toJson(),
      );

      // Update local cache
      await _hiveService.tasksBox.put(task.id, completedTask);

      // Create audit log
      await _createAuditLog(
        userId: completedBy,
        houseId: task.houseId,
        action: AuditAction.complete,
        targetType: 'task',
        targetId: task.id,
        description: 'Completed task: ${task.title}',
      );

      // Cancel existing reminders for this task
      await _notificationService.cancelTaskReminders(task.id);

      // Handle repeating tasks
      if (task.repeatInterval != RepeatInterval.none) {
        await _createRepeatingTask(task);
      }

      return completedTask;
    } catch (e) {
      throw Exception('Failed to complete task: ${e.toString()}');
    }
  }

  // Delete a task
  Future<void> deleteTask(String taskId, String userId, String houseId) async {
    try {
      // Get task for audit log
      final task = _hiveService.tasksBox.get(taskId);
      final taskTitle = task?.title ?? 'Unknown task';

      // Delete from Firestore
      await _firebaseService.deleteDocument(
        AppConstants.tasksCollection,
        taskId,
      );

      // Delete from local cache
      await _hiveService.tasksBox.delete(taskId);

      // Cancel any scheduled notifications for this task
      await _notificationService.cancelTaskReminders(taskId);

      // Create audit log
      await _createAuditLog(
        userId: userId,
        houseId: houseId,
        action: AuditAction.delete,
        targetType: 'task',
        targetId: taskId,
        description: 'Deleted task: $taskTitle',
      );
    } catch (e) {
      throw Exception('Failed to delete task: ${e.toString()}');
    }
  }

  // Assign task to user
  Future<Task> assignTask(
    Task task,
    String assignedTo,
    String assignedBy,
  ) async {
    try {
      final assignedTask = task.copyWith(
        assignedTo: assignedTo,
        updatedAt: DateTime.now(),
      );

      // Update in Firestore
      await _firebaseService.updateDocument(
        AppConstants.tasksCollection,
        task.id,
        assignedTask.toJson(),
      );

      // Update local cache
      await _hiveService.tasksBox.put(task.id, assignedTask);

      // Create audit log
      await _createAuditLog(
        userId: assignedBy,
        houseId: task.houseId,
        action: AuditAction.assign,
        targetType: 'task',
        targetId: task.id,
        description: 'Assigned task "${task.title}" to user',
        metadata: {'assignedTo': assignedTo},
      );

      // Notify the assigned user
      await _notificationService.notifyTaskAssignment(assignedTask);

      // Schedule reminders if task has due date
      if (assignedTask.dueDate != null) {
        await _notificationService.scheduleTaskReminder(assignedTask);
      }

      return assignedTask;
    } catch (e) {
      throw Exception('Failed to assign task: ${e.toString()}');
    }
  }

  // Get task statistics
  Future<Map<String, int>> getTaskStatistics(String houseId) async {
    try {
      final tasksSnapshot = await _firebaseService.getCollection(
        AppConstants.tasksCollection,
        queryBuilder: (query) => query.where('houseId', isEqualTo: houseId),
      );

      final tasks = tasksSnapshot.docs
          .map((doc) => Task.fromJson(doc.data() as Map<String, dynamic>))
          .toList();

      final stats = <String, int>{
        'total': tasks.length,
        'pending': tasks.where((t) => t.status == TaskStatus.pending).length,
        'inProgress': tasks
            .where((t) => t.status == TaskStatus.inProgress)
            .length,
        'completed': tasks
            .where((t) => t.status == TaskStatus.completed)
            .length,
        'overdue': tasks
            .where(
              (t) =>
                  t.status != TaskStatus.completed &&
                  t.dueDate != null &&
                  t.dueDate!.isBefore(DateTime.now()),
            )
            .length,
      };

      return stats;
    } catch (e) {
      throw Exception('Failed to get task statistics: ${e.toString()}');
    }
  }

  // Create repeating task
  Future<void> _createRepeatingTask(Task originalTask) async {
    if (originalTask.repeatInterval == RepeatInterval.none) return;

    DateTime nextDueDate;
    switch (originalTask.repeatInterval) {
      case RepeatInterval.daily:
        nextDueDate = DateTime.now().add(const Duration(days: 1));
        break;
      case RepeatInterval.weekly:
        nextDueDate = DateTime.now().add(const Duration(days: 7));
        break;
      case RepeatInterval.monthly:
        nextDueDate = DateTime.now().add(const Duration(days: 30));
        break;
      case RepeatInterval.yearly:
        nextDueDate = DateTime.now().add(const Duration(days: 365));
        break;
      default:
        return;
    }

    final newTask = originalTask.copyWith(
      id: _uuid.v4(),
      status: TaskStatus.pending,
      dueDate: nextDueDate,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
      completedAt: null,
      completedBy: null,
    );

    await _firebaseService.setDocument(
      AppConstants.tasksCollection,
      newTask.id,
      newTask.toJson(),
    );

    await _hiveService.tasksBox.put(newTask.id, newTask);
  }

  // Create audit log entry
  Future<void> _createAuditLog({
    required String userId,
    required String houseId,
    required AuditAction action,
    required String targetType,
    required String targetId,
    required String description,
    Map<String, dynamic>? metadata,
  }) async {
    try {
      final auditLog = AuditLog(
        id: _uuid.v4(),
        userId: userId,
        houseId: houseId,
        action: action,
        targetType: targetType,
        targetId: targetId,
        timestamp: DateTime.now(),
        description: description,
        metadata: metadata,
      );

      await _firebaseService.setDocument(
        AppConstants.auditLogsCollection,
        auditLog.id,
        auditLog.toJson(),
      );

      await _hiveService.auditLogsBox.put(auditLog.id, auditLog);
    } catch (e) {
      // Don't throw here as audit logging shouldn't break the main operation
      // Failed to create audit log - this shouldn't break the main operation
    }
  }
}
