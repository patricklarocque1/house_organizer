import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:house_organizer/features/tasks/repositories/task_repository.dart';
import 'package:house_organizer/data/models/task.dart';
import 'package:house_organizer/features/auth/providers/auth_providers.dart';

// Task repository provider
final taskRepositoryProvider = Provider<TaskRepository>((ref) {
  return TaskRepository();
});

// Tasks for house provider
final tasksForHouseProvider = StreamProvider.family<List<Task>, String>((
  ref,
  houseId,
) {
  final taskRepository = ref.watch(taskRepositoryProvider);
  return taskRepository.getTasksForHouse(houseId);
});

// Tasks for current user provider
final tasksForCurrentUserProvider = StreamProvider<List<Task>>((ref) {
  final taskRepository = ref.watch(taskRepositoryProvider);
  final authState = ref.watch(authNotifierProvider);

  return authState.when(
    data: (user) {
      if (user == null) return Stream.value([]);
      return taskRepository.getTasksForUser(user.id, user.houseId);
    },
    loading: () => Stream.value([]),
    error: (_, __) => Stream.value([]),
  );
});

// Tasks by status provider
final tasksByStatusProvider =
    StreamProvider.family<List<Task>, TaskStatusFilter>((ref, filter) {
      final taskRepository = ref.watch(taskRepositoryProvider);
      final authState = ref.watch(authNotifierProvider);

      return authState.when(
        data: (user) {
          if (user == null) return Stream.value([]);

          switch (filter.status) {
            case TaskStatus.pending:
            case TaskStatus.inProgress:
            case TaskStatus.completed:
            case TaskStatus.cancelled:
              return taskRepository.getTasksByStatus(
                user.houseId,
                filter.status!,
              );
            case null: // All tasks
              return taskRepository.getTasksForHouse(user.houseId);
          }
        },
        loading: () => Stream.value([]),
        error: (_, __) => Stream.value([]),
      );
    });

// Overdue tasks provider
final overdueTasksProvider = StreamProvider<List<Task>>((ref) {
  final taskRepository = ref.watch(taskRepositoryProvider);
  final authState = ref.watch(authNotifierProvider);

  return authState.when(
    data: (user) {
      if (user == null) return Stream.value([]);
      return taskRepository.getOverdueTasks(user.houseId);
    },
    loading: () => Stream.value([]),
    error: (_, __) => Stream.value([]),
  );
});

// Task statistics provider
final taskStatisticsProvider = FutureProvider<Map<String, int>>((ref) {
  final taskRepository = ref.watch(taskRepositoryProvider);
  final authState = ref.watch(authNotifierProvider);

  return authState.when(
    data: (user) async {
      if (user == null) return {};
      return await taskRepository.getTaskStatistics(user.houseId);
    },
    loading: () async => {},
    error: (_, __) async => {},
  );
});

// Task notifier for CRUD operations
class TaskNotifier extends StateNotifier<AsyncValue<void>> {
  final TaskRepository _taskRepository;
  final Ref _ref;

  TaskNotifier(this._taskRepository, this._ref)
    : super(const AsyncValue.data(null));

  Future<void> createTask({
    required String title,
    required String description,
    required TaskCategory category,
    String? assignedTo,
    DateTime? dueDate,
    RepeatInterval? repeatInterval,
    int? priority,
    List<String>? tags,
    String? notes,
  }) async {
    state = const AsyncValue.loading();

    try {
      final authState = _ref.read(authNotifierProvider);
      final user = authState.value;

      if (user == null) {
        throw Exception('User not authenticated');
      }

      await _taskRepository.createTask(
        title: title,
        description: description,
        category: category,
        houseId: user.houseId,
        createdBy: user.id,
        assignedTo: assignedTo,
        dueDate: dueDate,
        repeatInterval: repeatInterval,
        priority: priority,
        tags: tags,
        notes: notes,
      );

      state = const AsyncValue.data(null);
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }

  Future<void> updateTask(Task task) async {
    state = const AsyncValue.loading();

    try {
      await _taskRepository.updateTask(task);
      state = const AsyncValue.data(null);
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }

  Future<void> completeTask(Task task) async {
    state = const AsyncValue.loading();

    try {
      final authState = _ref.read(authNotifierProvider);
      final user = authState.value;

      if (user == null) {
        throw Exception('User not authenticated');
      }

      await _taskRepository.completeTask(task, user.id);
      state = const AsyncValue.data(null);
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }

  Future<void> deleteTask(String taskId) async {
    state = const AsyncValue.loading();

    try {
      final authState = _ref.read(authNotifierProvider);
      final user = authState.value;

      if (user == null) {
        throw Exception('User not authenticated');
      }

      await _taskRepository.deleteTask(taskId, user.id, user.houseId);
      state = const AsyncValue.data(null);
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }

  Future<void> assignTask(Task task, String assignedTo) async {
    state = const AsyncValue.loading();

    try {
      final authState = _ref.read(authNotifierProvider);
      final user = authState.value;

      if (user == null) {
        throw Exception('User not authenticated');
      }

      await _taskRepository.assignTask(task, assignedTo, user.id);
      state = const AsyncValue.data(null);
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }
}

// Task notifier provider
final taskNotifierProvider =
    StateNotifierProvider<TaskNotifier, AsyncValue<void>>((ref) {
      final taskRepository = ref.watch(taskRepositoryProvider);
      return TaskNotifier(taskRepository, ref);
    });

// Task status filter class
class TaskStatusFilter {
  final TaskStatus? status;
  final String? category;
  final String? assignedTo;

  const TaskStatusFilter({this.status, this.category, this.assignedTo});

  TaskStatusFilter copyWith({
    TaskStatus? status,
    String? category,
    String? assignedTo,
  }) {
    return TaskStatusFilter(
      status: status ?? this.status,
      category: category ?? this.category,
      assignedTo: assignedTo ?? this.assignedTo,
    );
  }
}

// Task filter provider
final taskFilterProvider = StateProvider<TaskStatusFilter>((ref) {
  return const TaskStatusFilter();
});
