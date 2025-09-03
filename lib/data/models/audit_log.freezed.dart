// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'audit_log.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AuditLog _$AuditLogFromJson(Map<String, dynamic> json) {
  return _AuditLog.fromJson(json);
}

/// @nodoc
mixin _$AuditLog {
  @HiveField(0)
  String get id => throw _privateConstructorUsedError;
  @HiveField(1)
  String get userId => throw _privateConstructorUsedError;
  @HiveField(2)
  String get houseId => throw _privateConstructorUsedError;
  @HiveField(3)
  AuditAction get action => throw _privateConstructorUsedError;
  @HiveField(4)
  String get targetType => throw _privateConstructorUsedError;
  @HiveField(5)
  String get targetId => throw _privateConstructorUsedError;
  @HiveField(6)
  DateTime get timestamp => throw _privateConstructorUsedError;
  @HiveField(7)
  Map<String, dynamic>? get metadata => throw _privateConstructorUsedError;
  @HiveField(8)
  String? get description => throw _privateConstructorUsedError;
  @HiveField(9)
  String? get userDisplayName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AuditLogCopyWith<AuditLog> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuditLogCopyWith<$Res> {
  factory $AuditLogCopyWith(AuditLog value, $Res Function(AuditLog) then) =
      _$AuditLogCopyWithImpl<$Res, AuditLog>;
  @useResult
  $Res call(
      {@HiveField(0) String id,
      @HiveField(1) String userId,
      @HiveField(2) String houseId,
      @HiveField(3) AuditAction action,
      @HiveField(4) String targetType,
      @HiveField(5) String targetId,
      @HiveField(6) DateTime timestamp,
      @HiveField(7) Map<String, dynamic>? metadata,
      @HiveField(8) String? description,
      @HiveField(9) String? userDisplayName});
}

/// @nodoc
class _$AuditLogCopyWithImpl<$Res, $Val extends AuditLog>
    implements $AuditLogCopyWith<$Res> {
  _$AuditLogCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? houseId = null,
    Object? action = null,
    Object? targetType = null,
    Object? targetId = null,
    Object? timestamp = null,
    Object? metadata = freezed,
    Object? description = freezed,
    Object? userDisplayName = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      houseId: null == houseId
          ? _value.houseId
          : houseId // ignore: cast_nullable_to_non_nullable
              as String,
      action: null == action
          ? _value.action
          : action // ignore: cast_nullable_to_non_nullable
              as AuditAction,
      targetType: null == targetType
          ? _value.targetType
          : targetType // ignore: cast_nullable_to_non_nullable
              as String,
      targetId: null == targetId
          ? _value.targetId
          : targetId // ignore: cast_nullable_to_non_nullable
              as String,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      metadata: freezed == metadata
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      userDisplayName: freezed == userDisplayName
          ? _value.userDisplayName
          : userDisplayName // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AuditLogImplCopyWith<$Res>
    implements $AuditLogCopyWith<$Res> {
  factory _$$AuditLogImplCopyWith(
          _$AuditLogImpl value, $Res Function(_$AuditLogImpl) then) =
      __$$AuditLogImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) String id,
      @HiveField(1) String userId,
      @HiveField(2) String houseId,
      @HiveField(3) AuditAction action,
      @HiveField(4) String targetType,
      @HiveField(5) String targetId,
      @HiveField(6) DateTime timestamp,
      @HiveField(7) Map<String, dynamic>? metadata,
      @HiveField(8) String? description,
      @HiveField(9) String? userDisplayName});
}

