import 'package:freezed_annotation/freezed_annotation.dart';

part 'house.freezed.dart';
part 'house.g.dart';

@freezed
class House with _$House {
  const factory House({
    required String id,
    required String name,
    required String address,
    required String joinCode,
    required String createdBy,
    required DateTime createdAt,
    required DateTime updatedAt,
    List<String>? residentIds,
    List<String>? supervisorIds,
    bool? isActive,
    String? description,
    String? phoneNumber,
    String? email,
  }) = _House;

  factory House.fromJson(Map<String, dynamic> json) => _$HouseFromJson(json);
}
