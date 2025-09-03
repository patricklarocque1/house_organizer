import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:house_organizer/data/models/list_model.dart';
import 'package:house_organizer/data/models/list_item.dart';
import 'package:house_organizer/features/lists/providers/list_providers.dart';
import 'package:house_organizer/features/lists/widgets/list_item_card.dart';
import 'package:house_organizer/features/lists/widgets/add_item_dialog.dart';

class ListDetailScreen extends ConsumerStatefulWidget {
  final String listId;

  const ListDetailScreen({super.key, required this.listId});

  @override
  ConsumerState<ListDetailScreen> createState() => _ListDetailScreenState();
}

class _ListDetailScreenState extends ConsumerState<ListDetailScreen> {
  String _searchQuery = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List Details'),
        actions: [
          IconButton(
            onPressed: _showAddItemDialog,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Column(
        children: [
          // Search bar
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search items...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onChanged: (value) {
                setState(() {
                  _searchQuery = value;
                });
              },
            ),
          ),
          // List content
          Expanded(child: _buildListContent()),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddItemDialog,
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildListContent() {
    final listAsync = ref.watch(listProvider(widget.listId));
    return listAsync.when(
      data: (list) {
        if (list == null) {
          return const Center(child: Text('List not found'));
        }
        return _buildListItems(list);
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, _) => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error, size: 64, color: Colors.red),
            const SizedBox(height: 16),
            Text(
              'Error loading list',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 8),
            Text(
              error.toString(),
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(color: Colors.grey),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildListItems(ListModel list) {
    // Apply search filter
    final filteredItems = _searchQuery.isEmpty
        ? list.items
        : list.items
            .where(
              (item) =>
                  item.name.toLowerCase().contains(
                        _searchQuery.toLowerCase(),
                      ) ||
                  (item.notes?.toLowerCase().contains(
                            _searchQuery.toLowerCase(),
                          ) ??
                      false),
            )
            .toList();

    if (filteredItems.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.list_alt, size: 64, color: Colors.grey),
            const SizedBox(height: 16),
            Text(
              _searchQuery.isNotEmpty
                  ? 'No items found'
                  : 'No items in this list',
              style: Theme.of(
                context,
              ).textTheme.titleLarge?.copyWith(color: Colors.grey),
            ),
            const SizedBox(height: 8),
            Text(
              _searchQuery.isNotEmpty
                  ? 'Try adjusting your search terms'
                  : 'Add items to get started',
              style: Theme.of(
                context,
              ).textTheme.bodyMedium?.copyWith(color: Colors.grey),
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: filteredItems.length,
      itemBuilder: (context, index) {
        final item = filteredItems[index];
        return ListItemCard(
          item: item,
          onTogglePurchased: () => _toggleItemPurchased(item),
          onEdit: () => _showEditItemDialog(item),
          onDelete: () => _showDeleteItemConfirmation(item),
        );
      },
    );
  }

  // Removed mock _getList; using provider instead

  void _showAddItemDialog() {
    showDialog(
      context: context,
      builder: (context) => AddItemDialog(
        onAddItem: (ListItem item) {
          // In real implementation, this would call the repository
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text('Added ${item.name} to list')));
        },
      ),
    );
  }

  void _showEditItemDialog(ListItem item) {
    showDialog(
      context: context,
      builder: (context) => AddItemDialog(
        initialItem: item,
        onAddItem: (ListItem updatedItem) {
          // In real implementation, this would call the repository
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Updated ${updatedItem.name}')),
          );
        },
      ),
    );
  }

  void _toggleItemPurchased(ListItem item) {
    final updatedItem = item.copyWith(
      isPurchased: !item.isPurchased,
      purchasedAt: !item.isPurchased ? DateTime.now() : null,
    );

    // In real implementation, this would call the repository
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          updatedItem.isPurchased
              ? 'Marked ${item.name} as purchased'
              : 'Marked ${item.name} as not purchased',
        ),
      ),
    );
  }

  void _showDeleteItemConfirmation(ListItem item) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Item'),
        content: Text('Are you sure you want to delete "${item.name}"?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              // In real implementation, this would call the repository
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text('Deleted ${item.name}')));
            },
            style: TextButton.styleFrom(foregroundColor: Colors.red),
            child: const Text('Delete'),
          ),
        ],
      ),
    );
  }
}
