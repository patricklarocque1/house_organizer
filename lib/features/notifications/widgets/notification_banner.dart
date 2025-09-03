import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:house_organizer/features/notifications/providers/notification_providers.dart';

class NotificationBanner extends ConsumerStatefulWidget {
  final Widget child;

  const NotificationBanner({super.key, required this.child});

  @override
  ConsumerState<NotificationBanner> createState() => _NotificationBannerState();
}

class _NotificationBannerState extends ConsumerState<NotificationBanner> {
  @override
  void initState() {
    super.initState();
    _initializeNotifications();
  }

  Future<void> _initializeNotifications() async {
    final notificationService = ref.read(notificationServiceProvider);
    await notificationService.initialize();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        widget.child,
        // Future: Add notification banner overlay here
      ],
    );
  }
}

// Notification card widget for displaying notification content
class NotificationCard extends StatelessWidget {
  final String title;
  final String body;
  final IconData icon;
  final Color? iconColor;
  final VoidCallback? onTap;
  final VoidCallback? onDismiss;

  const NotificationCard({
    super.key,
    required this.title,
    required this.body,
    required this.icon,
    this.iconColor,
    this.onTap,
    this.onDismiss,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: (iconColor ?? Theme.of(context).colorScheme.primary)
                      .withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  icon,
                  color: iconColor ?? Theme.of(context).colorScheme.primary,
                  size: 24,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      body,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ),
              if (onDismiss != null)
                IconButton(
                  onPressed: onDismiss,
                  icon: const Icon(Icons.close),
                  iconSize: 20,
                ),
            ],
          ),
        ),
      ),
    );
  }
}

// Notification list widget for displaying multiple notifications
class NotificationList extends StatelessWidget {
  final List<NotificationItem> notifications;
  final VoidCallback? onClearAll;

  const NotificationList({
    super.key,
    required this.notifications,
    this.onClearAll,
  });

  @override
  Widget build(BuildContext context) {
    if (notifications.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.notifications_none,
              size: 64,
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
            const SizedBox(height: 16),
            Text(
              'No notifications',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'You\'re all caught up!',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ),
      );
    }

    return Column(
      children: [
        if (onClearAll != null && notifications.isNotEmpty)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${notifications.length} notification${notifications.length == 1 ? '' : 's'}',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
                ),
                TextButton(
                  onPressed: onClearAll,
                  child: const Text('Clear All'),
                ),
              ],
            ),
          ),
        Expanded(
          child: ListView.builder(
            itemCount: notifications.length,
            itemBuilder: (context, index) {
              final notification = notifications[index];
              return NotificationCard(
                title: notification.title,
                body: notification.body,
                icon: notification.icon,
                iconColor: notification.iconColor,
                onTap: notification.onTap,
                onDismiss: notification.onDismiss,
              );
            },
          ),
        ),
      ],
    );
  }
}

// Notification item model
class NotificationItem {
  final String title;
  final String body;
  final IconData icon;
  final Color? iconColor;
  final VoidCallback? onTap;
  final VoidCallback? onDismiss;
  final DateTime timestamp;

  NotificationItem({
    required this.title,
    required this.body,
    required this.icon,
    this.iconColor,
    this.onTap,
    this.onDismiss,
    DateTime? timestamp,
  }) : timestamp = timestamp ?? DateTime.now();
}
