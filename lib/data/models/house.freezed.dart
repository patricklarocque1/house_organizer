// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'house.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

House _$HouseFromJson(Map<String, dynamic> json) {
  return _House.fromJson(json);
}

/// @nodoc
mixin _$House {
  @HiveField(0)
  String get id => throw _privateConstructorUsedError;
  @HiveField(1)
  String get name => throw _privateConstructorUsedError;
  @HiveField(2)
  String get address => throw _privateConstructorUsedError;
  @HiveField(3)
  String get joinCode => throw _privateConstructorUsedError;
  @HiveField(4)
  String get createdBy => throw _privateConstructorUsedError;
  @HiveField(5)
  DateTime get createdAt => throw _privateConstructorUsedError;
  @HiveField(6)
  DateTime get updatedAt => throw _privateConstructorUsedError;
  @HiveField(7)
  List<String>? get residentIds => throw _privateConstructorUsedError;
  @HiveField(8)
  List<String>? get supervisorIds => throw _privateConstructorUsedError;
  @HiveField(9)
  bool? get isActive => throw _privateConstructorUsedError;
  @HiveField(10)
  String? get description => throw _privateConstructorUsedError;
  @HiveField(11)
  String? get phoneNumber => throw _privateConstructorUsedError;
  @HiveField(12)
  String? get email => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HouseCopyWith<House> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HouseCopyWith<$Res> {
  factory $HouseCopyWith(House value, $Res Function(House) then) =
      _$HouseCopyWithImpl<$Res, House>;
  @useResult
  $Res call(
      {@HiveField(0) String id,
      @HiveField(1) String name,
      @HiveField(2) String address,
      @HiveField(3) String joinCode,
      @HiveField(4) String createdBy,
      @HiveField(5) DateTime createdAt,
      @HiveField(6) DateTime updatedAt,
      @HiveField(7) List<String>? residentIds,
      @HiveField(8) List<String>? supervisorIds,
      @HiveField(9) bool? isActive,
      @HiveField(10) String? description,
      @HiveField(11) String? phoneNumber,
      @HiveField(12) String? email});
}

/// @nodoc
class _$HouseCopyWithImpl<$Res, $Val extends House>
    implements $HouseCopyWith<$Res> {
  _$HouseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? address = null,
    Object? joinCode = null,
    Object? createdBy = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? residentIds = freezed,
    Object? supervisorIds = freezed,
    Object? isActive = freezed,
    Object? description = freezed,
    Object? phoneNumber = freezed,
    Object? email = freezed,
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
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      joinCode: null == joinCode
          ? _value.joinCode
          : joinCode // ignore: cast_nullable_to_non_nullable
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
      residentIds: freezed == residentIds
          ? _value.residentIds
          : residentIds // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      supervisorIds: freezed == supervisorIds
          ? _value.supervisorIds
          : supervisorIds // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HouseImplCopyWith<$Res> implements $HouseCopyWith<$Res> {
  factory _$$HouseImplCopyWith(
          _$HouseImpl value, $Res Function(_$HouseImpl) then) =
      __$$HouseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) String id,
      @HiveField(1) String name,
      @HiveField(2) String address,
      @HiveField(3) String joinCode,
      @HiveField(4) String createdBy,
      @HiveField(5) DateTime createdAt,
      @HiveField(6) DateTime updatedAt,
      @HiveField(7) List<String>? residentIds,
      @HiveField(8) List<String>? supervisorIds,
      @HiveField(9) bool? isActive,
      @HiveField(10) String? description,
      @HiveField(11) String? phoneNumber,
      @HiveField(12) String? email});
}

