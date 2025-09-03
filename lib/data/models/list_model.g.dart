// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ListModelAdapter extends TypeAdapter<ListModel> {
  @override
  final int typeId = 7;

  @override
  ListModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ListModel(
      id: fields[0] as String,
      name: fields[1] as String,
      type: fields[2] as ListType,
      houseId: fields[3] as String,
      createdBy: fields[4] as String,
      createdAt: fields[5] as DateTime,
      updatedAt: fields[6] as DateTime,
      items: (fields[7] as List).cast<ListItem>(),
      assignedTo: fields[8] as String?,
      description: fields[9] as String?,
      isCompleted: fields[10] as bool?,
      completedAt: fields[11] as DateTime?,
      completedBy: fields[12] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, ListModel obj) {
    writer
      ..writeByte(13)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.type)
      ..writeByte(3)
      ..write(obj.houseId)
      ..writeByte(4)
      ..write(obj.createdBy)
      ..writeByte(5)
      ..write(obj.createdAt)
      ..writeByte(6)
      ..write(obj.updatedAt)
      ..writeByte(7)
      ..write(obj.items)
      ..writeByte(8)
      ..write(obj.assignedTo)
      ..writeByte(9)
      ..write(obj.description)
      ..writeByte(10)
      ..write(obj.isCompleted)
      ..writeByte(11)
      ..write(obj.completedAt)
      ..writeByte(12)
      ..write(obj.completedBy);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ListModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

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

class ListTypeAdapter extends TypeAdapter<ListType> {
  @override
  final int typeId = 9;

  @override
  ListType read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return ListType.grocery;
      case 1:
        return ListType.errands;
      case 2:
        return ListType.other;
      default:
        return ListType.grocery;
    }
  }

  @override
  void write(BinaryWriter writer, ListType obj) {
    switch (obj) {
      case ListType.grocery:
        writer.writeByte(0);
        break;
      case ListType.errands:
        writer.writeByte(1);
        break;
      case ListType.other:
        writer.writeByte(2);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ListTypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ListModelImpl _$$ListModelImplFromJson(Map<String, dynamic> json) =>
    _$ListModelImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      type: $enumDecode(_$ListTypeEnumMap, json['type']),
      houseId: json['houseId'] as String,
      createdBy: json['createdBy'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      items: (json['items'] as List<dynamic>)
          .map((e) => ListItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      assignedTo: json['assignedTo'] as String?,
      description: json['description'] as String?,
      isCompleted: json['isCompleted'] as bool?,
      completedAt: json['completedAt'] == null
          ? null
          : DateTime.parse(json['completedAt'] as String),
      completedBy: json['completedBy'] as String?,
    );

Map<String, dynamic> _$$ListModelImplToJson(_$ListModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'type': _$ListTypeEnumMap[instance.type]!,
      'houseId': instance.houseId,
      'createdBy': instance.createdBy,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'items': instance.items,
      'assignedTo': instance.assignedTo,
      'description': instance.description,
      'isCompleted': instance.isCompleted,
      'completedAt': instance.completedAt?.toIso8601String(),
      'completedBy': instance.completedBy,
    };

const _$ListTypeEnumMap = {
  ListType.grocery: 'grocery',
  ListType.errands: 'errands',
  ListType.other: 'other',
};

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
