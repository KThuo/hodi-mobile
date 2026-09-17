// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tenant_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TenantModel {

 String get id;/// `PERSON` or `ORGANISATION`.
 String? get kind; bool get organisation; String get displayName; String? get firstName; String? get lastName; String? get idNumber; String? get registeredName; String? get kraPin;/// Who to speak to at a company. Null for a person, where the tenant is the contact.
 String? get contactName; String? get phone; String? get email; String? get username;/// Whether they have been asked to set up a sign-in. Worth showing: a tenant with no account
/// cannot see their own invoices, and that is a thing somebody can act on.
 bool get invited; String? get estateId;/// Every unit they occupy — a tenant is not limited to one.
 List<OccupiedUnitModel> get occupying; int get status; String? get createdOn;
/// Create a copy of TenantModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TenantModelCopyWith<TenantModel> get copyWith => _$TenantModelCopyWithImpl<TenantModel>(this as TenantModel, _$identity);

  /// Serializes this TenantModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TenantModel&&(identical(other.id, id) || other.id == id)&&(identical(other.kind, kind) || other.kind == kind)&&(identical(other.organisation, organisation) || other.organisation == organisation)&&(identical(other.displayName, displayName) || other.displayName == displayName)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.idNumber, idNumber) || other.idNumber == idNumber)&&(identical(other.registeredName, registeredName) || other.registeredName == registeredName)&&(identical(other.kraPin, kraPin) || other.kraPin == kraPin)&&(identical(other.contactName, contactName) || other.contactName == contactName)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.email, email) || other.email == email)&&(identical(other.username, username) || other.username == username)&&(identical(other.invited, invited) || other.invited == invited)&&(identical(other.estateId, estateId) || other.estateId == estateId)&&const DeepCollectionEquality().equals(other.occupying, occupying)&&(identical(other.status, status) || other.status == status)&&(identical(other.createdOn, createdOn) || other.createdOn == createdOn));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,kind,organisation,displayName,firstName,lastName,idNumber,registeredName,kraPin,contactName,phone,email,username,invited,estateId,const DeepCollectionEquality().hash(occupying),status,createdOn);

@override
String toString() {
  return 'TenantModel(id: $id, kind: $kind, organisation: $organisation, displayName: $displayName, firstName: $firstName, lastName: $lastName, idNumber: $idNumber, registeredName: $registeredName, kraPin: $kraPin, contactName: $contactName, phone: $phone, email: $email, username: $username, invited: $invited, estateId: $estateId, occupying: $occupying, status: $status, createdOn: $createdOn)';
}


}

