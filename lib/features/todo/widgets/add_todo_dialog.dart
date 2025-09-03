import 'package:flutter/material.dart';
import 'package:house_organizer/features/todo/models/simple_todo.dart';
import 'package:uuid/uuid.dart';

class AddTodoDialog extends StatefulWidget {
  final String houseId;
  final String currentUserId;
  final SimpleTodo? existingTodo;
  final Function(SimpleTodo) onTodoAdded;

  const AddTodoDialog({
    super.key,
    required this.houseId,
    required this.currentUserId,
    this.existingTodo,
    required this.onTodoAdded,
  });

  @override
  State<AddTodoDialog> createState() => _AddTodoDialogState();
}

class _AddTodoDialogState extends State<AddTodoDialog> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _notesController = TextEditingController();
  final _uuid = const Uuid();

  @override
  void initState() {
    super.initState();
    if (widget.existingTodo != null) {
      _titleController.text = widget.existingTodo!.title;
      _notesController.text = widget.existingTodo!.notes ?? '';
    }
  }

  @override
  void dispose() {
    _titleController.dispose();
    _notesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.existingTodo != null ? 'Edit Todo' : 'Add Todo'),
      content: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              controller: _titleController,
              decoration: const InputDecoration(
                labelText: 'Title',
                hintText: 'Enter todo title',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Please enter a title';
                }
                return null;
              },
              autofocus: true,
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _notesController,
              decoration: const InputDecoration(
                labelText: 'Notes (Optional)',
                hintText: 'Add any additional notes',
                border: OutlineInputBorder(),
              ),
              maxLines: 3,
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: _saveTodo,
          child: Text(widget.existingTodo != null ? 'Update' : 'Add'),
        ),
      ],
    );
  }

  void _saveTodo() {
    if (_formKey.currentState!.validate()) {
      final todo = widget.existingTodo != null
          ? widget.existingTodo!.copyWith(
              title: _titleController.text.trim(),
              notes: _notesController.text.trim().isEmpty
                  ? null
                  : _notesController.text.trim(),
            )
          : SimpleTodo(
              id: _uuid.v4(),
              title: _titleController.text.trim(),
              notes: _notesController.text.trim().isEmpty
                  ? null
                  : _notesController.text.trim(),
              createdAt: DateTime.now(),
              houseId: widget.houseId,
              createdBy: widget.currentUserId,
            );

      widget.onTodoAdded(todo);
      Navigator.of(context).pop();
    }
  }
}
