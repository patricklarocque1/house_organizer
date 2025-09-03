// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'audit_log.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AuditLogAdapter extends TypeAdapter<AuditLog> {
  @override
  final int typeId = 10;

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

class AuditActionAdapter extends TypeAdapter<AuditAction> {
  @override
  final int typeId = 11;

  @override
  AuditAction read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return AuditAction.create;
      case 1:
        return AuditAction.update;
      case 2:
        return AuditAction.delete;
      case 3:
        return AuditAction.complete;
      case 4:
        return AuditAction.assign;
      case 5:
        return AuditAction.unassign;
      case 6:
        return AuditAction.login;
      case 7:
        return AuditAction.logout;
      case 8:
        return AuditAction.joinHouse;
      case 9:
        return AuditAction.leaveHouse;
      default:
        return AuditAction.create;
    }
  }

  @override
  void write(BinaryWriter writer, AuditAction obj) {
    switch (obj) {
      case AuditAction.create:
        writer.writeByte(0);
        break;
      case AuditAction.update:
        writer.writeByte(1);
        break;
      case AuditAction.delete:
        writer.writeByte(2);
        break;
      case AuditAction.complete:
        writer.writeByte(3);
        break;
      case AuditAction.assign:
        writer.writeByte(4);
        break;
      case AuditAction.unassign:
        writer.writeByte(5);
        break;
      case AuditAction.login:
        writer.writeByte(6);
        break;
      case AuditAction.logout:
        writer.writeByte(7);
        break;
      case AuditAction.joinHouse:
        writer.writeByte(8);
        break;
      case AuditAction.leaveHouse:
        writer.writeByte(9);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AuditActionAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AuditLogImpl _$$AuditLogImplFromJson(Map<String, dynamic> json) =>
    _$AuditLogImpl(
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

Map<String, dynamic> _$$AuditLogImplToJson(_$AuditLogImpl instance) =>
    <String, dynamic>{
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
