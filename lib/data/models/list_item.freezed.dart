// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'list_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ListItem {
  @HiveField(0)
  String get id;
  @HiveField(1)
  String get name;
  @HiveField(2)
  int get quantity;
  @HiveField(3)
  bool get isPurchased;
  @HiveField(4)
  String? get notes;
  @HiveField(5)
  String? get category;
  @HiveField(6)
  double? get estimatedPrice;
  @HiveField(7)
  DateTime? get purchasedAt;
  @HiveField(8)
  String? get purchasedBy;

  /// Create a copy of ListItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ListItemCopyWith<ListItem> get copyWith =>
      _$ListItemCopyWithImpl<ListItem>(this as ListItem, _$identity);

  /// Serializes this ListItem to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ListItem &&
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

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, quantity, isPurchased,
      notes, category, estimatedPrice, purchasedAt, purchasedBy);

  @override
  String toString() {
    return 'ListItem(id: $id, name: $name, quantity: $quantity, isPurchased: $isPurchased, notes: $notes, category: $category, estimatedPrice: $estimatedPrice, purchasedAt: $purchasedAt, purchasedBy: $purchasedBy)';
  }
}

/// @nodoc
abstract mixin class $ListItemCopyWith<$Res> {
  factory $ListItemCopyWith(ListItem value, $Res Function(ListItem) _then) =
      _$ListItemCopyWithImpl;
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
class _$ListItemCopyWithImpl<$Res> implements $ListItemCopyWith<$Res> {
  _$ListItemCopyWithImpl(this._self, this._then);

  final ListItem _self;
  final $Res Function(ListItem) _then;

  /// Create a copy of ListItem
  /// with the given fields replaced by the non-null parameter values.
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
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _self.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      isPurchased: null == isPurchased
          ? _self.isPurchased
          : isPurchased // ignore: cast_nullable_to_non_nullable
              as bool,
      notes: freezed == notes
          ? _self.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      category: freezed == category
          ? _self.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
      estimatedPrice: freezed == estimatedPrice
          ? _self.estimatedPrice
          : estimatedPrice // ignore: cast_nullable_to_non_nullable
              as double?,
      purchasedAt: freezed == purchasedAt
          ? _self.purchasedAt
          : purchasedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      purchasedBy: freezed == purchasedBy
          ? _self.purchasedBy
          : purchasedBy // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [ListItem].
extension ListItemPatterns on ListItem {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_ListItem value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ListItem() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_ListItem value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ListItem():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_ListItem value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ListItem() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            @HiveField(0) String id,
            @HiveField(1) String name,
            @HiveField(2) int quantity,
            @HiveField(3) bool isPurchased,
            @HiveField(4) String? notes,
            @HiveField(5) String? category,
            @HiveField(6) double? estimatedPrice,
            @HiveField(7) DateTime? purchasedAt,
            @HiveField(8) String? purchasedBy)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ListItem() when $default != null:
        return $default(
            _that.id,
            _that.name,
            _that.quantity,
            _that.isPurchased,
            _that.notes,
            _that.category,
            _that.estimatedPrice,
            _that.purchasedAt,
            _that.purchasedBy);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            @HiveField(0) String id,
            @HiveField(1) String name,
            @HiveField(2) int quantity,
            @HiveField(3) bool isPurchased,
            @HiveField(4) String? notes,
            @HiveField(5) String? category,
            @HiveField(6) double? estimatedPrice,
            @HiveField(7) DateTime? purchasedAt,
            @HiveField(8) String? purchasedBy)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ListItem():
        return $default(
            _that.id,
            _that.name,
            _that.quantity,
            _that.isPurchased,
            _that.notes,
            _that.category,
            _that.estimatedPrice,
            _that.purchasedAt,
            _that.purchasedBy);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            @HiveField(0) String id,
            @HiveField(1) String name,
            @HiveField(2) int quantity,
            @HiveField(3) bool isPurchased,
            @HiveField(4) String? notes,
            @HiveField(5) String? category,
            @HiveField(6) double? estimatedPrice,
            @HiveField(7) DateTime? purchasedAt,
            @HiveField(8) String? purchasedBy)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ListItem() when $default != null:
        return $default(
            _that.id,
            _that.name,
            _that.quantity,
            _that.isPurchased,
            _that.notes,
            _that.category,
            _that.estimatedPrice,
            _that.purchasedAt,
            _that.purchasedBy);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _ListItem implements ListItem {
  const _ListItem(
      {@HiveField(0) required this.id,
      @HiveField(1) required this.name,
      @HiveField(2) required this.quantity,
      @HiveField(3) required this.isPurchased,
      @HiveField(4) this.notes,
      @HiveField(5) this.category,
      @HiveField(6) this.estimatedPrice,
      @HiveField(7) this.purchasedAt,
      @HiveField(8) this.purchasedBy});
  factory _ListItem.fromJson(Map<String, dynamic> json) =>
      _$ListItemFromJson(json);

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

  /// Create a copy of ListItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ListItemCopyWith<_ListItem> get copyWith =>
      __$ListItemCopyWithImpl<_ListItem>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ListItemToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ListItem &&
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

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, quantity, isPurchased,
      notes, category, estimatedPrice, purchasedAt, purchasedBy);

  @override
  String toString() {
    return 'ListItem(id: $id, name: $name, quantity: $quantity, isPurchased: $isPurchased, notes: $notes, category: $category, estimatedPrice: $estimatedPrice, purchasedAt: $purchasedAt, purchasedBy: $purchasedBy)';
  }
}

/// @nodoc
abstract mixin class _$ListItemCopyWith<$Res>
    implements $ListItemCopyWith<$Res> {
  factory _$ListItemCopyWith(_ListItem value, $Res Function(_ListItem) _then) =
      __$ListItemCopyWithImpl;
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
class __$ListItemCopyWithImpl<$Res> implements _$ListItemCopyWith<$Res> {
  __$ListItemCopyWithImpl(this._self, this._then);

  final _ListItem _self;
  final $Res Function(_ListItem) _then;

  /// Create a copy of ListItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
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
    return _then(_ListItem(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _self.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      isPurchased: null == isPurchased
          ? _self.isPurchased
          : isPurchased // ignore: cast_nullable_to_non_nullable
              as bool,
      notes: freezed == notes
          ? _self.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      category: freezed == category
          ? _self.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
      estimatedPrice: freezed == estimatedPrice
          ? _self.estimatedPrice
          : estimatedPrice // ignore: cast_nullable_to_non_nullable
              as double?,
      purchasedAt: freezed == purchasedAt
          ? _self.purchasedAt
          : purchasedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      purchasedBy: freezed == purchasedBy
          ? _self.purchasedBy
          : purchasedBy // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
