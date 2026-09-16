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

/// Hashed, and salted per user. It is an opaque string: never parse it, never sort by it, and
/// never cache anything under it across sign-ins.
 String get id; String get username; String get fullName; String? get firstName; String? get email; String? get phone;/// The code — `ADMIN`, `TENANT`. What behaviour keys off, where a flag below is not enough.
 String get userType;/// The type in words — "Estate Admin", not "ADMIN". What a person reads.
 String? get userTypeName; String? get estateName; String? get estateId; String? get bankName; String? get bankId; String? get bankLogoUrl; String? get userGroupName; List<String> get authorities; bool get superadmin; bool get bankadmin; bool get admin; bool get caretaker; bool get tenant;/// A new password is required before this account may do anything else.
 bool get mustChangePassword;/// Whether the handset that made this request can sign in with a PIN.
///
/// Answered per device by the server, not remembered by the app: a PIN can be removed from
/// another phone or spend its five tries, and an app trusting its own memory would keep drawing
/// a keypad that cannot work.
 bool get pinSet;
/// Create a copy of UserModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserModelCopyWith<UserModel> get copyWith => _$UserModelCopyWithImpl<UserModel>(this as UserModel, _$identity);

  /// Serializes this UserModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserModel&&(identical(other.id, id) || other.id == id)&&(identical(other.username, username) || other.username == username)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.email, email) || other.email == email)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.userType, userType) || other.userType == userType)&&(identical(other.userTypeName, userTypeName) || other.userTypeName == userTypeName)&&(identical(other.estateName, estateName) || other.estateName == estateName)&&(identical(other.estateId, estateId) || other.estateId == estateId)&&(identical(other.bankName, bankName) || other.bankName == bankName)&&(identical(other.bankId, bankId) || other.bankId == bankId)&&(identical(other.bankLogoUrl, bankLogoUrl) || other.bankLogoUrl == bankLogoUrl)&&(identical(other.userGroupName, userGroupName) || other.userGroupName == userGroupName)&&const DeepCollectionEquality().equals(other.authorities, authorities)&&(identical(other.superadmin, superadmin) || other.superadmin == superadmin)&&(identical(other.bankadmin, bankadmin) || other.bankadmin == bankadmin)&&(identical(other.admin, admin) || other.admin == admin)&&(identical(other.caretaker, caretaker) || other.caretaker == caretaker)&&(identical(other.tenant, tenant) || other.tenant == tenant)&&(identical(other.mustChangePassword, mustChangePassword) || other.mustChangePassword == mustChangePassword)&&(identical(other.pinSet, pinSet) || other.pinSet == pinSet));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,username,fullName,firstName,email,phone,userType,userTypeName,estateName,estateId,bankName,bankId,bankLogoUrl,userGroupName,const DeepCollectionEquality().hash(authorities),superadmin,bankadmin,admin,caretaker,tenant,mustChangePassword,pinSet]);

@override
String toString() {
  return 'UserModel(id: $id, username: $username, fullName: $fullName, firstName: $firstName, email: $email, phone: $phone, userType: $userType, userTypeName: $userTypeName, estateName: $estateName, estateId: $estateId, bankName: $bankName, bankId: $bankId, bankLogoUrl: $bankLogoUrl, userGroupName: $userGroupName, authorities: $authorities, superadmin: $superadmin, bankadmin: $bankadmin, admin: $admin, caretaker: $caretaker, tenant: $tenant, mustChangePassword: $mustChangePassword, pinSet: $pinSet)';
}


}

