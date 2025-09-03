import 'package:freezed_annotation/freezed_annotation.dart';

import 'list_item.dart';

part 'list_model.freezed.dart';
part 'list_model.g.dart';

@freezed
class ListModel with _$ListModel {
  const factory ListModel({
    required String id,
    required String name,
    required ListType type,
    required String houseId,
    required String createdBy,
    required DateTime createdAt,
    required DateTime updatedAt,
    required List<ListItem> items,
    String? assignedTo,
    String? description,
    bool? isCompleted,
    DateTime? completedAt,
    String? completedBy,
    DateTime? dueDate,
  }) = _ListModel;

  factory ListModel.fromJson(Map<String, dynamic> json) =>
      _$ListModelFromJson(json);
}

enum ListType { grocery, errands, other }

extension ListTypeExtension on ListType {
  String get displayName {
    switch (this) {
      case ListType.grocery:
        return 'Grocery List';
      case ListType.errands:
        return 'Errands';
      case ListType.other:
        return 'Other';
    }
  }
}
