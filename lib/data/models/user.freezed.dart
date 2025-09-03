// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$User {
  @HiveField(0)
  String get id;
  @HiveField(1)
  String get email;
  @HiveField(2)
  String get displayName;
  @HiveField(3)
  String get houseId;
  @HiveField(4)
  UserRole get role;
  @HiveField(5)
  DateTime get createdAt;
  @HiveField(6)
  DateTime get updatedAt;
  @HiveField(7)
  String? get profileImageUrl;
  @HiveField(8)
  bool? get isActive;
  @HiveField(9)
  DateTime? get lastLoginAt;

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UserCopyWith<User> get copyWith =>
      _$UserCopyWithImpl<User>(this as User, _$identity);

  /// Serializes this User to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is User &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.displayName, displayName) ||
                other.displayName == displayName) &&
            (identical(other.houseId, houseId) || other.houseId == houseId) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.profileImageUrl, profileImageUrl) ||
                other.profileImageUrl == profileImageUrl) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.lastLoginAt, lastLoginAt) ||
                other.lastLoginAt == lastLoginAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, email, displayName, houseId,
      role, createdAt, updatedAt, profileImageUrl, isActive, lastLoginAt);

  @override
  String toString() {
    return 'User(id: $id, email: $email, displayName: $displayName, houseId: $houseId, role: $role, createdAt: $createdAt, updatedAt: $updatedAt, profileImageUrl: $profileImageUrl, isActive: $isActive, lastLoginAt: $lastLoginAt)';
  }
}

/// @nodoc
abstract mixin class $UserCopyWith<$Res> {
  factory $UserCopyWith(User value, $Res Function(User) _then) =
      _$UserCopyWithImpl;
  @useResult
  $Res call(
      {@HiveField(0) String id,
      @HiveField(1) String email,
      @HiveField(2) String displayName,
      @HiveField(3) String houseId,
      @HiveField(4) UserRole role,
      @HiveField(5) DateTime createdAt,
      @HiveField(6) DateTime updatedAt,
      @HiveField(7) String? profileImageUrl,
      @HiveField(8) bool? isActive,
      @HiveField(9) DateTime? lastLoginAt});
}

/// @nodoc
class _$UserCopyWithImpl<$Res> implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._self, this._then);

  final User _self;
  final $Res Function(User) _then;

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? email = null,
    Object? displayName = null,
    Object? houseId = null,
    Object? role = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? profileImageUrl = freezed,
    Object? isActive = freezed,
    Object? lastLoginAt = freezed,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      displayName: null == displayName
          ? _self.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String,
      houseId: null == houseId
          ? _self.houseId
          : houseId // ignore: cast_nullable_to_non_nullable
              as String,
      role: null == role
          ? _self.role
          : role // ignore: cast_nullable_to_non_nullable
              as UserRole,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      profileImageUrl: freezed == profileImageUrl
          ? _self.profileImageUrl
          : profileImageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      isActive: freezed == isActive
          ? _self.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
      lastLoginAt: freezed == lastLoginAt
          ? _self.lastLoginAt
          : lastLoginAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// Adds pattern-matching-related methods to [User].
