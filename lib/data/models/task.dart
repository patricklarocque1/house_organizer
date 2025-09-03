import 'package:freezed_annotation/freezed_annotation.dart';

part 'task.freezed.dart';
part 'task.g.dart';

@freezed
class Task with _$Task {
  const factory Task({
    required String id,
    required String title,
    required String description,
    required TaskStatus status,
    required TaskCategory category,
    required String houseId,
    required String createdBy,
    required DateTime createdAt,
    required DateTime updatedAt,
    String? assignedTo,
    DateTime? dueDate,
    RepeatInterval? repeatInterval,
    DateTime? completedAt,
    String? completedBy,
    int? priority,
    List<String>? tags,
    String? notes,
  }) = _Task;

  factory Task.fromJson(Map<String, dynamic> json) => _$TaskFromJson(json);
}

enum TaskStatus { pending, inProgress, completed, cancelled }

enum TaskCategory {
  cleaning,
  maintenance,
  cooking,
  shopping,
  personal,
  medical,
  social,
  other,
}

enum RepeatInterval { none, daily, weekly, monthly, yearly }

extension TaskStatusExtension on TaskStatus {
  String get displayName {
    switch (this) {
      case TaskStatus.pending:
        return 'Pending';
      case TaskStatus.inProgress:
        return 'In Progress';
      case TaskStatus.completed:
        return 'Completed';
      case TaskStatus.cancelled:
        return 'Cancelled';
    }
  }
}

extension TaskCategoryExtension on TaskCategory {
  String get displayName {
    switch (this) {
      case TaskCategory.cleaning:
        return 'Cleaning';
      case TaskCategory.maintenance:
        return 'Maintenance';
      case TaskCategory.cooking:
        return 'Cooking';
      case TaskCategory.shopping:
        return 'Shopping';
      case TaskCategory.personal:
        return 'Personal';
      case TaskCategory.medical:
        return 'Medical';
      case TaskCategory.social:
        return 'Social';
      case TaskCategory.other:
        return 'Other';
    }
  }
}

extension RepeatIntervalExtension on RepeatInterval {
  String get displayName {
    switch (this) {
      case RepeatInterval.none:
        return 'No Repeat';
      case RepeatInterval.daily:
        return 'Daily';
      case RepeatInterval.weekly:
        return 'Weekly';
      case RepeatInterval.monthly:
        return 'Monthly';
      case RepeatInterval.yearly:
        return 'Yearly';
    }
  }
}
