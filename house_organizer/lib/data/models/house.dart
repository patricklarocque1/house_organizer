import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_ce/hive.dart';

part 'house.freezed.dart';
part 'house.g.dart';

@freezed
@HiveType(typeId: 3, adapterName: 'HouseAdapter')
abstract class House with _$House {
  const factory House({
    @HiveField(0) required String id,
    @HiveField(1) required String name,
    @HiveField(2) required String address,
    @HiveField(3) required String joinCode,
    @HiveField(4) required String createdBy,
    @HiveField(5) required DateTime createdAt,
    @HiveField(6) required DateTime updatedAt,
    @HiveField(7) List<String>? residentIds,
    @HiveField(8) List<String>? supervisorIds,
    @HiveField(9) bool? isActive,
    @HiveField(10) String? description,
    @HiveField(11) String? phoneNumber,
    @HiveField(12) String? email,
  }) = _House;

  factory House.fromJson(Map<String, dynamic> json) => _$HouseFromJson(json);
}
