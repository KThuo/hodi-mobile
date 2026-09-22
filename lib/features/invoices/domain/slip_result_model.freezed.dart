// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'slip_result_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SlipResultModel {

 bool get valid; String get message; String? get statementId; String? get reference;@JsonKey(fromJson: parseDoubleNullable) double? get amount; String? get paidOn; String? get payerName;/// `LOCAL` when the credit was already here, `GATEWAY` when the bank confirmed it just now.
 String? get confirmedBy; String? get paymentTypeId; String? get paymentTypeName;
/// Create a copy of SlipResultModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SlipResultModelCopyWith<SlipResultModel> get copyWith => _$SlipResultModelCopyWithImpl<SlipResultModel>(this as SlipResultModel, _$identity);

  /// Serializes this SlipResultModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SlipResultModel&&(identical(other.valid, valid) || other.valid == valid)&&(identical(other.message, message) || other.message == message)&&(identical(other.statementId, statementId) || other.statementId == statementId)&&(identical(other.reference, reference) || other.reference == reference)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.paidOn, paidOn) || other.paidOn == paidOn)&&(identical(other.payerName, payerName) || other.payerName == payerName)&&(identical(other.confirmedBy, confirmedBy) || other.confirmedBy == confirmedBy)&&(identical(other.paymentTypeId, paymentTypeId) || other.paymentTypeId == paymentTypeId)&&(identical(other.paymentTypeName, paymentTypeName) || other.paymentTypeName == paymentTypeName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,valid,message,statementId,reference,amount,paidOn,payerName,confirmedBy,paymentTypeId,paymentTypeName);

@override
String toString() {
  return 'SlipResultModel(valid: $valid, message: $message, statementId: $statementId, reference: $reference, amount: $amount, paidOn: $paidOn, payerName: $payerName, confirmedBy: $confirmedBy, paymentTypeId: $paymentTypeId, paymentTypeName: $paymentTypeName)';
}


}

