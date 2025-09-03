// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'house.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$House {

 String get id; String get name; String get address; String get joinCode; String get createdBy; DateTime get createdAt; DateTime get updatedAt; List<String>? get residentIds; List<String>? get supervisorIds; bool? get isActive; String? get description; String? get phoneNumber; String? get email;
/// Create a copy of House
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HouseCopyWith<House> get copyWith => _$HouseCopyWithImpl<House>(this as House, _$identity);

  /// Serializes this House to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is House&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.address, address) || other.address == address)&&(identical(other.joinCode, joinCode) || other.joinCode == joinCode)&&(identical(other.createdBy, createdBy) || other.createdBy == createdBy)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&const DeepCollectionEquality().equals(other.residentIds, residentIds)&&const DeepCollectionEquality().equals(other.supervisorIds, supervisorIds)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.description, description) || other.description == description)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.email, email) || other.email == email));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,address,joinCode,createdBy,createdAt,updatedAt,const DeepCollectionEquality().hash(residentIds),const DeepCollectionEquality().hash(supervisorIds),isActive,description,phoneNumber,email);

@override
String toString() {
  return 'House(id: $id, name: $name, address: $address, joinCode: $joinCode, createdBy: $createdBy, createdAt: $createdAt, updatedAt: $updatedAt, residentIds: $residentIds, supervisorIds: $supervisorIds, isActive: $isActive, description: $description, phoneNumber: $phoneNumber, email: $email)';
}


}

/// @nodoc
abstract mixin class $HouseCopyWith<$Res>  {
  factory $HouseCopyWith(House value, $Res Function(House) _then) = _$HouseCopyWithImpl;
@useResult
$Res call({
 String id, String name, String address, String joinCode, String createdBy, DateTime createdAt, DateTime updatedAt, List<String>? residentIds, List<String>? supervisorIds, bool? isActive, String? description, String? phoneNumber, String? email
});




}
/// @nodoc
class _$HouseCopyWithImpl<$Res>
    implements $HouseCopyWith<$Res> {
  _$HouseCopyWithImpl(this._self, this._then);

  final House _self;
  final $Res Function(House) _then;

/// Create a copy of House
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? address = null,Object? joinCode = null,Object? createdBy = null,Object? createdAt = null,Object? updatedAt = null,Object? residentIds = freezed,Object? supervisorIds = freezed,Object? isActive = freezed,Object? description = freezed,Object? phoneNumber = freezed,Object? email = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,joinCode: null == joinCode ? _self.joinCode : joinCode // ignore: cast_nullable_to_non_nullable
as String,createdBy: null == createdBy ? _self.createdBy : createdBy // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,residentIds: freezed == residentIds ? _self.residentIds : residentIds // ignore: cast_nullable_to_non_nullable
as List<String>?,supervisorIds: freezed == supervisorIds ? _self.supervisorIds : supervisorIds // ignore: cast_nullable_to_non_nullable
as List<String>?,isActive: freezed == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,phoneNumber: freezed == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [House].
extension HousePatterns on House {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _House value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _House() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _House value)  $default,){
final _that = this;
switch (_that) {
case _House():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _House value)?  $default,){
final _that = this;
switch (_that) {
case _House() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String address,  String joinCode,  String createdBy,  DateTime createdAt,  DateTime updatedAt,  List<String>? residentIds,  List<String>? supervisorIds,  bool? isActive,  String? description,  String? phoneNumber,  String? email)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _House() when $default != null:
return $default(_that.id,_that.name,_that.address,_that.joinCode,_that.createdBy,_that.createdAt,_that.updatedAt,_that.residentIds,_that.supervisorIds,_that.isActive,_that.description,_that.phoneNumber,_that.email);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String address,  String joinCode,  String createdBy,  DateTime createdAt,  DateTime updatedAt,  List<String>? residentIds,  List<String>? supervisorIds,  bool? isActive,  String? description,  String? phoneNumber,  String? email)  $default,) {final _that = this;
switch (_that) {
case _House():
return $default(_that.id,_that.name,_that.address,_that.joinCode,_that.createdBy,_that.createdAt,_that.updatedAt,_that.residentIds,_that.supervisorIds,_that.isActive,_that.description,_that.phoneNumber,_that.email);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String address,  String joinCode,  String createdBy,  DateTime createdAt,  DateTime updatedAt,  List<String>? residentIds,  List<String>? supervisorIds,  bool? isActive,  String? description,  String? phoneNumber,  String? email)?  $default,) {final _that = this;
switch (_that) {
case _House() when $default != null:
return $default(_that.id,_that.name,_that.address,_that.joinCode,_that.createdBy,_that.createdAt,_that.updatedAt,_that.residentIds,_that.supervisorIds,_that.isActive,_that.description,_that.phoneNumber,_that.email);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _House implements House {
  const _House({required this.id, required this.name, required this.address, required this.joinCode, required this.createdBy, required this.createdAt, required this.updatedAt, final  List<String>? residentIds, final  List<String>? supervisorIds, this.isActive, this.description, this.phoneNumber, this.email}): _residentIds = residentIds,_supervisorIds = supervisorIds;
  factory _House.fromJson(Map<String, dynamic> json) => _$HouseFromJson(json);

@override final  String id;
@override final  String name;
@override final  String address;
@override final  String joinCode;
@override final  String createdBy;
@override final  DateTime createdAt;
@override final  DateTime updatedAt;
 final  List<String>? _residentIds;
@override List<String>? get residentIds {
  final value = _residentIds;
  if (value == null) return null;
  if (_residentIds is EqualUnmodifiableListView) return _residentIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<String>? _supervisorIds;
@override List<String>? get supervisorIds {
  final value = _supervisorIds;
  if (value == null) return null;
  if (_supervisorIds is EqualUnmodifiableListView) return _supervisorIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  bool? isActive;
@override final  String? description;
@override final  String? phoneNumber;
@override final  String? email;

/// Create a copy of House
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HouseCopyWith<_House> get copyWith => __$HouseCopyWithImpl<_House>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$HouseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _House&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.address, address) || other.address == address)&&(identical(other.joinCode, joinCode) || other.joinCode == joinCode)&&(identical(other.createdBy, createdBy) || other.createdBy == createdBy)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&const DeepCollectionEquality().equals(other._residentIds, _residentIds)&&const DeepCollectionEquality().equals(other._supervisorIds, _supervisorIds)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.description, description) || other.description == description)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.email, email) || other.email == email));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,address,joinCode,createdBy,createdAt,updatedAt,const DeepCollectionEquality().hash(_residentIds),const DeepCollectionEquality().hash(_supervisorIds),isActive,description,phoneNumber,email);

