// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserModel {

 String get id; String get name; String get username; String get usertype; String? get estate; String? get estateId; String? get email; String? get firstName; String? get userGroup; String? get groupId; List<String> get propertyIds; List<String> get authorities;
/// Create a copy of UserModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserModelCopyWith<UserModel> get copyWith => _$UserModelCopyWithImpl<UserModel>(this as UserModel, _$identity);

  /// Serializes this UserModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.username, username) || other.username == username)&&(identical(other.usertype, usertype) || other.usertype == usertype)&&(identical(other.estate, estate) || other.estate == estate)&&(identical(other.estateId, estateId) || other.estateId == estateId)&&(identical(other.email, email) || other.email == email)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.userGroup, userGroup) || other.userGroup == userGroup)&&(identical(other.groupId, groupId) || other.groupId == groupId)&&const DeepCollectionEquality().equals(other.propertyIds, propertyIds)&&const DeepCollectionEquality().equals(other.authorities, authorities));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,username,usertype,estate,estateId,email,firstName,userGroup,groupId,const DeepCollectionEquality().hash(propertyIds),const DeepCollectionEquality().hash(authorities));

@override
String toString() {
  return 'UserModel(id: $id, name: $name, username: $username, usertype: $usertype, estate: $estate, estateId: $estateId, email: $email, firstName: $firstName, userGroup: $userGroup, groupId: $groupId, propertyIds: $propertyIds, authorities: $authorities)';
}


}

/// @nodoc
abstract mixin class $UserModelCopyWith<$Res>  {
  factory $UserModelCopyWith(UserModel value, $Res Function(UserModel) _then) = _$UserModelCopyWithImpl;
@useResult
$Res call({
 String id, String name, String username, String usertype, String? estate, String? estateId, String? email, String? firstName, String? userGroup, String? groupId, List<String> propertyIds, List<String> authorities
});




}
/// @nodoc
class _$UserModelCopyWithImpl<$Res>
    implements $UserModelCopyWith<$Res> {
  _$UserModelCopyWithImpl(this._self, this._then);

  final UserModel _self;
  final $Res Function(UserModel) _then;

/// Create a copy of UserModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? username = null,Object? usertype = null,Object? estate = freezed,Object? estateId = freezed,Object? email = freezed,Object? firstName = freezed,Object? userGroup = freezed,Object? groupId = freezed,Object? propertyIds = null,Object? authorities = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,usertype: null == usertype ? _self.usertype : usertype // ignore: cast_nullable_to_non_nullable
as String,estate: freezed == estate ? _self.estate : estate // ignore: cast_nullable_to_non_nullable
as String?,estateId: freezed == estateId ? _self.estateId : estateId // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,firstName: freezed == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String?,userGroup: freezed == userGroup ? _self.userGroup : userGroup // ignore: cast_nullable_to_non_nullable
as String?,groupId: freezed == groupId ? _self.groupId : groupId // ignore: cast_nullable_to_non_nullable
as String?,propertyIds: null == propertyIds ? _self.propertyIds : propertyIds // ignore: cast_nullable_to_non_nullable
as List<String>,authorities: null == authorities ? _self.authorities : authorities // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// Adds pattern-matching-related methods to [UserModel].
extension UserModelPatterns on UserModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserModel value)  $default,){
final _that = this;
switch (_that) {
case _UserModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserModel value)?  $default,){
final _that = this;
switch (_that) {
case _UserModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String username,  String usertype,  String? estate,  String? estateId,  String? email,  String? firstName,  String? userGroup,  String? groupId,  List<String> propertyIds,  List<String> authorities)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserModel() when $default != null:
return $default(_that.id,_that.name,_that.username,_that.usertype,_that.estate,_that.estateId,_that.email,_that.firstName,_that.userGroup,_that.groupId,_that.propertyIds,_that.authorities);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String username,  String usertype,  String? estate,  String? estateId,  String? email,  String? firstName,  String? userGroup,  String? groupId,  List<String> propertyIds,  List<String> authorities)  $default,) {final _that = this;
switch (_that) {
case _UserModel():
return $default(_that.id,_that.name,_that.username,_that.usertype,_that.estate,_that.estateId,_that.email,_that.firstName,_that.userGroup,_that.groupId,_that.propertyIds,_that.authorities);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String username,  String usertype,  String? estate,  String? estateId,  String? email,  String? firstName,  String? userGroup,  String? groupId,  List<String> propertyIds,  List<String> authorities)?  $default,) {final _that = this;
switch (_that) {
case _UserModel() when $default != null:
return $default(_that.id,_that.name,_that.username,_that.usertype,_that.estate,_that.estateId,_that.email,_that.firstName,_that.userGroup,_that.groupId,_that.propertyIds,_that.authorities);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserModel extends UserModel {
  const _UserModel({required this.id, required this.name, required this.username, required this.usertype, this.estate, this.estateId, this.email, this.firstName, this.userGroup, this.groupId, final  List<String> propertyIds = const [], final  List<String> authorities = const []}): _propertyIds = propertyIds,_authorities = authorities,super._();
  factory _UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);

@override final  String id;
@override final  String name;
@override final  String username;
@override final  String usertype;
@override final  String? estate;
@override final  String? estateId;
@override final  String? email;
@override final  String? firstName;
@override final  String? userGroup;
@override final  String? groupId;
 final  List<String> _propertyIds;
@override@JsonKey() List<String> get propertyIds {
  if (_propertyIds is EqualUnmodifiableListView) return _propertyIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_propertyIds);
}

 final  List<String> _authorities;
@override@JsonKey() List<String> get authorities {
  if (_authorities is EqualUnmodifiableListView) return _authorities;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_authorities);
}


