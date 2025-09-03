import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:house_organizer/features/tasks/providers/task_providers.dart';
import 'package:house_organizer/data/models/task.dart';

class TaskFilterBottomSheet extends ConsumerStatefulWidget {
  const TaskFilterBottomSheet({super.key});

  @override
  ConsumerState<TaskFilterBottomSheet> createState() => _TaskFilterBottomSheetState();
}

class _TaskFilterBottomSheetState extends ConsumerState<TaskFilterBottomSheet> {
  TaskStatus? _selectedStatus;
  TaskCategory? _selectedCategory;
  int? _selectedPriority;

  @override
  void initState() {
    super.initState();
    final currentFilter = ref.read(taskFilterProvider);
    _selectedStatus = currentFilter.status;
    _selectedCategory = currentFilter.category != null
        ? TaskCategory.values.firstWhere(
            (cat) => cat.name == currentFilter.category,
            orElse: () => TaskCategory.other,
          )
        : null;
    _selectedPriority = currentFilter.assignedTo != null
        ? int.tryParse(currentFilter.assignedTo!)
        : null;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Header
          Row(
            children: [
              Text(
                'Filter Tasks',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const Spacer(),
              TextButton(
                onPressed: () {
                  setState(() {
                    _selectedStatus = null;
                    _selectedCategory = null;
                    _selectedPriority = null;
                  });
                },
                child: const Text('Clear All'),
              ),
            ],
          ),
          const SizedBox(height: 24),

          // Status filter
          Text(
            'Status',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            children: [
              _buildStatusChip(null, 'All'),
              ...TaskStatus.values.map((status) => _buildStatusChip(status, status.displayName)),
            ],
          ),
          const SizedBox(height: 24),

          // Category filter
          Text(
            'Category',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            children: [
              _buildCategoryChip(null, 'All'),
              ...TaskCategory.values.map((category) => _buildCategoryChip(category, category.displayName)),
            ],
          ),
          const SizedBox(height: 24),

          // Priority filter
          Text(
            'Priority',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            children: [
              _buildPriorityChip(null, 'All'),
              _buildPriorityChip(1, 'Low'),
              _buildPriorityChip(2, 'Medium'),
              _buildPriorityChip(3, 'High'),
            ],
          ),
          const SizedBox(height: 32),

          // Apply button
          ElevatedButton(
            onPressed: _applyFilters,
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 16),
            ),
            child: const Text('Apply Filters'),
          ),
        ],
      ),
    );
  }

  Widget _buildStatusChip(TaskStatus? status, String label) {
    final isSelected = _selectedStatus == status;
    Color backgroundColor;
    Color textColor;

    if (isSelected) {
      backgroundColor = Theme.of(context).colorScheme.primary;
      textColor = Theme.of(context).colorScheme.onPrimary;
    } else {
      backgroundColor = Theme.of(context).colorScheme.surface;
      textColor = Theme.of(context).colorScheme.onSurface;
    }

    return FilterChip(
      label: Text(label),
      selected: isSelected,
      onSelected: (selected) {
        setState(() {
          _selectedStatus = selected ? status : null;
        });
      },
      backgroundColor: backgroundColor,
      selectedColor: backgroundColor,
      labelStyle: TextStyle(color: textColor),
      checkmarkColor: textColor,
    );
  }

  Widget _buildCategoryChip(TaskCategory? category, String label) {
    final isSelected = _selectedCategory == category;
    Color backgroundColor;
    Color textColor;

    if (isSelected) {
      backgroundColor = Theme.of(context).colorScheme.secondary;
      textColor = Theme.of(context).colorScheme.onSecondary;
    } else {
      backgroundColor = Theme.of(context).colorScheme.surface;
      textColor = Theme.of(context).colorScheme.onSurface;
    }

    return FilterChip(
      label: Text(label),
      selected: isSelected,
      onSelected: (selected) {
        setState(() {
          _selectedCategory = selected ? category : null;
        });
      },
      backgroundColor: backgroundColor,
      selectedColor: backgroundColor,
      labelStyle: TextStyle(color: textColor),
      checkmarkColor: textColor,
    );
  }

  Widget _buildPriorityChip(int? priority, String label) {
    final isSelected = _selectedPriority == priority;
    Color backgroundColor;
    Color textColor;

    if (isSelected) {
      backgroundColor = Theme.of(context).colorScheme.tertiary;
      textColor = Theme.of(context).colorScheme.onTertiary;
    } else {
      backgroundColor = Theme.of(context).colorScheme.surface;
      textColor = Theme.of(context).colorScheme.onSurface;
    }

    return FilterChip(
      label: Text(label),
      selected: isSelected,
      onSelected: (selected) {
        setState(() {
          _selectedPriority = selected ? priority : null;
        });
      },
      backgroundColor: backgroundColor,
      selectedColor: backgroundColor,
      labelStyle: TextStyle(color: textColor),
      checkmarkColor: textColor,
    );
  }

  void _applyFilters() {
    final filter = TaskStatusFilter(
      status: _selectedStatus,
      category: _selectedCategory?.name,
      assignedTo: _selectedPriority?.toString(),
    );

    ref.read(taskFilterProvider.notifier).state = filter;
    Navigator.of(context).pop();
  }
}
