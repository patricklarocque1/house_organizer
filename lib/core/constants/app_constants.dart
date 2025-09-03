class AppConstants {
  // App Information
  static const String appName = 'House Organizer';
  static const String appVersion = '1.0.0';
  
  // Firebase Collections
  static const String usersCollection = 'users';
  static const String housesCollection = 'houses';
  static const String tasksCollection = 'tasks';
  static const String listsCollection = 'lists';
  static const String auditLogsCollection = 'audit_logs';
  
  // Hive Box Names
  static const String usersBox = 'users_box';
  static const String housesBox = 'houses_box';
  static const String tasksBox = 'tasks_box';
  static const String listsBox = 'lists_box';
  static const String auditLogsBox = 'audit_logs_box';
  static const String settingsBox = 'settings_box';
  
  // Notification Channels
  static const String taskNotificationsChannel = 'task_notifications';
  static const String listNotificationsChannel = 'list_notifications';
  static const String generalNotificationsChannel = 'general_notifications';
  
  // Notification IDs
  static const int taskAssignmentNotificationId = 1000;
  static const int taskDueSoonNotificationId = 1001;
  static const int taskCompletedNotificationId = 1002;
  static const int listAssignedNotificationId = 1003;
  static const int dailySummaryNotificationId = 1004;
  
  // Timeouts
  static const Duration networkTimeout = Duration(seconds: 30);
  static const Duration syncTimeout = Duration(minutes: 5);
  
  // Pagination
  static const int defaultPageSize = 20;
  static const int maxPageSize = 100;
  
  // File Upload
  static const int maxFileSize = 10 * 1024 * 1024; // 10MB
  static const List<String> allowedImageTypes = ['jpg', 'jpeg', 'png', 'gif'];
  
  // Validation
  static const int minPasswordLength = 8;
  static const int maxTaskTitleLength = 100;
  static const int maxTaskDescriptionLength = 500;
  static const int maxListNameLength = 50;
  static const int maxItemNameLength = 100;
  
  // Canadian Region
  static const String firebaseRegion = 'northamerica-northeast1';
  
  // Accessibility
  static const double minContrastRatio = 4.5;
  static const double minLargeTextContrastRatio = 3.0;
}
