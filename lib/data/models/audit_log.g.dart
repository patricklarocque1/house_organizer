// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'audit_log.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AuditLogAdapter extends TypeAdapter<AuditLog> {
  @override
  final typeId = 6;

  @override
  AuditLog read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AuditLog(
      id: fields[0] as String,
      userId: fields[1] as String,
      houseId: fields[2] as String,
      action: fields[3] as AuditAction,
      targetType: fields[4] as String,
      targetId: fields[5] as String,
      timestamp: fields[6] as DateTime,
      metadata: (fields[7] as Map?)?.cast<String, dynamic>(),
      description: fields[8] as String?,
      userDisplayName: fields[9] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, AuditLog obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.userId)
      ..writeByte(2)
      ..write(obj.houseId)
      ..writeByte(3)
      ..write(obj.action)
      ..writeByte(4)
      ..write(obj.targetType)
      ..writeByte(5)
      ..write(obj.targetId)
      ..writeByte(6)
      ..write(obj.timestamp)
      ..writeByte(7)
      ..write(obj.metadata)
      ..writeByte(8)
      ..write(obj.description)
      ..writeByte(9)
      ..write(obj.userDisplayName);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AuditLogAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

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
