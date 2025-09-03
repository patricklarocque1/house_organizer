import 'package:flutter/material.dart';
import 'package:house_organizer/data/models/list_model.dart';
import 'package:house_organizer/features/lists/providers/list_providers.dart';

class ListFilterBottomSheet extends StatefulWidget {
  final ListTypeFilter currentFilter;
  final Function(ListTypeFilter) onFilterChanged;

  const ListFilterBottomSheet({
    super.key,
    required this.currentFilter,
    required this.onFilterChanged,
  });

  @override
  State<ListFilterBottomSheet> createState() => _ListFilterBottomSheetState();
}

class _ListFilterBottomSheetState extends State<ListFilterBottomSheet> {
  ListType? _selectedType;
  bool? _selectedCompletionStatus;

  @override
  void initState() {
    super.initState();
    _selectedType = widget.currentFilter.type;
    _selectedCompletionStatus = widget.currentFilter.isCompleted;
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
                'Filter Lists',
                style: Theme.of(
                  context,
                ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
              ),
              const Spacer(),
              TextButton(
                onPressed: () {
                  setState(() {
                    _selectedType = null;
                    _selectedCompletionStatus = null;
                  });
                },
                child: const Text('Clear All'),
              ),
            ],
          ),
          const SizedBox(height: 24),

          // Type filter
          Text(
            'Type',
            style: Theme.of(
              context,
            ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            children: [
              _buildTypeChip(null, 'All'),
              ...ListType.values.map(
                (type) => _buildTypeChip(type, type.displayName),
              ),
            ],
          ),
          const SizedBox(height: 24),

          // Completion status filter
          Text(
            'Status',
            style: Theme.of(
              context,
            ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            children: [
              _buildStatusChip(null, 'All'),
              _buildStatusChip(false, 'Pending'),
              _buildStatusChip(true, 'Completed'),
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

  Widget _buildTypeChip(ListType? type, String label) {
    final isSelected = _selectedType == type;
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
          _selectedType = selected ? type : null;
        });
      },
      backgroundColor: backgroundColor,
      selectedColor: backgroundColor,
      labelStyle: TextStyle(color: textColor),
      checkmarkColor: textColor,
    );
  }

  Widget _buildStatusChip(bool? status, String label) {
    final isSelected = _selectedCompletionStatus == status;
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
          _selectedCompletionStatus = selected ? status : null;
        });
      },
      backgroundColor: backgroundColor,
      selectedColor: backgroundColor,
      labelStyle: TextStyle(color: textColor),
      checkmarkColor: textColor,
    );
  }

  void _applyFilters() {
    final filter = ListTypeFilter(
      type: _selectedType,
      isCompleted: _selectedCompletionStatus,
    );

    widget.onFilterChanged(filter);
    Navigator.of(context).pop();
  }
}