/// @nodoc
abstract mixin class $UserModelCopyWith<$Res>  {
  factory $UserModelCopyWith(UserModel value, $Res Function(UserModel) _then) = _$UserModelCopyWithImpl;
@useResult
$Res call({
 String id, String username, String fullName, String? firstName, String? email, String? phone, String userType, String? userTypeName, String? estateName, String? estateId, String? bankName, String? bankId, String? bankLogoUrl, String? userGroupName, List<String> authorities, bool superadmin, bool bankadmin, bool admin, bool caretaker, bool tenant, bool mustChangePassword, bool pinSet
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
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? username = null,Object? fullName = null,Object? firstName = freezed,Object? email = freezed,Object? phone = freezed,Object? userType = null,Object? userTypeName = freezed,Object? estateName = freezed,Object? estateId = freezed,Object? bankName = freezed,Object? bankId = freezed,Object? bankLogoUrl = freezed,Object? userGroupName = freezed,Object? authorities = null,Object? superadmin = null,Object? bankadmin = null,Object? admin = null,Object? caretaker = null,Object? tenant = null,Object? mustChangePassword = null,Object? pinSet = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,firstName: freezed == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,userType: null == userType ? _self.userType : userType // ignore: cast_nullable_to_non_nullable
as String,userTypeName: freezed == userTypeName ? _self.userTypeName : userTypeName // ignore: cast_nullable_to_non_nullable
as String?,estateName: freezed == estateName ? _self.estateName : estateName // ignore: cast_nullable_to_non_nullable
as String?,estateId: freezed == estateId ? _self.estateId : estateId // ignore: cast_nullable_to_non_nullable
as String?,bankName: freezed == bankName ? _self.bankName : bankName // ignore: cast_nullable_to_non_nullable
as String?,bankId: freezed == bankId ? _self.bankId : bankId // ignore: cast_nullable_to_non_nullable
as String?,bankLogoUrl: freezed == bankLogoUrl ? _self.bankLogoUrl : bankLogoUrl // ignore: cast_nullable_to_non_nullable
as String?,userGroupName: freezed == userGroupName ? _self.userGroupName : userGroupName // ignore: cast_nullable_to_non_nullable
as String?,authorities: null == authorities ? _self.authorities : authorities // ignore: cast_nullable_to_non_nullable
as List<String>,superadmin: null == superadmin ? _self.superadmin : superadmin // ignore: cast_nullable_to_non_nullable
as bool,bankadmin: null == bankadmin ? _self.bankadmin : bankadmin // ignore: cast_nullable_to_non_nullable
as bool,admin: null == admin ? _self.admin : admin // ignore: cast_nullable_to_non_nullable
as bool,caretaker: null == caretaker ? _self.caretaker : caretaker // ignore: cast_nullable_to_non_nullable
as bool,tenant: null == tenant ? _self.tenant : tenant // ignore: cast_nullable_to_non_nullable
as bool,mustChangePassword: null == mustChangePassword ? _self.mustChangePassword : mustChangePassword // ignore: cast_nullable_to_non_nullable
as bool,pinSet: null == pinSet ? _self.pinSet : pinSet // ignore: cast_nullable_to_non_nullable
as bool,
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String username,  String fullName,  String? firstName,  String? email,  String? phone,  String userType,  String? userTypeName,  String? estateName,  String? estateId,  String? bankName,  String? bankId,  String? bankLogoUrl,  String? userGroupName,  List<String> authorities,  bool superadmin,  bool bankadmin,  bool admin,  bool caretaker,  bool tenant,  bool mustChangePassword,  bool pinSet)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserModel() when $default != null:
return $default(_that.id,_that.username,_that.fullName,_that.firstName,_that.email,_that.phone,_that.userType,_that.userTypeName,_that.estateName,_that.estateId,_that.bankName,_that.bankId,_that.bankLogoUrl,_that.userGroupName,_that.authorities,_that.superadmin,_that.bankadmin,_that.admin,_that.caretaker,_that.tenant,_that.mustChangePassword,_that.pinSet);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String username,  String fullName,  String? firstName,  String? email,  String? phone,  String userType,  String? userTypeName,  String? estateName,  String? estateId,  String? bankName,  String? bankId,  String? bankLogoUrl,  String? userGroupName,  List<String> authorities,  bool superadmin,  bool bankadmin,  bool admin,  bool caretaker,  bool tenant,  bool mustChangePassword,  bool pinSet)  $default,) {final _that = this;
switch (_that) {
case _UserModel():
return $default(_that.id,_that.username,_that.fullName,_that.firstName,_that.email,_that.phone,_that.userType,_that.userTypeName,_that.estateName,_that.estateId,_that.bankName,_that.bankId,_that.bankLogoUrl,_that.userGroupName,_that.authorities,_that.superadmin,_that.bankadmin,_that.admin,_that.caretaker,_that.tenant,_that.mustChangePassword,_that.pinSet);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String username,  String fullName,  String? firstName,  String? email,  String? phone,  String userType,  String? userTypeName,  String? estateName,  String? estateId,  String? bankName,  String? bankId,  String? bankLogoUrl,  String? userGroupName,  List<String> authorities,  bool superadmin,  bool bankadmin,  bool admin,  bool caretaker,  bool tenant,  bool mustChangePassword,  bool pinSet)?  $default,) {final _that = this;
switch (_that) {
case _UserModel() when $default != null:
return $default(_that.id,_that.username,_that.fullName,_that.firstName,_that.email,_that.phone,_that.userType,_that.userTypeName,_that.estateName,_that.estateId,_that.bankName,_that.bankId,_that.bankLogoUrl,_that.userGroupName,_that.authorities,_that.superadmin,_that.bankadmin,_that.admin,_that.caretaker,_that.tenant,_that.mustChangePassword,_that.pinSet);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserModel extends UserModel {
  const _UserModel({required this.id, required this.username, required this.fullName, this.firstName, this.email, this.phone, required this.userType, this.userTypeName, this.estateName, this.estateId, this.bankName, this.bankId, this.bankLogoUrl, this.userGroupName, final  List<String> authorities = const [], this.superadmin = false, this.bankadmin = false, this.admin = false, this.caretaker = false, this.tenant = false, this.mustChangePassword = false, this.pinSet = false}): _authorities = authorities,super._();
  factory _UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);

/// Hashed, and salted per user. It is an opaque string: never parse it, never sort by it, and
/// never cache anything under it across sign-ins.
@override final  String id;
@override final  String username;
@override final  String fullName;
@override final  String? firstName;
@override final  String? email;
@override final  String? phone;
/// The code — `ADMIN`, `TENANT`. What behaviour keys off, where a flag below is not enough.
@override final  String userType;
/// The type in words — "Estate Admin", not "ADMIN". What a person reads.
@override final  String? userTypeName;
@override final  String? estateName;
@override final  String? estateId;
@override final  String? bankName;
@override final  String? bankId;
@override final  String? bankLogoUrl;
@override final  String? userGroupName;
 final  List<String> _authorities;
@override@JsonKey() List<String> get authorities {
  if (_authorities is EqualUnmodifiableListView) return _authorities;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_authorities);
}

@override@JsonKey() final  bool superadmin;
@override@JsonKey() final  bool bankadmin;
@override@JsonKey() final  bool admin;
@override@JsonKey() final  bool caretaker;
@override@JsonKey() final  bool tenant;
/// A new password is required before this account may do anything else.
@override@JsonKey() final  bool mustChangePassword;
/// Whether the handset that made this request can sign in with a PIN.
///
/// Answered per device by the server, not remembered by the app: a PIN can be removed from
/// another phone or spend its five tries, and an app trusting its own memory would keep drawing
/// a keypad that cannot work.
@override@JsonKey() final  bool pinSet;

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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserModel&&(identical(other.id, id) || other.id == id)&&(identical(other.username, username) || other.username == username)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.email, email) || other.email == email)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.userType, userType) || other.userType == userType)&&(identical(other.userTypeName, userTypeName) || other.userTypeName == userTypeName)&&(identical(other.estateName, estateName) || other.estateName == estateName)&&(identical(other.estateId, estateId) || other.estateId == estateId)&&(identical(other.bankName, bankName) || other.bankName == bankName)&&(identical(other.bankId, bankId) || other.bankId == bankId)&&(identical(other.bankLogoUrl, bankLogoUrl) || other.bankLogoUrl == bankLogoUrl)&&(identical(other.userGroupName, userGroupName) || other.userGroupName == userGroupName)&&const DeepCollectionEquality().equals(other._authorities, _authorities)&&(identical(other.superadmin, superadmin) || other.superadmin == superadmin)&&(identical(other.bankadmin, bankadmin) || other.bankadmin == bankadmin)&&(identical(other.admin, admin) || other.admin == admin)&&(identical(other.caretaker, caretaker) || other.caretaker == caretaker)&&(identical(other.tenant, tenant) || other.tenant == tenant)&&(identical(other.mustChangePassword, mustChangePassword) || other.mustChangePassword == mustChangePassword)&&(identical(other.pinSet, pinSet) || other.pinSet == pinSet));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,username,fullName,firstName,email,phone,userType,userTypeName,estateName,estateId,bankName,bankId,bankLogoUrl,userGroupName,const DeepCollectionEquality().hash(_authorities),superadmin,bankadmin,admin,caretaker,tenant,mustChangePassword,pinSet]);

