// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'house.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HouseAdapter extends TypeAdapter<House> {
  @override
  final int typeId = 2;

  @override
  House read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return House(
      id: fields[0] as String,
      name: fields[1] as String,
      address: fields[2] as String,
      joinCode: fields[3] as String,
      createdBy: fields[4] as String,
      createdAt: fields[5] as DateTime,
      updatedAt: fields[6] as DateTime,
      residentIds: (fields[7] as List?)?.cast<String>(),
      supervisorIds: (fields[8] as List?)?.cast<String>(),
      isActive: fields[9] as bool?,
      description: fields[10] as String?,
      phoneNumber: fields[11] as String?,
      email: fields[12] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, House obj) {
    writer
      ..writeByte(13)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.address)
      ..writeByte(3)
      ..write(obj.joinCode)
      ..writeByte(4)
      ..write(obj.createdBy)
      ..writeByte(5)
      ..write(obj.createdAt)
      ..writeByte(6)
      ..write(obj.updatedAt)
      ..writeByte(7)
      ..write(obj.residentIds)
      ..writeByte(8)
      ..write(obj.supervisorIds)
      ..writeByte(9)
      ..write(obj.isActive)
      ..writeByte(10)
      ..write(obj.description)
      ..writeByte(11)
      ..write(obj.phoneNumber)
      ..writeByte(12)
      ..write(obj.email);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HouseAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HouseImpl _$$HouseImplFromJson(Map<String, dynamic> json) => _$HouseImpl(
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

Map<String, dynamic> _$$HouseImplToJson(_$HouseImpl instance) =>
    <String, dynamic>{
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
