import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:house_organizer/core/services/notification_service.dart';
import 'package:house_organizer/data/models/task.dart';
import 'package:house_organizer/data/models/list_model.dart';

// Notification service provider
final notificationServiceProvider = Provider<NotificationService>((ref) {
  return NotificationService();
});

// Notification settings provider
final notificationSettingsProvider = StateNotifierProvider<NotificationSettingsNotifier, NotificationSettings>((ref) {
  return NotificationSettingsNotifier();
});

// Notification settings state
class NotificationSettings {
  final bool taskNotifications;
  final bool listNotifications;
  final bool dailySummary;
  final bool reminders;
  final bool pushNotifications;
  final String quietHoursStart;
  final String quietHoursEnd;

  const NotificationSettings({
    this.taskNotifications = true,
    this.listNotifications = true,
    this.dailySummary = true,
    this.reminders = true,
    this.pushNotifications = true,
    this.quietHoursStart = '22:00',
    this.quietHoursEnd = '08:00',
  });

  NotificationSettings copyWith({
    bool? taskNotifications,
    bool? listNotifications,
    bool? dailySummary,
    bool? reminders,
    bool? pushNotifications,
    String? quietHoursStart,
    String? quietHoursEnd,
  }) {
    return NotificationSettings(
      taskNotifications: taskNotifications ?? this.taskNotifications,
      listNotifications: listNotifications ?? this.listNotifications,
      dailySummary: dailySummary ?? this.dailySummary,
      reminders: reminders ?? this.reminders,
      pushNotifications: pushNotifications ?? this.pushNotifications,
      quietHoursStart: quietHoursStart ?? this.quietHoursStart,
      quietHoursEnd: quietHoursEnd ?? this.quietHoursEnd,
    );
  }
}

// Notification settings notifier
class NotificationSettingsNotifier extends StateNotifier<NotificationSettings> {
  NotificationSettingsNotifier() : super(const NotificationSettings());

  void updateTaskNotifications(bool enabled) {
    state = state.copyWith(taskNotifications: enabled);
  }

  void updateListNotifications(bool enabled) {
    state = state.copyWith(listNotifications: enabled);
  }

  void updateDailySummary(bool enabled) {
    state = state.copyWith(dailySummary: enabled);
  }

  void updateReminders(bool enabled) {
    state = state.copyWith(reminders: enabled);
  }

  void updatePushNotifications(bool enabled) {
    state = state.copyWith(pushNotifications: enabled);
  }

  void updateQuietHours(String start, String end) {
    state = state.copyWith(
      quietHoursStart: start,
      quietHoursEnd: end,
    );
  }
}

// Notification actions provider
final notificationActionsProvider = Provider<NotificationActions>((ref) {
  final notificationService = ref.watch(notificationServiceProvider);
  final settings = ref.watch(notificationSettingsProvider);
  
  return NotificationActions(
    notificationService: notificationService,
    settings: settings,
  );
});

// Notification actions class
class NotificationActions {
  final NotificationService notificationService;
  final NotificationSettings settings;

  NotificationActions({
    required this.notificationService,
    required this.settings,
  });

  // Task notification actions
  Future<void> scheduleTaskReminder(Task task) async {
    if (settings.reminders && settings.taskNotifications) {
      await notificationService.scheduleTaskReminder(task);
    }
  }

  Future<void> notifyTaskAssignment(Task task) async {
    if (settings.taskNotifications) {
      await notificationService.notifyTaskAssignment(task);
    }
  }

  Future<void> notifyTaskUpdate(Task task) async {
    if (settings.taskNotifications) {
      await notificationService.notifyTaskUpdate(task);
    }
  }

  Future<void> cancelTaskReminders(String taskId) async {
    await notificationService.cancelTaskReminders(taskId);
  }

  // List notification actions
  Future<void> notifyListAssignment(ListModel list) async {
    if (settings.listNotifications) {
      await notificationService.notifyListAssignment(list);
    }
  }

  Future<void> notifyListUpdate(ListModel list) async {
    if (settings.listNotifications) {
      await notificationService.notifyListUpdate(list);
    }
  }

  // Daily summary
  Future<void> scheduleDailySummary() async {
    if (settings.dailySummary) {
      await notificationService.scheduleDailySummary();
    }
  }

  // House topic management
  Future<void> subscribeToHouse(String houseId) async {
    if (settings.pushNotifications) {
      await notificationService.subscribeToHouseTopic(houseId);
    }
  }

  Future<void> unsubscribeFromHouse(String houseId) async {
    await notificationService.unsubscribeFromHouseTopic(houseId);
  }

  // Get FCM token
  Future<String?> getFCMToken() async {
    return await notificationService.getFCMToken();
  }
}