@override
String toString() {
  return 'UserModel(id: $id, username: $username, fullName: $fullName, firstName: $firstName, email: $email, phone: $phone, userType: $userType, userTypeName: $userTypeName, estateName: $estateName, estateId: $estateId, bankName: $bankName, bankId: $bankId, bankLogoUrl: $bankLogoUrl, userGroupName: $userGroupName, authorities: $authorities, superadmin: $superadmin, bankadmin: $bankadmin, admin: $admin, caretaker: $caretaker, tenant: $tenant, mustChangePassword: $mustChangePassword, pinSet: $pinSet)';
}


}

/// @nodoc
abstract mixin class _$UserModelCopyWith<$Res> implements $UserModelCopyWith<$Res> {
  factory _$UserModelCopyWith(_UserModel value, $Res Function(_UserModel) _then) = __$UserModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String username, String fullName, String? firstName, String? email, String? phone, String userType, String? userTypeName, String? estateName, String? estateId, String? bankName, String? bankId, String? bankLogoUrl, String? userGroupName, List<String> authorities, bool superadmin, bool bankadmin, bool admin, bool caretaker, bool tenant, bool mustChangePassword, bool pinSet
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
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? username = null,Object? fullName = null,Object? firstName = freezed,Object? email = freezed,Object? phone = freezed,Object? userType = null,Object? userTypeName = freezed,Object? estateName = freezed,Object? estateId = freezed,Object? bankName = freezed,Object? bankId = freezed,Object? bankLogoUrl = freezed,Object? userGroupName = freezed,Object? authorities = null,Object? superadmin = null,Object? bankadmin = null,Object? admin = null,Object? caretaker = null,Object? tenant = null,Object? mustChangePassword = null,Object? pinSet = null,}) {
  return _then(_UserModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,firstName: freezed == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,userType: null == userType ? _self.userType : userType // ignore: cast_nullable_to_non_nullable
as String,userTypeName: freezed == userTypeName ? _self.userTypeName : userTypeName // ignore: cast_nullable_to_non_nullable
as String?,estateName: freezed == estateName ? _self.estateName : estateName // ignore: cast_nullable_to_non_nullable
as String?,estateId: freezed == estateId ? _self.estateId : estateId // ignore: cast_nullable_to_non_nullable
as String?,bankName: freezed == bankName ? _self.bankName : bankName // ignore: cast_nullable_to_non_nullable
as String?,bankId: freezed == bankId ? _self.bankId : bankId // ignore: cast_nullable_to_non_nullable
as String?,bankLogoUrl: freezed == bankLogoUrl ? _self.bankLogoUrl : bankLogoUrl // ignore: cast_nullable_to_non_nullable
as String?,userGroupName: freezed == userGroupName ? _self.userGroupName : userGroupName // ignore: cast_nullable_to_non_nullable
as String?,authorities: null == authorities ? _self._authorities : authorities // ignore: cast_nullable_to_non_nullable
as List<String>,superadmin: null == superadmin ? _self.superadmin : superadmin // ignore: cast_nullable_to_non_nullable
as bool,bankadmin: null == bankadmin ? _self.bankadmin : bankadmin // ignore: cast_nullable_to_non_nullable
as bool,admin: null == admin ? _self.admin : admin // ignore: cast_nullable_to_non_nullable
as bool,caretaker: null == caretaker ? _self.caretaker : caretaker // ignore: cast_nullable_to_non_nullable
as bool,tenant: null == tenant ? _self.tenant : tenant // ignore: cast_nullable_to_non_nullable
as bool,mustChangePassword: null == mustChangePassword ? _self.mustChangePassword : mustChangePassword // ignore: cast_nullable_to_non_nullable
as bool,pinSet: null == pinSet ? _self.pinSet : pinSet // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
