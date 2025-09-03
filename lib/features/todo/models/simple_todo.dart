import 'package:json_annotation/json_annotation.dart';

part 'simple_todo.g.dart';

@JsonSerializable()
class SimpleTodo {
  final String id;
  final String title;
  final bool completed;
  final DateTime createdAt;
  final DateTime? completedAt;
  final String? notes;
  final String houseId;
  final String createdBy;

  const SimpleTodo({
    required this.id,
    required this.title,
    this.completed = false,
    required this.createdAt,
    this.completedAt,
    this.notes,
    required this.houseId,
    required this.createdBy,
  });

  factory SimpleTodo.fromJson(Map<String, dynamic> json) =>
      _$SimpleTodoFromJson(json);

  Map<String, dynamic> toJson() => _$SimpleTodoToJson(this);

  SimpleTodo copyWith({
    String? id,
    String? title,
    bool? completed,
    DateTime? createdAt,
    DateTime? completedAt,
    String? notes,
    String? houseId,
    String? createdBy,
  }) {
    return SimpleTodo(
      id: id ?? this.id,
      title: title ?? this.title,
      completed: completed ?? this.completed,
      createdAt: createdAt ?? this.createdAt,
      completedAt: completedAt ?? this.completedAt,
      notes: notes ?? this.notes,
      houseId: houseId ?? this.houseId,
      createdBy: createdBy ?? this.createdBy,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is SimpleTodo && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;
}
