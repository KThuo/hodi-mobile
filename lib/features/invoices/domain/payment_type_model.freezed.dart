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

/// Hashed. It goes back on the prompt, and is checked against what this invoice actually offers.
 String? get id; String? get name;/// `STK`, `VALIDATE`, `CASH`, `CHEQUE` or `TRANSFER`. Which form the pay screen should show.
 String get renderAs; String? get bankName; String? get bankLogoUrl; String? get payBillNo; String? get accountNo;
/// Create a copy of PaymentTypeModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PaymentTypeModelCopyWith<PaymentTypeModel> get copyWith => _$PaymentTypeModelCopyWithImpl<PaymentTypeModel>(this as PaymentTypeModel, _$identity);

  /// Serializes this PaymentTypeModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PaymentTypeModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.renderAs, renderAs) || other.renderAs == renderAs)&&(identical(other.bankName, bankName) || other.bankName == bankName)&&(identical(other.bankLogoUrl, bankLogoUrl) || other.bankLogoUrl == bankLogoUrl)&&(identical(other.payBillNo, payBillNo) || other.payBillNo == payBillNo)&&(identical(other.accountNo, accountNo) || other.accountNo == accountNo));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,renderAs,bankName,bankLogoUrl,payBillNo,accountNo);

@override
String toString() {
  return 'PaymentTypeModel(id: $id, name: $name, renderAs: $renderAs, bankName: $bankName, bankLogoUrl: $bankLogoUrl, payBillNo: $payBillNo, accountNo: $accountNo)';
}


}

/// @nodoc
abstract mixin class $PaymentTypeModelCopyWith<$Res>  {
  factory $PaymentTypeModelCopyWith(PaymentTypeModel value, $Res Function(PaymentTypeModel) _then) = _$PaymentTypeModelCopyWithImpl;
@useResult
$Res call({
 String? id, String? name, String renderAs, String? bankName, String? bankLogoUrl, String? payBillNo, String? accountNo
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
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? name = freezed,Object? renderAs = null,Object? bankName = freezed,Object? bankLogoUrl = freezed,Object? payBillNo = freezed,Object? accountNo = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,renderAs: null == renderAs ? _self.renderAs : renderAs // ignore: cast_nullable_to_non_nullable
as String,bankName: freezed == bankName ? _self.bankName : bankName // ignore: cast_nullable_to_non_nullable
as String?,bankLogoUrl: freezed == bankLogoUrl ? _self.bankLogoUrl : bankLogoUrl // ignore: cast_nullable_to_non_nullable
as String?,payBillNo: freezed == payBillNo ? _self.payBillNo : payBillNo // ignore: cast_nullable_to_non_nullable
as String?,accountNo: freezed == accountNo ? _self.accountNo : accountNo // ignore: cast_nullable_to_non_nullable
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id,  String? name,  String renderAs,  String? bankName,  String? bankLogoUrl,  String? payBillNo,  String? accountNo)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PaymentTypeModel() when $default != null:
return $default(_that.id,_that.name,_that.renderAs,_that.bankName,_that.bankLogoUrl,_that.payBillNo,_that.accountNo);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id,  String? name,  String renderAs,  String? bankName,  String? bankLogoUrl,  String? payBillNo,  String? accountNo)  $default,) {final _that = this;
switch (_that) {
case _PaymentTypeModel():
return $default(_that.id,_that.name,_that.renderAs,_that.bankName,_that.bankLogoUrl,_that.payBillNo,_that.accountNo);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id,  String? name,  String renderAs,  String? bankName,  String? bankLogoUrl,  String? payBillNo,  String? accountNo)?  $default,) {final _that = this;
switch (_that) {
case _PaymentTypeModel() when $default != null:
return $default(_that.id,_that.name,_that.renderAs,_that.bankName,_that.bankLogoUrl,_that.payBillNo,_that.accountNo);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PaymentTypeModel extends PaymentTypeModel {
  const _PaymentTypeModel({this.id, this.name, this.renderAs = '', this.bankName, this.bankLogoUrl, this.payBillNo, this.accountNo}): super._();
  factory _PaymentTypeModel.fromJson(Map<String, dynamic> json) => _$PaymentTypeModelFromJson(json);

/// Hashed. It goes back on the prompt, and is checked against what this invoice actually offers.
@override final  String? id;
@override final  String? name;
/// `STK`, `VALIDATE`, `CASH`, `CHEQUE` or `TRANSFER`. Which form the pay screen should show.
@override@JsonKey() final  String renderAs;
@override final  String? bankName;
@override final  String? bankLogoUrl;
@override final  String? payBillNo;
@override final  String? accountNo;

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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PaymentTypeModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.renderAs, renderAs) || other.renderAs == renderAs)&&(identical(other.bankName, bankName) || other.bankName == bankName)&&(identical(other.bankLogoUrl, bankLogoUrl) || other.bankLogoUrl == bankLogoUrl)&&(identical(other.payBillNo, payBillNo) || other.payBillNo == payBillNo)&&(identical(other.accountNo, accountNo) || other.accountNo == accountNo));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,renderAs,bankName,bankLogoUrl,payBillNo,accountNo);

@override
String toString() {
  return 'PaymentTypeModel(id: $id, name: $name, renderAs: $renderAs, bankName: $bankName, bankLogoUrl: $bankLogoUrl, payBillNo: $payBillNo, accountNo: $accountNo)';
}


}

/// @nodoc
abstract mixin class _$PaymentTypeModelCopyWith<$Res> implements $PaymentTypeModelCopyWith<$Res> {
  factory _$PaymentTypeModelCopyWith(_PaymentTypeModel value, $Res Function(_PaymentTypeModel) _then) = __$PaymentTypeModelCopyWithImpl;
@override @useResult
$Res call({
 String? id, String? name, String renderAs, String? bankName, String? bankLogoUrl, String? payBillNo, String? accountNo
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
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? name = freezed,Object? renderAs = null,Object? bankName = freezed,Object? bankLogoUrl = freezed,Object? payBillNo = freezed,Object? accountNo = freezed,}) {
  return _then(_PaymentTypeModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,renderAs: null == renderAs ? _self.renderAs : renderAs // ignore: cast_nullable_to_non_nullable
as String,bankName: freezed == bankName ? _self.bankName : bankName // ignore: cast_nullable_to_non_nullable
as String?,bankLogoUrl: freezed == bankLogoUrl ? _self.bankLogoUrl : bankLogoUrl // ignore: cast_nullable_to_non_nullable
as String?,payBillNo: freezed == payBillNo ? _self.payBillNo : payBillNo // ignore: cast_nullable_to_non_nullable
as String?,accountNo: freezed == accountNo ? _self.accountNo : accountNo // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
