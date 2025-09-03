import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:house_organizer/data/models/list_model.dart';
import 'package:house_organizer/features/auth/providers/auth_providers.dart';
import 'package:house_organizer/features/lists/providers/list_providers.dart';

class CreateListScreen extends ConsumerStatefulWidget {
  const CreateListScreen({super.key});

  @override
  ConsumerState<CreateListScreen> createState() => _CreateListScreenState();
}

class _CreateListScreenState extends ConsumerState<CreateListScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _assignedToController = TextEditingController();

  ListType _selectedType = ListType.grocery;
  DateTime? _selectedDueDate;
  bool _isShared = true;

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    _assignedToController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create List'),
        actions: [TextButton(onPressed: _saveList, child: const Text('Save'))],
      ),
      body: Consumer(
        builder: (context, ref, child) {
          final authState = ref.watch(authNotifierProvider);

          return authState.when(
            data: (user) {
              if (user == null) {
                return const Center(
                  child: Text('Please sign in to create lists'),
                );
              }

              return _buildForm();
            },
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (error, stack) =>
                Center(child: Text('Error: ${error.toString()}')),
          );
        },
      ),
    );
  }

  Widget _buildForm() {
    return Form(
      key: _formKey,
      child: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // List name
          TextFormField(
            controller: _nameController,
            decoration: const InputDecoration(
              labelText: 'List Name',
              hintText: 'Enter list name',
              border: OutlineInputBorder(),
            ),
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return 'Please enter a list name';
              }
              return null;
            },
          ),
          const SizedBox(height: 16),

          // List type
          DropdownButtonFormField<ListType>(
            initialValue: _selectedType,
            decoration: const InputDecoration(
              labelText: 'List Type',
              border: OutlineInputBorder(),
            ),
            items: ListType.values.map((type) {
              return DropdownMenuItem(
                value: type,
                child: Text(type.displayName),
              );
            }).toList(),
            onChanged: (value) {
              if (value != null) {
                setState(() {
                  _selectedType = value;
                });
              }
            },
          ),
          const SizedBox(height: 16),

          // Description
          TextFormField(
            controller: _descriptionController,
            decoration: const InputDecoration(
              labelText: 'Description (Optional)',
              hintText: 'Enter description',
              border: OutlineInputBorder(),
            ),
            maxLines: 3,
          ),
          const SizedBox(height: 16),

          // Assigned to
          TextFormField(
            controller: _assignedToController,
            decoration: const InputDecoration(
              labelText: 'Assigned To (Optional)',
              hintText: 'Enter person name',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 16),

          // Due date
          InkWell(
            onTap: _selectDueDate,
            child: InputDecorator(
              decoration: const InputDecoration(
                labelText: 'Due Date (Optional)',
                border: OutlineInputBorder(),
                suffixIcon: Icon(Icons.calendar_today),
              ),
              child: Text(
                _selectedDueDate != null
                    ? '${_selectedDueDate!.day}/${_selectedDueDate!.month}/${_selectedDueDate!.year}'
                    : 'Select due date',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
          ),
          const SizedBox(height: 16),

          // Shared toggle
          SwitchListTile(
            title: const Text('Shared List'),
            subtitle: const Text('Allow other house members to view and edit'),
            value: _isShared,
            onChanged: (value) {
              setState(() {
                _isShared = value;
              });
            },
          ),
          const SizedBox(height: 32),

          // Save button
          ElevatedButton(
            onPressed: _saveList,
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 16),
            ),
            child: const Text('Create List'),
          ),
        ],
      ),
    );
  }

  Future<void> _selectDueDate() async {
    final date = await showDatePicker(
      context: context,
      initialDate: DateTime.now().add(const Duration(days: 1)),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );

    if (date != null) {
      setState(() {
        _selectedDueDate = date;
      });
    }
  }

  Future<void> _saveList() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    try {
      await ref
          .read(listNotifierProvider.notifier)
          .createList(
            name: _nameController.text.trim(),
            type: _selectedType,
            description: _descriptionController.text.trim().isEmpty
                ? null
                : _descriptionController.text.trim(),
            assignedTo: _assignedToController.text.trim().isEmpty
                ? null
                : _assignedToController.text.trim(),
            isShared: _isShared,
            dueDate: _selectedDueDate,
          );

      if (mounted) {
        Navigator.of(context).pop();
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('List created successfully')),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Error creating list: $e')));
      }
    }
  }
}
