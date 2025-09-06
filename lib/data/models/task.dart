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
    @HiveField(5) required String groupHomeId, // Aligned with Data Connect
    @HiveField(6) required String createdBy,
    @HiveField(7) required DateTime createdAt,
    @HiveField(8) required DateTime updatedAt,
    @HiveField(9) String? assignedToUserId, // Consistent naming
    @HiveField(10) DateTime? dueDate,
    @HiveField(11) RepeatInterval? repeatInterval,
    @HiveField(12) DateTime? completedAt,
    @HiveField(13) String? completedByUserId, // Consistent naming
    @HiveField(14) int? priority,
    @HiveField(15) List<String>? tags,
    @HiveField(16) String? notes,
    @HiveField(17) String? type, // Added to match Data Connect
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

// Extension for backward compatibility
extension TaskCompatibility on Task {
  // For backward compatibility with existing code
  String get houseId => groupHomeId;
  String? get assignedTo => assignedToUserId;
  String? get completedBy => completedByUserId;
  
  // Create a Task with backward-compatible field names
  factory Task.fromLegacyJson(Map<String, dynamic> json) {
    return Task(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      status: TaskStatus.values.firstWhere(
        (e) => e.name == json['status'],
        orElse: () => TaskStatus.pending,
      ),
      category: TaskCategory.values.firstWhere(
        (e) => e.name == json['category'],
        orElse: () => TaskCategory.other,
      ),
      groupHomeId: json['houseId'] as String? ?? json['groupHomeId'] as String,
      createdBy: json['createdBy'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      assignedToUserId: json['assignedTo'] as String? ?? json['assignedToUserId'] as String?,
      dueDate: json['dueDate'] != null ? DateTime.parse(json['dueDate'] as String) : null,
      repeatInterval: json['repeatInterval'] != null 
          ? RepeatInterval.values.firstWhere(
              (e) => e.name == json['repeatInterval'],
              orElse: () => RepeatInterval.none,
            )
          : RepeatInterval.none,
      completedAt: json['completedAt'] != null ? DateTime.parse(json['completedAt'] as String) : null,
      completedByUserId: json['completedBy'] as String? ?? json['completedByUserId'] as String?,
      priority: json['priority'] as int?,
      tags: (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList(),
      notes: json['notes'] as String?,
      type: json['type'] as String? ?? json['category'] as String?,
    );
  }
}
