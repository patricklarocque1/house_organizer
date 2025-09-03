import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_ce/hive.dart';

import 'list_item.dart';

part 'list_model.freezed.dart';
part 'list_model.g.dart';

@freezed
@HiveType(typeId: 2, adapterName: 'ListModelAdapter')
abstract class ListModel with _$ListModel {
  const factory ListModel({
    @HiveField(0) required String id,
    @HiveField(1) required String name,
    @HiveField(2) required ListType type,
    @HiveField(3) required String houseId,
    @HiveField(4) required String createdBy,
    @HiveField(5) required DateTime createdAt,
    @HiveField(6) required DateTime updatedAt,
    @HiveField(7) required List<ListItem> items,
    @HiveField(8) String? assignedTo,
    @HiveField(9) String? description,
    @HiveField(10) bool? isCompleted,
    @HiveField(11) DateTime? completedAt,
    @HiveField(12) String? completedBy,
    @HiveField(13) DateTime? dueDate,
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
