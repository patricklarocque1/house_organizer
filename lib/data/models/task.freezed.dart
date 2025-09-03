// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'task.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Task {
  @HiveField(0)
  String get id;
  @HiveField(1)
  String get title;
  @HiveField(2)
  String get description;
  @HiveField(3)
  TaskStatus get status;
  @HiveField(4)
  TaskCategory get category;
  @HiveField(5)
  String get houseId;
  @HiveField(6)
  String get createdBy;
  @HiveField(7)
  DateTime get createdAt;
  @HiveField(8)
  DateTime get updatedAt;
  @HiveField(9)
  String? get assignedTo;
  @HiveField(10)
  DateTime? get dueDate;
  @HiveField(11)
  RepeatInterval? get repeatInterval;
  @HiveField(12)
  DateTime? get completedAt;
  @HiveField(13)
  String? get completedBy;
  @HiveField(14)
  int? get priority;
  @HiveField(15)
  List<String>? get tags;
  @HiveField(16)
  String? get notes;

  /// Create a copy of Task
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $TaskCopyWith<Task> get copyWith =>
      _$TaskCopyWithImpl<Task>(this as Task, _$identity);

  /// Serializes this Task to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Task &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.houseId, houseId) || other.houseId == houseId) &&
            (identical(other.createdBy, createdBy) ||
                other.createdBy == createdBy) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.assignedTo, assignedTo) ||
                other.assignedTo == assignedTo) &&
            (identical(other.dueDate, dueDate) || other.dueDate == dueDate) &&
            (identical(other.repeatInterval, repeatInterval) ||
                other.repeatInterval == repeatInterval) &&
            (identical(other.completedAt, completedAt) ||
                other.completedAt == completedAt) &&
            (identical(other.completedBy, completedBy) ||
                other.completedBy == completedBy) &&
            (identical(other.priority, priority) ||
                other.priority == priority) &&
            const DeepCollectionEquality().equals(other.tags, tags) &&
            (identical(other.notes, notes) || other.notes == notes));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      title,
      description,
      status,
      category,
      houseId,
      createdBy,
      createdAt,
      updatedAt,
      assignedTo,
      dueDate,
      repeatInterval,
      completedAt,
      completedBy,
      priority,
      const DeepCollectionEquality().hash(tags),
      notes);

  @override
  String toString() {
    return 'Task(id: $id, title: $title, description: $description, status: $status, category: $category, houseId: $houseId, createdBy: $createdBy, createdAt: $createdAt, updatedAt: $updatedAt, assignedTo: $assignedTo, dueDate: $dueDate, repeatInterval: $repeatInterval, completedAt: $completedAt, completedBy: $completedBy, priority: $priority, tags: $tags, notes: $notes)';
  }
}

/// @nodoc
abstract mixin class $TaskCopyWith<$Res> {
  factory $TaskCopyWith(Task value, $Res Function(Task) _then) =
      _$TaskCopyWithImpl;
  @useResult
  $Res call(
      {@HiveField(0) String id,
      @HiveField(1) String title,
      @HiveField(2) String description,
      @HiveField(3) TaskStatus status,
      @HiveField(4) TaskCategory category,
      @HiveField(5) String houseId,
      @HiveField(6) String createdBy,
      @HiveField(7) DateTime createdAt,
      @HiveField(8) DateTime updatedAt,
      @HiveField(9) String? assignedTo,
      @HiveField(10) DateTime? dueDate,
      @HiveField(11) RepeatInterval? repeatInterval,
      @HiveField(12) DateTime? completedAt,
      @HiveField(13) String? completedBy,
      @HiveField(14) int? priority,
      @HiveField(15) List<String>? tags,
      @HiveField(16) String? notes});
}

/// @nodoc
class _$TaskCopyWithImpl<$Res> implements $TaskCopyWith<$Res> {
  _$TaskCopyWithImpl(this._self, this._then);

  final Task _self;
  final $Res Function(Task) _then;

