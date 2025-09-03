import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:house_organizer/features/todo/providers/todo_providers.dart';
import 'package:house_organizer/features/todo/screens/todo_list_screen.dart';

class TodoSummaryCard extends ConsumerWidget {
  final String houseId;
  final String currentUserId;

  const TodoSummaryCard({
    super.key,
    required this.houseId,
    required this.currentUserId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todoState = ref.watch(todoListProvider(houseId));

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'To-Do List',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => TodoListScreen(
                          houseId: houseId,
                          currentUserId: currentUserId,
                        ),
                      ),
                    );
                  },
                  icon: const Icon(Icons.arrow_forward),
                ),
              ],
            ),
            const SizedBox(height: 12),
            todoState.when(
              data: (todos) {
                final completedCount = todos.where((todo) => todo.completed).length;
                final pendingCount = todos.length - completedCount;
                final totalCount = todos.length;

                return Column(
                  children: [
                    Row(
                      children: [
                        _buildStatItem(
                          context,
                          'Total',
                          totalCount.toString(),
                          Icons.checklist,
                          Theme.of(context).colorScheme.primary,
                        ),
                        const SizedBox(width: 16),
                        _buildStatItem(
                          context,
                          'Completed',
                          completedCount.toString(),
                          Icons.check_circle,
                          Colors.green,
                        ),
                        const SizedBox(width: 16),
                        _buildStatItem(
                          context,
                          'Pending',
                          pendingCount.toString(),
                          Icons.pending,
                          Colors.orange,
                        ),
                      ],
                    ),
                    if (totalCount > 0) ...[
                      const SizedBox(height: 12),
                      LinearProgressIndicator(
                        value: totalCount > 0 ? completedCount / totalCount : 0,
                        backgroundColor: Theme.of(context).colorScheme.surfaceContainerHighest,
                        valueColor: AlwaysStoppedAnimation<Color>(
                          Theme.of(context).colorScheme.primary,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        '${((completedCount / totalCount) * 100).toStringAsFixed(0)}% completed',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Theme.of(context).colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ],
                );
              },
              loading: () => const Center(
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: CircularProgressIndicator(),
                ),
              ),
              error: (error, stackTrace) => Center(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Icon(
                        Icons.error_outline,
                        color: Theme.of(context).colorScheme.error,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Error loading todos',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Theme.of(context).colorScheme.error,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 12),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => TodoListScreen(
                        houseId: houseId,
                        currentUserId: currentUserId,
                      ),
                    ),
                  );
                },
                icon: const Icon(Icons.add),
                label: const Text('Add Todo'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatItem(
    BuildContext context,
    String label,
    String value,
    IconData icon,
    Color color,
  ) {
    return Expanded(
      child: Column(
        children: [
          Icon(
            icon,
            color: color,
            size: 24,
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
          Text(
            label,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }
}
