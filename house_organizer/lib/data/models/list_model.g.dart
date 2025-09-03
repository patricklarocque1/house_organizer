// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ListModelAdapter extends TypeAdapter<ListModel> {
  @override
  final typeId = 2;

  @override
  ListModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ListModel(
      id: fields[0] as String,
      name: fields[1] as String,
      type: fields[2] as ListType,
      houseId: fields[3] as String,
      createdBy: fields[4] as String,
      createdAt: fields[5] as DateTime,
      updatedAt: fields[6] as DateTime,
      items: (fields[7] as List).cast<ListItem>(),
      assignedTo: fields[8] as String?,
      description: fields[9] as String?,
      isCompleted: fields[10] as bool?,
      completedAt: fields[11] as DateTime?,
      completedBy: fields[12] as String?,
      dueDate: fields[13] as DateTime?,
    );
  }

  @override
  void write(BinaryWriter writer, ListModel obj) {
    writer
      ..writeByte(14)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.type)
      ..writeByte(3)
      ..write(obj.houseId)
      ..writeByte(4)
      ..write(obj.createdBy)
      ..writeByte(5)
      ..write(obj.createdAt)
      ..writeByte(6)
      ..write(obj.updatedAt)
      ..writeByte(7)
      ..write(obj.items)
      ..writeByte(8)
      ..write(obj.assignedTo)
      ..writeByte(9)
      ..write(obj.description)
      ..writeByte(10)
      ..write(obj.isCompleted)
      ..writeByte(11)
      ..write(obj.completedAt)
      ..writeByte(12)
      ..write(obj.completedBy)
      ..writeByte(13)
      ..write(obj.dueDate);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ListModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ListModel _$ListModelFromJson(Map<String, dynamic> json) => _ListModel(
      id: json['id'] as String,
      name: json['name'] as String,
      type: $enumDecode(_$ListTypeEnumMap, json['type']),
      houseId: json['houseId'] as String,
      createdBy: json['createdBy'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      items: (json['items'] as List<dynamic>)
          .map((e) => ListItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      assignedTo: json['assignedTo'] as String?,
      description: json['description'] as String?,
      isCompleted: json['isCompleted'] as bool?,
      completedAt: json['completedAt'] == null
          ? null
          : DateTime.parse(json['completedAt'] as String),
      completedBy: json['completedBy'] as String?,
      dueDate: json['dueDate'] == null
          ? null
          : DateTime.parse(json['dueDate'] as String),
    );

Map<String, dynamic> _$ListModelToJson(_ListModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'type': _$ListTypeEnumMap[instance.type]!,
      'houseId': instance.houseId,
      'createdBy': instance.createdBy,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'items': instance.items,
      'assignedTo': instance.assignedTo,
      'description': instance.description,
      'isCompleted': instance.isCompleted,
      'completedAt': instance.completedAt?.toIso8601String(),
      'completedBy': instance.completedBy,
      'dueDate': instance.dueDate?.toIso8601String(),
    };

const _$ListTypeEnumMap = {
  ListType.grocery: 'grocery',
  ListType.errands: 'errands',
  ListType.other: 'other',
};