  /// Create a copy of Task
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = null,
    Object? status = null,
    Object? category = null,
    Object? houseId = null,
    Object? createdBy = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? assignedTo = freezed,
    Object? dueDate = freezed,
    Object? repeatInterval = freezed,
    Object? completedAt = freezed,
    Object? completedBy = freezed,
    Object? priority = freezed,
    Object? tags = freezed,
    Object? notes = freezed,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as TaskStatus,
      category: null == category
          ? _self.category
          : category // ignore: cast_nullable_to_non_nullable
              as TaskCategory,
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
      assignedTo: freezed == assignedTo
          ? _self.assignedTo
          : assignedTo // ignore: cast_nullable_to_non_nullable
              as String?,
      dueDate: freezed == dueDate
          ? _self.dueDate
          : dueDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      repeatInterval: freezed == repeatInterval
          ? _self.repeatInterval
          : repeatInterval // ignore: cast_nullable_to_non_nullable
              as RepeatInterval?,
      completedAt: freezed == completedAt
          ? _self.completedAt
          : completedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      completedBy: freezed == completedBy
          ? _self.completedBy
          : completedBy // ignore: cast_nullable_to_non_nullable
              as String?,
      priority: freezed == priority
          ? _self.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as int?,
      tags: freezed == tags
          ? _self.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      notes: freezed == notes
          ? _self.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [Task].
extension TaskPatterns on Task {
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
    TResult Function(_Task value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Task() when $default != null:
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
    TResult Function(_Task value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Task():
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
    TResult? Function(_Task value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Task() when $default != null:
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
            @HiveField(1) String title,
            @HiveField(2) String description,
            @HiveField(3) TaskStatus status,
            @HiveField(4) TaskCategory category,
            @HiveField(5) String houseId,
            @HiveField(6) String createdBy,
            @HiveField(7) DateTime createdAt,
            @HiveField(8) DateTime updatedAt,
            @HiveField(9) String? assignedTo,
            @HiveField(10) DateTime? dueDate,
            @HiveField(11) RepeatInterval? repeatInterval,
            @HiveField(12) DateTime? completedAt,
            @HiveField(13) String? completedBy,
            @HiveField(14) int? priority,
            @HiveField(15) List<String>? tags,
            @HiveField(16) String? notes)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Task() when $default != null:
        return $default(
            _that.id,
            _that.title,
            _that.description,
            _that.status,
            _that.category,
            _that.houseId,
            _that.createdBy,
            _that.createdAt,
            _that.updatedAt,
            _that.assignedTo,
            _that.dueDate,
            _that.repeatInterval,
            _that.completedAt,
            _that.completedBy,
            _that.priority,
            _that.tags,
            _that.notes);
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
            @HiveField(1) String title,
            @HiveField(2) String description,
            @HiveField(3) TaskStatus status,
            @HiveField(4) TaskCategory category,
            @HiveField(5) String houseId,
            @HiveField(6) String createdBy,
            @HiveField(7) DateTime createdAt,
            @HiveField(8) DateTime updatedAt,
            @HiveField(9) String? assignedTo,
            @HiveField(10) DateTime? dueDate,
            @HiveField(11) RepeatInterval? repeatInterval,
            @HiveField(12) DateTime? completedAt,
            @HiveField(13) String? completedBy,
            @HiveField(14) int? priority,
            @HiveField(15) List<String>? tags,
            @HiveField(16) String? notes)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Task():
        return $default(
            _that.id,
            _that.title,
            _that.description,
            _that.status,
            _that.category,
            _that.houseId,
            _that.createdBy,
            _that.createdAt,
            _that.updatedAt,
            _that.assignedTo,
            _that.dueDate,
            _that.repeatInterval,
            _that.completedAt,
            _that.completedBy,
            _that.priority,
            _that.tags,
            _that.notes);
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
            @HiveField(1) String title,
            @HiveField(2) String description,
            @HiveField(3) TaskStatus status,
            @HiveField(4) TaskCategory category,
            @HiveField(5) String houseId,
            @HiveField(6) String createdBy,
            @HiveField(7) DateTime createdAt,
            @HiveField(8) DateTime updatedAt,
            @HiveField(9) String? assignedTo,
            @HiveField(10) DateTime? dueDate,
            @HiveField(11) RepeatInterval? repeatInterval,
            @HiveField(12) DateTime? completedAt,
            @HiveField(13) String? completedBy,
            @HiveField(14) int? priority,
            @HiveField(15) List<String>? tags,
            @HiveField(16) String? notes)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Task() when $default != null:
        return $default(
            _that.id,
            _that.title,
            _that.description,
            _that.status,
            _that.category,
            _that.houseId,
            _that.createdBy,
            _that.createdAt,
            _that.updatedAt,
            _that.assignedTo,
            _that.dueDate,
            _that.repeatInterval,
            _that.completedAt,
            _that.completedBy,
            _that.priority,
            _that.tags,
            _that.notes);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _Task implements Task {
  const _Task(
      {@HiveField(0) required this.id,
      @HiveField(1) required this.title,
      @HiveField(2) required this.description,
      @HiveField(3) required this.status,
      @HiveField(4) required this.category,
      @HiveField(5) required this.houseId,
      @HiveField(6) required this.createdBy,
      @HiveField(7) required this.createdAt,
      @HiveField(8) required this.updatedAt,
      @HiveField(9) this.assignedTo,
      @HiveField(10) this.dueDate,
      @HiveField(11) this.repeatInterval,
      @HiveField(12) this.completedAt,
      @HiveField(13) this.completedBy,
      @HiveField(14) this.priority,
      @HiveField(15) final List<String>? tags,
      @HiveField(16) this.notes})
      : _tags = tags;
  factory _Task.fromJson(Map<String, dynamic> json) => _$TaskFromJson(json);

  @override
  @HiveField(0)
  final String id;
  @override
  @HiveField(1)
  final String title;
  @override
  @HiveField(2)
  final String description;
  @override
  @HiveField(3)
  final TaskStatus status;
  @override
  @HiveField(4)
  final TaskCategory category;
  @override
  @HiveField(5)
  final String houseId;
  @override
  @HiveField(6)
  final String createdBy;
  @override
  @HiveField(7)
  final DateTime createdAt;
  @override
  @HiveField(8)
  final DateTime updatedAt;
  @override
  @HiveField(9)
  final String? assignedTo;
  @override
  @HiveField(10)
  final DateTime? dueDate;
  @override
  @HiveField(11)
  final RepeatInterval? repeatInterval;
  @override
  @HiveField(12)
  final DateTime? completedAt;
  @override
  @HiveField(13)
  final String? completedBy;
  @override
  @HiveField(14)
  final int? priority;
  final List<String>? _tags;
  @override
  @HiveField(15)
  List<String>? get tags {
    final value = _tags;
    if (value == null) return null;
    if (_tags is EqualUnmodifiableListView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @HiveField(16)
  final String? notes;

  /// Create a copy of Task
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$TaskCopyWith<_Task> get copyWith =>
      __$TaskCopyWithImpl<_Task>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$TaskToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Task &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.houseId, houseId) || other.houseId == houseId) &&
            (identical(other.createdBy, createdBy) ||
                other.createdBy == createdBy) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.assignedTo, assignedTo) ||
                other.assignedTo == assignedTo) &&
            (identical(other.dueDate, dueDate) || other.dueDate == dueDate) &&
            (identical(other.repeatInterval, repeatInterval) ||
                other.repeatInterval == repeatInterval) &&
            (identical(other.completedAt, completedAt) ||
                other.completedAt == completedAt) &&
            (identical(other.completedBy, completedBy) ||
                other.completedBy == completedBy) &&
            (identical(other.priority, priority) ||
                other.priority == priority) &&
            const DeepCollectionEquality().equals(other._tags, _tags) &&
            (identical(other.notes, notes) || other.notes == notes));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      title,
      description,
      status,
      category,
      houseId,
      createdBy,
      createdAt,
      updatedAt,
      assignedTo,
      dueDate,
      repeatInterval,
      completedAt,
      completedBy,
      priority,
      const DeepCollectionEquality().hash(_tags),
      notes);

  @override
  String toString() {
    return 'Task(id: $id, title: $title, description: $description, status: $status, category: $category, houseId: $houseId, createdBy: $createdBy, createdAt: $createdAt, updatedAt: $updatedAt, assignedTo: $assignedTo, dueDate: $dueDate, repeatInterval: $repeatInterval, completedAt: $completedAt, completedBy: $completedBy, priority: $priority, tags: $tags, notes: $notes)';
  }
}

