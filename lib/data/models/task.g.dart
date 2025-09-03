// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TaskAdapter extends TypeAdapter<Task> {
  @override
  final typeId = 4;

  @override
  Task read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Task(
      id: fields[0] as String,
      title: fields[1] as String,
      description: fields[2] as String,
      status: fields[3] as TaskStatus,
      category: fields[4] as TaskCategory,
      houseId: fields[5] as String,
      createdBy: fields[6] as String,
      createdAt: fields[7] as DateTime,
      updatedAt: fields[8] as DateTime,
      assignedTo: fields[9] as String?,
      dueDate: fields[10] as DateTime?,
      repeatInterval: fields[11] as RepeatInterval?,
      completedAt: fields[12] as DateTime?,
      completedBy: fields[13] as String?,
      priority: (fields[14] as num?)?.toInt(),
      tags: (fields[15] as List?)?.cast<String>(),
      notes: fields[16] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Task obj) {
    writer
      ..writeByte(17)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.description)
      ..writeByte(3)
      ..write(obj.status)
      ..writeByte(4)
      ..write(obj.category)
      ..writeByte(5)
      ..write(obj.houseId)
      ..writeByte(6)
      ..write(obj.createdBy)
      ..writeByte(7)
      ..write(obj.createdAt)
      ..writeByte(8)
      ..write(obj.updatedAt)
      ..writeByte(9)
      ..write(obj.assignedTo)
      ..writeByte(10)
      ..write(obj.dueDate)
      ..writeByte(11)
      ..write(obj.repeatInterval)
      ..writeByte(12)
      ..write(obj.completedAt)
      ..writeByte(13)
      ..write(obj.completedBy)
      ..writeByte(14)
      ..write(obj.priority)
      ..writeByte(15)
      ..write(obj.tags)
      ..writeByte(16)
      ..write(obj.notes);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TaskAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

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
      repeatInterval:
          $enumDecodeNullable(_$RepeatIntervalEnumMap, json['repeatInterval']),
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
