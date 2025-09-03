import 'package:flutter/material.dart';
import 'package:house_organizer/data/models/task.dart';
import 'package:house_organizer/shared/coming_soon_screen.dart';

class TaskDetailScreen extends StatelessWidget {
  final Task task;
  const TaskDetailScreen({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return ComingSoonScreen(
      title: 'Task Details',
      message: 'Details for "${task.title}" will appear here.',
      icon: Icons.task_outlined,
    );
  }
}
