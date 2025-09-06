import 'dart:async';
import 'dart:io';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import 'package:workmanager/workmanager.dart';
import 'package:house_organizer/core/logging.dart';
import 'package:house_organizer/data/models/list_model.dart';
import 'package:house_organizer/data/models/task.dart';
import 'package:house_organizer/core/services/notification_service.dart';

final _log = buildLogger();

class NotificationServiceImpl implements NotificationService {
  static final NotificationServiceImpl _instance =
      NotificationServiceImpl._internal();
  factory NotificationServiceImpl() => _instance;
  NotificationServiceImpl._internal();

  final FlutterLocalNotificationsPlugin _localNotifications =
      FlutterLocalNotificationsPlugin();
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  bool _isInitialized = false;
  StreamSubscription<RemoteMessage>? _messageSubscription;

  // Notification channels
  static const String _taskChannelId = 'task_notifications';
  static const String _listChannelId = 'list_notifications';
  static const String _dailySummaryChannelId = 'daily_summary';
  static const String _reminderChannelId = 'reminders';
  static const String _medicalChannelId = 'medical_notifications';
  static const String _urgentChannelId = 'urgent_notifications';

  // Notification categories for better organization
  static const Map<String, String> notificationCategories = {
    'task_assigned': 'Task Assignment',
    'task_due': 'Task Due',
    'task_completed': 'Task Completed',
    'task_overdue': 'Task Overdue',
    'list_assigned': 'List Assignment',
    'house_update': 'House Update',
    'medical_reminder': 'Medical Reminder',
    'daily_summary': 'Daily Summary',
  };

  // Background message handler
  static Future<void> firebaseMessagingBackgroundHandler(
    RemoteMessage message,
  ) async {
    _log.i('Handling a background message: ${message.messageId}');
  }

  @override
  Future<void> initialize() async {
    if (_isInitialized) return;

    // Initialize timezone
    tz.initializeTimeZones();

    // Initialize local notifications
    await _initializeLocalNotifications();

    // Initialize Firebase messaging
    await _initializeFirebaseMessaging();

    // Initialize workmanager for background tasks
    await _initializeWorkmanager();

    _isInitialized = true;
  }

  Future<void> _initializeLocalNotifications() async {
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    const DarwinInitializationSettings initializationSettingsIOS =
        DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
    );

