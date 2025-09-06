import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:house_organizer/core/logging.dart';

class AnalyticsService {
  static final FirebaseAnalytics _analytics = FirebaseAnalytics.instance;
  static final _log = buildLogger();

  // User events
  static Future<void> logUserSignedUp(String method) async {
    try {
      await _analytics.logSignUp(signUpMethod: method);
      _log.d('📊 Analytics: User signed up with $method');
    } catch (e) {
      _log.e('📊 Analytics: Failed to log sign up: $e');
    }
  }

  static Future<void> logUserSignedIn(String method) async {
    try {
      await _analytics.logLogin(loginMethod: method);
      _log.d('📊 Analytics: User signed in with $method');
    } catch (e) {
      _log.e('📊 Analytics: Failed to log sign in: $e');
    }
  }

  static Future<void> logUserSignedOut() async {
    try {
      await _analytics.logEvent(name: 'user_signed_out');
      _log.d('📊 Analytics: User signed out');
    } catch (e) {
      _log.e('📊 Analytics: Failed to log sign out: $e');
    }
  }

  // Task events
  static Future<void> logTaskCreated(String category, String priority) async {
    try {
      await _analytics.logEvent(
        name: 'task_created',
        parameters: {
          'task_category': category,
          'task_priority': priority,
        },
      );
      _log.d('📊 Analytics: Task created - Category: $category, Priority: $priority');
    } catch (e) {
      _log.e('📊 Analytics: Failed to log task creation: $e');
    }
  }

  static Future<void> logTaskCompleted(String category, int completionTime) async {
    try {
      await _analytics.logEvent(
        name: 'task_completed',
        parameters: {
          'task_category': category,
          'completion_time_minutes': completionTime,
        },
      );
      _log.d('📊 Analytics: Task completed - Category: $category, Time: ${completionTime}min');
    } catch (e) {
      _log.e('📊 Analytics: Failed to log task completion: $e');
    }
  }

  static Future<void> logTaskAssigned(String category, String assigneeRole) async {
    try {
      await _analytics.logEvent(
        name: 'task_assigned',
        parameters: {
          'task_category': category,
          'assignee_role': assigneeRole,
        },
      );
      _log.d('📊 Analytics: Task assigned - Category: $category, Role: $assigneeRole');
    } catch (e) {
      _log.e('📊 Analytics: Failed to log task assignment: $e');
    }
  }

  // List events
  static Future<void> logListCreated(String listType) async {
    try {
      await _analytics.logEvent(
        name: 'list_created',
        parameters: {
          'list_type': listType,
        },
      );
      _log.d('📊 Analytics: List created - Type: $listType');
    } catch (e) {
      _log.e('📊 Analytics: Failed to log list creation: $e');
    }
  }

  static Future<void> logListItemAdded(String listType) async {
    try {
      await _analytics.logEvent(
        name: 'list_item_added',
        parameters: {
          'list_type': listType,
        },
      );
      _log.d('📊 Analytics: List item added - Type: $listType');
    } catch (e) {
      _log.e('📊 Analytics: Failed to log list item addition: $e');
    }
  }

  // House events
  static Future<void> logHouseJoined(String joinMethod) async {
    try {
      await _analytics.logEvent(
        name: 'house_joined',
        parameters: {
          'join_method': joinMethod,
        },
      );
      _log.d('📊 Analytics: House joined - Method: $joinMethod');
    } catch (e) {
      _log.e('📊 Analytics: Failed to log house join: $e');
    }
  }

  static Future<void> logHouseCreated() async {
    try {
      await _analytics.logEvent(name: 'house_created');
      _log.d('📊 Analytics: House created');
    } catch (e) {
      _log.e('📊 Analytics: Failed to log house creation: $e');
    }
  }

  // User engagement events
  static Future<void> logScreenView(String screenName, String screenClass) async {
    try {
      await _analytics.logScreenView(
        screenName: screenName,
        screenClass: screenClass,
      );
      _log.d('📊 Analytics: Screen view - $screenName ($screenClass)');
    } catch (e) {
      _log.e('📊 Analytics: Failed to log screen view: $e');
    }
  }

  static Future<void> logUserEngagement(String action, String context) async {
    try {
      await _analytics.logEvent(
        name: 'user_engagement',
        parameters: {
          'action': action,
          'context': context,
        },
      );
      _log.d('📊 Analytics: User engagement - Action: $action, Context: $context');
    } catch (e) {
      _log.e('📊 Analytics: Failed to log user engagement: $e');
    }
  }

  // Error events
  static Future<void> logError(String errorType, String errorMessage) async {
    try {
      await _analytics.logEvent(
        name: 'app_error',
        parameters: {
          'error_type': errorType,
          'error_message': errorMessage,
        },
      );
      _log.d('📊 Analytics: Error logged - Type: $errorType');
    } catch (e) {
      _log.e('📊 Analytics: Failed to log error: $e');
    }
  }

  // Feature usage events
  static Future<void> logFeatureUsed(String featureName, Map<String, dynamic>? parameters) async {
    try {
      await _analytics.logEvent(
        name: 'feature_used',
        parameters: {
          'feature_name': featureName,
          ...?parameters,
        },
      );
      _log.d('📊 Analytics: Feature used - $featureName');
    } catch (e) {
      _log.e('📊 Analytics: Failed to log feature usage: $e');
    }
  }

  // Performance events
  static Future<void> logPerformanceMetric(String metricName, int value, String unit) async {
    try {
      await _analytics.logEvent(
        name: 'performance_metric',
        parameters: {
          'metric_name': metricName,
          'metric_value': value,
          'metric_unit': unit,
        },
      );
      _log.d('📊 Analytics: Performance metric - $metricName: $value $unit');
    } catch (e) {
      _log.e('📊 Analytics: Failed to log performance metric: $e');
    }
  }

  // User properties
  static Future<void> setUserProperty(String name, String? value) async {
    try {
      await _analytics.setUserProperty(name: name, value: value);
      _log.d('📊 Analytics: User property set - $name: $value');
    } catch (e) {
      _log.e('📊 Analytics: Failed to set user property: $e');
    }
  }

  static Future<void> setUserId(String userId) async {
    try {
      await _analytics.setUserId(id: userId);
      _log.d('📊 Analytics: User ID set - $userId');
    } catch (e) {
      _log.e('📊 Analytics: Failed to set user ID: $e');
    }
  }

  // Custom events for house organizer specific metrics
  static Future<void> logTaskOverdue(String category, int daysOverdue) async {
    try {
      await _analytics.logEvent(
        name: 'task_overdue',
        parameters: {
          'task_category': category,
          'days_overdue': daysOverdue,
        },
      );
      _log.d('📊 Analytics: Task overdue - Category: $category, Days: $daysOverdue');
    } catch (e) {
      _log.e('📊 Analytics: Failed to log task overdue: $e');
    }
  }

  static Future<void> logNotificationReceived(String notificationType) async {
    try {
      await _analytics.logEvent(
        name: 'notification_received',
        parameters: {
          'notification_type': notificationType,
        },
      );
      _log.d('📊 Analytics: Notification received - Type: $notificationType');
    } catch (e) {
      _log.e('📊 Analytics: Failed to log notification: $e');
    }
  }

  static Future<void> logNotificationTapped(String notificationType) async {
    try {
      await _analytics.logEvent(
        name: 'notification_tapped',
        parameters: {
          'notification_type': notificationType,
        },
      );
      _log.d('📊 Analytics: Notification tapped - Type: $notificationType');
    } catch (e) {
      _log.e('📊 Analytics: Failed to log notification tap: $e');
    }
  }
}