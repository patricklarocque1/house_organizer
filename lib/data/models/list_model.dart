import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'list_model.freezed.dart';
part 'list_model.g.dart';

@freezed
@HiveType(typeId: 7)
class ListModel with _$ListModel {
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
  }) = _ListModel;

  factory ListModel.fromJson(Map<String, dynamic> json) =>
      _$ListModelFromJson(json);
}

@freezed
@HiveType(typeId: 8)
class ListItem with _$ListItem {
  const factory ListItem({
    @HiveField(0) required String id,
    @HiveField(1) required String name,
    @HiveField(2) required int quantity,
    @HiveField(3) required bool isPurchased,
    @HiveField(4) String? notes,
    @HiveField(5) String? category,
    @HiveField(6) double? estimatedPrice,
    @HiveField(7) DateTime? purchasedAt,
    @HiveField(8) String? purchasedBy,
  }) = _ListItem;

  factory ListItem.fromJson(Map<String, dynamic> json) =>
      _$ListItemFromJson(json);
}

@HiveType(typeId: 9)
enum ListType {
  @HiveField(0)
  grocery,
  @HiveField(1)
  errands,
  @HiveField(2)
  other,
}

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
