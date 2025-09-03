// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ListItem _$ListItemFromJson(Map<String, dynamic> json) => _ListItem(
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

Map<String, dynamic> _$ListItemToJson(_ListItem instance) => <String, dynamic>{
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
