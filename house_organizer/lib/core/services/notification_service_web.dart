import 'package:flutter/foundation.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:house_organizer/core/logging.dart';
import './notification_service.dart';
import 'package:house_organizer/data/models/list_model.dart';
import 'package:house_organizer/data/models/task.dart';

final _log = buildLogger();

/// Web-safe no-op implementation.
/// - flutter_local_notifications is not supported on web.
/// - FCM topic APIs are not available on web clients; they are no-ops here.
class NotificationServiceWeb implements NotificationService {
  static final NotificationServiceWeb _instance = NotificationServiceWeb._();
  factory NotificationServiceWeb() => _instance;
  NotificationServiceWeb._();

  final FirebaseMessaging _messaging = FirebaseMessaging.instance;
  bool _initialized = false;

  @override
  Future<void> initialize() async {
    if (_initialized) return;
    if (kIsWeb) {
      try {
        await _messaging.requestPermission(
          alert: true,
          badge: true,
          sound: true,
        );
        // Foreground messages can be listened to if you want to surface banners.
        FirebaseMessaging.onMessage.listen((message) {
          _log.i('Web FCM foreground message: \\n${message.messageId}');
        });
      } catch (e) {
        _log.w('Web notifications permission failed: $e');
      }
    }
    _initialized = true;
  }

  // No-op local notifications on web
  @override
  Future<void> scheduleTaskReminder(Task task) async {}
  @override
  Future<void> notifyTaskAssignment(Task task) async {}
  @override
  Future<void> notifyTaskUpdate(Task task) async {}
  @override
  Future<void> notifyListAssignment(ListModel list) async {}
  @override
  Future<void> notifyListUpdate(ListModel list) async {}
  @override
  Future<void> scheduleDailySummary() async {}

  @override
  Future<void> cancelTaskReminders(String taskId) async {}

  @override
  Future<String?> getFCMToken() async {
    try {
      return await _messaging.getToken();
    } catch (e) {
      _log.w('Failed to get web FCM token: $e');
      return null;
    }
  }

  // Topics are server-managed; client-side calls are no-ops.
  @override
  Future<void> subscribeToHouseTopic(String houseId) async {}
  @override
  Future<void> unsubscribeFromHouseTopic(String houseId) async {}

  @override
  void dispose() {}
}

