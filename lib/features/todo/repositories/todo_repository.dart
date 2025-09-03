import 'package:house_organizer/features/todo/models/simple_todo.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class TodoRepository {
  static const String _todosKey = 'todos';

  // Create a new todo
  Future<void> createTodo(SimpleTodo todo) async {
    final todos = await getTodosForHouse(todo.houseId);

    todos.add(todo);
    await _saveTodos(todo.houseId, todos);
  }

  // Get all todos for a specific house
  Future<List<SimpleTodo>> getTodosForHouse(String houseId) async {
    final prefs = await SharedPreferences.getInstance();
    final todosJson = prefs.getStringList('${_todosKey}_$houseId') ?? [];

    return todosJson
        .map((json) => SimpleTodo.fromJson(jsonDecode(json)))
        .toList();
  }

  // Update an existing todo
  Future<void> updateTodo(SimpleTodo todo) async {
    final todos = await getTodosForHouse(todo.houseId);
    final index = todos.indexWhere((t) => t.id == todo.id);

    if (index != -1) {
      todos[index] = todo;
      await _saveTodos(todo.houseId, todos);
    }
  }

  // Delete a todo
  Future<void> deleteTodo(String todoId) async {
    // We need to find which house this todo belongs to
    // For simplicity, we'll search through all houses
    final prefs = await SharedPreferences.getInstance();
    final keys = prefs.getKeys().where(
          (key) => key.startsWith('${_todosKey}_'),
        );

    for (final key in keys) {
      final houseId = key.substring('${_todosKey}_'.length);
      final todos = await getTodosForHouse(houseId);
      final todoExists = todos.any((t) => t.id == todoId);

      if (todoExists) {
        final updatedTodos = todos.where((t) => t.id != todoId).toList();
        await _saveTodos(houseId, updatedTodos);
        break;
      }
    }
  }

  // Get completed todos count
  Future<int> getCompletedTodosCount(String houseId) async {
    final todos = await getTodosForHouse(houseId);
    return todos.where((todo) => todo.completed).length;
  }

  // Get pending todos count
  Future<int> getPendingTodosCount(String houseId) async {
    final todos = await getTodosForHouse(houseId);
    return todos.where((todo) => !todo.completed).length;
  }

  // Private method to save todos to SharedPreferences
  Future<void> _saveTodos(String houseId, List<SimpleTodo> todos) async {
    final prefs = await SharedPreferences.getInstance();
    final todosJson = todos.map((todo) => jsonEncode(todo.toJson())).toList();
    await prefs.setStringList('${_todosKey}_$houseId', todosJson);
  }
}
