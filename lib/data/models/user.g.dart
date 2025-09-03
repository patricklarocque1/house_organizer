// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_User _$UserFromJson(Map<String, dynamic> json) => _User(
  id: json['id'] as String,
  email: json['email'] as String,
  displayName: json['displayName'] as String,
  houseId: json['houseId'] as String,
  role: $enumDecode(_$UserRoleEnumMap, json['role']),
  createdAt: DateTime.parse(json['createdAt'] as String),
  updatedAt: DateTime.parse(json['updatedAt'] as String),
  profileImageUrl: json['profileImageUrl'] as String?,
  isActive: json['isActive'] as bool?,
  lastLoginAt: json['lastLoginAt'] == null
      ? null
      : DateTime.parse(json['lastLoginAt'] as String),
);

Map<String, dynamic> _$UserToJson(_User instance) => <String, dynamic>{
  'id': instance.id,
  'email': instance.email,
  'displayName': instance.displayName,
  'houseId': instance.houseId,
  'role': _$UserRoleEnumMap[instance.role]!,
  'createdAt': instance.createdAt.toIso8601String(),
  'updatedAt': instance.updatedAt.toIso8601String(),
  'profileImageUrl': instance.profileImageUrl,
  'isActive': instance.isActive,
  'lastLoginAt': instance.lastLoginAt?.toIso8601String(),
};

const _$UserRoleEnumMap = {
  UserRole.resident: 'resident',
  UserRole.supervisor: 'supervisor',
  UserRole.admin: 'admin',
};