/// @nodoc
abstract mixin class $TenantModelCopyWith<$Res>  {
  factory $TenantModelCopyWith(TenantModel value, $Res Function(TenantModel) _then) = _$TenantModelCopyWithImpl;
@useResult
$Res call({
 String id, String? kind, bool organisation, String displayName, String? firstName, String? lastName, String? idNumber, String? registeredName, String? kraPin, String? contactName, String? phone, String? email, String? username, bool invited, String? estateId, List<OccupiedUnitModel> occupying, int status, String? createdOn
});




}
/// @nodoc
class _$TenantModelCopyWithImpl<$Res>
    implements $TenantModelCopyWith<$Res> {
  _$TenantModelCopyWithImpl(this._self, this._then);

  final TenantModel _self;
  final $Res Function(TenantModel) _then;

/// Create a copy of TenantModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? kind = freezed,Object? organisation = null,Object? displayName = null,Object? firstName = freezed,Object? lastName = freezed,Object? idNumber = freezed,Object? registeredName = freezed,Object? kraPin = freezed,Object? contactName = freezed,Object? phone = freezed,Object? email = freezed,Object? username = freezed,Object? invited = null,Object? estateId = freezed,Object? occupying = null,Object? status = null,Object? createdOn = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,kind: freezed == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as String?,organisation: null == organisation ? _self.organisation : organisation // ignore: cast_nullable_to_non_nullable
as bool,displayName: null == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String,firstName: freezed == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String?,lastName: freezed == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String?,idNumber: freezed == idNumber ? _self.idNumber : idNumber // ignore: cast_nullable_to_non_nullable
as String?,registeredName: freezed == registeredName ? _self.registeredName : registeredName // ignore: cast_nullable_to_non_nullable
as String?,kraPin: freezed == kraPin ? _self.kraPin : kraPin // ignore: cast_nullable_to_non_nullable
as String?,contactName: freezed == contactName ? _self.contactName : contactName // ignore: cast_nullable_to_non_nullable
as String?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,username: freezed == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String?,invited: null == invited ? _self.invited : invited // ignore: cast_nullable_to_non_nullable
as bool,estateId: freezed == estateId ? _self.estateId : estateId // ignore: cast_nullable_to_non_nullable
as String?,occupying: null == occupying ? _self.occupying : occupying // ignore: cast_nullable_to_non_nullable
as List<OccupiedUnitModel>,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as int,createdOn: freezed == createdOn ? _self.createdOn : createdOn // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [TenantModel].
extension TenantModelPatterns on TenantModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TenantModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TenantModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TenantModel value)  $default,){
final _that = this;
switch (_that) {
case _TenantModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TenantModel value)?  $default,){
final _that = this;
switch (_that) {
case _TenantModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String? kind,  bool organisation,  String displayName,  String? firstName,  String? lastName,  String? idNumber,  String? registeredName,  String? kraPin,  String? contactName,  String? phone,  String? email,  String? username,  bool invited,  String? estateId,  List<OccupiedUnitModel> occupying,  int status,  String? createdOn)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TenantModel() when $default != null:
return $default(_that.id,_that.kind,_that.organisation,_that.displayName,_that.firstName,_that.lastName,_that.idNumber,_that.registeredName,_that.kraPin,_that.contactName,_that.phone,_that.email,_that.username,_that.invited,_that.estateId,_that.occupying,_that.status,_that.createdOn);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String? kind,  bool organisation,  String displayName,  String? firstName,  String? lastName,  String? idNumber,  String? registeredName,  String? kraPin,  String? contactName,  String? phone,  String? email,  String? username,  bool invited,  String? estateId,  List<OccupiedUnitModel> occupying,  int status,  String? createdOn)  $default,) {final _that = this;
switch (_that) {
case _TenantModel():
return $default(_that.id,_that.kind,_that.organisation,_that.displayName,_that.firstName,_that.lastName,_that.idNumber,_that.registeredName,_that.kraPin,_that.contactName,_that.phone,_that.email,_that.username,_that.invited,_that.estateId,_that.occupying,_that.status,_that.createdOn);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String? kind,  bool organisation,  String displayName,  String? firstName,  String? lastName,  String? idNumber,  String? registeredName,  String? kraPin,  String? contactName,  String? phone,  String? email,  String? username,  bool invited,  String? estateId,  List<OccupiedUnitModel> occupying,  int status,  String? createdOn)?  $default,) {final _that = this;
switch (_that) {
case _TenantModel() when $default != null:
return $default(_that.id,_that.kind,_that.organisation,_that.displayName,_that.firstName,_that.lastName,_that.idNumber,_that.registeredName,_that.kraPin,_that.contactName,_that.phone,_that.email,_that.username,_that.invited,_that.estateId,_that.occupying,_that.status,_that.createdOn);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TenantModel extends TenantModel {
  const _TenantModel({required this.id, this.kind, this.organisation = false, required this.displayName, this.firstName, this.lastName, this.idNumber, this.registeredName, this.kraPin, this.contactName, this.phone, this.email, this.username, this.invited = false, this.estateId, final  List<OccupiedUnitModel> occupying = const <OccupiedUnitModel>[], this.status = 0, this.createdOn}): _occupying = occupying,super._();
  factory _TenantModel.fromJson(Map<String, dynamic> json) => _$TenantModelFromJson(json);

@override final  String id;
/// `PERSON` or `ORGANISATION`.
@override final  String? kind;
@override@JsonKey() final  bool organisation;
@override final  String displayName;
@override final  String? firstName;
@override final  String? lastName;
@override final  String? idNumber;
@override final  String? registeredName;
@override final  String? kraPin;
/// Who to speak to at a company. Null for a person, where the tenant is the contact.
@override final  String? contactName;
@override final  String? phone;
@override final  String? email;
@override final  String? username;
/// Whether they have been asked to set up a sign-in. Worth showing: a tenant with no account
/// cannot see their own invoices, and that is a thing somebody can act on.
@override@JsonKey() final  bool invited;
@override final  String? estateId;
/// Every unit they occupy — a tenant is not limited to one.
 final  List<OccupiedUnitModel> _occupying;
/// Every unit they occupy — a tenant is not limited to one.
@override@JsonKey() List<OccupiedUnitModel> get occupying {
  if (_occupying is EqualUnmodifiableListView) return _occupying;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_occupying);
}

@override@JsonKey() final  int status;
@override final  String? createdOn;

/// Create a copy of TenantModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TenantModelCopyWith<_TenantModel> get copyWith => __$TenantModelCopyWithImpl<_TenantModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TenantModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TenantModel&&(identical(other.id, id) || other.id == id)&&(identical(other.kind, kind) || other.kind == kind)&&(identical(other.organisation, organisation) || other.organisation == organisation)&&(identical(other.displayName, displayName) || other.displayName == displayName)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.idNumber, idNumber) || other.idNumber == idNumber)&&(identical(other.registeredName, registeredName) || other.registeredName == registeredName)&&(identical(other.kraPin, kraPin) || other.kraPin == kraPin)&&(identical(other.contactName, contactName) || other.contactName == contactName)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.email, email) || other.email == email)&&(identical(other.username, username) || other.username == username)&&(identical(other.invited, invited) || other.invited == invited)&&(identical(other.estateId, estateId) || other.estateId == estateId)&&const DeepCollectionEquality().equals(other._occupying, _occupying)&&(identical(other.status, status) || other.status == status)&&(identical(other.createdOn, createdOn) || other.createdOn == createdOn));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,kind,organisation,displayName,firstName,lastName,idNumber,registeredName,kraPin,contactName,phone,email,username,invited,estateId,const DeepCollectionEquality().hash(_occupying),status,createdOn);

@override
String toString() {
  return 'TenantModel(id: $id, kind: $kind, organisation: $organisation, displayName: $displayName, firstName: $firstName, lastName: $lastName, idNumber: $idNumber, registeredName: $registeredName, kraPin: $kraPin, contactName: $contactName, phone: $phone, email: $email, username: $username, invited: $invited, estateId: $estateId, occupying: $occupying, status: $status, createdOn: $createdOn)';
}


}

/// @nodoc
abstract mixin class _$TenantModelCopyWith<$Res> implements $TenantModelCopyWith<$Res> {
  factory _$TenantModelCopyWith(_TenantModel value, $Res Function(_TenantModel) _then) = __$TenantModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String? kind, bool organisation, String displayName, String? firstName, String? lastName, String? idNumber, String? registeredName, String? kraPin, String? contactName, String? phone, String? email, String? username, bool invited, String? estateId, List<OccupiedUnitModel> occupying, int status, String? createdOn
});




}
/// @nodoc
class __$TenantModelCopyWithImpl<$Res>
    implements _$TenantModelCopyWith<$Res> {
  __$TenantModelCopyWithImpl(this._self, this._then);

  final _TenantModel _self;
  final $Res Function(_TenantModel) _then;

/// Create a copy of TenantModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? kind = freezed,Object? organisation = null,Object? displayName = null,Object? firstName = freezed,Object? lastName = freezed,Object? idNumber = freezed,Object? registeredName = freezed,Object? kraPin = freezed,Object? contactName = freezed,Object? phone = freezed,Object? email = freezed,Object? username = freezed,Object? invited = null,Object? estateId = freezed,Object? occupying = null,Object? status = null,Object? createdOn = freezed,}) {
  return _then(_TenantModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,kind: freezed == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as String?,organisation: null == organisation ? _self.organisation : organisation // ignore: cast_nullable_to_non_nullable
as bool,displayName: null == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String,firstName: freezed == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String?,lastName: freezed == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String?,idNumber: freezed == idNumber ? _self.idNumber : idNumber // ignore: cast_nullable_to_non_nullable
as String?,registeredName: freezed == registeredName ? _self.registeredName : registeredName // ignore: cast_nullable_to_non_nullable
as String?,kraPin: freezed == kraPin ? _self.kraPin : kraPin // ignore: cast_nullable_to_non_nullable
as String?,contactName: freezed == contactName ? _self.contactName : contactName // ignore: cast_nullable_to_non_nullable
as String?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,username: freezed == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String?,invited: null == invited ? _self.invited : invited // ignore: cast_nullable_to_non_nullable
as bool,estateId: freezed == estateId ? _self.estateId : estateId // ignore: cast_nullable_to_non_nullable
as String?,occupying: null == occupying ? _self._occupying : occupying // ignore: cast_nullable_to_non_nullable
as List<OccupiedUnitModel>,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as int,createdOn: freezed == createdOn ? _self.createdOn : createdOn // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$OccupiedUnitModel {

 String get houseId; String get houseCode;/// The unit as somebody reads it out — "K04 (Ground Floor)". Composed by the server.
 String get label;
/// Create a copy of OccupiedUnitModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OccupiedUnitModelCopyWith<OccupiedUnitModel> get copyWith => _$OccupiedUnitModelCopyWithImpl<OccupiedUnitModel>(this as OccupiedUnitModel, _$identity);

  /// Serializes this OccupiedUnitModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OccupiedUnitModel&&(identical(other.houseId, houseId) || other.houseId == houseId)&&(identical(other.houseCode, houseCode) || other.houseCode == houseCode)&&(identical(other.label, label) || other.label == label));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,houseId,houseCode,label);

@override
String toString() {
  return 'OccupiedUnitModel(houseId: $houseId, houseCode: $houseCode, label: $label)';
}


}

/// @nodoc
abstract mixin class $OccupiedUnitModelCopyWith<$Res>  {
  factory $OccupiedUnitModelCopyWith(OccupiedUnitModel value, $Res Function(OccupiedUnitModel) _then) = _$OccupiedUnitModelCopyWithImpl;
@useResult
$Res call({
 String houseId, String houseCode, String label
});




}
/// @nodoc
class _$OccupiedUnitModelCopyWithImpl<$Res>
    implements $OccupiedUnitModelCopyWith<$Res> {
  _$OccupiedUnitModelCopyWithImpl(this._self, this._then);

  final OccupiedUnitModel _self;
  final $Res Function(OccupiedUnitModel) _then;

/// Create a copy of OccupiedUnitModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? houseId = null,Object? houseCode = null,Object? label = null,}) {
  return _then(_self.copyWith(
houseId: null == houseId ? _self.houseId : houseId // ignore: cast_nullable_to_non_nullable
as String,houseCode: null == houseCode ? _self.houseCode : houseCode // ignore: cast_nullable_to_non_nullable
as String,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [OccupiedUnitModel].
extension OccupiedUnitModelPatterns on OccupiedUnitModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OccupiedUnitModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OccupiedUnitModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OccupiedUnitModel value)  $default,){
final _that = this;
switch (_that) {
case _OccupiedUnitModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OccupiedUnitModel value)?  $default,){
final _that = this;
switch (_that) {
case _OccupiedUnitModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String houseId,  String houseCode,  String label)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OccupiedUnitModel() when $default != null:
return $default(_that.houseId,_that.houseCode,_that.label);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String houseId,  String houseCode,  String label)  $default,) {final _that = this;
switch (_that) {
case _OccupiedUnitModel():
return $default(_that.houseId,_that.houseCode,_that.label);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String houseId,  String houseCode,  String label)?  $default,) {final _that = this;
switch (_that) {
case _OccupiedUnitModel() when $default != null:
return $default(_that.houseId,_that.houseCode,_that.label);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OccupiedUnitModel extends OccupiedUnitModel {
  const _OccupiedUnitModel({required this.houseId, required this.houseCode, required this.label}): super._();
  factory _OccupiedUnitModel.fromJson(Map<String, dynamic> json) => _$OccupiedUnitModelFromJson(json);

@override final  String houseId;
@override final  String houseCode;
/// The unit as somebody reads it out — "K04 (Ground Floor)". Composed by the server.
@override final  String label;

/// Create a copy of OccupiedUnitModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OccupiedUnitModelCopyWith<_OccupiedUnitModel> get copyWith => __$OccupiedUnitModelCopyWithImpl<_OccupiedUnitModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OccupiedUnitModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OccupiedUnitModel&&(identical(other.houseId, houseId) || other.houseId == houseId)&&(identical(other.houseCode, houseCode) || other.houseCode == houseCode)&&(identical(other.label, label) || other.label == label));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,houseId,houseCode,label);

@override
String toString() {
  return 'OccupiedUnitModel(houseId: $houseId, houseCode: $houseCode, label: $label)';
}


}

/// @nodoc
abstract mixin class _$OccupiedUnitModelCopyWith<$Res> implements $OccupiedUnitModelCopyWith<$Res> {
  factory _$OccupiedUnitModelCopyWith(_OccupiedUnitModel value, $Res Function(_OccupiedUnitModel) _then) = __$OccupiedUnitModelCopyWithImpl;
@override @useResult
$Res call({
 String houseId, String houseCode, String label
});




}
/// @nodoc
class __$OccupiedUnitModelCopyWithImpl<$Res>
    implements _$OccupiedUnitModelCopyWith<$Res> {
  __$OccupiedUnitModelCopyWithImpl(this._self, this._then);

  final _OccupiedUnitModel _self;
  final $Res Function(_OccupiedUnitModel) _then;

/// Create a copy of OccupiedUnitModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? houseId = null,Object? houseCode = null,Object? label = null,}) {
  return _then(_OccupiedUnitModel(
houseId: null == houseId ? _self.houseId : houseId // ignore: cast_nullable_to_non_nullable
as String,houseCode: null == houseCode ? _self.houseCode : houseCode // ignore: cast_nullable_to_non_nullable
as String,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
