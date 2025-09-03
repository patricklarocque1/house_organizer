// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'list_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ListItem _$ListItemFromJson(Map<String, dynamic> json) {
  return _ListItem.fromJson(json);
}

/// @nodoc
mixin _$ListItem {
  @HiveField(0)
  String get id => throw _privateConstructorUsedError;
  @HiveField(1)
  String get name => throw _privateConstructorUsedError;
  @HiveField(2)
  int get quantity => throw _privateConstructorUsedError;
  @HiveField(3)
  bool get isPurchased => throw _privateConstructorUsedError;
  @HiveField(4)
  String? get notes => throw _privateConstructorUsedError;
  @HiveField(5)
  String? get category => throw _privateConstructorUsedError;
  @HiveField(6)
  double? get estimatedPrice => throw _privateConstructorUsedError;
  @HiveField(7)
  DateTime? get purchasedAt => throw _privateConstructorUsedError;
  @HiveField(8)
  String? get purchasedBy => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ListItemCopyWith<ListItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ListItemCopyWith<$Res> {
  factory $ListItemCopyWith(ListItem value, $Res Function(ListItem) then) =
      _$ListItemCopyWithImpl<$Res, ListItem>;
  @useResult
  $Res call(
      {@HiveField(0) String id,
      @HiveField(1) String name,
      @HiveField(2) int quantity,
      @HiveField(3) bool isPurchased,
      @HiveField(4) String? notes,
      @HiveField(5) String? category,
      @HiveField(6) double? estimatedPrice,
      @HiveField(7) DateTime? purchasedAt,
      @HiveField(8) String? purchasedBy});
}

/// @nodoc
class _$ListItemCopyWithImpl<$Res, $Val extends ListItem>
    implements $ListItemCopyWith<$Res> {
  _$ListItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? quantity = null,
    Object? isPurchased = null,
    Object? notes = freezed,
    Object? category = freezed,
    Object? estimatedPrice = freezed,
    Object? purchasedAt = freezed,
    Object? purchasedBy = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      isPurchased: null == isPurchased
          ? _value.isPurchased
          : isPurchased // ignore: cast_nullable_to_non_nullable
              as bool,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
      estimatedPrice: freezed == estimatedPrice
          ? _value.estimatedPrice
          : estimatedPrice // ignore: cast_nullable_to_non_nullable
              as double?,
      purchasedAt: freezed == purchasedAt
          ? _value.purchasedAt
          : purchasedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      purchasedBy: freezed == purchasedBy
          ? _value.purchasedBy
          : purchasedBy // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ListItemImplCopyWith<$Res>
    implements $ListItemCopyWith<$Res> {
  factory _$$ListItemImplCopyWith(
          _$ListItemImpl value, $Res Function(_$ListItemImpl) then) =
      __$$ListItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) String id,
      @HiveField(1) String name,
      @HiveField(2) int quantity,
      @HiveField(3) bool isPurchased,
      @HiveField(4) String? notes,
      @HiveField(5) String? category,
      @HiveField(6) double? estimatedPrice,
      @HiveField(7) DateTime? purchasedAt,
      @HiveField(8) String? purchasedBy});
}

/// @nodoc
class __$$ListItemImplCopyWithImpl<$Res>
    extends _$ListItemCopyWithImpl<$Res, _$ListItemImpl>
    implements _$$ListItemImplCopyWith<$Res> {
  __$$ListItemImplCopyWithImpl(
      _$ListItemImpl _value, $Res Function(_$ListItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? quantity = null,
    Object? isPurchased = null,
    Object? notes = freezed,
    Object? category = freezed,
    Object? estimatedPrice = freezed,
    Object? purchasedAt = freezed,
    Object? purchasedBy = freezed,
  }) {
    return _then(_$ListItemImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      isPurchased: null == isPurchased
          ? _value.isPurchased
          : isPurchased // ignore: cast_nullable_to_non_nullable
              as bool,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
      estimatedPrice: freezed == estimatedPrice
          ? _value.estimatedPrice
          : estimatedPrice // ignore: cast_nullable_to_non_nullable
              as double?,
      purchasedAt: freezed == purchasedAt
          ? _value.purchasedAt
          : purchasedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      purchasedBy: freezed == purchasedBy
          ? _value.purchasedBy
          : purchasedBy // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ListItemImpl implements _ListItem {
  const _$ListItemImpl(
      {@HiveField(0) required this.id,
      @HiveField(1) required this.name,
      @HiveField(2) required this.quantity,
      @HiveField(3) required this.isPurchased,
      @HiveField(4) this.notes,
      @HiveField(5) this.category,
      @HiveField(6) this.estimatedPrice,
      @HiveField(7) this.purchasedAt,
      @HiveField(8) this.purchasedBy});

  factory _$ListItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$ListItemImplFromJson(json);

  @override
  @HiveField(0)
  final String id;
  @override
  @HiveField(1)
  final String name;
  @override
  @HiveField(2)
  final int quantity;
  @override
  @HiveField(3)
  final bool isPurchased;
  @override
  @HiveField(4)
  final String? notes;
  @override
  @HiveField(5)
  final String? category;
  @override
  @HiveField(6)
  final double? estimatedPrice;
  @override
  @HiveField(7)
  final DateTime? purchasedAt;
  @override
  @HiveField(8)
  final String? purchasedBy;

  @override
  String toString() {
    return 'ListItem(id: $id, name: $name, quantity: $quantity, isPurchased: $isPurchased, notes: $notes, category: $category, estimatedPrice: $estimatedPrice, purchasedAt: $purchasedAt, purchasedBy: $purchasedBy)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ListItemImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.isPurchased, isPurchased) ||
                other.isPurchased == isPurchased) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.estimatedPrice, estimatedPrice) ||
                other.estimatedPrice == estimatedPrice) &&
            (identical(other.purchasedAt, purchasedAt) ||
                other.purchasedAt == purchasedAt) &&
            (identical(other.purchasedBy, purchasedBy) ||
                other.purchasedBy == purchasedBy));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, quantity, isPurchased,
      notes, category, estimatedPrice, purchasedAt, purchasedBy);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ListItemImplCopyWith<_$ListItemImpl> get copyWith =>
      __$$ListItemImplCopyWithImpl<_$ListItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ListItemImplToJson(
      this,
    );
  }
}

abstract class _ListItem implements ListItem {
  const factory _ListItem(
      {@HiveField(0) required final String id,
      @HiveField(1) required final String name,
      @HiveField(2) required final int quantity,
      @HiveField(3) required final bool isPurchased,
      @HiveField(4) final String? notes,
      @HiveField(5) final String? category,
      @HiveField(6) final double? estimatedPrice,
      @HiveField(7) final DateTime? purchasedAt,
      @HiveField(8) final String? purchasedBy}) = _$ListItemImpl;

  factory _ListItem.fromJson(Map<String, dynamic> json) =
      _$ListItemImpl.fromJson;

  @override
  @HiveField(0)
  String get id;
  @override
  @HiveField(1)
  String get name;
  @override
  @HiveField(2)
  int get quantity;
  @override
  @HiveField(3)
  bool get isPurchased;
  @override
  @HiveField(4)
  String? get notes;
  @override
  @HiveField(5)
  String? get category;
  @override
  @HiveField(6)
  double? get estimatedPrice;
  @override
  @HiveField(7)
  DateTime? get purchasedAt;
  @override
  @HiveField(8)
  String? get purchasedBy;
  @override
  @JsonKey(ignore: true)
  _$$ListItemImplCopyWith<_$ListItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
