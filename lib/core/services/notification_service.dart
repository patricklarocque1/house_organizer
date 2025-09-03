import 'package:house_organizer/data/models/list_model.dart';
import 'package:house_organizer/data/models/task.dart';

// Conditional factory implementation per platform (IO vs Web)
import 'notification_service_factory_io.dart'
    if (dart.library.html) 'notification_service_factory_web.dart';

// Cross-platform interface with factory constructor.
abstract class NotificationService {
  factory NotificationService() => createNotificationService();

  Future<void> initialize();

  // Task-related
  Future<void> scheduleTaskReminder(Task task);
  Future<void> notifyTaskAssignment(Task task);
  Future<void> notifyTaskUpdate(Task task);
  Future<void> cancelTaskReminders(String taskId);

  // List-related
  Future<void> notifyListAssignment(ListModel list);
  Future<void> notifyListUpdate(ListModel list);

  // Daily summary
  Future<void> scheduleDailySummary();

  // FCM
  Future<String?> getFCMToken();
  Future<void> subscribeToHouseTopic(String houseId);
  Future<void> unsubscribeFromHouseTopic(String houseId);

  void dispose();
}
