// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payment_type_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PaymentTypeModel {

 String? get typeId; String? get bankId; String? get name;
/// Create a copy of PaymentTypeModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PaymentTypeModelCopyWith<PaymentTypeModel> get copyWith => _$PaymentTypeModelCopyWithImpl<PaymentTypeModel>(this as PaymentTypeModel, _$identity);

  /// Serializes this PaymentTypeModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PaymentTypeModel&&(identical(other.typeId, typeId) || other.typeId == typeId)&&(identical(other.bankId, bankId) || other.bankId == bankId)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,typeId,bankId,name);

@override
String toString() {
  return 'PaymentTypeModel(typeId: $typeId, bankId: $bankId, name: $name)';
}


}

/// @nodoc
abstract mixin class $PaymentTypeModelCopyWith<$Res>  {
  factory $PaymentTypeModelCopyWith(PaymentTypeModel value, $Res Function(PaymentTypeModel) _then) = _$PaymentTypeModelCopyWithImpl;
@useResult
$Res call({
 String? typeId, String? bankId, String? name
});




}
/// @nodoc
class _$PaymentTypeModelCopyWithImpl<$Res>
    implements $PaymentTypeModelCopyWith<$Res> {
  _$PaymentTypeModelCopyWithImpl(this._self, this._then);

  final PaymentTypeModel _self;
  final $Res Function(PaymentTypeModel) _then;

/// Create a copy of PaymentTypeModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? typeId = freezed,Object? bankId = freezed,Object? name = freezed,}) {
  return _then(_self.copyWith(
typeId: freezed == typeId ? _self.typeId : typeId // ignore: cast_nullable_to_non_nullable
as String?,bankId: freezed == bankId ? _self.bankId : bankId // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [PaymentTypeModel].
extension PaymentTypeModelPatterns on PaymentTypeModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PaymentTypeModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PaymentTypeModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PaymentTypeModel value)  $default,){
final _that = this;
switch (_that) {
case _PaymentTypeModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PaymentTypeModel value)?  $default,){
final _that = this;
switch (_that) {
case _PaymentTypeModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? typeId,  String? bankId,  String? name)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PaymentTypeModel() when $default != null:
return $default(_that.typeId,_that.bankId,_that.name);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? typeId,  String? bankId,  String? name)  $default,) {final _that = this;
switch (_that) {
case _PaymentTypeModel():
return $default(_that.typeId,_that.bankId,_that.name);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? typeId,  String? bankId,  String? name)?  $default,) {final _that = this;
switch (_that) {
case _PaymentTypeModel() when $default != null:
return $default(_that.typeId,_that.bankId,_that.name);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PaymentTypeModel extends PaymentTypeModel {
  const _PaymentTypeModel({this.typeId, this.bankId, this.name}): super._();
  factory _PaymentTypeModel.fromJson(Map<String, dynamic> json) => _$PaymentTypeModelFromJson(json);

@override final  String? typeId;
@override final  String? bankId;
@override final  String? name;

/// Create a copy of PaymentTypeModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PaymentTypeModelCopyWith<_PaymentTypeModel> get copyWith => __$PaymentTypeModelCopyWithImpl<_PaymentTypeModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PaymentTypeModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PaymentTypeModel&&(identical(other.typeId, typeId) || other.typeId == typeId)&&(identical(other.bankId, bankId) || other.bankId == bankId)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,typeId,bankId,name);

@override
String toString() {
  return 'PaymentTypeModel(typeId: $typeId, bankId: $bankId, name: $name)';
}


}

/// @nodoc
abstract mixin class _$PaymentTypeModelCopyWith<$Res> implements $PaymentTypeModelCopyWith<$Res> {
  factory _$PaymentTypeModelCopyWith(_PaymentTypeModel value, $Res Function(_PaymentTypeModel) _then) = __$PaymentTypeModelCopyWithImpl;
@override @useResult
$Res call({
 String? typeId, String? bankId, String? name
});




}
/// @nodoc
class __$PaymentTypeModelCopyWithImpl<$Res>
    implements _$PaymentTypeModelCopyWith<$Res> {
  __$PaymentTypeModelCopyWithImpl(this._self, this._then);

  final _PaymentTypeModel _self;
  final $Res Function(_PaymentTypeModel) _then;

/// Create a copy of PaymentTypeModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? typeId = freezed,Object? bankId = freezed,Object? name = freezed,}) {
  return _then(_PaymentTypeModel(
typeId: freezed == typeId ? _self.typeId : typeId // ignore: cast_nullable_to_non_nullable
as String?,bankId: freezed == bankId ? _self.bankId : bankId // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
