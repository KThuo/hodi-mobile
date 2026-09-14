// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'token_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TokenModel {

 String get accessToken;/// The credential that outlives the access token, and the only one worth protecting.
///
/// The app used to keep the person's **password** in secure storage so biometric unlock could
/// sign in again with it. This replaces that: a refresh token is revocable server-side, scoped
/// to one session family, and useless once the session ends — none of which is true of a
/// password, which also unlocks the web console and anything else it was reused on.
 String get refreshToken;/// When the access token dies, as epoch milliseconds.
///
/// Stored absolute although the wire sends `expiresIn` seconds: a duration is only meaningful
/// beside the moment it was received, and that moment is gone by the time anything reads this.
 int get expiresAt;/// How long the session may sit idle before the client ends it, in seconds.
///
/// Not the same question as [expiresAt] and deliberately separate on the wire. The token's life
/// is how often the client must rotate; this is how long somebody may walk away. The watchdog
/// used to read the token lifetime for want of anything else, which tied being signed out for
/// inactivity to a number chosen for unrelated reasons.
 int get sessionTimeoutSeconds;
/// Create a copy of TokenModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TokenModelCopyWith<TokenModel> get copyWith => _$TokenModelCopyWithImpl<TokenModel>(this as TokenModel, _$identity);

  /// Serializes this TokenModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TokenModel&&(identical(other.accessToken, accessToken) || other.accessToken == accessToken)&&(identical(other.refreshToken, refreshToken) || other.refreshToken == refreshToken)&&(identical(other.expiresAt, expiresAt) || other.expiresAt == expiresAt)&&(identical(other.sessionTimeoutSeconds, sessionTimeoutSeconds) || other.sessionTimeoutSeconds == sessionTimeoutSeconds));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,accessToken,refreshToken,expiresAt,sessionTimeoutSeconds);

@override
String toString() {
  return 'TokenModel(accessToken: $accessToken, refreshToken: $refreshToken, expiresAt: $expiresAt, sessionTimeoutSeconds: $sessionTimeoutSeconds)';
}


}