@override
String toString() {
  return 'House(id: $id, name: $name, address: $address, joinCode: $joinCode, createdBy: $createdBy, createdAt: $createdAt, updatedAt: $updatedAt, residentIds: $residentIds, supervisorIds: $supervisorIds, isActive: $isActive, description: $description, phoneNumber: $phoneNumber, email: $email)';
}


}

/// @nodoc
abstract mixin class _$HouseCopyWith<$Res> implements $HouseCopyWith<$Res> {
  factory _$HouseCopyWith(_House value, $Res Function(_House) _then) = __$HouseCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String address, String joinCode, String createdBy, DateTime createdAt, DateTime updatedAt, List<String>? residentIds, List<String>? supervisorIds, bool? isActive, String? description, String? phoneNumber, String? email
});




}
/// @nodoc
class __$HouseCopyWithImpl<$Res>
    implements _$HouseCopyWith<$Res> {
  __$HouseCopyWithImpl(this._self, this._then);

  final _House _self;
  final $Res Function(_House) _then;

/// Create a copy of House
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? address = null,Object? joinCode = null,Object? createdBy = null,Object? createdAt = null,Object? updatedAt = null,Object? residentIds = freezed,Object? supervisorIds = freezed,Object? isActive = freezed,Object? description = freezed,Object? phoneNumber = freezed,Object? email = freezed,}) {
  return _then(_House(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,joinCode: null == joinCode ? _self.joinCode : joinCode // ignore: cast_nullable_to_non_nullable
as String,createdBy: null == createdBy ? _self.createdBy : createdBy // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,residentIds: freezed == residentIds ? _self._residentIds : residentIds // ignore: cast_nullable_to_non_nullable
as List<String>?,supervisorIds: freezed == supervisorIds ? _self._supervisorIds : supervisorIds // ignore: cast_nullable_to_non_nullable
as List<String>?,isActive: freezed == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,phoneNumber: freezed == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
