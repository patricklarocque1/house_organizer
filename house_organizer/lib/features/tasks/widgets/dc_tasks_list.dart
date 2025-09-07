import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:house_organizer/features/tasks/providers/dataconnect_task_providers.dart';

class DcTasksList extends ConsumerWidget {
  const DcTasksList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tasks = ref.watch(dcTasksProvider);
    return tasks.when(
      data: (items) {
        if (items.isEmpty) {
          return const Center(child: Text('No tasks from Data Connect'));
        }
        return ListView.separated(
          itemCount: items.length,
          separatorBuilder: (context, index) => const Divider(height: 1),
          itemBuilder: (context, index) {
            final t = items[index];
            return ListTile(
              title: Text(t.title),
              subtitle: Text(t.description),
              trailing: Text(t.status),
            );
          },
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, _) => Center(child: Text('Failed to load DC tasks: $e')),
    );
  }
}