/// @nodoc
class __$$AuditLogImplCopyWithImpl<$Res>
    extends _$AuditLogCopyWithImpl<$Res, _$AuditLogImpl>
    implements _$$AuditLogImplCopyWith<$Res> {
  __$$AuditLogImplCopyWithImpl(
      _$AuditLogImpl _value, $Res Function(_$AuditLogImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? houseId = null,
    Object? action = null,
    Object? targetType = null,
    Object? targetId = null,
    Object? timestamp = null,
    Object? metadata = freezed,
    Object? description = freezed,
    Object? userDisplayName = freezed,
  }) {
    return _then(_$AuditLogImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      houseId: null == houseId
          ? _value.houseId
          : houseId // ignore: cast_nullable_to_non_nullable
              as String,
      action: null == action
          ? _value.action
          : action // ignore: cast_nullable_to_non_nullable
              as AuditAction,
      targetType: null == targetType
          ? _value.targetType
          : targetType // ignore: cast_nullable_to_non_nullable
              as String,
      targetId: null == targetId
          ? _value.targetId
          : targetId // ignore: cast_nullable_to_non_nullable
              as String,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      metadata: freezed == metadata
          ? _value._metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      userDisplayName: freezed == userDisplayName
          ? _value.userDisplayName
          : userDisplayName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AuditLogImpl implements _AuditLog {
  const _$AuditLogImpl(
      {@HiveField(0) required this.id,
      @HiveField(1) required this.userId,
      @HiveField(2) required this.houseId,
      @HiveField(3) required this.action,
      @HiveField(4) required this.targetType,
      @HiveField(5) required this.targetId,
      @HiveField(6) required this.timestamp,
      @HiveField(7) final Map<String, dynamic>? metadata,
      @HiveField(8) this.description,
      @HiveField(9) this.userDisplayName})
      : _metadata = metadata;

  factory _$AuditLogImpl.fromJson(Map<String, dynamic> json) =>
      _$$AuditLogImplFromJson(json);

  @override
  @HiveField(0)
  final String id;
  @override
  @HiveField(1)
  final String userId;
  @override
  @HiveField(2)
  final String houseId;
  @override
  @HiveField(3)
  final AuditAction action;
  @override
  @HiveField(4)
  final String targetType;
  @override
  @HiveField(5)
  final String targetId;
  @override
  @HiveField(6)
  final DateTime timestamp;
  final Map<String, dynamic>? _metadata;
  @override
  @HiveField(7)
  Map<String, dynamic>? get metadata {
    final value = _metadata;
    if (value == null) return null;
    if (_metadata is EqualUnmodifiableMapView) return _metadata;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  @HiveField(8)
  final String? description;
  @override
  @HiveField(9)
  final String? userDisplayName;

  @override
  String toString() {
    return 'AuditLog(id: $id, userId: $userId, houseId: $houseId, action: $action, targetType: $targetType, targetId: $targetId, timestamp: $timestamp, metadata: $metadata, description: $description, userDisplayName: $userDisplayName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuditLogImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.houseId, houseId) || other.houseId == houseId) &&
            (identical(other.action, action) || other.action == action) &&
            (identical(other.targetType, targetType) ||
                other.targetType == targetType) &&
            (identical(other.targetId, targetId) ||
                other.targetId == targetId) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            const DeepCollectionEquality().equals(other._metadata, _metadata) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.userDisplayName, userDisplayName) ||
                other.userDisplayName == userDisplayName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      userId,
      houseId,
      action,
      targetType,
      targetId,
      timestamp,
      const DeepCollectionEquality().hash(_metadata),
      description,
      userDisplayName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AuditLogImplCopyWith<_$AuditLogImpl> get copyWith =>
      __$$AuditLogImplCopyWithImpl<_$AuditLogImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AuditLogImplToJson(
      this,
    );
  }
}

abstract class _AuditLog implements AuditLog {
  const factory _AuditLog(
      {@HiveField(0) required final String id,
      @HiveField(1) required final String userId,
      @HiveField(2) required final String houseId,
      @HiveField(3) required final AuditAction action,
      @HiveField(4) required final String targetType,
      @HiveField(5) required final String targetId,
      @HiveField(6) required final DateTime timestamp,
      @HiveField(7) final Map<String, dynamic>? metadata,
      @HiveField(8) final String? description,
      @HiveField(9) final String? userDisplayName}) = _$AuditLogImpl;

  factory _AuditLog.fromJson(Map<String, dynamic> json) =
      _$AuditLogImpl.fromJson;

  @override
  @HiveField(0)
  String get id;
  @override
  @HiveField(1)
  String get userId;
  @override
  @HiveField(2)
  String get houseId;
  @override
  @HiveField(3)
  AuditAction get action;
  @override
  @HiveField(4)
  String get targetType;
  @override
  @HiveField(5)
  String get targetId;
  @override
  @HiveField(6)
  DateTime get timestamp;
  @override
  @HiveField(7)
  Map<String, dynamic>? get metadata;
  @override
  @HiveField(8)
  String? get description;
  @override
  @HiveField(9)
  String? get userDisplayName;
  @override
  @JsonKey(ignore: true)
  _$$AuditLogImplCopyWith<_$AuditLogImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