/// Create a copy of UserModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserModelCopyWith<_UserModel> get copyWith => __$UserModelCopyWithImpl<_UserModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.username, username) || other.username == username)&&(identical(other.usertype, usertype) || other.usertype == usertype)&&(identical(other.estate, estate) || other.estate == estate)&&(identical(other.estateId, estateId) || other.estateId == estateId)&&(identical(other.email, email) || other.email == email)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.userGroup, userGroup) || other.userGroup == userGroup)&&(identical(other.groupId, groupId) || other.groupId == groupId)&&const DeepCollectionEquality().equals(other._propertyIds, _propertyIds)&&const DeepCollectionEquality().equals(other._authorities, _authorities));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,username,usertype,estate,estateId,email,firstName,userGroup,groupId,const DeepCollectionEquality().hash(_propertyIds),const DeepCollectionEquality().hash(_authorities));

@override
String toString() {
  return 'UserModel(id: $id, name: $name, username: $username, usertype: $usertype, estate: $estate, estateId: $estateId, email: $email, firstName: $firstName, userGroup: $userGroup, groupId: $groupId, propertyIds: $propertyIds, authorities: $authorities)';
}


}

/// @nodoc
abstract mixin class _$UserModelCopyWith<$Res> implements $UserModelCopyWith<$Res> {
  factory _$UserModelCopyWith(_UserModel value, $Res Function(_UserModel) _then) = __$UserModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String username, String usertype, String? estate, String? estateId, String? email, String? firstName, String? userGroup, String? groupId, List<String> propertyIds, List<String> authorities
});




}
/// @nodoc
class __$UserModelCopyWithImpl<$Res>
    implements _$UserModelCopyWith<$Res> {
  __$UserModelCopyWithImpl(this._self, this._then);

  final _UserModel _self;
  final $Res Function(_UserModel) _then;

/// Create a copy of UserModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? username = null,Object? usertype = null,Object? estate = freezed,Object? estateId = freezed,Object? email = freezed,Object? firstName = freezed,Object? userGroup = freezed,Object? groupId = freezed,Object? propertyIds = null,Object? authorities = null,}) {
  return _then(_UserModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,usertype: null == usertype ? _self.usertype : usertype // ignore: cast_nullable_to_non_nullable
as String,estate: freezed == estate ? _self.estate : estate // ignore: cast_nullable_to_non_nullable
as String?,estateId: freezed == estateId ? _self.estateId : estateId // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,firstName: freezed == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String?,userGroup: freezed == userGroup ? _self.userGroup : userGroup // ignore: cast_nullable_to_non_nullable
as String?,groupId: freezed == groupId ? _self.groupId : groupId // ignore: cast_nullable_to_non_nullable
as String?,propertyIds: null == propertyIds ? _self._propertyIds : propertyIds // ignore: cast_nullable_to_non_nullable
as List<String>,authorities: null == authorities ? _self._authorities : authorities // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}

// dart format on
