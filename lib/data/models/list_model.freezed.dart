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

 String get id; String get name; ListType get type; String get houseId; String get createdBy; DateTime get createdAt; DateTime get updatedAt; List<ListItem> get items; String? get assignedTo; String? get description; bool? get isCompleted; DateTime? get completedAt; String? get completedBy; DateTime? get dueDate;
/// Create a copy of ListModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ListModelCopyWith<ListModel> get copyWith => _$ListModelCopyWithImpl<ListModel>(this as ListModel, _$identity);

  /// Serializes this ListModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ListModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.type, type) || other.type == type)&&(identical(other.houseId, houseId) || other.houseId == houseId)&&(identical(other.createdBy, createdBy) || other.createdBy == createdBy)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&const DeepCollectionEquality().equals(other.items, items)&&(identical(other.assignedTo, assignedTo) || other.assignedTo == assignedTo)&&(identical(other.description, description) || other.description == description)&&(identical(other.isCompleted, isCompleted) || other.isCompleted == isCompleted)&&(identical(other.completedAt, completedAt) || other.completedAt == completedAt)&&(identical(other.completedBy, completedBy) || other.completedBy == completedBy)&&(identical(other.dueDate, dueDate) || other.dueDate == dueDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,type,houseId,createdBy,createdAt,updatedAt,const DeepCollectionEquality().hash(items),assignedTo,description,isCompleted,completedAt,completedBy,dueDate);

@override
String toString() {
  return 'ListModel(id: $id, name: $name, type: $type, houseId: $houseId, createdBy: $createdBy, createdAt: $createdAt, updatedAt: $updatedAt, items: $items, assignedTo: $assignedTo, description: $description, isCompleted: $isCompleted, completedAt: $completedAt, completedBy: $completedBy, dueDate: $dueDate)';
}


}

