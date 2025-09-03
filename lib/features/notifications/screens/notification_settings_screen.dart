import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:house_organizer/features/notifications/providers/notification_providers.dart';
import 'package:house_organizer/data/models/task.dart';
import 'package:house_organizer/data/models/list_model.dart';

class NotificationSettingsScreen extends ConsumerStatefulWidget {
  const NotificationSettingsScreen({super.key});

  @override
  ConsumerState<NotificationSettingsScreen> createState() =>
      _NotificationSettingsScreenState();
}

class _NotificationSettingsScreenState
    extends ConsumerState<NotificationSettingsScreen> {
  @override
  Widget build(BuildContext context) {
    final settings = ref.watch(notificationSettingsProvider);
    final settingsNotifier = ref.read(notificationSettingsProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Notification Settings'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          // Push Notifications Section
          _buildSectionHeader('Push Notifications'),
          _buildSwitchTile(
            title: 'Enable Push Notifications',
            subtitle: 'Receive notifications from the server',
            value: settings.pushNotifications,
            onChanged: settingsNotifier.updatePushNotifications,
          ),

          const SizedBox(height: 24),

          // Task Notifications Section
          _buildSectionHeader('Task Notifications'),
          _buildSwitchTile(
            title: 'Task Assignments',
            subtitle: 'Get notified when tasks are assigned to you',
            value: settings.taskNotifications,
            onChanged: settingsNotifier.updateTaskNotifications,
          ),
          _buildSwitchTile(
            title: 'Task Reminders',
            subtitle: 'Get reminded about upcoming task due dates',
            value: settings.reminders,
            onChanged: settingsNotifier.updateReminders,
          ),

          const SizedBox(height: 24),

          // List Notifications Section
          _buildSectionHeader('List Notifications'),
          _buildSwitchTile(
            title: 'List Assignments',
            subtitle: 'Get notified when lists are assigned to you',
            value: settings.listNotifications,
            onChanged: settingsNotifier.updateListNotifications,
          ),

          const SizedBox(height: 24),

          // Daily Summary Section
          _buildSectionHeader('Daily Summary'),
          _buildSwitchTile(
            title: 'Daily Summary',
            subtitle: 'Receive daily task and list summaries at 9 AM',
            value: settings.dailySummary,
            onChanged: settingsNotifier.updateDailySummary,
          ),

          const SizedBox(height: 24),

          // Quiet Hours Section
          _buildSectionHeader('Quiet Hours'),
          _buildQuietHoursCard(settings, settingsNotifier),

          const SizedBox(height: 24),

          // Test Notifications Section
          _buildSectionHeader('Test Notifications'),
          _buildTestNotificationsCard(),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(
        title,
        style: Theme.of(context).textTheme.titleMedium?.copyWith(
          fontWeight: FontWeight.bold,
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
    );
  }

  Widget _buildSwitchTile({
    required String title,
    required String subtitle,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return Card(
      child: SwitchListTile(
        title: Text(title),
        subtitle: Text(subtitle),
        value: value,
        onChanged: onChanged,
        secondary: Icon(
          value ? Icons.notifications_active : Icons.notifications_off,
          color: value
              ? Theme.of(context).colorScheme.primary
              : Theme.of(context).colorScheme.onSurfaceVariant,
        ),
      ),
    );
  }

  Widget _buildQuietHoursCard(
    NotificationSettings settings,
    NotificationSettingsNotifier notifier,
  ) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  Icons.bedtime,
                  color: Theme.of(context).colorScheme.primary,
                ),
                const SizedBox(width: 8),
                Text(
                  'Quiet Hours',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              'No notifications will be sent during quiet hours',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Start Time',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      const SizedBox(height: 4),
                      InkWell(
                        onTap: () => _selectTime(
                          context,
                          settings.quietHoursStart,
                          (time) => notifier.updateQuietHours(
                            time,
                            settings.quietHoursEnd,
                          ),
                        ),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 8,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Theme.of(context).colorScheme.outline,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(settings.quietHoursStart),
                              const Icon(Icons.access_time),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'End Time',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      const SizedBox(height: 4),
                      InkWell(
                        onTap: () => _selectTime(
                          context,
                          settings.quietHoursEnd,
                          (time) => notifier.updateQuietHours(
                            settings.quietHoursStart,
                            time,
                          ),
                        ),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 8,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Theme.of(context).colorScheme.outline,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(settings.quietHoursEnd),
                              const Icon(Icons.access_time),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTestNotificationsCard() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  Icons.science,
                  color: Theme.of(context).colorScheme.primary,
                ),
                const SizedBox(width: 8),
                Text(
                  'Test Notifications',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              'Send test notifications to verify your settings',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () => _sendTestNotification('task'),
                    icon: const Icon(Icons.task),
                    label: const Text('Test Task'),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () => _sendTestNotification('list'),
                    icon: const Icon(Icons.list),
                    label: const Text('Test List'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _selectTime(
    BuildContext context,
    String currentTime,
    Function(String) onTimeSelected,
  ) async {
    final timeParts = currentTime.split(':');
    final initialTime = TimeOfDay(
      hour: int.parse(timeParts[0]),
      minute: int.parse(timeParts[1]),
    );

    final selectedTime = await showTimePicker(
      context: context,
      initialTime: initialTime,
    );

    if (selectedTime != null) {
      final formattedTime =
          '${selectedTime.hour.toString().padLeft(2, '0')}:${selectedTime.minute.toString().padLeft(2, '0')}';
      onTimeSelected(formattedTime);
    }
  }

  Future<void> _sendTestNotification(String type) async {
    final notificationActions = ref.read(notificationActionsProvider);

    if (type == 'task') {
      // Create a mock task for testing
      final mockTask = Task(
        id: 'test_task',
        title: 'Test Task Notification',
        description: 'This is a test notification for tasks',
        status: TaskStatus.pending,
        category: TaskCategory.cleaning,
        assignedTo: 'test_user',
        createdBy: 'test_user',
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        houseId: 'test_house',
      );

      await notificationActions.notifyTaskAssignment(mockTask);
    } else if (type == 'list') {
      // Create a mock list for testing
      final mockList = ListModel(
        id: 'test_list',
        name: 'Test List Notification',
        description: 'This is a test notification for lists',
        type: ListType.grocery,
        items: [],
        assignedTo: 'test_user',
        createdBy: 'test_user',
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        houseId: 'test_house',
        isCompleted: false,
        dueDate: DateTime.now().add(const Duration(days: 1)),
      );

      await notificationActions.notifyListAssignment(mockList);
    }

    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Test ${type} notification sent!'),
          backgroundColor: Theme.of(context).colorScheme.primary,
        ),
      );
    }
  }
}