    const InitializationSettings initializationSettings =
        InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS,
    );

    await _localNotifications.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: _onNotificationTapped,
    );

    // Create notification channels for Android
    if (Platform.isAndroid) {
      await _createNotificationChannels();
    }
  }

  Future<void> _createNotificationChannels() async {
    const AndroidNotificationChannel taskChannel = AndroidNotificationChannel(
      _taskChannelId,
      'Task Notifications',
      description: 'Notifications for task assignments and updates',
      importance: Importance.high,
    );

    const AndroidNotificationChannel listChannel = AndroidNotificationChannel(
      _listChannelId,
      'List Notifications',
      description: 'Notifications for list assignments and updates',
      importance: Importance.high,
    );

    const AndroidNotificationChannel dailySummaryChannel =
        AndroidNotificationChannel(
      _dailySummaryChannelId,
      'Daily Summary',
      description: 'Daily task and list summaries',
      importance: Importance.defaultImportance,
    );

    const AndroidNotificationChannel reminderChannel =
        AndroidNotificationChannel(
      _reminderChannelId,
      'Reminders',
      description: 'Task and list reminders',
      importance: Importance.high,
    );

    const AndroidNotificationChannel medicalChannel =
        AndroidNotificationChannel(
      _medicalChannelId,
      'Medical Notifications',
      description: 'Medical task and appointment reminders',
      importance: Importance.max,
      enableVibration: true,
      enableLights: true,
    );

    const AndroidNotificationChannel urgentChannel =
        AndroidNotificationChannel(
      _urgentChannelId,
      'Urgent Notifications',
      description: 'Urgent and high-priority task notifications',
      importance: Importance.max,
      enableVibration: true,
      enableLights: true,
    );

    final androidPlugin = _localNotifications
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>();

    if (androidPlugin != null) {
      await androidPlugin.createNotificationChannel(taskChannel);
      await androidPlugin.createNotificationChannel(listChannel);
      await androidPlugin.createNotificationChannel(dailySummaryChannel);
      await androidPlugin.createNotificationChannel(reminderChannel);
      await androidPlugin.createNotificationChannel(medicalChannel);
      await androidPlugin.createNotificationChannel(urgentChannel);
    }
  }

  Future<void> _initializeFirebaseMessaging() async {
    // Request permission for notifications
    await _requestNotificationPermission();

    // Set background message handler
    FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);

    // Handle foreground messages
    _messageSubscription = FirebaseMessaging.onMessage.listen(
      _handleForegroundMessage,
    );

    // Handle notification taps when app is in background
    FirebaseMessaging.onMessageOpenedApp.listen(_handleNotificationTap);

    // Handle notification tap when app is terminated
    RemoteMessage? initialMessage =
        await _firebaseMessaging.getInitialMessage();
    if (initialMessage != null) {
      _handleNotificationTap(initialMessage);
    }
  }

  Future<void> _initializeWorkmanager() async {
    await Workmanager().initialize(callbackDispatcher);

    // Register daily summary task
    await Workmanager().registerPeriodicTask(
      'daily-summary',
      'dailySummaryTask',
      frequency: const Duration(hours: 24),
      constraints: Constraints(
        networkType: NetworkType.notRequired,
        requiresBatteryNotLow: false,
      ),
    );
  }

  Future<void> _requestNotificationPermission() async {
    if (Platform.isAndroid) {
      final status = await Permission.notification.request();
      if (status != PermissionStatus.granted) {
        _log.e('Notification permission denied');
      }
    } else if (Platform.isIOS) {
      final settings = await _firebaseMessaging.requestPermission(
        alert: true,
        badge: true,
        sound: true,
        provisional: false,
      );
      if (settings.authorizationStatus != AuthorizationStatus.authorized) {
        _log.e('Notification permission denied');
      }
    }
  }

  void _onNotificationTapped(NotificationResponse response) {
    // Handle local notification tap
    _log.i('Local notification tapped: ${response.payload}');
    // Navigate to appropriate screen based on payload
  }

  void _handleForegroundMessage(RemoteMessage message) {
    _log.i('Received foreground message: ${message.messageId}');
    _showLocalNotification(message);
  }

  void _handleNotificationTap(RemoteMessage message) {
    _log.i('Notification tapped: ${message.messageId}');
    // Navigate to appropriate screen based on message data
  }

  Future<void> _showLocalNotification(RemoteMessage message) async {
    final notification = message.notification;
    if (notification == null) return;

    const AndroidNotificationDetails androidDetails =
        AndroidNotificationDetails(
      _taskChannelId,
      'Task Notifications',
      channelDescription: 'Notifications for task assignments and updates',
      importance: Importance.high,
      priority: Priority.high,
    );

    const DarwinNotificationDetails iosDetails = DarwinNotificationDetails(
      presentAlert: true,
      presentBadge: true,
      presentSound: true,
    );

    const NotificationDetails platformDetails = NotificationDetails(
      android: androidDetails,
      iOS: iosDetails,
    );

    await _localNotifications.show(
      message.hashCode,
      notification.title,
      notification.body,
      platformDetails,
      payload: message.data.toString(),
    );
  }

  // Enhanced task-related notifications with smart scheduling
  @override
  Future<void> scheduleTaskReminder(Task task) async {
    if (task.dueDate == null) return;

    final now = DateTime.now();
    final dueDate = task.dueDate!;
    final timeUntilDue = dueDate.difference(now);

    // Smart reminder scheduling based on time until due date
    if (timeUntilDue.inDays >= 3) {
      // Schedule reminder 3 days before for long-term tasks
      final reminderTime = dueDate.subtract(const Duration(days: 3));
      if (reminderTime.isAfter(now)) {
        await _scheduleNotification(
          id: task.hashCode,
          title: 'Task Reminder',
          body: '${task.title} is due in 3 days',
          scheduledDate: reminderTime,
          channelId: _reminderChannelId,
          payload: 'task:${task.id}',
        );
      }
    }

    if (timeUntilDue.inDays >= 1) {
      // Schedule reminder 1 day before due date
      final reminderTime = dueDate.subtract(const Duration(days: 1));
      if (reminderTime.isAfter(now)) {
        await _scheduleNotification(
          id: task.hashCode + 1,
          title: 'Task Due Soon',
          body: '${task.title} is due tomorrow',
          scheduledDate: reminderTime,
          channelId: _reminderChannelId,
          payload: 'task:${task.id}',
        );
      }
    }

    if (timeUntilDue.inHours >= 2) {
      // Schedule reminder 2 hours before for urgent tasks
      final reminderTime = dueDate.subtract(const Duration(hours: 2));
      if (reminderTime.isAfter(now)) {
        await _scheduleNotification(
          id: task.hashCode + 2,
          title: 'Task Due Soon',
          body: '${task.title} is due in 2 hours',
          scheduledDate: reminderTime,
          channelId: _reminderChannelId,
          payload: 'task:${task.id}',
        );
      }
    }

    if (timeUntilDue.inMinutes >= 30) {
      // Schedule final reminder 30 minutes before
      final reminderTime = dueDate.subtract(const Duration(minutes: 30));
      if (reminderTime.isAfter(now)) {
        await _scheduleNotification(
          id: task.hashCode + 3,
          title: 'Task Due Now',
          body: '${task.title} is due in 30 minutes',
          scheduledDate: reminderTime,
          channelId: _reminderChannelId,
          payload: 'task:${task.id}',
        );
      }
    }

    // Schedule reminder on due date
    if (dueDate.isAfter(now)) {
      await _scheduleNotification(
        id: task.hashCode + 4,
        title: 'Task Due Today',
        body: '${task.title} is due today',
        scheduledDate: dueDate,
        channelId: _reminderChannelId,
        payload: 'task:${task.id}',
      );
    }
  }

  // Smart reminder scheduling based on task priority and category
  Future<void> scheduleSmartReminder(Task task) async {
    if (task.dueDate == null) return;

    final now = DateTime.now();
    final dueDate = task.dueDate!;
    final timeUntilDue = dueDate.difference(now);

    // Determine reminder strategy based on task priority
    final isHighPriority = task.priority != null && task.priority! >= 8;
    final isMedicalTask = task.category == TaskCategory.medical;
    final isCleaningTask = task.category == TaskCategory.cleaning;

    if (isMedicalTask || isHighPriority) {
      // Medical and high-priority tasks get more frequent reminders
      await _scheduleMedicalOrHighPriorityReminders(task, timeUntilDue, now, dueDate);
    } else if (isCleaningTask) {
      // Cleaning tasks get reminders optimized for daily routines
      await _scheduleCleaningTaskReminders(task, timeUntilDue, now, dueDate);
    } else {
      // Default smart scheduling
      await scheduleTaskReminder(task);
    }
  }

  Future<void> _scheduleMedicalOrHighPriorityReminders(
    Task task,
    Duration timeUntilDue,
    DateTime now,
    DateTime dueDate,
  ) async {
    // More frequent reminders for medical/high-priority tasks
    final reminderTimes = <Duration>[
      const Duration(days: 7),
      const Duration(days: 3),
      const Duration(days: 1),
      const Duration(hours: 4),
      const Duration(hours: 1),
      const Duration(minutes: 15),
    ];

    for (int i = 0; i < reminderTimes.length; i++) {
      final reminderTime = dueDate.subtract(reminderTimes[i]);
      if (reminderTime.isAfter(now) && timeUntilDue > reminderTimes[i]) {
        String title;
        String body;
        
        if (reminderTimes[i].inDays > 0) {
          title = 'Important Task Reminder';
          body = '${task.title} is due in ${reminderTimes[i].inDays} days';
        } else if (reminderTimes[i].inHours > 0) {
          title = 'Urgent Task Reminder';
          body = '${task.title} is due in ${reminderTimes[i].inHours} hours';
        } else {
          title = 'Task Due Now';
          body = '${task.title} is due in ${reminderTimes[i].inMinutes} minutes';
        }

        await _scheduleNotification(
          id: task.hashCode + i,
          title: title,
          body: body,
          scheduledDate: reminderTime,
          channelId: _reminderChannelId,
          payload: 'task:${task.id}',
        );
      }
    }
  }

  Future<void> _scheduleCleaningTaskReminders(
    Task task,
    Duration timeUntilDue,
    DateTime now,
    DateTime dueDate,
  ) async {
    // Optimized for daily cleaning routines
    if (timeUntilDue.inDays >= 1) {
      final reminderTime = dueDate.subtract(const Duration(hours: 2));
      if (reminderTime.isAfter(now)) {
        await _scheduleNotification(
          id: task.hashCode,
          title: 'Cleaning Reminder',
          body: 'Time to clean: ${task.title}',
          scheduledDate: reminderTime,
          channelId: _reminderChannelId,
          payload: 'task:${task.id}',
        );
      }
    }

    // Morning reminder for same-day cleaning tasks
    if (timeUntilDue.inHours < 24 && timeUntilDue.inHours > 0) {
      final morningReminder = DateTime(dueDate.year, dueDate.month, dueDate.day, 8, 0);
      if (morningReminder.isAfter(now)) {
        await _scheduleNotification(
          id: task.hashCode + 1,
          title: 'Daily Cleaning',
          body: 'Don\'t forget: ${task.title}',
          scheduledDate: morningReminder,
          channelId: _reminderChannelId,
          payload: 'task:${task.id}',
        );
      }
    }
  }

  @override
  Future<void> notifyTaskAssignment(Task task) async {
    await _showNotification(
      id: task.hashCode,
      title: 'New Task Assigned',
      body: 'You have been assigned: ${task.title}',
      channelId: _taskChannelId,
      payload: 'task:${task.id}',
    );
  }

  @override
  Future<void> notifyTaskUpdate(Task task) async {
    await _showNotification(
      id: task.hashCode,
      title: 'Task Updated',
      body: '${task.title} has been updated',
      channelId: _taskChannelId,
      payload: 'task:${task.id}',
    );
  }

  // List-related notifications
  @override
  Future<void> notifyListAssignment(ListModel list) async {
    await _showNotification(
      id: list.hashCode,
      title: 'New List Assigned',
      body: 'You have been assigned: ${list.name}',
      channelId: _listChannelId,
      payload: 'list:${list.id}',
    );
  }

  @override
  Future<void> notifyListUpdate(ListModel list) async {
    await _showNotification(
      id: list.hashCode,
      title: 'List Updated',
      body: '${list.name} has been updated',
      channelId: _listChannelId,
      payload: 'list:${list.id}',
    );
  }

  // Daily summary
  @override
  Future<void> scheduleDailySummary() async {
    // Schedule daily summary at 9 AM
    final now = DateTime.now();
    var scheduledTime = DateTime(now.year, now.month, now.day, 9, 0);

    // If it's already past 9 AM today, schedule for tomorrow
    if (scheduledTime.isBefore(now)) {
      scheduledTime = scheduledTime.add(const Duration(days: 1));
    }

    await _scheduleNotification(
      id: 9999, // Fixed ID for daily summary
      title: 'Daily Summary',
      body: 'Check your tasks and lists for today',
      scheduledDate: scheduledTime,
      channelId: _dailySummaryChannelId,
      payload: 'daily_summary',
    );
  }

  // Generic notification methods
  Future<void> _showNotification({
    required int id,
    required String title,
    required String body,
    required String channelId,
    String? payload,
  }) async {
    const AndroidNotificationDetails androidDetails =
        AndroidNotificationDetails(
      _taskChannelId,
      'Task Notifications',
      channelDescription: 'Notifications for task assignments and updates',
      importance: Importance.high,
      priority: Priority.high,
    );

    const DarwinNotificationDetails iosDetails = DarwinNotificationDetails(
      presentAlert: true,
      presentBadge: true,
      presentSound: true,
    );

    const NotificationDetails platformDetails = NotificationDetails(
      android: androidDetails,
      iOS: iosDetails,
    );

    await _localNotifications.show(
      id,
      title,
      body,
      platformDetails,
      payload: payload,
    );
  }

  Future<void> _scheduleNotification({
    required int id,
    required String title,
    required String body,
    required DateTime scheduledDate,
    required String channelId,
    String? payload,
  }) async {
    final tz.TZDateTime scheduledTZ = tz.TZDateTime.from(
      scheduledDate,
      tz.local,
    );

    const AndroidNotificationDetails androidDetails =
        AndroidNotificationDetails(
      _reminderChannelId,
      'Reminders',
      channelDescription: 'Task and list reminders',
      importance: Importance.high,
      priority: Priority.high,
    );

    const DarwinNotificationDetails iosDetails = DarwinNotificationDetails(
      presentAlert: true,
      presentBadge: true,
      presentSound: true,
    );

    const NotificationDetails platformDetails = NotificationDetails(
      android: androidDetails,
      iOS: iosDetails,
    );

    await _localNotifications.zonedSchedule(
      id,
      title,
      body,
      scheduledTZ,
      platformDetails,
      payload: payload,
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
    );
  }

  // Cancel notifications
  @override
  Future<void> cancelTaskReminders(String taskId) async {
    await _localNotifications.cancel(taskId.hashCode);
    await _localNotifications.cancel(taskId.hashCode + 1);
  }

  Future<void> cancelAllNotifications() async {
    await _localNotifications.cancelAll();
  }

  // Get FCM token for push notifications
  @override
  Future<String?> getFCMToken() async {
    return await _firebaseMessaging.getToken();
  }

  // Subscribe to topic for house-specific notifications
  @override
  Future<void> subscribeToHouseTopic(String houseId) async {
    await _firebaseMessaging.subscribeToTopic('house_$houseId');
  }

  // Unsubscribe from topic
  @override
  Future<void> unsubscribeFromHouseTopic(String houseId) async {
    await _firebaseMessaging.unsubscribeFromTopic('house_$houseId');
  }

  @override
  void dispose() {
    _messageSubscription?.cancel();
  }
}

// Background task callback for workmanager
@pragma('vm:entry-point')
void callbackDispatcher() {
  Workmanager().executeTask((task, inputData) async {
    switch (task) {
      case 'dailySummaryTask':
        await _handleDailySummaryTask();
        break;
    }
    return Future.value(true);
  });
}

Future<void> _handleDailySummaryTask() async {
  // This would typically fetch data from local storage and send notifications
  // For now, we'll just log that the task ran
  _log.i('Daily summary task executed');
}

