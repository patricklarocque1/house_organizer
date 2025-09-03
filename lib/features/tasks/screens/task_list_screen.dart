import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:house_organizer/features/tasks/providers/task_providers.dart';
import 'package:house_organizer/features/tasks/screens/create_task_screen.dart';
import 'package:house_organizer/features/tasks/widgets/task_card.dart';
import 'package:house_organizer/features/tasks/widgets/task_filter_bottom_sheet.dart';
import 'package:house_organizer/data/models/task.dart';
import 'package:house_organizer/features/auth/providers/auth_providers.dart';

class TaskListScreen extends ConsumerStatefulWidget {
  const TaskListScreen({super.key});

  @override
  ConsumerState<TaskListScreen> createState() => _TaskListScreenState();
}

class _TaskListScreenState extends ConsumerState<TaskListScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;
  final _searchController = TextEditingController();
  String _searchQuery = '';

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Tasks'),
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_list),
            onPressed: () => _showFilterBottomSheet(context),
          ),
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () => _showSearchDialog(context),
          ),
        ],
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'All', icon: Icon(Icons.list)),
            Tab(text: 'Pending', icon: Icon(Icons.pending)),
            Tab(text: 'In Progress', icon: Icon(Icons.play_arrow)),
            Tab(text: 'Completed', icon: Icon(Icons.check)),
          ],
        ),
      ),
      body: authState.when(
        data: (user) {
          if (user == null) {
            return const Center(child: Text('Please sign in to view tasks'));
          }

          return TabBarView(
            controller: _tabController,
            children: [
              _buildTaskList(user.houseId, null),
              _buildTaskList(user.houseId, TaskStatus.pending),
              _buildTaskList(user.houseId, TaskStatus.inProgress),
              _buildTaskList(user.houseId, TaskStatus.completed),
            ],
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) =>
            Center(child: Text('Error: ${error.toString()}')),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const CreateTaskScreen()),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildTaskList(String houseId, TaskStatus? status) {
    final tasksAsync = ref.watch(
      tasksByStatusProvider(TaskStatusFilter(status: status)),
    );

    return tasksAsync.when(
      data: (tasks) {
        // Apply search filter
        final filteredTasks = _searchQuery.isEmpty
            ? tasks
            : tasks
                  .where(
                    (task) =>
                        task.title.toLowerCase().contains(
                          _searchQuery.toLowerCase(),
                        ) ||
                        task.description.toLowerCase().contains(
                          _searchQuery.toLowerCase(),
                        ),
                  )
                  .toList();

        if (filteredTasks.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  status == null ? Icons.task_alt : _getStatusIcon(status),
                  size: 64,
                  color: Colors.grey,
                ),
                const SizedBox(height: 16),
                Text(
                  status == null
                      ? 'No tasks found'
                      : 'No ${status.displayName.toLowerCase()} tasks',
                  style: Theme.of(
                    context,
                  ).textTheme.titleLarge?.copyWith(color: Colors.grey),
                ),
                const SizedBox(height: 8),
                Text(
                  status == null
                      ? 'Create your first task to get started'
                      : 'All caught up with ${status.displayName.toLowerCase()} tasks!',
                  style: Theme.of(
                    context,
                  ).textTheme.bodyMedium?.copyWith(color: Colors.grey),
                ),
              ],
            ),
          );
        }

        return RefreshIndicator(
          onRefresh: () async {
            // Refresh the data
            ref.invalidate(
              tasksByStatusProvider(TaskStatusFilter(status: status)),
            );
          },
          child: ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: filteredTasks.length,
            itemBuilder: (context, index) {
              final task = filteredTasks[index];
              return TaskCard(
                task: task,
                onTap: () => _showTaskDetails(context, task),
                onComplete: () => _completeTask(task),
                onDelete: () => _deleteTask(task),
              );
            },
          ),
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stack) => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error, size: 64, color: Colors.red),
            const SizedBox(height: 16),
            Text(
              'Error loading tasks',
              style: Theme.of(context).textTheme.titleLarge,
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
                ref.invalidate(
                  tasksByStatusProvider(TaskStatusFilter(status: status)),
                );
              },
              child: const Text('Retry'),
            ),
          ],
        ),
      ),
    );
  }

  IconData _getStatusIcon(TaskStatus status) {
    switch (status) {
      case TaskStatus.pending:
        return Icons.pending;
      case TaskStatus.inProgress:
        return Icons.play_arrow;
      case TaskStatus.completed:
        return Icons.check_circle;
      case TaskStatus.cancelled:
        return Icons.cancel;
    }
  }

  void _showTaskDetails(BuildContext context, Task task) {
    // TODO: Implement task details screen
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(task.title),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Description: ${task.description}'),
            const SizedBox(height: 8),
            Text('Status: ${task.status.displayName}'),
            Text('Category: ${task.category.displayName}'),
            if (task.dueDate != null)
              Text('Due: ${task.dueDate!.toString().split(' ')[0]}'),
            if (task.assignedTo != null)
              Text('Assigned to: ${task.assignedTo}'),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }

  void _completeTask(Task task) {
    ref.read(taskNotifierProvider.notifier).completeTask(task);
  }

  void _deleteTask(Task task) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Task'),
        content: Text('Are you sure you want to delete "${task.title}"?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              ref.read(taskNotifierProvider.notifier).deleteTask(task.id);
            },
            child: const Text('Delete'),
          ),
        ],
      ),
    );
  }

  void _showFilterBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => const TaskFilterBottomSheet(),
    );
  }

  void _showSearchDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Search Tasks'),
        content: TextField(
          controller: _searchController,
          decoration: const InputDecoration(
            hintText: 'Search by title or description...',
            border: OutlineInputBorder(),
          ),
          autofocus: true,
        ),
        actions: [
          TextButton(
            onPressed: () {
              setState(() {
                _searchQuery = '';
                _searchController.clear();
              });
              Navigator.of(context).pop();
            },
            child: const Text('Clear'),
          ),
          TextButton(
            onPressed: () {
              setState(() {
                _searchQuery = _searchController.text;
              });
              Navigator.of(context).pop();
            },
            child: const Text('Search'),
          ),
        ],
      ),
    );
  }
}
