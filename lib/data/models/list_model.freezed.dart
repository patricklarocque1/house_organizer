// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'list_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ListModel {
  @HiveField(0)
  String get id;
  @HiveField(1)
  String get name;
  @HiveField(2)
  ListType get type;
  @HiveField(3)
  String get houseId;
  @HiveField(4)
  String get createdBy;
  @HiveField(5)
  DateTime get createdAt;
  @HiveField(6)
  DateTime get updatedAt;
  @HiveField(7)
  List<ListItem> get items;
  @HiveField(8)
  String? get assignedTo;
  @HiveField(9)
  String? get description;
  @HiveField(10)
  bool? get isCompleted;
  @HiveField(11)
  DateTime? get completedAt;
  @HiveField(12)
  String? get completedBy;
  @HiveField(13)
  DateTime? get dueDate;

  /// Create a copy of ListModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ListModelCopyWith<ListModel> get copyWith =>
      _$ListModelCopyWithImpl<ListModel>(this as ListModel, _$identity);

  /// Serializes this ListModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ListModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.houseId, houseId) || other.houseId == houseId) &&
            (identical(other.createdBy, createdBy) ||
                other.createdBy == createdBy) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            const DeepCollectionEquality().equals(other.items, items) &&
            (identical(other.assignedTo, assignedTo) ||
                other.assignedTo == assignedTo) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.isCompleted, isCompleted) ||
                other.isCompleted == isCompleted) &&
            (identical(other.completedAt, completedAt) ||
                other.completedAt == completedAt) &&
            (identical(other.completedBy, completedBy) ||
                other.completedBy == completedBy) &&
            (identical(other.dueDate, dueDate) || other.dueDate == dueDate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      type,
      houseId,
      createdBy,
      createdAt,
      updatedAt,
      const DeepCollectionEquality().hash(items),
      assignedTo,
      description,
      isCompleted,
      completedAt,
      completedBy,
      dueDate);

  @override
  String toString() {
    return 'ListModel(id: $id, name: $name, type: $type, houseId: $houseId, createdBy: $createdBy, createdAt: $createdAt, updatedAt: $updatedAt, items: $items, assignedTo: $assignedTo, description: $description, isCompleted: $isCompleted, completedAt: $completedAt, completedBy: $completedBy, dueDate: $dueDate)';
  }
}

/// @nodoc
abstract mixin class $ListModelCopyWith<$Res> {
  factory $ListModelCopyWith(ListModel value, $Res Function(ListModel) _then) =
      _$ListModelCopyWithImpl;
  @useResult
  $Res call(
      {@HiveField(0) String id,
      @HiveField(1) String name,
      @HiveField(2) ListType type,
      @HiveField(3) String houseId,
      @HiveField(4) String createdBy,
      @HiveField(5) DateTime createdAt,
      @HiveField(6) DateTime updatedAt,
      @HiveField(7) List<ListItem> items,
      @HiveField(8) String? assignedTo,
      @HiveField(9) String? description,
      @HiveField(10) bool? isCompleted,
      @HiveField(11) DateTime? completedAt,
      @HiveField(12) String? completedBy,
      @HiveField(13) DateTime? dueDate});
}

/// @nodoc
class _$ListModelCopyWithImpl<$Res> implements $ListModelCopyWith<$Res> {
  _$ListModelCopyWithImpl(this._self, this._then);

  final ListModel _self;
  final $Res Function(ListModel) _then;

