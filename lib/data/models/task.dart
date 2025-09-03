import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_ce/hive.dart';

part 'task.freezed.dart';
part 'task.g.dart';

@freezed
@HiveType(typeId: 4, adapterName: 'TaskAdapter')
abstract class Task with _$Task {
  const factory Task({
    @HiveField(0) required String id,
    @HiveField(1) required String title,
    @HiveField(2) required String description,
    @HiveField(3) required TaskStatus status,
    @HiveField(4) required TaskCategory category,
    @HiveField(5) required String houseId,
    @HiveField(6) required String createdBy,
    @HiveField(7) required DateTime createdAt,
    @HiveField(8) required DateTime updatedAt,
    @HiveField(9) String? assignedTo,
    @HiveField(10) DateTime? dueDate,
    @HiveField(11) RepeatInterval? repeatInterval,
    @HiveField(12) DateTime? completedAt,
    @HiveField(13) String? completedBy,
    @HiveField(14) int? priority,
    @HiveField(15) List<String>? tags,
    @HiveField(16) String? notes,
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
