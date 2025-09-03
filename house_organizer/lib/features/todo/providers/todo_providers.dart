import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:house_organizer/features/todo/models/simple_todo.dart';
import 'package:house_organizer/features/todo/repositories/todo_repository.dart';

// Todo repository provider
final todoRepositoryProvider = Provider<TodoRepository>((ref) {
  return TodoRepository();
});

// Todo list provider for a specific house
final todoListProvider = FutureProvider.family<List<SimpleTodo>, String>((
  ref,
  houseId,
) async {
  final repository = ref.watch(todoRepositoryProvider);
  return await repository.getTodosForHouse(houseId);
});

// Todo notifier for managing todo state
final todoNotifierProvider =
    StateNotifierProvider<TodoNotifier, AsyncValue<List<SimpleTodo>>>((ref) {
  return TodoNotifier(ref.watch(todoRepositoryProvider));
});

class TodoNotifier extends StateNotifier<AsyncValue<List<SimpleTodo>>> {
  final TodoRepository _repository;

  TodoNotifier(this._repository) : super(const AsyncValue.loading());

  Future<void> loadTodos(String houseId) async {
    state = const AsyncValue.loading();
    try {
      final todos = await _repository.getTodosForHouse(houseId);
      state = AsyncValue.data(todos);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }

  Future<void> addTodo(SimpleTodo todo) async {
    try {
      await _repository.createTodo(todo);
      // Reload todos after adding
      if (state.hasValue) {
        final currentTodos = state.value!;
        state = AsyncValue.data([...currentTodos, todo]);
      }
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }

  Future<void> updateTodo(SimpleTodo todo) async {
    try {
      await _repository.updateTodo(todo);
      // Update the todo in the current list
      if (state.hasValue) {
        final currentTodos = state.value!;
        final updatedTodos =
            currentTodos.map((t) => t.id == todo.id ? todo : t).toList();
        state = AsyncValue.data(updatedTodos);
      }
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }

  Future<void> deleteTodo(String todoId) async {
    try {
      await _repository.deleteTodo(todoId);
      // Remove the todo from the current list
      if (state.hasValue) {
        final currentTodos = state.value!;
        final updatedTodos = currentTodos.where((t) => t.id != todoId).toList();
        state = AsyncValue.data(updatedTodos);
      }
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }

  Future<void> toggleTodoCompletion(SimpleTodo todo) async {
    final updatedTodo = todo.copyWith(
      completed: !todo.completed,
      completedAt: !todo.completed ? DateTime.now() : null,
    );
    await updateTodo(updatedTodo);
  }
}
