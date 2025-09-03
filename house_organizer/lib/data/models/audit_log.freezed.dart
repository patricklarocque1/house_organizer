// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'audit_log.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AuditLog {
  @HiveField(0)
  String get id;
  @HiveField(1)
  String get userId;
  @HiveField(2)
  String get houseId;
  @HiveField(3)
  AuditAction get action;
  @HiveField(4)
  String get targetType;
  @HiveField(5)
  String get targetId;
  @HiveField(6)
  DateTime get timestamp;
  @HiveField(7)
  Map<String, dynamic>? get metadata;
  @HiveField(8)
  String? get description;
  @HiveField(9)
  String? get userDisplayName;

  /// Create a copy of AuditLog
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AuditLogCopyWith<AuditLog> get copyWith =>
      _$AuditLogCopyWithImpl<AuditLog>(this as AuditLog, _$identity);

  /// Serializes this AuditLog to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AuditLog &&
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
            const DeepCollectionEquality().equals(other.metadata, metadata) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.userDisplayName, userDisplayName) ||
                other.userDisplayName == userDisplayName));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
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
      const DeepCollectionEquality().hash(metadata),
      description,
      userDisplayName);

  @override
  String toString() {
    return 'AuditLog(id: $id, userId: $userId, houseId: $houseId, action: $action, targetType: $targetType, targetId: $targetId, timestamp: $timestamp, metadata: $metadata, description: $description, userDisplayName: $userDisplayName)';
  }
}

/// @nodoc
abstract mixin class $AuditLogCopyWith<$Res> {
  factory $AuditLogCopyWith(AuditLog value, $Res Function(AuditLog) _then) =
      _$AuditLogCopyWithImpl;
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
class _$AuditLogCopyWithImpl<$Res> implements $AuditLogCopyWith<$Res> {
  _$AuditLogCopyWithImpl(this._self, this._then);

  final AuditLog _self;
  final $Res Function(AuditLog) _then;

  /// Create a copy of AuditLog
  /// with the given fields replaced by the non-null parameter values.
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
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      houseId: null == houseId
          ? _self.houseId
          : houseId // ignore: cast_nullable_to_non_nullable
              as String,
      action: null == action
          ? _self.action
          : action // ignore: cast_nullable_to_non_nullable
              as AuditAction,
      targetType: null == targetType
          ? _self.targetType
          : targetType // ignore: cast_nullable_to_non_nullable
              as String,
      targetId: null == targetId
          ? _self.targetId
          : targetId // ignore: cast_nullable_to_non_nullable
              as String,
      timestamp: null == timestamp
          ? _self.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      metadata: freezed == metadata
          ? _self.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      description: freezed == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      userDisplayName: freezed == userDisplayName
          ? _self.userDisplayName
          : userDisplayName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [AuditLog].
extension AuditLogPatterns on AuditLog {
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
    TResult Function(_AuditLog value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AuditLog() when $default != null:
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
    TResult Function(_AuditLog value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AuditLog():
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
    TResult? Function(_AuditLog value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AuditLog() when $default != null:
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
            @HiveField(1) String userId,
            @HiveField(2) String houseId,
            @HiveField(3) AuditAction action,
            @HiveField(4) String targetType,
            @HiveField(5) String targetId,
            @HiveField(6) DateTime timestamp,
            @HiveField(7) Map<String, dynamic>? metadata,
            @HiveField(8) String? description,
            @HiveField(9) String? userDisplayName)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AuditLog() when $default != null:
        return $default(
            _that.id,
            _that.userId,
            _that.houseId,
            _that.action,
            _that.targetType,
            _that.targetId,
            _that.timestamp,
            _that.metadata,
            _that.description,
            _that.userDisplayName);
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
            @HiveField(1) String userId,
            @HiveField(2) String houseId,
            @HiveField(3) AuditAction action,
            @HiveField(4) String targetType,
            @HiveField(5) String targetId,
            @HiveField(6) DateTime timestamp,
            @HiveField(7) Map<String, dynamic>? metadata,
            @HiveField(8) String? description,
            @HiveField(9) String? userDisplayName)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AuditLog():
        return $default(
            _that.id,
            _that.userId,
            _that.houseId,
            _that.action,
            _that.targetType,
            _that.targetId,
            _that.timestamp,
            _that.metadata,
            _that.description,
            _that.userDisplayName);
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
            @HiveField(1) String userId,
            @HiveField(2) String houseId,
            @HiveField(3) AuditAction action,
            @HiveField(4) String targetType,
            @HiveField(5) String targetId,
            @HiveField(6) DateTime timestamp,
            @HiveField(7) Map<String, dynamic>? metadata,
            @HiveField(8) String? description,
            @HiveField(9) String? userDisplayName)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AuditLog() when $default != null:
        return $default(
            _that.id,
            _that.userId,
            _that.houseId,
            _that.action,
            _that.targetType,
            _that.targetId,
            _that.timestamp,
            _that.metadata,
            _that.description,
            _that.userDisplayName);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _AuditLog implements AuditLog {
  const _AuditLog(
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
  factory _AuditLog.fromJson(Map<String, dynamic> json) =>
      _$AuditLogFromJson(json);

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

  /// Create a copy of AuditLog
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AuditLogCopyWith<_AuditLog> get copyWith =>
      __$AuditLogCopyWithImpl<_AuditLog>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$AuditLogToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AuditLog &&
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

  @JsonKey(includeFromJson: false, includeToJson: false)
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

  @override
  String toString() {
    return 'AuditLog(id: $id, userId: $userId, houseId: $houseId, action: $action, targetType: $targetType, targetId: $targetId, timestamp: $timestamp, metadata: $metadata, description: $description, userDisplayName: $userDisplayName)';
  }
}

/// @nodoc
abstract mixin class _$AuditLogCopyWith<$Res>
    implements $AuditLogCopyWith<$Res> {
  factory _$AuditLogCopyWith(_AuditLog value, $Res Function(_AuditLog) _then) =
      __$AuditLogCopyWithImpl;
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
class __$AuditLogCopyWithImpl<$Res> implements _$AuditLogCopyWith<$Res> {
  __$AuditLogCopyWithImpl(this._self, this._then);

  final _AuditLog _self;
  final $Res Function(_AuditLog) _then;

  /// Create a copy of AuditLog
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
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
    return _then(_AuditLog(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      houseId: null == houseId
          ? _self.houseId
          : houseId // ignore: cast_nullable_to_non_nullable
              as String,
      action: null == action
          ? _self.action
          : action // ignore: cast_nullable_to_non_nullable
              as AuditAction,
      targetType: null == targetType
          ? _self.targetType
          : targetType // ignore: cast_nullable_to_non_nullable
              as String,
      targetId: null == targetId
          ? _self.targetId
          : targetId // ignore: cast_nullable_to_non_nullable
              as String,
      timestamp: null == timestamp
          ? _self.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      metadata: freezed == metadata
          ? _self._metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      description: freezed == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      userDisplayName: freezed == userDisplayName
          ? _self.userDisplayName
          : userDisplayName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