/// @nodoc
abstract mixin class $ListModelCopyWith<$Res>  {
  factory $ListModelCopyWith(ListModel value, $Res Function(ListModel) _then) = _$ListModelCopyWithImpl;
@useResult
$Res call({
 String id, String name, ListType type, String houseId, String createdBy, DateTime createdAt, DateTime updatedAt, List<ListItem> items, String? assignedTo, String? description, bool? isCompleted, DateTime? completedAt, String? completedBy, DateTime? dueDate
});




}
/// @nodoc
class _$ListModelCopyWithImpl<$Res>
    implements $ListModelCopyWith<$Res> {
  _$ListModelCopyWithImpl(this._self, this._then);

  final ListModel _self;
  final $Res Function(ListModel) _then;

/// Create a copy of ListModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? type = null,Object? houseId = null,Object? createdBy = null,Object? createdAt = null,Object? updatedAt = null,Object? items = null,Object? assignedTo = freezed,Object? description = freezed,Object? isCompleted = freezed,Object? completedAt = freezed,Object? completedBy = freezed,Object? dueDate = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as ListType,houseId: null == houseId ? _self.houseId : houseId // ignore: cast_nullable_to_non_nullable
as String,createdBy: null == createdBy ? _self.createdBy : createdBy // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<ListItem>,assignedTo: freezed == assignedTo ? _self.assignedTo : assignedTo // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,isCompleted: freezed == isCompleted ? _self.isCompleted : isCompleted // ignore: cast_nullable_to_non_nullable
as bool?,completedAt: freezed == completedAt ? _self.completedAt : completedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,completedBy: freezed == completedBy ? _self.completedBy : completedBy // ignore: cast_nullable_to_non_nullable
as String?,dueDate: freezed == dueDate ? _self.dueDate : dueDate // ignore: cast_nullable_to_non_nullable
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ListModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ListModel() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ListModel value)  $default,){
final _that = this;
switch (_that) {
case _ListModel():
return $default(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ListModel value)?  $default,){
final _that = this;
switch (_that) {
case _ListModel() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  ListType type,  String houseId,  String createdBy,  DateTime createdAt,  DateTime updatedAt,  List<ListItem> items,  String? assignedTo,  String? description,  bool? isCompleted,  DateTime? completedAt,  String? completedBy,  DateTime? dueDate)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ListModel() when $default != null:
return $default(_that.id,_that.name,_that.type,_that.houseId,_that.createdBy,_that.createdAt,_that.updatedAt,_that.items,_that.assignedTo,_that.description,_that.isCompleted,_that.completedAt,_that.completedBy,_that.dueDate);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  ListType type,  String houseId,  String createdBy,  DateTime createdAt,  DateTime updatedAt,  List<ListItem> items,  String? assignedTo,  String? description,  bool? isCompleted,  DateTime? completedAt,  String? completedBy,  DateTime? dueDate)  $default,) {final _that = this;
switch (_that) {
case _ListModel():
return $default(_that.id,_that.name,_that.type,_that.houseId,_that.createdBy,_that.createdAt,_that.updatedAt,_that.items,_that.assignedTo,_that.description,_that.isCompleted,_that.completedAt,_that.completedBy,_that.dueDate);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  ListType type,  String houseId,  String createdBy,  DateTime createdAt,  DateTime updatedAt,  List<ListItem> items,  String? assignedTo,  String? description,  bool? isCompleted,  DateTime? completedAt,  String? completedBy,  DateTime? dueDate)?  $default,) {final _that = this;
switch (_that) {
case _ListModel() when $default != null:
return $default(_that.id,_that.name,_that.type,_that.houseId,_that.createdBy,_that.createdAt,_that.updatedAt,_that.items,_that.assignedTo,_that.description,_that.isCompleted,_that.completedAt,_that.completedBy,_that.dueDate);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ListModel implements ListModel {
  const _ListModel({required this.id, required this.name, required this.type, required this.houseId, required this.createdBy, required this.createdAt, required this.updatedAt, required final  List<ListItem> items, this.assignedTo, this.description, this.isCompleted, this.completedAt, this.completedBy, this.dueDate}): _items = items;
  factory _ListModel.fromJson(Map<String, dynamic> json) => _$ListModelFromJson(json);

@override final  String id;
@override final  String name;
@override final  ListType type;
@override final  String houseId;
@override final  String createdBy;
@override final  DateTime createdAt;
@override final  DateTime updatedAt;
 final  List<ListItem> _items;
@override List<ListItem> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

@override final  String? assignedTo;
@override final  String? description;
@override final  bool? isCompleted;
@override final  DateTime? completedAt;
@override final  String? completedBy;
@override final  DateTime? dueDate;

/// Create a copy of ListModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ListModelCopyWith<_ListModel> get copyWith => __$ListModelCopyWithImpl<_ListModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ListModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ListModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.type, type) || other.type == type)&&(identical(other.houseId, houseId) || other.houseId == houseId)&&(identical(other.createdBy, createdBy) || other.createdBy == createdBy)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&const DeepCollectionEquality().equals(other._items, _items)&&(identical(other.assignedTo, assignedTo) || other.assignedTo == assignedTo)&&(identical(other.description, description) || other.description == description)&&(identical(other.isCompleted, isCompleted) || other.isCompleted == isCompleted)&&(identical(other.completedAt, completedAt) || other.completedAt == completedAt)&&(identical(other.completedBy, completedBy) || other.completedBy == completedBy)&&(identical(other.dueDate, dueDate) || other.dueDate == dueDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,type,houseId,createdBy,createdAt,updatedAt,const DeepCollectionEquality().hash(_items),assignedTo,description,isCompleted,completedAt,completedBy,dueDate);

@override
String toString() {
  return 'ListModel(id: $id, name: $name, type: $type, houseId: $houseId, createdBy: $createdBy, createdAt: $createdAt, updatedAt: $updatedAt, items: $items, assignedTo: $assignedTo, description: $description, isCompleted: $isCompleted, completedAt: $completedAt, completedBy: $completedBy, dueDate: $dueDate)';
}


}

/// @nodoc
abstract mixin class _$ListModelCopyWith<$Res> implements $ListModelCopyWith<$Res> {
  factory _$ListModelCopyWith(_ListModel value, $Res Function(_ListModel) _then) = __$ListModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, ListType type, String houseId, String createdBy, DateTime createdAt, DateTime updatedAt, List<ListItem> items, String? assignedTo, String? description, bool? isCompleted, DateTime? completedAt, String? completedBy, DateTime? dueDate
});




}
/// @nodoc
class __$ListModelCopyWithImpl<$Res>
    implements _$ListModelCopyWith<$Res> {
  __$ListModelCopyWithImpl(this._self, this._then);

  final _ListModel _self;
  final $Res Function(_ListModel) _then;

/// Create a copy of ListModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? type = null,Object? houseId = null,Object? createdBy = null,Object? createdAt = null,Object? updatedAt = null,Object? items = null,Object? assignedTo = freezed,Object? description = freezed,Object? isCompleted = freezed,Object? completedAt = freezed,Object? completedBy = freezed,Object? dueDate = freezed,}) {
  return _then(_ListModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as ListType,houseId: null == houseId ? _self.houseId : houseId // ignore: cast_nullable_to_non_nullable
as String,createdBy: null == createdBy ? _self.createdBy : createdBy // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<ListItem>,assignedTo: freezed == assignedTo ? _self.assignedTo : assignedTo // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,isCompleted: freezed == isCompleted ? _self.isCompleted : isCompleted // ignore: cast_nullable_to_non_nullable
as bool?,completedAt: freezed == completedAt ? _self.completedAt : completedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,completedBy: freezed == completedBy ? _self.completedBy : completedBy // ignore: cast_nullable_to_non_nullable
as String?,dueDate: freezed == dueDate ? _self.dueDate : dueDate // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
