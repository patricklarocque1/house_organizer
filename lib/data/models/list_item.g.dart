// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_item.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ListItemAdapter extends TypeAdapter<ListItem> {
  @override
  final int typeId = 8;

  @override
  ListItem read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ListItem(
      id: fields[0] as String,
      name: fields[1] as String,
      quantity: fields[2] as int,
      isPurchased: fields[3] as bool,
      notes: fields[4] as String?,
      category: fields[5] as String?,
      estimatedPrice: fields[6] as double?,
      purchasedAt: fields[7] as DateTime?,
      purchasedBy: fields[8] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, ListItem obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.quantity)
      ..writeByte(3)
      ..write(obj.isPurchased)
      ..writeByte(4)
      ..write(obj.notes)
      ..writeByte(5)
      ..write(obj.category)
      ..writeByte(6)
      ..write(obj.estimatedPrice)
      ..writeByte(7)
      ..write(obj.purchasedAt)
      ..writeByte(8)
      ..write(obj.purchasedBy);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ListItemAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ListItemImpl _$$ListItemImplFromJson(Map<String, dynamic> json) =>
    _$ListItemImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      quantity: (json['quantity'] as num).toInt(),
      isPurchased: json['isPurchased'] as bool,
      notes: json['notes'] as String?,
      category: json['category'] as String?,
      estimatedPrice: (json['estimatedPrice'] as num?)?.toDouble(),
      purchasedAt: json['purchasedAt'] == null
          ? null
          : DateTime.parse(json['purchasedAt'] as String),
      purchasedBy: json['purchasedBy'] as String?,
    );

Map<String, dynamic> _$$ListItemImplToJson(_$ListItemImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'quantity': instance.quantity,
      'isPurchased': instance.isPurchased,
      'notes': instance.notes,
      'category': instance.category,
      'estimatedPrice': instance.estimatedPrice,
      'purchasedAt': instance.purchasedAt?.toIso8601String(),
      'purchasedBy': instance.purchasedBy,
    };
