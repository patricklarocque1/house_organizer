// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TaskAdapter extends TypeAdapter<Task> {
  @override
  final int typeId = 3;

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
      priority: fields[14] as int?,
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

class TaskStatusAdapter extends TypeAdapter<TaskStatus> {
  @override
  final int typeId = 4;

  @override
  TaskStatus read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return TaskStatus.pending;
      case 1:
        return TaskStatus.inProgress;
      case 2:
        return TaskStatus.completed;
      case 3:
        return TaskStatus.cancelled;
      default:
        return TaskStatus.pending;
    }
  }

  @override
  void write(BinaryWriter writer, TaskStatus obj) {
    switch (obj) {
      case TaskStatus.pending:
        writer.writeByte(0);
        break;
      case TaskStatus.inProgress:
        writer.writeByte(1);
        break;
      case TaskStatus.completed:
        writer.writeByte(2);
        break;
      case TaskStatus.cancelled:
        writer.writeByte(3);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TaskStatusAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class TaskCategoryAdapter extends TypeAdapter<TaskCategory> {
  @override
  final int typeId = 5;

  @override
  TaskCategory read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return TaskCategory.cleaning;
      case 1:
        return TaskCategory.maintenance;
      case 2:
        return TaskCategory.cooking;
      case 3:
        return TaskCategory.shopping;
      case 4:
        return TaskCategory.personal;
      case 5:
        return TaskCategory.medical;
      case 6:
        return TaskCategory.social;
      case 7:
        return TaskCategory.other;
      default:
        return TaskCategory.cleaning;
    }
  }

  @override
  void write(BinaryWriter writer, TaskCategory obj) {
    switch (obj) {
      case TaskCategory.cleaning:
        writer.writeByte(0);
        break;
      case TaskCategory.maintenance:
        writer.writeByte(1);
        break;
      case TaskCategory.cooking:
        writer.writeByte(2);
        break;
      case TaskCategory.shopping:
        writer.writeByte(3);
        break;
      case TaskCategory.personal:
        writer.writeByte(4);
        break;
      case TaskCategory.medical:
        writer.writeByte(5);
        break;
      case TaskCategory.social:
        writer.writeByte(6);
        break;
      case TaskCategory.other:
        writer.writeByte(7);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TaskCategoryAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class RepeatIntervalAdapter extends TypeAdapter<RepeatInterval> {
  @override
  final int typeId = 6;

  @override
  RepeatInterval read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return RepeatInterval.none;
      case 1:
        return RepeatInterval.daily;
      case 2:
        return RepeatInterval.weekly;
      case 3:
        return RepeatInterval.monthly;
      case 4:
        return RepeatInterval.yearly;
      default:
        return RepeatInterval.none;
    }
  }

  @override
  void write(BinaryWriter writer, RepeatInterval obj) {
    switch (obj) {
      case RepeatInterval.none:
        writer.writeByte(0);
        break;
      case RepeatInterval.daily:
        writer.writeByte(1);
        break;
      case RepeatInterval.weekly:
        writer.writeByte(2);
        break;
      case RepeatInterval.monthly:
        writer.writeByte(3);
        break;
      case RepeatInterval.yearly:
        writer.writeByte(4);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RepeatIntervalAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TaskImpl _$$TaskImplFromJson(Map<String, dynamic> json) => _$TaskImpl(
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

Map<String, dynamic> _$$TaskImplToJson(_$TaskImpl instance) =>
    <String, dynamic>{
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
