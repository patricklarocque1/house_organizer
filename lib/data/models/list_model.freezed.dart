// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'list_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ListModel _$ListModelFromJson(Map<String, dynamic> json) {
  return _ListModel.fromJson(json);
}

/// @nodoc
mixin _$ListModel {
  @HiveField(0)
  String get id => throw _privateConstructorUsedError;
  @HiveField(1)
  String get name => throw _privateConstructorUsedError;
  @HiveField(2)
  ListType get type => throw _privateConstructorUsedError;
  @HiveField(3)
  String get houseId => throw _privateConstructorUsedError;
  @HiveField(4)
  String get createdBy => throw _privateConstructorUsedError;
  @HiveField(5)
  DateTime get createdAt => throw _privateConstructorUsedError;
  @HiveField(6)
  DateTime get updatedAt => throw _privateConstructorUsedError;
  @HiveField(7)
  List<ListItem> get items => throw _privateConstructorUsedError;
  @HiveField(8)
  String? get assignedTo => throw _privateConstructorUsedError;
  @HiveField(9)
  String? get description => throw _privateConstructorUsedError;
  @HiveField(10)
  bool? get isCompleted => throw _privateConstructorUsedError;
  @HiveField(11)
  DateTime? get completedAt => throw _privateConstructorUsedError;
  @HiveField(12)
  String? get completedBy => throw _privateConstructorUsedError;
  @HiveField(13)
  DateTime? get dueDate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ListModelCopyWith<ListModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ListModelCopyWith<$Res> {
  factory $ListModelCopyWith(ListModel value, $Res Function(ListModel) then) =
      _$ListModelCopyWithImpl<$Res, ListModel>;
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
class _$ListModelCopyWithImpl<$Res, $Val extends ListModel>
    implements $ListModelCopyWith<$Res> {
  _$ListModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

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
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ListType,
      houseId: null == houseId
          ? _value.houseId
          : houseId // ignore: cast_nullable_to_non_nullable
              as String,
      createdBy: null == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<ListItem>,
      assignedTo: freezed == assignedTo
          ? _value.assignedTo
          : assignedTo // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      isCompleted: freezed == isCompleted
          ? _value.isCompleted
          : isCompleted // ignore: cast_nullable_to_non_nullable
              as bool?,
      completedAt: freezed == completedAt
          ? _value.completedAt
          : completedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      completedBy: freezed == completedBy
          ? _value.completedBy
          : completedBy // ignore: cast_nullable_to_non_nullable
              as String?,
      dueDate: freezed == dueDate
          ? _value.dueDate
          : dueDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ListModelImplCopyWith<$Res>
    implements $ListModelCopyWith<$Res> {
  factory _$$ListModelImplCopyWith(
          _$ListModelImpl value, $Res Function(_$ListModelImpl) then) =
      __$$ListModelImplCopyWithImpl<$Res>;
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
class __$$ListModelImplCopyWithImpl<$Res>
    extends _$ListModelCopyWithImpl<$Res, _$ListModelImpl>
    implements _$$ListModelImplCopyWith<$Res> {
  __$$ListModelImplCopyWithImpl(
      _$ListModelImpl _value, $Res Function(_$ListModelImpl) _then)
      : super(_value, _then);

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
    return _then(_$ListModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ListType,
      houseId: null == houseId
          ? _value.houseId
          : houseId // ignore: cast_nullable_to_non_nullable
              as String,
      createdBy: null == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<ListItem>,
      assignedTo: freezed == assignedTo
          ? _value.assignedTo
          : assignedTo // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      isCompleted: freezed == isCompleted
          ? _value.isCompleted
          : isCompleted // ignore: cast_nullable_to_non_nullable
              as bool?,
      completedAt: freezed == completedAt
          ? _value.completedAt
          : completedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      completedBy: freezed == completedBy
          ? _value.completedBy
          : completedBy // ignore: cast_nullable_to_non_nullable
              as String?,
      dueDate: freezed == dueDate
          ? _value.dueDate
          : dueDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ListModelImpl implements _ListModel {
  const _$ListModelImpl(
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

  factory _$ListModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ListModelImplFromJson(json);

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

  @override
  String toString() {
    return 'ListModel(id: $id, name: $name, type: $type, houseId: $houseId, createdBy: $createdBy, createdAt: $createdAt, updatedAt: $updatedAt, items: $items, assignedTo: $assignedTo, description: $description, isCompleted: $isCompleted, completedAt: $completedAt, completedBy: $completedBy, dueDate: $dueDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ListModelImpl &&
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

  @JsonKey(ignore: true)
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

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ListModelImplCopyWith<_$ListModelImpl> get copyWith =>
      __$$ListModelImplCopyWithImpl<_$ListModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ListModelImplToJson(
      this,
    );
  }
}

abstract class _ListModel implements ListModel {
  const factory _ListModel(
      {@HiveField(0) required final String id,
      @HiveField(1) required final String name,
      @HiveField(2) required final ListType type,
      @HiveField(3) required final String houseId,
      @HiveField(4) required final String createdBy,
      @HiveField(5) required final DateTime createdAt,
      @HiveField(6) required final DateTime updatedAt,
      @HiveField(7) required final List<ListItem> items,
      @HiveField(8) final String? assignedTo,
      @HiveField(9) final String? description,
      @HiveField(10) final bool? isCompleted,
      @HiveField(11) final DateTime? completedAt,
      @HiveField(12) final String? completedBy,
      @HiveField(13) final DateTime? dueDate}) = _$ListModelImpl;

  factory _ListModel.fromJson(Map<String, dynamic> json) =
      _$ListModelImpl.fromJson;

  @override
  @HiveField(0)
  String get id;
  @override
  @HiveField(1)
  String get name;
  @override
  @HiveField(2)
  ListType get type;
  @override
  @HiveField(3)
  String get houseId;
  @override
  @HiveField(4)
  String get createdBy;
  @override
  @HiveField(5)
  DateTime get createdAt;
  @override
  @HiveField(6)
  DateTime get updatedAt;
  @override
  @HiveField(7)
  List<ListItem> get items;
  @override
  @HiveField(8)
  String? get assignedTo;
  @override
  @HiveField(9)
  String? get description;
  @override
  @HiveField(10)
  bool? get isCompleted;
  @override
  @HiveField(11)
  DateTime? get completedAt;
  @override
  @HiveField(12)
  String? get completedBy;
  @override
  @HiveField(13)
  DateTime? get dueDate;
  @override
  @JsonKey(ignore: true)
  _$$ListModelImplCopyWith<_$ListModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

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
