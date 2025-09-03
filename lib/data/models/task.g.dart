// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Task _$TaskFromJson(Map<String, dynamic> json) => _Task(
  id: json['id'] as String,
  title: json['title'] as String,
  description: json['description'] as String,
  status: $enumDecode(_$TaskStatusEnumMap, json['status']),
  category: $enumDecode(_$TaskCategoryEnumMap, json['category']),
  houseId: json['houseId'] as String,
  createdBy: json['createdBy'] as String,
  createdAt: DateTime.parse(json['createdAt'] as String),
  updatedAt: DateTime.parse(json['updatedAt'] as String),
  assignedTo: json['assignedTo'] as String?,
  dueDate: json['dueDate'] == null
      ? null
      : DateTime.parse(json['dueDate'] as String),
  repeatInterval: $enumDecodeNullable(
    _$RepeatIntervalEnumMap,
    json['repeatInterval'],
  ),
  completedAt: json['completedAt'] == null
      ? null
      : DateTime.parse(json['completedAt'] as String),
  completedBy: json['completedBy'] as String?,
  priority: (json['priority'] as num?)?.toInt(),
  tags: (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList(),
  notes: json['notes'] as String?,
);

Map<String, dynamic> _$TaskToJson(_Task instance) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'description': instance.description,
  'status': _$TaskStatusEnumMap[instance.status]!,
  'category': _$TaskCategoryEnumMap[instance.category]!,
  'houseId': instance.houseId,
  'createdBy': instance.createdBy,
  'createdAt': instance.createdAt.toIso8601String(),
  'updatedAt': instance.updatedAt.toIso8601String(),
  'assignedTo': instance.assignedTo,
  'dueDate': instance.dueDate?.toIso8601String(),
  'repeatInterval': _$RepeatIntervalEnumMap[instance.repeatInterval],
  'completedAt': instance.completedAt?.toIso8601String(),
  'completedBy': instance.completedBy,
  'priority': instance.priority,
  'tags': instance.tags,
  'notes': instance.notes,
};

const _$TaskStatusEnumMap = {
  TaskStatus.pending: 'pending',
  TaskStatus.inProgress: 'inProgress',
  TaskStatus.completed: 'completed',
  TaskStatus.cancelled: 'cancelled',
};

const _$TaskCategoryEnumMap = {
  TaskCategory.cleaning: 'cleaning',
  TaskCategory.maintenance: 'maintenance',
  TaskCategory.cooking: 'cooking',
  TaskCategory.shopping: 'shopping',
  TaskCategory.personal: 'personal',
  TaskCategory.medical: 'medical',
  TaskCategory.social: 'social',
  TaskCategory.other: 'other',
};

const _$RepeatIntervalEnumMap = {
  RepeatInterval.none: 'none',
  RepeatInterval.daily: 'daily',
  RepeatInterval.weekly: 'weekly',
  RepeatInterval.monthly: 'monthly',
  RepeatInterval.yearly: 'yearly',
};
