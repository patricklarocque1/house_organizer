import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:house_organizer/features/tasks/providers/task_providers.dart';
import 'package:house_organizer/core/services/dataconnect_service.dart';
import 'package:house_organizer/core/constants/app_constants.dart';
import 'package:house_organizer/core/services/hive_service.dart';
import 'package:house_organizer/core/services/firebase_service.dart';
import 'package:house_organizer/features/settings/providers/dc_settings_provider.dart';
import 'package:house_organizer/features/auth/providers/auth_providers.dart';
import 'package:house_organizer/data/models/task.dart';

class CreateTaskScreen extends ConsumerStatefulWidget {
  const CreateTaskScreen({super.key});

  @override
  ConsumerState<CreateTaskScreen> createState() => _CreateTaskScreenState();
}

class _CreateTaskScreenState extends ConsumerState<CreateTaskScreen> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _notesController = TextEditingController();
  final _tagsController = TextEditingController();

  TaskCategory _selectedCategory = TaskCategory.other;

  RepeatInterval _selectedRepeat = RepeatInterval.none;
  int _selectedPriority = 1;
  DateTime? _selectedDueDate;
  String? _selectedAssignee;
  bool _assignToMe = false;

  bool _isLoading = false;

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    _notesController.dispose();
    _tagsController.dispose();
    super.dispose();
  }

  Future<void> _createTask() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() {
      _isLoading = true;
    });

    try {
      final tags = _tagsController.text
          .split(',')
          .map((tag) => tag.trim())
          .where((tag) => tag.isNotEmpty)
          .toList();

      await ref.read(taskNotifierProvider.notifier).createTask(
            title: _titleController.text.trim(),
            description: _descriptionController.text.trim(),
            category: _selectedCategory,
            assignedTo: _selectedAssignee,
            dueDate: _selectedDueDate,
            repeatInterval: _selectedRepeat,
            priority: _selectedPriority,
            tags: tags.isNotEmpty ? tags : null,
            notes: _notesController.text.trim().isNotEmpty
                ? _notesController.text.trim()
                : null,
          );

      // Mirror create into Firebase Data Connect (optional, non-blocking)
      try {
        final auth = ref.read(authNotifierProvider).value;
        if (auth != null) {
          final dcSettings = ref.read(dcSettingsProvider);
          if (!dcSettings.mirrorEnabled) {
            // Skip DC mirror entirely
          } else if (dcSettings.mirrorOnlyWhenAssigned &&
              _selectedAssignee == null &&
              !_assignToMe) {
            // Skip DC mirror when no assignee selected and setting requires it
          } else {
            final dc = ref.read(dataConnectServiceProvider);
            final now = DateTime.now();
            final due = _selectedDueDate ?? now;
            final assigned = _selectedAssignee ?? auth.id; // if Assign to me on, set earlier

            // Fetch real GroupHome details
            String ghName = 'House';
            String ghAddress = '';
            try {
              final hive = HiveService.instance;
              final cached = hive.housesBox.get(auth.houseId);
              if (cached != null) {
                ghName = cached.name;
                ghAddress = cached.address;
              } else {
                final doc = await FirebaseService.instance.getDocument(
                  AppConstants.housesCollection,
                  auth.houseId,
                );
                if (doc.exists) {
                  final data = doc.data() as Map<String, dynamic>;
                  ghName = (data['name'] as String?) ?? ghName;
                  ghAddress = (data['address'] as String?) ?? ghAddress;
                }
              }
            } catch (_) {}

            // Ensure relational rows exist to avoid FK errors
            await dc.ensureUserAndGroupHome(
              userId: auth.id,
              displayName: auth.displayName,
              email: auth.email,
              role: auth.role.name,
              photoUrl: auth.profileImageUrl,
              groupHomeId: auth.houseId,
              groupHomeName: ghName,
              groupHomeAddress: ghAddress,
            );

            await dc.createTask(
              groupHomeId: auth.houseId,
              assignedToUserId: assigned,
              title: _titleController.text.trim(),
              description: _descriptionController.text.trim(),
              dueDate: DataConnectService.tsFromDateTime(due),
              type: _selectedCategory.name,
              createdAt: DataConnectService.tsFromDateTime(now),
            );
          }
        }
      } catch (e) {
        // Best-effort: do not block Firestore flow if Data Connect is unavailable
        // ignore: avoid_print
        print('Data Connect mirror failed: $e');
      }

      if (mounted) {
        Navigator.of(context).pop();
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Task created successfully!'),
            backgroundColor: Colors.green,
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to create task: ${e.toString()}'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Task'),
        actions: [
          TextButton(
            onPressed: _isLoading ? null : _createTask,
            child: _isLoading
                ? const SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  )
                : const Text('Create'),
          ),
        ],
      ),
      body: authState.when(
        data: (user) {
          if (user == null) {
            return const Center(child: Text('Please sign in to create tasks'));
          }

          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Title field
                  TextFormField(
                    controller: _titleController,
                    decoration: const InputDecoration(
                      labelText: 'Task Title *',
                      hintText: 'Enter task title',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Please enter a task title';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),

                  // Description field
                  TextFormField(
                    controller: _descriptionController,
                    maxLines: 3,
                    decoration: const InputDecoration(
                      labelText: 'Description *',
                      hintText: 'Enter task description',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Please enter a task description';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),

                  // Category dropdown
                  DropdownButtonFormField<TaskCategory>(
                    initialValue: _selectedCategory,
                    decoration: const InputDecoration(
                      labelText: 'Category',
                      border: OutlineInputBorder(),
                    ),
                    items: TaskCategory.values.map((category) {
                      return DropdownMenuItem(
                        value: category,
                        child: Text(category.displayName),
                      );
                    }).toList(),
                    onChanged: (value) {
                      if (value != null) {
                        setState(() {
                          _selectedCategory = value;
                        });
                      }
                    },
                  ),
                  const SizedBox(height: 16),

                  // Priority dropdown
                  DropdownButtonFormField<int>(
                    initialValue: _selectedPriority,
                    decoration: const InputDecoration(
                      labelText: 'Priority',
                      border: OutlineInputBorder(),
                    ),
                    items: const [
                      DropdownMenuItem(value: 1, child: Text('Low')),
                      DropdownMenuItem(value: 2, child: Text('Medium')),
                      DropdownMenuItem(value: 3, child: Text('High')),
                    ],
                    onChanged: (value) {
                      if (value != null) {
                        setState(() {
                          _selectedPriority = value;
                        });
                      }
                    },
                  ),
                  const SizedBox(height: 16),

                  // Due date field
                  InkWell(
                    onTap: () => _selectDueDate(context),
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

                  // Repeat interval dropdown
                  DropdownButtonFormField<RepeatInterval>(
                    initialValue: _selectedRepeat,
                    decoration: const InputDecoration(
                      labelText: 'Repeat',
                      border: OutlineInputBorder(),
                    ),
                    items: RepeatInterval.values.map((interval) {
                      return DropdownMenuItem(
                        value: interval,
                        child: Text(interval.displayName),
                      );
                    }).toList(),
                    onChanged: (value) {
                      if (value != null) {
                        setState(() {
                          _selectedRepeat = value;
                        });
                      }
                    },
                  ),
                  const SizedBox(height: 16),

                  // Assign to me switch
                  Card(
                    child: SwitchListTile(
                      title: const Text('Assign to me'),
                      subtitle: const Text('Set yourself as assignee'),
                      value: _assignToMe,
                      onChanged: (val) {
                        setState(() {
                          _assignToMe = val;
                          if (val) {
                            _selectedAssignee = user.id;
                          } else if (_selectedAssignee == user.id) {
                            _selectedAssignee = null;
                          }
                        });
                      },
                    ),
                  ),

                  // Tags field
                  TextFormField(
                    controller: _tagsController,
                    decoration: const InputDecoration(
                      labelText: 'Tags (Optional)',
                      hintText: 'Enter tags separated by commas',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Notes field
                  TextFormField(
                    controller: _notesController,
                    maxLines: 3,
                    decoration: const InputDecoration(
                      labelText: 'Notes (Optional)',
                      hintText: 'Additional notes or instructions',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 32),

                  // Create button
                  ElevatedButton(
                    onPressed: _isLoading ? null : _createTask,
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                    child: _isLoading
                        ? const SizedBox(
                            height: 20,
                            width: 20,
                            child: CircularProgressIndicator(strokeWidth: 2),
                          )
                        : const Text('Create Task'),
                  ),
                ],
              ),
            ),
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) =>
            Center(child: Text('Error: ${error.toString()}')),
      ),
    );
  }

  Future<void> _selectDueDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDueDate ?? DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );

    if (picked != null && picked != _selectedDueDate) {
      setState(() {
        _selectedDueDate = picked;
      });
    }
  }
}
