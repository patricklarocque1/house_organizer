// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'task.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Task _$TaskFromJson(Map<String, dynamic> json) {
  return _Task.fromJson(json);
}

/// @nodoc
mixin _$Task {
  @HiveField(0)
  String get id => throw _privateConstructorUsedError;
  @HiveField(1)
  String get title => throw _privateConstructorUsedError;
  @HiveField(2)
  String get description => throw _privateConstructorUsedError;
  @HiveField(3)
  TaskStatus get status => throw _privateConstructorUsedError;
  @HiveField(4)
  TaskCategory get category => throw _privateConstructorUsedError;
  @HiveField(5)
  String get houseId => throw _privateConstructorUsedError;
  @HiveField(6)
  String get createdBy => throw _privateConstructorUsedError;
  @HiveField(7)
  DateTime get createdAt => throw _privateConstructorUsedError;
  @HiveField(8)
  DateTime get updatedAt => throw _privateConstructorUsedError;
  @HiveField(9)
  String? get assignedTo => throw _privateConstructorUsedError;
  @HiveField(10)
  DateTime? get dueDate => throw _privateConstructorUsedError;
  @HiveField(11)
  RepeatInterval? get repeatInterval => throw _privateConstructorUsedError;
  @HiveField(12)
  DateTime? get completedAt => throw _privateConstructorUsedError;
  @HiveField(13)
  String? get completedBy => throw _privateConstructorUsedError;
  @HiveField(14)
  int? get priority => throw _privateConstructorUsedError;
  @HiveField(15)
  List<String>? get tags => throw _privateConstructorUsedError;
  @HiveField(16)
  String? get notes => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TaskCopyWith<Task> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaskCopyWith<$Res> {
  factory $TaskCopyWith(Task value, $Res Function(Task) then) =
      _$TaskCopyWithImpl<$Res, Task>;
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
class _$TaskCopyWithImpl<$Res, $Val extends Task>
    implements $TaskCopyWith<$Res> {
  _$TaskCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

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
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as TaskStatus,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as TaskCategory,
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
      assignedTo: freezed == assignedTo
          ? _value.assignedTo
          : assignedTo // ignore: cast_nullable_to_non_nullable
              as String?,
      dueDate: freezed == dueDate
          ? _value.dueDate
          : dueDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      repeatInterval: freezed == repeatInterval
          ? _value.repeatInterval
          : repeatInterval // ignore: cast_nullable_to_non_nullable
              as RepeatInterval?,
      completedAt: freezed == completedAt
          ? _value.completedAt
          : completedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      completedBy: freezed == completedBy
          ? _value.completedBy
          : completedBy // ignore: cast_nullable_to_non_nullable
              as String?,
      priority: freezed == priority
          ? _value.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as int?,
      tags: freezed == tags
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TaskImplCopyWith<$Res> implements $TaskCopyWith<$Res> {
  factory _$$TaskImplCopyWith(
          _$TaskImpl value, $Res Function(_$TaskImpl) then) =
      __$$TaskImplCopyWithImpl<$Res>;
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
class __$$TaskImplCopyWithImpl<$Res>
    extends _$TaskCopyWithImpl<$Res, _$TaskImpl>
    implements _$$TaskImplCopyWith<$Res> {
  __$$TaskImplCopyWithImpl(_$TaskImpl _value, $Res Function(_$TaskImpl) _then)
      : super(_value, _then);

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
    return _then(_$TaskImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as TaskStatus,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as TaskCategory,
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
      assignedTo: freezed == assignedTo
          ? _value.assignedTo
          : assignedTo // ignore: cast_nullable_to_non_nullable
              as String?,
      dueDate: freezed == dueDate
          ? _value.dueDate
          : dueDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      repeatInterval: freezed == repeatInterval
          ? _value.repeatInterval
          : repeatInterval // ignore: cast_nullable_to_non_nullable
              as RepeatInterval?,
      completedAt: freezed == completedAt
          ? _value.completedAt
          : completedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      completedBy: freezed == completedBy
          ? _value.completedBy
          : completedBy // ignore: cast_nullable_to_non_nullable
              as String?,
      priority: freezed == priority
          ? _value.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as int?,
      tags: freezed == tags
          ? _value._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TaskImpl implements _Task {
  const _$TaskImpl(
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

  factory _$TaskImpl.fromJson(Map<String, dynamic> json) =>
      _$$TaskImplFromJson(json);

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

  @override
  String toString() {
    return 'Task(id: $id, title: $title, description: $description, status: $status, category: $category, houseId: $houseId, createdBy: $createdBy, createdAt: $createdAt, updatedAt: $updatedAt, assignedTo: $assignedTo, dueDate: $dueDate, repeatInterval: $repeatInterval, completedAt: $completedAt, completedBy: $completedBy, priority: $priority, tags: $tags, notes: $notes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TaskImpl &&
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

  @JsonKey(ignore: true)
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

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TaskImplCopyWith<_$TaskImpl> get copyWith =>
      __$$TaskImplCopyWithImpl<_$TaskImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TaskImplToJson(
      this,
    );
  }
}

abstract class _Task implements Task {
  const factory _Task(
      {@HiveField(0) required final String id,
      @HiveField(1) required final String title,
      @HiveField(2) required final String description,
      @HiveField(3) required final TaskStatus status,
      @HiveField(4) required final TaskCategory category,
      @HiveField(5) required final String houseId,
      @HiveField(6) required final String createdBy,
      @HiveField(7) required final DateTime createdAt,
      @HiveField(8) required final DateTime updatedAt,
      @HiveField(9) final String? assignedTo,
      @HiveField(10) final DateTime? dueDate,
      @HiveField(11) final RepeatInterval? repeatInterval,
      @HiveField(12) final DateTime? completedAt,
      @HiveField(13) final String? completedBy,
      @HiveField(14) final int? priority,
      @HiveField(15) final List<String>? tags,
      @HiveField(16) final String? notes}) = _$TaskImpl;

  factory _Task.fromJson(Map<String, dynamic> json) = _$TaskImpl.fromJson;

  @override
  @HiveField(0)
  String get id;
  @override
  @HiveField(1)
  String get title;
  @override
  @HiveField(2)
  String get description;
  @override
  @HiveField(3)
  TaskStatus get status;
  @override
  @HiveField(4)
  TaskCategory get category;
  @override
  @HiveField(5)
  String get houseId;
  @override
  @HiveField(6)
  String get createdBy;
  @override
  @HiveField(7)
  DateTime get createdAt;
  @override
  @HiveField(8)
  DateTime get updatedAt;
  @override
  @HiveField(9)
  String? get assignedTo;
  @override
  @HiveField(10)
  DateTime? get dueDate;
  @override
  @HiveField(11)
  RepeatInterval? get repeatInterval;
  @override
  @HiveField(12)
  DateTime? get completedAt;
  @override
  @HiveField(13)
  String? get completedBy;
  @override
  @HiveField(14)
  int? get priority;
  @override
  @HiveField(15)
  List<String>? get tags;
  @override
  @HiveField(16)
  String? get notes;
  @override
  @JsonKey(ignore: true)
  _$$TaskImplCopyWith<_$TaskImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