extension UserPatterns on User {
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
    TResult Function(_User value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _User() when $default != null:
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
    TResult Function(_User value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _User():
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
    TResult? Function(_User value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _User() when $default != null:
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
            @HiveField(1) String email,
            @HiveField(2) String displayName,
            @HiveField(3) String houseId,
            @HiveField(4) UserRole role,
            @HiveField(5) DateTime createdAt,
            @HiveField(6) DateTime updatedAt,
            @HiveField(7) String? profileImageUrl,
            @HiveField(8) bool? isActive,
            @HiveField(9) DateTime? lastLoginAt)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _User() when $default != null:
        return $default(
            _that.id,
            _that.email,
            _that.displayName,
            _that.houseId,
            _that.role,
            _that.createdAt,
            _that.updatedAt,
            _that.profileImageUrl,
            _that.isActive,
            _that.lastLoginAt);
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
            @HiveField(1) String email,
            @HiveField(2) String displayName,
            @HiveField(3) String houseId,
            @HiveField(4) UserRole role,
            @HiveField(5) DateTime createdAt,
            @HiveField(6) DateTime updatedAt,
            @HiveField(7) String? profileImageUrl,
            @HiveField(8) bool? isActive,
            @HiveField(9) DateTime? lastLoginAt)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _User():
        return $default(
            _that.id,
            _that.email,
            _that.displayName,
            _that.houseId,
            _that.role,
            _that.createdAt,
            _that.updatedAt,
            _that.profileImageUrl,
            _that.isActive,
            _that.lastLoginAt);
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
            @HiveField(1) String email,
            @HiveField(2) String displayName,
            @HiveField(3) String houseId,
            @HiveField(4) UserRole role,
            @HiveField(5) DateTime createdAt,
            @HiveField(6) DateTime updatedAt,
            @HiveField(7) String? profileImageUrl,
            @HiveField(8) bool? isActive,
            @HiveField(9) DateTime? lastLoginAt)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _User() when $default != null:
        return $default(
            _that.id,
            _that.email,
            _that.displayName,
            _that.houseId,
            _that.role,
            _that.createdAt,
            _that.updatedAt,
            _that.profileImageUrl,
            _that.isActive,
            _that.lastLoginAt);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _User implements User {
  const _User(
      {@HiveField(0) required this.id,
      @HiveField(1) required this.email,
      @HiveField(2) required this.displayName,
      @HiveField(3) required this.houseId,
      @HiveField(4) required this.role,
      @HiveField(5) required this.createdAt,
      @HiveField(6) required this.updatedAt,
      @HiveField(7) this.profileImageUrl,
      @HiveField(8) this.isActive,
      @HiveField(9) this.lastLoginAt});
  factory _User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  @override
  @HiveField(0)
  final String id;
  @override
  @HiveField(1)
  final String email;
  @override
  @HiveField(2)
  final String displayName;
  @override
  @HiveField(3)
  final String houseId;
  @override
  @HiveField(4)
  final UserRole role;
  @override
  @HiveField(5)
  final DateTime createdAt;
  @override
  @HiveField(6)
  final DateTime updatedAt;
  @override
  @HiveField(7)
  final String? profileImageUrl;
  @override
  @HiveField(8)
  final bool? isActive;
  @override
  @HiveField(9)
  final DateTime? lastLoginAt;

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$UserCopyWith<_User> get copyWith =>
      __$UserCopyWithImpl<_User>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$UserToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _User &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.displayName, displayName) ||
                other.displayName == displayName) &&
            (identical(other.houseId, houseId) || other.houseId == houseId) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.profileImageUrl, profileImageUrl) ||
                other.profileImageUrl == profileImageUrl) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.lastLoginAt, lastLoginAt) ||
                other.lastLoginAt == lastLoginAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, email, displayName, houseId,
      role, createdAt, updatedAt, profileImageUrl, isActive, lastLoginAt);

  @override
  String toString() {
    return 'User(id: $id, email: $email, displayName: $displayName, houseId: $houseId, role: $role, createdAt: $createdAt, updatedAt: $updatedAt, profileImageUrl: $profileImageUrl, isActive: $isActive, lastLoginAt: $lastLoginAt)';
  }
}

/// @nodoc
abstract mixin class _$UserCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$UserCopyWith(_User value, $Res Function(_User) _then) =
      __$UserCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@HiveField(0) String id,
      @HiveField(1) String email,
      @HiveField(2) String displayName,
      @HiveField(3) String houseId,
      @HiveField(4) UserRole role,
      @HiveField(5) DateTime createdAt,
      @HiveField(6) DateTime updatedAt,
      @HiveField(7) String? profileImageUrl,
      @HiveField(8) bool? isActive,
      @HiveField(9) DateTime? lastLoginAt});
}

/// @nodoc
class __$UserCopyWithImpl<$Res> implements _$UserCopyWith<$Res> {
  __$UserCopyWithImpl(this._self, this._then);

  final _User _self;
  final $Res Function(_User) _then;

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? email = null,
    Object? displayName = null,
    Object? houseId = null,
    Object? role = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? profileImageUrl = freezed,
    Object? isActive = freezed,
    Object? lastLoginAt = freezed,
  }) {
    return _then(_User(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      displayName: null == displayName
          ? _self.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String,
      houseId: null == houseId
          ? _self.houseId
          : houseId // ignore: cast_nullable_to_non_nullable
              as String,
      role: null == role
          ? _self.role
          : role // ignore: cast_nullable_to_non_nullable
              as UserRole,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      profileImageUrl: freezed == profileImageUrl
          ? _self.profileImageUrl
          : profileImageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      isActive: freezed == isActive
          ? _self.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
      lastLoginAt: freezed == lastLoginAt
          ? _self.lastLoginAt
          : lastLoginAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

// dart format on
