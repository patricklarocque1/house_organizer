import 'package:flutter/material.dart';
import 'package:house_organizer/data/models/list_item.dart';

class ListItemCard extends StatelessWidget {
  final ListItem item;
  final VoidCallback? onTogglePurchased;
  final VoidCallback? onEdit;
  final VoidCallback? onDelete;

  const ListItemCard({
    super.key,
    required this.item,
    this.onTogglePurchased,
    this.onEdit,
    this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: ListTile(
        leading: Semantics(
          label: item.isPurchased
              ? 'Mark ${item.name} as not purchased'
              : 'Mark ${item.name} as purchased',
          toggled: item.isPurchased,
          child: Checkbox(
            value: item.isPurchased,
            onChanged:
                onTogglePurchased != null ? (_) => onTogglePurchased!() : null,
          ),
        ),
        title: Text(
          item.name,
          style: TextStyle(
            decoration: item.isPurchased ? TextDecoration.lineThrough : null,
            color: item.isPurchased
                ? Theme.of(context).colorScheme.onSurface.withOpacity(0.6)
                : null,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (item.quantity > 1)
              Text(
                'Quantity: ${item.quantity}',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Theme.of(
                        context,
                      ).colorScheme.onSurface.withOpacity(0.6),
                    ),
              ),
            if (item.category != null)
              Text(
                'Category: ${item.category}',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Theme.of(
                        context,
                      ).colorScheme.onSurface.withOpacity(0.6),
                    ),
              ),
            if (item.notes != null && item.notes!.isNotEmpty)
              Text(
                item.notes!,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Theme.of(
                        context,
                      ).colorScheme.onSurface.withOpacity(0.6),
                    ),
              ),
            if (item.estimatedPrice != null)
              Text(
                '\$${item.estimatedPrice!.toStringAsFixed(2)}',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                    ),
              ),
          ],
        ),
        trailing: PopupMenuButton<String>(
          tooltip: 'Item actions',
          onSelected: (value) {
            switch (value) {
              case 'edit':
                onEdit?.call();
                break;
              case 'delete':
                onDelete?.call();
                break;
            }
          },
          itemBuilder: (context) => [
            PopupMenuItem(
              value: 'edit',
              child: Semantics(
                button: true,
                label: 'Edit item ${item.name}',
                child: const Row(
                  children: [
                    Icon(Icons.edit, size: 20),
                    SizedBox(width: 8),
                    Text('Edit'),
                  ],
                ),
              ),
            ),
            PopupMenuItem(
              value: 'delete',
              child: Semantics(
                button: true,
                label: 'Delete item ${item.name}',
                child: const Row(
                  children: [
                    Icon(Icons.delete, size: 20, color: Colors.red),
                    SizedBox(width: 8),
                    Text('Delete', style: TextStyle(color: Colors.red)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
