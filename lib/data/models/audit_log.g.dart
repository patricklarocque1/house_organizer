// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'audit_log.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AuditLog _$AuditLogFromJson(Map<String, dynamic> json) => _AuditLog(
  id: json['id'] as String,
  userId: json['userId'] as String,
  houseId: json['houseId'] as String,
  action: $enumDecode(_$AuditActionEnumMap, json['action']),
  targetType: json['targetType'] as String,
  targetId: json['targetId'] as String,
  timestamp: DateTime.parse(json['timestamp'] as String),
  metadata: json['metadata'] as Map<String, dynamic>?,
  description: json['description'] as String?,
  userDisplayName: json['userDisplayName'] as String?,
);

Map<String, dynamic> _$AuditLogToJson(_AuditLog instance) => <String, dynamic>{
  'id': instance.id,
  'userId': instance.userId,
  'houseId': instance.houseId,
  'action': _$AuditActionEnumMap[instance.action]!,
  'targetType': instance.targetType,
  'targetId': instance.targetId,
  'timestamp': instance.timestamp.toIso8601String(),
  'metadata': instance.metadata,
  'description': instance.description,
  'userDisplayName': instance.userDisplayName,
};

const _$AuditActionEnumMap = {
  AuditAction.create: 'create',
  AuditAction.update: 'update',
  AuditAction.delete: 'delete',
  AuditAction.complete: 'complete',
  AuditAction.assign: 'assign',
  AuditAction.unassign: 'unassign',
  AuditAction.login: 'login',
  AuditAction.logout: 'logout',
  AuditAction.joinHouse: 'joinHouse',
  AuditAction.leaveHouse: 'leaveHouse',
};