/// @nodoc
abstract mixin class $SlipResultModelCopyWith<$Res>  {
  factory $SlipResultModelCopyWith(SlipResultModel value, $Res Function(SlipResultModel) _then) = _$SlipResultModelCopyWithImpl;
@useResult
$Res call({
 bool valid, String message, String? statementId, String? reference,@JsonKey(fromJson: parseDoubleNullable) double? amount, String? paidOn, String? payerName, String? confirmedBy, String? paymentTypeId, String? paymentTypeName
});




}
/// @nodoc
class _$SlipResultModelCopyWithImpl<$Res>
    implements $SlipResultModelCopyWith<$Res> {
  _$SlipResultModelCopyWithImpl(this._self, this._then);

  final SlipResultModel _self;
  final $Res Function(SlipResultModel) _then;

/// Create a copy of SlipResultModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? valid = null,Object? message = null,Object? statementId = freezed,Object? reference = freezed,Object? amount = freezed,Object? paidOn = freezed,Object? payerName = freezed,Object? confirmedBy = freezed,Object? paymentTypeId = freezed,Object? paymentTypeName = freezed,}) {
  return _then(_self.copyWith(
valid: null == valid ? _self.valid : valid // ignore: cast_nullable_to_non_nullable
as bool,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,statementId: freezed == statementId ? _self.statementId : statementId // ignore: cast_nullable_to_non_nullable
as String?,reference: freezed == reference ? _self.reference : reference // ignore: cast_nullable_to_non_nullable
as String?,amount: freezed == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double?,paidOn: freezed == paidOn ? _self.paidOn : paidOn // ignore: cast_nullable_to_non_nullable
as String?,payerName: freezed == payerName ? _self.payerName : payerName // ignore: cast_nullable_to_non_nullable
as String?,confirmedBy: freezed == confirmedBy ? _self.confirmedBy : confirmedBy // ignore: cast_nullable_to_non_nullable
as String?,paymentTypeId: freezed == paymentTypeId ? _self.paymentTypeId : paymentTypeId // ignore: cast_nullable_to_non_nullable
as String?,paymentTypeName: freezed == paymentTypeName ? _self.paymentTypeName : paymentTypeName // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [SlipResultModel].
extension SlipResultModelPatterns on SlipResultModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SlipResultModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SlipResultModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SlipResultModel value)  $default,){
final _that = this;
switch (_that) {
case _SlipResultModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SlipResultModel value)?  $default,){
final _that = this;
switch (_that) {
case _SlipResultModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool valid,  String message,  String? statementId,  String? reference, @JsonKey(fromJson: parseDoubleNullable)  double? amount,  String? paidOn,  String? payerName,  String? confirmedBy,  String? paymentTypeId,  String? paymentTypeName)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SlipResultModel() when $default != null:
return $default(_that.valid,_that.message,_that.statementId,_that.reference,_that.amount,_that.paidOn,_that.payerName,_that.confirmedBy,_that.paymentTypeId,_that.paymentTypeName);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool valid,  String message,  String? statementId,  String? reference, @JsonKey(fromJson: parseDoubleNullable)  double? amount,  String? paidOn,  String? payerName,  String? confirmedBy,  String? paymentTypeId,  String? paymentTypeName)  $default,) {final _that = this;
switch (_that) {
case _SlipResultModel():
return $default(_that.valid,_that.message,_that.statementId,_that.reference,_that.amount,_that.paidOn,_that.payerName,_that.confirmedBy,_that.paymentTypeId,_that.paymentTypeName);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool valid,  String message,  String? statementId,  String? reference, @JsonKey(fromJson: parseDoubleNullable)  double? amount,  String? paidOn,  String? payerName,  String? confirmedBy,  String? paymentTypeId,  String? paymentTypeName)?  $default,) {final _that = this;
switch (_that) {
case _SlipResultModel() when $default != null:
return $default(_that.valid,_that.message,_that.statementId,_that.reference,_that.amount,_that.paidOn,_that.payerName,_that.confirmedBy,_that.paymentTypeId,_that.paymentTypeName);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SlipResultModel extends SlipResultModel {
  const _SlipResultModel({this.valid = false, this.message = '', this.statementId, this.reference, @JsonKey(fromJson: parseDoubleNullable) this.amount, this.paidOn, this.payerName, this.confirmedBy, this.paymentTypeId, this.paymentTypeName}): super._();
  factory _SlipResultModel.fromJson(Map<String, dynamic> json) => _$SlipResultModelFromJson(json);

@override@JsonKey() final  bool valid;
@override@JsonKey() final  String message;
@override final  String? statementId;
@override final  String? reference;
@override@JsonKey(fromJson: parseDoubleNullable) final  double? amount;
@override final  String? paidOn;
@override final  String? payerName;
/// `LOCAL` when the credit was already here, `GATEWAY` when the bank confirmed it just now.
@override final  String? confirmedBy;
@override final  String? paymentTypeId;
@override final  String? paymentTypeName;

/// Create a copy of SlipResultModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SlipResultModelCopyWith<_SlipResultModel> get copyWith => __$SlipResultModelCopyWithImpl<_SlipResultModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SlipResultModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SlipResultModel&&(identical(other.valid, valid) || other.valid == valid)&&(identical(other.message, message) || other.message == message)&&(identical(other.statementId, statementId) || other.statementId == statementId)&&(identical(other.reference, reference) || other.reference == reference)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.paidOn, paidOn) || other.paidOn == paidOn)&&(identical(other.payerName, payerName) || other.payerName == payerName)&&(identical(other.confirmedBy, confirmedBy) || other.confirmedBy == confirmedBy)&&(identical(other.paymentTypeId, paymentTypeId) || other.paymentTypeId == paymentTypeId)&&(identical(other.paymentTypeName, paymentTypeName) || other.paymentTypeName == paymentTypeName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,valid,message,statementId,reference,amount,paidOn,payerName,confirmedBy,paymentTypeId,paymentTypeName);

@override
String toString() {
  return 'SlipResultModel(valid: $valid, message: $message, statementId: $statementId, reference: $reference, amount: $amount, paidOn: $paidOn, payerName: $payerName, confirmedBy: $confirmedBy, paymentTypeId: $paymentTypeId, paymentTypeName: $paymentTypeName)';
}


}

/// @nodoc
abstract mixin class _$SlipResultModelCopyWith<$Res> implements $SlipResultModelCopyWith<$Res> {
  factory _$SlipResultModelCopyWith(_SlipResultModel value, $Res Function(_SlipResultModel) _then) = __$SlipResultModelCopyWithImpl;
@override @useResult
$Res call({
 bool valid, String message, String? statementId, String? reference,@JsonKey(fromJson: parseDoubleNullable) double? amount, String? paidOn, String? payerName, String? confirmedBy, String? paymentTypeId, String? paymentTypeName
});




}
/// @nodoc
class __$SlipResultModelCopyWithImpl<$Res>
    implements _$SlipResultModelCopyWith<$Res> {
  __$SlipResultModelCopyWithImpl(this._self, this._then);

  final _SlipResultModel _self;
  final $Res Function(_SlipResultModel) _then;

/// Create a copy of SlipResultModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? valid = null,Object? message = null,Object? statementId = freezed,Object? reference = freezed,Object? amount = freezed,Object? paidOn = freezed,Object? payerName = freezed,Object? confirmedBy = freezed,Object? paymentTypeId = freezed,Object? paymentTypeName = freezed,}) {
  return _then(_SlipResultModel(
valid: null == valid ? _self.valid : valid // ignore: cast_nullable_to_non_nullable
as bool,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,statementId: freezed == statementId ? _self.statementId : statementId // ignore: cast_nullable_to_non_nullable
as String?,reference: freezed == reference ? _self.reference : reference // ignore: cast_nullable_to_non_nullable
as String?,amount: freezed == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double?,paidOn: freezed == paidOn ? _self.paidOn : paidOn // ignore: cast_nullable_to_non_nullable
as String?,payerName: freezed == payerName ? _self.payerName : payerName // ignore: cast_nullable_to_non_nullable
as String?,confirmedBy: freezed == confirmedBy ? _self.confirmedBy : confirmedBy // ignore: cast_nullable_to_non_nullable
as String?,paymentTypeId: freezed == paymentTypeId ? _self.paymentTypeId : paymentTypeId // ignore: cast_nullable_to_non_nullable
as String?,paymentTypeName: freezed == paymentTypeName ? _self.paymentTypeName : paymentTypeName // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
