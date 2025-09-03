import 'package:flutter/material.dart';
import 'package:house_organizer/features/todo/models/simple_todo.dart';

class TodoItem extends StatelessWidget {
  final SimpleTodo todo;
  final VoidCallback onToggle;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  const TodoItem({
    super.key,
    required this.todo,
    required this.onToggle,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: ListTile(
        leading: Checkbox(value: todo.completed, onChanged: (_) => onToggle()),
        title: Text(
          todo.title,
          style: TextStyle(
            decoration: todo.completed
                ? TextDecoration.lineThrough
                : TextDecoration.none,
            color: todo.completed
                ? Theme.of(context).colorScheme.onSurfaceVariant
                : null,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (todo.notes != null && todo.notes!.isNotEmpty) ...[
              const SizedBox(height: 4),
              Text(
                todo.notes!,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: todo.completed
                          ? Theme.of(context).colorScheme.onSurfaceVariant
                          : null,
                    ),
              ),
            ],
            const SizedBox(height: 4),
            Row(
              children: [
                Icon(
                  Icons.access_time,
                  size: 12,
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
                const SizedBox(width: 4),
                Text(
                  _formatDate(todo.createdAt),
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                      ),
                ),
                if (todo.completed && todo.completedAt != null) ...[
                  const SizedBox(width: 16),
                  Icon(Icons.check_circle, size: 12, color: Colors.green),
                  const SizedBox(width: 4),
                  Text(
                    'Completed ${_formatDate(todo.completedAt!)}',
                    style: Theme.of(
                      context,
                    ).textTheme.bodySmall?.copyWith(color: Colors.green),
                  ),
                ],
              ],
            ),
          ],
        ),
        trailing: PopupMenuButton<String>(
          onSelected: (value) {
            switch (value) {
              case 'edit':
                onEdit();
                break;
              case 'delete':
                onDelete();
                break;
            }
          },
          itemBuilder: (context) => [
            const PopupMenuItem(
              value: 'edit',
              child: Row(
                children: [Icon(Icons.edit), SizedBox(width: 8), Text('Edit')],
              ),
            ),
            const PopupMenuItem(
              value: 'delete',
              child: Row(
                children: [
                  Icon(Icons.delete, color: Colors.red),
                  SizedBox(width: 8),
                  Text('Delete', style: TextStyle(color: Colors.red)),
                ],
              ),
            ),
          ],
        ),
        onTap: onToggle,
      ),
    );
  }

  String _formatDate(DateTime date) {
    final now = DateTime.now();
    final difference = now.difference(date);

    if (difference.inDays == 0) {
      return 'Today';
    } else if (difference.inDays == 1) {
      return 'Yesterday';
    } else if (difference.inDays < 7) {
      return '${difference.inDays} days ago';
    } else {
      return '${date.day}/${date.month}/${date.year}';
    }
  }
}