/// @nodoc
abstract mixin class _$TaskCopyWith<$Res> implements $TaskCopyWith<$Res> {
  factory _$TaskCopyWith(_Task value, $Res Function(_Task) _then) =
      __$TaskCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@HiveField(0) String id,
      @HiveField(1) String title,
      @HiveField(2) String description,
      @HiveField(3) TaskStatus status,
      @HiveField(4) TaskCategory category,
      @HiveField(5) String houseId,
      @HiveField(6) String createdBy,
      @HiveField(7) DateTime createdAt,
      @HiveField(8) DateTime updatedAt,
      @HiveField(9) String? assignedTo,
      @HiveField(10) DateTime? dueDate,
      @HiveField(11) RepeatInterval? repeatInterval,
      @HiveField(12) DateTime? completedAt,
      @HiveField(13) String? completedBy,
      @HiveField(14) int? priority,
      @HiveField(15) List<String>? tags,
      @HiveField(16) String? notes});
}

/// @nodoc
class __$TaskCopyWithImpl<$Res> implements _$TaskCopyWith<$Res> {
  __$TaskCopyWithImpl(this._self, this._then);

  final _Task _self;
  final $Res Function(_Task) _then;

  /// Create a copy of Task
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = null,
    Object? status = null,
    Object? category = null,
    Object? houseId = null,
    Object? createdBy = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? assignedTo = freezed,
    Object? dueDate = freezed,
    Object? repeatInterval = freezed,
    Object? completedAt = freezed,
    Object? completedBy = freezed,
    Object? priority = freezed,
    Object? tags = freezed,
    Object? notes = freezed,
  }) {
    return _then(_Task(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as TaskStatus,
      category: null == category
          ? _self.category
          : category // ignore: cast_nullable_to_non_nullable
              as TaskCategory,
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
      assignedTo: freezed == assignedTo
          ? _self.assignedTo
          : assignedTo // ignore: cast_nullable_to_non_nullable
              as String?,
      dueDate: freezed == dueDate
          ? _self.dueDate
          : dueDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      repeatInterval: freezed == repeatInterval
          ? _self.repeatInterval
          : repeatInterval // ignore: cast_nullable_to_non_nullable
              as RepeatInterval?,
      completedAt: freezed == completedAt
          ? _self.completedAt
          : completedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      completedBy: freezed == completedBy
          ? _self.completedBy
          : completedBy // ignore: cast_nullable_to_non_nullable
              as String?,
      priority: freezed == priority
          ? _self.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as int?,
      tags: freezed == tags
          ? _self._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      notes: freezed == notes
          ? _self.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