/// @nodoc
abstract mixin class $TokenModelCopyWith<$Res>  {
  factory $TokenModelCopyWith(TokenModel value, $Res Function(TokenModel) _then) = _$TokenModelCopyWithImpl;
@useResult
$Res call({
 String accessToken, String refreshToken, int expiresAt, int sessionTimeoutSeconds
});




}
/// @nodoc
class _$TokenModelCopyWithImpl<$Res>
    implements $TokenModelCopyWith<$Res> {
  _$TokenModelCopyWithImpl(this._self, this._then);

  final TokenModel _self;
  final $Res Function(TokenModel) _then;

/// Create a copy of TokenModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? accessToken = null,Object? refreshToken = null,Object? expiresAt = null,Object? sessionTimeoutSeconds = null,}) {
  return _then(_self.copyWith(
accessToken: null == accessToken ? _self.accessToken : accessToken // ignore: cast_nullable_to_non_nullable
as String,refreshToken: null == refreshToken ? _self.refreshToken : refreshToken // ignore: cast_nullable_to_non_nullable
as String,expiresAt: null == expiresAt ? _self.expiresAt : expiresAt // ignore: cast_nullable_to_non_nullable
as int,sessionTimeoutSeconds: null == sessionTimeoutSeconds ? _self.sessionTimeoutSeconds : sessionTimeoutSeconds // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [TokenModel].
extension TokenModelPatterns on TokenModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TokenModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TokenModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TokenModel value)  $default,){
final _that = this;
switch (_that) {
case _TokenModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TokenModel value)?  $default,){
final _that = this;
switch (_that) {
case _TokenModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String accessToken,  String refreshToken,  int expiresAt,  int sessionTimeoutSeconds)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TokenModel() when $default != null:
return $default(_that.accessToken,_that.refreshToken,_that.expiresAt,_that.sessionTimeoutSeconds);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String accessToken,  String refreshToken,  int expiresAt,  int sessionTimeoutSeconds)  $default,) {final _that = this;
switch (_that) {
case _TokenModel():
return $default(_that.accessToken,_that.refreshToken,_that.expiresAt,_that.sessionTimeoutSeconds);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String accessToken,  String refreshToken,  int expiresAt,  int sessionTimeoutSeconds)?  $default,) {final _that = this;
switch (_that) {
case _TokenModel() when $default != null:
return $default(_that.accessToken,_that.refreshToken,_that.expiresAt,_that.sessionTimeoutSeconds);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TokenModel extends TokenModel {
  const _TokenModel({required this.accessToken, required this.refreshToken, required this.expiresAt, this.sessionTimeoutSeconds = 0}): super._();
  factory _TokenModel.fromJson(Map<String, dynamic> json) => _$TokenModelFromJson(json);

@override final  String accessToken;
/// The credential that outlives the access token, and the only one worth protecting.
///
/// The app used to keep the person's **password** in secure storage so biometric unlock could
/// sign in again with it. This replaces that: a refresh token is revocable server-side, scoped
/// to one session family, and useless once the session ends — none of which is true of a
/// password, which also unlocks the web console and anything else it was reused on.
@override final  String refreshToken;
/// When the access token dies, as epoch milliseconds.
///
/// Stored absolute although the wire sends `expiresIn` seconds: a duration is only meaningful
/// beside the moment it was received, and that moment is gone by the time anything reads this.
@override final  int expiresAt;
/// How long the session may sit idle before the client ends it, in seconds.
///
/// Not the same question as [expiresAt] and deliberately separate on the wire. The token's life
/// is how often the client must rotate; this is how long somebody may walk away. The watchdog
/// used to read the token lifetime for want of anything else, which tied being signed out for
/// inactivity to a number chosen for unrelated reasons.
@override@JsonKey() final  int sessionTimeoutSeconds;

/// Create a copy of TokenModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TokenModelCopyWith<_TokenModel> get copyWith => __$TokenModelCopyWithImpl<_TokenModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TokenModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TokenModel&&(identical(other.accessToken, accessToken) || other.accessToken == accessToken)&&(identical(other.refreshToken, refreshToken) || other.refreshToken == refreshToken)&&(identical(other.expiresAt, expiresAt) || other.expiresAt == expiresAt)&&(identical(other.sessionTimeoutSeconds, sessionTimeoutSeconds) || other.sessionTimeoutSeconds == sessionTimeoutSeconds));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,accessToken,refreshToken,expiresAt,sessionTimeoutSeconds);

@override
String toString() {
  return 'TokenModel(accessToken: $accessToken, refreshToken: $refreshToken, expiresAt: $expiresAt, sessionTimeoutSeconds: $sessionTimeoutSeconds)';
}


}

/// @nodoc
abstract mixin class _$TokenModelCopyWith<$Res> implements $TokenModelCopyWith<$Res> {
  factory _$TokenModelCopyWith(_TokenModel value, $Res Function(_TokenModel) _then) = __$TokenModelCopyWithImpl;
@override @useResult
$Res call({
 String accessToken, String refreshToken, int expiresAt, int sessionTimeoutSeconds
});




}
/// @nodoc
class __$TokenModelCopyWithImpl<$Res>
    implements _$TokenModelCopyWith<$Res> {
  __$TokenModelCopyWithImpl(this._self, this._then);

  final _TokenModel _self;
  final $Res Function(_TokenModel) _then;

/// Create a copy of TokenModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? accessToken = null,Object? refreshToken = null,Object? expiresAt = null,Object? sessionTimeoutSeconds = null,}) {
  return _then(_TokenModel(
accessToken: null == accessToken ? _self.accessToken : accessToken // ignore: cast_nullable_to_non_nullable
as String,refreshToken: null == refreshToken ? _self.refreshToken : refreshToken // ignore: cast_nullable_to_non_nullable
as String,expiresAt: null == expiresAt ? _self.expiresAt : expiresAt // ignore: cast_nullable_to_non_nullable
as int,sessionTimeoutSeconds: null == sessionTimeoutSeconds ? _self.sessionTimeoutSeconds : sessionTimeoutSeconds // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
