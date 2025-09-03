import 'package:flutter/material.dart';
import 'package:house_organizer/data/models/list_model.dart';
import 'package:uuid/uuid.dart';

class AddItemDialog extends StatefulWidget {
  final ListItem? initialItem;
  final Function(ListItem) onAddItem;

  const AddItemDialog({super.key, this.initialItem, required this.onAddItem});

  @override
  State<AddItemDialog> createState() => _AddItemDialogState();
}

class _AddItemDialogState extends State<AddItemDialog> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _quantityController = TextEditingController();
  final _notesController = TextEditingController();
  final _priceController = TextEditingController();
  final _categoryController = TextEditingController();

  bool _isEditMode = false;

  @override
  void initState() {
    super.initState();
    _isEditMode = widget.initialItem != null;

    if (_isEditMode) {
      final item = widget.initialItem!;
      _nameController.text = item.name;
      _quantityController.text = item.quantity.toString();
      _notesController.text = item.notes ?? '';
      _priceController.text = item.estimatedPrice?.toString() ?? '';
      _categoryController.text = item.category ?? '';
    } else {
      _quantityController.text = '1';
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _quantityController.dispose();
    _notesController.dispose();
    _priceController.dispose();
    _categoryController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(_isEditMode ? 'Edit Item' : 'Add Item'),
      content: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Item name
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: 'Item Name',
                  hintText: 'Enter item name',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter an item name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // Quantity
              TextFormField(
                controller: _quantityController,
                decoration: const InputDecoration(
                  labelText: 'Quantity',
                  hintText: 'Enter quantity',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter a quantity';
                  }
                  final quantity = int.tryParse(value);
                  if (quantity == null || quantity < 1) {
                    return 'Please enter a valid quantity';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // Category
              TextFormField(
                controller: _categoryController,
                decoration: const InputDecoration(
                  labelText: 'Category (Optional)',
                  hintText: 'e.g., Dairy, Fruits, Vegetables',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),

              // Estimated price
              TextFormField(
                controller: _priceController,
                decoration: const InputDecoration(
                  labelText: 'Estimated Price (Optional)',
                  hintText: '0.00',
                  border: OutlineInputBorder(),
                  prefixText: '\$',
                ),
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                validator: (value) {
                  if (value != null && value.isNotEmpty) {
                    final price = double.tryParse(value);
                    if (price == null || price < 0) {
                      return 'Please enter a valid price';
                    }
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // Notes
              TextFormField(
                controller: _notesController,
                decoration: const InputDecoration(
                  labelText: 'Notes (Optional)',
                  hintText: 'Any additional notes',
                  border: OutlineInputBorder(),
                ),
                maxLines: 3,
              ),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: _saveItem,
          child: Text(_isEditMode ? 'Update' : 'Add'),
        ),
      ],
    );
  }

  void _saveItem() {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    final quantity = int.parse(_quantityController.text);
    final price = _priceController.text.isNotEmpty
        ? double.tryParse(_priceController.text)
        : null;

    final item = ListItem(
      id: _isEditMode ? widget.initialItem!.id : const Uuid().v4(),
      name: _nameController.text.trim(),
      quantity: quantity,
      isPurchased: _isEditMode ? widget.initialItem!.isPurchased : false,
      notes: _notesController.text.trim().isEmpty
          ? null
          : _notesController.text.trim(),
      category: _categoryController.text.trim().isEmpty
          ? null
          : _categoryController.text.trim(),
      estimatedPrice: price,
      purchasedAt: _isEditMode ? widget.initialItem!.purchasedAt : null,
      purchasedBy: _isEditMode ? widget.initialItem!.purchasedBy : null,
    );

    widget.onAddItem(item);
    Navigator.of(context).pop();
  }
}
