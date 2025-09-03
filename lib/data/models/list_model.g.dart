// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_model.dart';

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
