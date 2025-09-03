import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:house_organizer/features/auth/providers/auth_providers.dart';
import 'package:house_organizer/features/tasks/providers/task_providers.dart';
import 'package:house_organizer/features/tasks/screens/task_list_screen.dart';
import 'package:house_organizer/features/lists/screens/list_overview_screen.dart';
import 'package:house_organizer/features/lists/providers/list_providers.dart';
import 'package:house_organizer/features/notifications/screens/notification_settings_screen.dart';
import 'package:house_organizer/features/notifications/screens/notifications_screen.dart';
import 'package:house_organizer/features/profile/screens/profile_screen.dart';
import 'package:house_organizer/features/dashboard/screens/dashboard_screen.dart';
import 'package:house_organizer/features/dashboard/widgets/task_summary_card.dart';
import 'package:house_organizer/features/dashboard/widgets/quick_actions_card.dart';
import 'package:house_organizer/features/dashboard/widgets/list_summary_card.dart';
import 'package:house_organizer/features/dashboard/widgets/todo_summary_card.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authNotifierProvider);
    final taskStats = ref.watch(taskStatisticsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('House Organizer'),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const NotificationsScreen(),
                ),
              );
            },
          ),
          PopupMenuButton<String>(
            onSelected: (value) {
              switch (value) {
                case 'profile':
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const ProfileScreen(),
                    ),
                  );
                  break;
                case 'settings':
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const NotificationSettingsScreen(),
                    ),
                  );
                  break;
                case 'logout':
                  ref.read(authNotifierProvider.notifier).signOut();
                  break;
              }
            },
            itemBuilder: (context) => [
              const PopupMenuItem(
                value: 'profile',
                child: ListTile(
                  leading: Icon(Icons.person),
                  title: Text('Profile'),
                  contentPadding: EdgeInsets.zero,
                ),
              ),
              const PopupMenuItem(
                value: 'settings',
                child: ListTile(
                  leading: Icon(Icons.settings),
                  title: Text('Settings'),
                  contentPadding: EdgeInsets.zero,
                ),
              ),
              const PopupMenuItem(
                value: 'logout',
                child: ListTile(
                  leading: Icon(Icons.logout),
                  title: Text('Sign Out'),
                  contentPadding: EdgeInsets.zero,
                ),
              ),
            ],
          ),
        ],
      ),
      body: authState.when(
        data: (user) {
          if (user == null) {
            return const Center(
              child: Text('Please sign in to view the dashboard'),
            );
          }

          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Welcome section
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Welcome back, ${user.displayName}!',
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Here\'s what\'s happening in your house today',
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(
                                color: Theme.of(
                                  context,
                                ).colorScheme.onSurface.withValues(alpha: 0.7),
                              ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16),

                // Task summary
                taskStats.when(
                  data: (stats) => TaskSummaryCard(stats: stats),
                  loading: () => const Card(
                    child: Padding(
                      padding: EdgeInsets.all(16),
                      child: Center(child: CircularProgressIndicator()),
                    ),
                  ),
                  error: (error, stack) => Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Text(
                        'Error loading task statistics: ${error.toString()}',
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),

                // List summary
                authState.when(
                  data: (user) {
                    if (user == null) return const SizedBox.shrink();
                    final listStats = ref.watch(
                      listStatisticsProvider(user.houseId),
                    );
                    return listStats.when(
                      data: (stats) => ListSummaryCard(stats: stats),
                      loading: () => const Card(
                        child: Padding(
                          padding: EdgeInsets.all(16),
                          child: Center(child: CircularProgressIndicator()),
                        ),
                      ),
                      error: (error, stack) => Card(
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Text(
                            'Error loading list statistics: ${error.toString()}',
                          ),
                        ),
                      ),
                    );
                  },
                  loading: () => const SizedBox.shrink(),
                  error: (_, __) => const SizedBox.shrink(),
                ),
                const SizedBox(height: 16),

                // Todo summary
                authState.when(
                  data: (user) {
                    if (user == null) return const SizedBox.shrink();
                    return TodoSummaryCard(
                      houseId: user.houseId,
                      currentUserId: user.id,
                    );
                  },
                  loading: () => const SizedBox.shrink(),
                  error: (_, __) => const SizedBox.shrink(),
                ),
                const SizedBox(height: 16),

                // Quick actions
                const QuickActionsCard(),
                const SizedBox(height: 16),

                // Recent tasks section
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Recent Tasks',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const TaskListScreen(),
                          ),
                        );
                      },
                      child: const Text('View All'),
                    ),
                  ],
                ),
                const SizedBox(height: 8),

                // Recent tasks list
                _buildRecentTasks(context, ref),
                const SizedBox(height: 16),

                // Lists section
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Lists',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const ListOverviewScreen(),
                          ),
                        );
                      },
                      child: const Text('View All'),
                    ),
                  ],
                ),
                const SizedBox(height: 8),

                // Lists overview
                _buildListsOverview(context, ref),
              ],
            ),
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) =>
            Center(child: Text('Error: ${error.toString()}')),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.task_alt), label: 'Tasks'),
          BottomNavigationBarItem(icon: Icon(Icons.list), label: 'Lists'),
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'Dashboard',
          ),
        ],
        onTap: (index) {
          switch (index) {
            case 0:
              // Already on home
              break;
            case 1:
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const TaskListScreen()),
              );
              break;
            case 2:
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const ListOverviewScreen(),
                ),
              );
              break;
            case 3:
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const DashboardScreen(),
                ),
              );
              break;
          }
        },
      ),
    );
  }

  Widget _buildRecentTasks(BuildContext context, WidgetRef ref) {
    final tasksAsync = ref.watch(tasksForCurrentUserProvider);

    return tasksAsync.when(
      data: (tasks) {
        final recentTasks = tasks.take(3).toList();

        if (recentTasks.isEmpty) {
          return Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Icon(Icons.task_alt, size: 48, color: Colors.grey),
                  const SizedBox(height: 8),
                  Text(
                    'No tasks yet',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Create your first task to get started',
                    style: Theme.of(
                      context,
                    ).textTheme.bodyMedium?.copyWith(color: Colors.grey),
                  ),
                ],
              ),
            ),
          );
        }

        return Column(
          children: recentTasks
              .map(
                (task) => Card(
                  margin: const EdgeInsets.only(bottom: 8),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: _getStatusColor(task.status),
                      child: Icon(
                        _getStatusIcon(task.status),
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                    title: Text(task.title),
                    subtitle: Text(task.category.name),
                    trailing: task.dueDate != null
                        ? Text(
                            _formatDate(task.dueDate!),
                            style: Theme.of(context).textTheme.bodySmall,
                          )
                        : null,
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const TaskListScreen(),
                        ),
                      );
                    },
                  ),
                ),
              )
              .toList(),
        );
      },
      loading: () => const Card(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Center(child: CircularProgressIndicator()),
        ),
      ),
      error: (error, stack) => Card(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Text('Error loading tasks: ${error.toString()}'),
        ),
      ),
    );
  }

  Widget _buildListsOverview(BuildContext context, WidgetRef ref) {
    // TODO: Implement lists overview
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Icon(Icons.list_alt, size: 48, color: Colors.grey),
            const SizedBox(height: 8),
            Text(
              'No lists yet',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 4),
            Text(
              'Create your first list to get started',
              style: Theme.of(
                context,
              ).textTheme.bodyMedium?.copyWith(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }

  Color _getStatusColor(dynamic status) {
    switch (status.toString()) {
      case 'TaskStatus.pending':
        return Colors.orange;
      case 'TaskStatus.inProgress':
        return Colors.blue;
      case 'TaskStatus.completed':
        return Colors.green;
      case 'TaskStatus.cancelled':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  IconData _getStatusIcon(dynamic status) {
    switch (status.toString()) {
      case 'TaskStatus.pending':
        return Icons.pending;
      case 'TaskStatus.inProgress':
        return Icons.play_arrow;
      case 'TaskStatus.completed':
        return Icons.check;
      case 'TaskStatus.cancelled':
        return Icons.cancel;
      default:
        return Icons.task_alt;
    }
  }

  String _formatDate(DateTime date) {
    final now = DateTime.now();
    final difference = date.difference(now).inDays;

    if (difference == 0) {
      return 'Today';
    } else if (difference == 1) {
      return 'Tomorrow';
    } else if (difference == -1) {
      return 'Yesterday';
    } else if (difference > 0) {
      return 'In $difference days';
    } else {
      return '${-difference} days ago';
    }
  }
}