  /// Create a copy of ListModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? type = null,
    Object? houseId = null,
    Object? createdBy = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? items = null,
    Object? assignedTo = freezed,
    Object? description = freezed,
    Object? isCompleted = freezed,
    Object? completedAt = freezed,
    Object? completedBy = freezed,
    Object? dueDate = freezed,
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
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as ListType,
      houseId: null == houseId
          ? _self.houseId
          : houseId // ignore: cast_nullable_to_non_nullable
              as String,
      createdBy: null == createdBy
          ? _self.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      items: null == items
          ? _self.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<ListItem>,
      assignedTo: freezed == assignedTo
          ? _self.assignedTo
          : assignedTo // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      isCompleted: freezed == isCompleted
          ? _self.isCompleted
          : isCompleted // ignore: cast_nullable_to_non_nullable
              as bool?,
      completedAt: freezed == completedAt
          ? _self.completedAt
          : completedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      completedBy: freezed == completedBy
          ? _self.completedBy
          : completedBy // ignore: cast_nullable_to_non_nullable
              as String?,
      dueDate: freezed == dueDate
          ? _self.dueDate
          : dueDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// Adds pattern-matching-related methods to [ListModel].
extension ListModelPatterns on ListModel {
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
    TResult Function(_ListModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ListModel() when $default != null:
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
    TResult Function(_ListModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ListModel():
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
    TResult? Function(_ListModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ListModel() when $default != null:
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
            @HiveField(2) ListType type,
            @HiveField(3) String houseId,
            @HiveField(4) String createdBy,
            @HiveField(5) DateTime createdAt,
            @HiveField(6) DateTime updatedAt,
            @HiveField(7) List<ListItem> items,
            @HiveField(8) String? assignedTo,
            @HiveField(9) String? description,
            @HiveField(10) bool? isCompleted,
            @HiveField(11) DateTime? completedAt,
            @HiveField(12) String? completedBy,
            @HiveField(13) DateTime? dueDate)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ListModel() when $default != null:
        return $default(
            _that.id,
            _that.name,
            _that.type,
            _that.houseId,
            _that.createdBy,
            _that.createdAt,
            _that.updatedAt,
            _that.items,
            _that.assignedTo,
            _that.description,
            _that.isCompleted,
            _that.completedAt,
            _that.completedBy,
            _that.dueDate);
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
            @HiveField(2) ListType type,
            @HiveField(3) String houseId,
            @HiveField(4) String createdBy,
            @HiveField(5) DateTime createdAt,
            @HiveField(6) DateTime updatedAt,
            @HiveField(7) List<ListItem> items,
            @HiveField(8) String? assignedTo,
            @HiveField(9) String? description,
            @HiveField(10) bool? isCompleted,
            @HiveField(11) DateTime? completedAt,
            @HiveField(12) String? completedBy,
            @HiveField(13) DateTime? dueDate)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ListModel():
        return $default(
            _that.id,
            _that.name,
            _that.type,
            _that.houseId,
            _that.createdBy,
            _that.createdAt,
            _that.updatedAt,
            _that.items,
            _that.assignedTo,
            _that.description,
            _that.isCompleted,
            _that.completedAt,
            _that.completedBy,
            _that.dueDate);
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
            @HiveField(2) ListType type,
            @HiveField(3) String houseId,
            @HiveField(4) String createdBy,
            @HiveField(5) DateTime createdAt,
            @HiveField(6) DateTime updatedAt,
            @HiveField(7) List<ListItem> items,
            @HiveField(8) String? assignedTo,
            @HiveField(9) String? description,
            @HiveField(10) bool? isCompleted,
            @HiveField(11) DateTime? completedAt,
            @HiveField(12) String? completedBy,
            @HiveField(13) DateTime? dueDate)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ListModel() when $default != null:
        return $default(
            _that.id,
            _that.name,
            _that.type,
            _that.houseId,
            _that.createdBy,
            _that.createdAt,
            _that.updatedAt,
            _that.items,
            _that.assignedTo,
            _that.description,
            _that.isCompleted,
            _that.completedAt,
            _that.completedBy,
            _that.dueDate);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _ListModel implements ListModel {
  const _ListModel(
      {@HiveField(0) required this.id,
      @HiveField(1) required this.name,
      @HiveField(2) required this.type,
      @HiveField(3) required this.houseId,
      @HiveField(4) required this.createdBy,
      @HiveField(5) required this.createdAt,
      @HiveField(6) required this.updatedAt,
      @HiveField(7) required final List<ListItem> items,
      @HiveField(8) this.assignedTo,
      @HiveField(9) this.description,
      @HiveField(10) this.isCompleted,
      @HiveField(11) this.completedAt,
      @HiveField(12) this.completedBy,
      @HiveField(13) this.dueDate})
      : _items = items;
  factory _ListModel.fromJson(Map<String, dynamic> json) =>
      _$ListModelFromJson(json);

  @override
  @HiveField(0)
  final String id;
  @override
  @HiveField(1)
  final String name;
  @override
  @HiveField(2)
  final ListType type;
  @override
  @HiveField(3)
  final String houseId;
  @override
  @HiveField(4)
  final String createdBy;
  @override
  @HiveField(5)
  final DateTime createdAt;
  @override
  @HiveField(6)
  final DateTime updatedAt;
  final List<ListItem> _items;
  @override
  @HiveField(7)
  List<ListItem> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  @HiveField(8)
  final String? assignedTo;
  @override
  @HiveField(9)
  final String? description;
  @override
  @HiveField(10)
  final bool? isCompleted;
  @override
  @HiveField(11)
  final DateTime? completedAt;
  @override
  @HiveField(12)
  final String? completedBy;
  @override
  @HiveField(13)
  final DateTime? dueDate;

  /// Create a copy of ListModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ListModelCopyWith<_ListModel> get copyWith =>
      __$ListModelCopyWithImpl<_ListModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ListModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ListModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.houseId, houseId) || other.houseId == houseId) &&
            (identical(other.createdBy, createdBy) ||
                other.createdBy == createdBy) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.assignedTo, assignedTo) ||
                other.assignedTo == assignedTo) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.isCompleted, isCompleted) ||
                other.isCompleted == isCompleted) &&
            (identical(other.completedAt, completedAt) ||
                other.completedAt == completedAt) &&
            (identical(other.completedBy, completedBy) ||
                other.completedBy == completedBy) &&
            (identical(other.dueDate, dueDate) || other.dueDate == dueDate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      type,
      houseId,
      createdBy,
      createdAt,
      updatedAt,
      const DeepCollectionEquality().hash(_items),
      assignedTo,
      description,
      isCompleted,
      completedAt,
      completedBy,
      dueDate);

  @override
  String toString() {
    return 'ListModel(id: $id, name: $name, type: $type, houseId: $houseId, createdBy: $createdBy, createdAt: $createdAt, updatedAt: $updatedAt, items: $items, assignedTo: $assignedTo, description: $description, isCompleted: $isCompleted, completedAt: $completedAt, completedBy: $completedBy, dueDate: $dueDate)';
  }
}

