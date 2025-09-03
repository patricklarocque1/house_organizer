import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:house_organizer/features/todo/models/simple_todo.dart';
import 'package:house_organizer/features/todo/providers/todo_providers.dart';
import 'package:house_organizer/features/todo/widgets/todo_item.dart';
import 'package:house_organizer/features/todo/widgets/add_todo_dialog.dart';


class TodoListScreen extends ConsumerStatefulWidget {
  final String houseId;
  final String currentUserId;

  const TodoListScreen({
    super.key,
    required this.houseId,
    required this.currentUserId,
  });

  @override
  ConsumerState<TodoListScreen> createState() => _TodoListScreenState();
}

class _TodoListScreenState extends ConsumerState<TodoListScreen> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  @override
  void initState() {
    super.initState();
    // Load todos when the screen initializes
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(todoNotifierProvider.notifier).loadTodos(widget.houseId);
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final todoState = ref.watch(todoNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('To-Do List'),
        actions: [
          IconButton(
            onPressed: _showAddTodoDialog,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Column(
        children: [
          // Search bar
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search todos...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onChanged: (value) {
                setState(() {
                  _searchQuery = value.toLowerCase();
                });
              },
            ),
          ),
          
          // Todo list
          Expanded(
            child: todoState.when(
              data: (todos) {
                final filteredTodos = _filterTodos(todos);
                
                if (filteredTodos.isEmpty) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          _searchQuery.isNotEmpty ? Icons.search_off : Icons.checklist,
                          size: 64,
                          color: Theme.of(context).colorScheme.onSurfaceVariant,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          _searchQuery.isNotEmpty 
                              ? 'No todos found matching "$_searchQuery"'
                              : 'No todos yet',
                          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            color: Theme.of(context).colorScheme.onSurfaceVariant,
                          ),
                        ),
                        const SizedBox(height: 8),
                        if (_searchQuery.isEmpty)
                          Text(
                            'Tap the + button to add your first todo',
                            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: Theme.of(context).colorScheme.onSurfaceVariant,
                            ),
                          ),
                      ],
                    ),
                  );
                }

                return ListView.builder(
                  itemCount: filteredTodos.length,
                  itemBuilder: (context, index) {
                    final todo = filteredTodos[index];
                    return TodoItem(
                      todo: todo,
                      onToggle: () => _toggleTodo(todo),
                      onEdit: () => _showEditTodoDialog(todo),
                      onDelete: () => _deleteTodo(todo),
                    );
                  },
                );
              },
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (error, stackTrace) => Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.error_outline,
                      size: 64,
                      color: Theme.of(context).colorScheme.error,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Error loading todos',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: Theme.of(context).colorScheme.error,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      error.toString(),
                      style: Theme.of(context).textTheme.bodyMedium,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                        ref.read(todoNotifierProvider.notifier).loadTodos(widget.houseId);
                      },
                      child: const Text('Retry'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddTodoDialog,
        child: const Icon(Icons.add),
      ),
    );
  }

  List<SimpleTodo> _filterTodos(List<SimpleTodo> todos) {
    if (_searchQuery.isEmpty) return todos;
    
    return todos.where((todo) {
      return todo.title.toLowerCase().contains(_searchQuery) ||
             (todo.notes?.toLowerCase().contains(_searchQuery) ?? false);
    }).toList();
  }

  void _showAddTodoDialog() {
    showDialog(
      context: context,
      builder: (context) => AddTodoDialog(
        houseId: widget.houseId,
        currentUserId: widget.currentUserId,
        onTodoAdded: (todo) {
          ref.read(todoNotifierProvider.notifier).addTodo(todo);
        },
      ),
    );
  }

  void _showEditTodoDialog(SimpleTodo todo) {
    showDialog(
      context: context,
      builder: (context) => AddTodoDialog(
        houseId: widget.houseId,
        currentUserId: widget.currentUserId,
        existingTodo: todo,
        onTodoAdded: (updatedTodo) {
          ref.read(todoNotifierProvider.notifier).updateTodo(updatedTodo);
        },
      ),
    );
  }

  void _toggleTodo(SimpleTodo todo) {
    ref.read(todoNotifierProvider.notifier).toggleTodoCompletion(todo);
  }

  void _deleteTodo(SimpleTodo todo) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Todo'),
        content: Text('Are you sure you want to delete "${todo.title}"?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              ref.read(todoNotifierProvider.notifier).deleteTodo(todo.id);
            },
            child: const Text('Delete'),
          ),
        ],
      ),
    );
  }
}
