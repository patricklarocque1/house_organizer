// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'simple_todo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SimpleTodo _$SimpleTodoFromJson(Map<String, dynamic> json) => SimpleTodo(
  id: json['id'] as String,
  title: json['title'] as String,
  completed: json['completed'] as bool? ?? false,
  createdAt: DateTime.parse(json['createdAt'] as String),
  completedAt: json['completedAt'] == null
      ? null
      : DateTime.parse(json['completedAt'] as String),
  notes: json['notes'] as String?,
  houseId: json['houseId'] as String,
  createdBy: json['createdBy'] as String,
);

Map<String, dynamic> _$SimpleTodoToJson(SimpleTodo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'completed': instance.completed,
      'createdAt': instance.createdAt.toIso8601String(),
      'completedAt': instance.completedAt?.toIso8601String(),
      'notes': instance.notes,
      'houseId': instance.houseId,
      'createdBy': instance.createdBy,
    };