/// @nodoc
class __$$HouseImplCopyWithImpl<$Res>
    extends _$HouseCopyWithImpl<$Res, _$HouseImpl>
    implements _$$HouseImplCopyWith<$Res> {
  __$$HouseImplCopyWithImpl(
      _$HouseImpl _value, $Res Function(_$HouseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? address = null,
    Object? joinCode = null,
    Object? createdBy = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? residentIds = freezed,
    Object? supervisorIds = freezed,
    Object? isActive = freezed,
    Object? description = freezed,
    Object? phoneNumber = freezed,
    Object? email = freezed,
  }) {
    return _then(_$HouseImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      joinCode: null == joinCode
          ? _value.joinCode
          : joinCode // ignore: cast_nullable_to_non_nullable
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
      residentIds: freezed == residentIds
          ? _value._residentIds
          : residentIds // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      supervisorIds: freezed == supervisorIds
          ? _value._supervisorIds
          : supervisorIds // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$HouseImpl implements _House {
  const _$HouseImpl(
      {@HiveField(0) required this.id,
      @HiveField(1) required this.name,
      @HiveField(2) required this.address,
      @HiveField(3) required this.joinCode,
      @HiveField(4) required this.createdBy,
      @HiveField(5) required this.createdAt,
      @HiveField(6) required this.updatedAt,
      @HiveField(7) final List<String>? residentIds,
      @HiveField(8) final List<String>? supervisorIds,
      @HiveField(9) this.isActive,
      @HiveField(10) this.description,
      @HiveField(11) this.phoneNumber,
      @HiveField(12) this.email})
      : _residentIds = residentIds,
        _supervisorIds = supervisorIds;

  factory _$HouseImpl.fromJson(Map<String, dynamic> json) =>
      _$$HouseImplFromJson(json);

  @override
  @HiveField(0)
  final String id;
  @override
  @HiveField(1)
  final String name;
  @override
  @HiveField(2)
  final String address;
  @override
  @HiveField(3)
  final String joinCode;
  @override
  @HiveField(4)
  final String createdBy;
  @override
  @HiveField(5)
  final DateTime createdAt;
  @override
  @HiveField(6)
  final DateTime updatedAt;
  final List<String>? _residentIds;
  @override
  @HiveField(7)
  List<String>? get residentIds {
    final value = _residentIds;
    if (value == null) return null;
    if (_residentIds is EqualUnmodifiableListView) return _residentIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String>? _supervisorIds;
  @override
  @HiveField(8)
  List<String>? get supervisorIds {
    final value = _supervisorIds;
    if (value == null) return null;
    if (_supervisorIds is EqualUnmodifiableListView) return _supervisorIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @HiveField(9)
  final bool? isActive;
  @override
  @HiveField(10)
  final String? description;
  @override
  @HiveField(11)
  final String? phoneNumber;
  @override
  @HiveField(12)
  final String? email;

  @override
  String toString() {
    return 'House(id: $id, name: $name, address: $address, joinCode: $joinCode, createdBy: $createdBy, createdAt: $createdAt, updatedAt: $updatedAt, residentIds: $residentIds, supervisorIds: $supervisorIds, isActive: $isActive, description: $description, phoneNumber: $phoneNumber, email: $email)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HouseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.joinCode, joinCode) ||
                other.joinCode == joinCode) &&
            (identical(other.createdBy, createdBy) ||
                other.createdBy == createdBy) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            const DeepCollectionEquality()
                .equals(other._residentIds, _residentIds) &&
            const DeepCollectionEquality()
                .equals(other._supervisorIds, _supervisorIds) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.email, email) || other.email == email));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      address,
      joinCode,
      createdBy,
      createdAt,
      updatedAt,
      const DeepCollectionEquality().hash(_residentIds),
      const DeepCollectionEquality().hash(_supervisorIds),
      isActive,
      description,
      phoneNumber,
      email);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HouseImplCopyWith<_$HouseImpl> get copyWith =>
      __$$HouseImplCopyWithImpl<_$HouseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HouseImplToJson(
      this,
    );
  }
}

abstract class _House implements House {
  const factory _House(
      {@HiveField(0) required final String id,
      @HiveField(1) required final String name,
      @HiveField(2) required final String address,
      @HiveField(3) required final String joinCode,
      @HiveField(4) required final String createdBy,
      @HiveField(5) required final DateTime createdAt,
      @HiveField(6) required final DateTime updatedAt,
      @HiveField(7) final List<String>? residentIds,
      @HiveField(8) final List<String>? supervisorIds,
      @HiveField(9) final bool? isActive,
      @HiveField(10) final String? description,
      @HiveField(11) final String? phoneNumber,
      @HiveField(12) final String? email}) = _$HouseImpl;

  factory _House.fromJson(Map<String, dynamic> json) = _$HouseImpl.fromJson;

  @override
  @HiveField(0)
  String get id;
  @override
  @HiveField(1)
  String get name;
  @override
  @HiveField(2)
  String get address;
  @override
  @HiveField(3)
  String get joinCode;
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
  List<String>? get residentIds;
  @override
  @HiveField(8)
  List<String>? get supervisorIds;
  @override
  @HiveField(9)
  bool? get isActive;
  @override
  @HiveField(10)
  String? get description;
  @override
  @HiveField(11)
  String? get phoneNumber;
  @override
  @HiveField(12)
  String? get email;
  @override
  @JsonKey(ignore: true)
  _$$HouseImplCopyWith<_$HouseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
