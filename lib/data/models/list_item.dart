import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_ce/hive.dart';

part 'list_item.freezed.dart';
part 'list_item.g.dart';

@freezed
@HiveType(typeId: 5, adapterName: 'ListItemAdapter')
abstract class ListItem with _$ListItem {
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