/// @nodoc
abstract mixin class _$ListModelCopyWith<$Res>
    implements $ListModelCopyWith<$Res> {
  factory _$ListModelCopyWith(
          _ListModel value, $Res Function(_ListModel) _then) =
      __$ListModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@HiveField(0) String id,
      @HiveField(1) String name,
      @HiveField(2) ListType type,
      @HiveField(3) String houseId,
      @HiveField(4) String createdBy,
      @HiveField(5) DateTime createdAt,
      @HiveField(6) DateTime updatedAt,
      @HiveField(7) List<ListItem> items,
      @HiveField(8) String? assignedTo,
      @HiveField(9) String? description,
      @HiveField(10) bool? isCompleted,
      @HiveField(11) DateTime? completedAt,
      @HiveField(12) String? completedBy,
      @HiveField(13) DateTime? dueDate});
}

/// @nodoc
class __$ListModelCopyWithImpl<$Res> implements _$ListModelCopyWith<$Res> {
  __$ListModelCopyWithImpl(this._self, this._then);

  final _ListModel _self;
  final $Res Function(_ListModel) _then;

  /// Create a copy of ListModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? type = null,
    Object? houseId = null,
    Object? createdBy = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? items = null,
    Object? assignedTo = freezed,
    Object? description = freezed,
    Object? isCompleted = freezed,
    Object? completedAt = freezed,
    Object? completedBy = freezed,
    Object? dueDate = freezed,
  }) {
    return _then(_ListModel(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as ListType,
      houseId: null == houseId
          ? _self.houseId
          : houseId // ignore: cast_nullable_to_non_nullable
              as String,
      createdBy: null == createdBy
          ? _self.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      items: null == items
          ? _self._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<ListItem>,
      assignedTo: freezed == assignedTo
          ? _self.assignedTo
          : assignedTo // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      isCompleted: freezed == isCompleted
          ? _self.isCompleted
          : isCompleted // ignore: cast_nullable_to_non_nullable
              as bool?,
      completedAt: freezed == completedAt
          ? _self.completedAt
          : completedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      completedBy: freezed == completedBy
          ? _self.completedBy
          : completedBy // ignore: cast_nullable_to_non_nullable
              as String?,
      dueDate: freezed == dueDate
          ? _self.dueDate
          : dueDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

// dart format on
