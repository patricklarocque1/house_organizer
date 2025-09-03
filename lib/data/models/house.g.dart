// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'house.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_House _$HouseFromJson(Map<String, dynamic> json) => _House(
  id: json['id'] as String,
  name: json['name'] as String,
  address: json['address'] as String,
  joinCode: json['joinCode'] as String,
  createdBy: json['createdBy'] as String,
  createdAt: DateTime.parse(json['createdAt'] as String),
  updatedAt: DateTime.parse(json['updatedAt'] as String),
  residentIds: (json['residentIds'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  supervisorIds: (json['supervisorIds'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  isActive: json['isActive'] as bool?,
  description: json['description'] as String?,
  phoneNumber: json['phoneNumber'] as String?,
  email: json['email'] as String?,
);

Map<String, dynamic> _$HouseToJson(_House instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'address': instance.address,
  'joinCode': instance.joinCode,
  'createdBy': instance.createdBy,
  'createdAt': instance.createdAt.toIso8601String(),
  'updatedAt': instance.updatedAt.toIso8601String(),
  'residentIds': instance.residentIds,
  'supervisorIds': instance.supervisorIds,
  'isActive': instance.isActive,
  'description': instance.description,
  'phoneNumber': instance.phoneNumber,
  'email': instance.email,
};
