// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payment_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PaymentModel {

/// Hashed and salted per user. Opaque.
 String? get id;/// The receipt number, which is what a tenant quotes.
 String? get rrn; int get status; String? get statusLabel;/// `CASH`, `STK`, `TRANSFER` — the machine-readable channel.
 String? get method;/// The channel in words, from the server, which is what gets shown.
 String? get methodLabel;/// The payer's own reference — an M-PESA code, a cheque number, a slip.
 String? get reference; String? get tenantName; String? get paidBy; String? get payerPhone; String? get houseCode; String? get houseNumber; String? get houseLabel; String? get propertyName; String? get estateName;/// What arrived.
@JsonKey(fromJson: parseDouble) double get amount;/// How much of it was put against invoices.
@JsonKey(fromJson: parseDouble) double get allocatedAmount;/// What is still standing as credit on the tenancy.
@JsonKey(fromJson: parseDouble) double get unallocated;/// How many invoices it was spread across. One payment can settle several months.
 int get invoiceCount;/// The invoice it was aimed at, where it was aimed at one.
 String? get invoiceRrn; String? get receivedOn; String? get narration; String? get occupationId; String? get houseId; String? get voidReason;/// The unit's category — "Two bedroom", "Shop". Shown to a tenant, who knows their unit by what
/// it is rather than by its code.
 String? get categoryName;/// What the tenancy owed after this payment, and before it.
///
/// Carried on the receipt because that is the question a tenant asks next, and answering it
/// from a balance fetched later would show what they owe *now* rather than what this payment
/// left them owing.
@JsonKey(fromJson: parseDouble) double get rentOwed;@JsonKey(fromJson: parseDouble) double get rentOwedBefore;
/// Create a copy of PaymentModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PaymentModelCopyWith<PaymentModel> get copyWith => _$PaymentModelCopyWithImpl<PaymentModel>(this as PaymentModel, _$identity);

  /// Serializes this PaymentModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PaymentModel&&(identical(other.id, id) || other.id == id)&&(identical(other.rrn, rrn) || other.rrn == rrn)&&(identical(other.status, status) || other.status == status)&&(identical(other.statusLabel, statusLabel) || other.statusLabel == statusLabel)&&(identical(other.method, method) || other.method == method)&&(identical(other.methodLabel, methodLabel) || other.methodLabel == methodLabel)&&(identical(other.reference, reference) || other.reference == reference)&&(identical(other.tenantName, tenantName) || other.tenantName == tenantName)&&(identical(other.paidBy, paidBy) || other.paidBy == paidBy)&&(identical(other.payerPhone, payerPhone) || other.payerPhone == payerPhone)&&(identical(other.houseCode, houseCode) || other.houseCode == houseCode)&&(identical(other.houseNumber, houseNumber) || other.houseNumber == houseNumber)&&(identical(other.houseLabel, houseLabel) || other.houseLabel == houseLabel)&&(identical(other.propertyName, propertyName) || other.propertyName == propertyName)&&(identical(other.estateName, estateName) || other.estateName == estateName)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.allocatedAmount, allocatedAmount) || other.allocatedAmount == allocatedAmount)&&(identical(other.unallocated, unallocated) || other.unallocated == unallocated)&&(identical(other.invoiceCount, invoiceCount) || other.invoiceCount == invoiceCount)&&(identical(other.invoiceRrn, invoiceRrn) || other.invoiceRrn == invoiceRrn)&&(identical(other.receivedOn, receivedOn) || other.receivedOn == receivedOn)&&(identical(other.narration, narration) || other.narration == narration)&&(identical(other.occupationId, occupationId) || other.occupationId == occupationId)&&(identical(other.houseId, houseId) || other.houseId == houseId)&&(identical(other.voidReason, voidReason) || other.voidReason == voidReason)&&(identical(other.categoryName, categoryName) || other.categoryName == categoryName)&&(identical(other.rentOwed, rentOwed) || other.rentOwed == rentOwed)&&(identical(other.rentOwedBefore, rentOwedBefore) || other.rentOwedBefore == rentOwedBefore));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,rrn,status,statusLabel,method,methodLabel,reference,tenantName,paidBy,payerPhone,houseCode,houseNumber,houseLabel,propertyName,estateName,amount,allocatedAmount,unallocated,invoiceCount,invoiceRrn,receivedOn,narration,occupationId,houseId,voidReason,categoryName,rentOwed,rentOwedBefore]);

@override
String toString() {
  return 'PaymentModel(id: $id, rrn: $rrn, status: $status, statusLabel: $statusLabel, method: $method, methodLabel: $methodLabel, reference: $reference, tenantName: $tenantName, paidBy: $paidBy, payerPhone: $payerPhone, houseCode: $houseCode, houseNumber: $houseNumber, houseLabel: $houseLabel, propertyName: $propertyName, estateName: $estateName, amount: $amount, allocatedAmount: $allocatedAmount, unallocated: $unallocated, invoiceCount: $invoiceCount, invoiceRrn: $invoiceRrn, receivedOn: $receivedOn, narration: $narration, occupationId: $occupationId, houseId: $houseId, voidReason: $voidReason, categoryName: $categoryName, rentOwed: $rentOwed, rentOwedBefore: $rentOwedBefore)';
}


}

/// @nodoc
abstract mixin class $PaymentModelCopyWith<$Res>  {
  factory $PaymentModelCopyWith(PaymentModel value, $Res Function(PaymentModel) _then) = _$PaymentModelCopyWithImpl;
@useResult
$Res call({
 String? id, String? rrn, int status, String? statusLabel, String? method, String? methodLabel, String? reference, String? tenantName, String? paidBy, String? payerPhone, String? houseCode, String? houseNumber, String? houseLabel, String? propertyName, String? estateName,@JsonKey(fromJson: parseDouble) double amount,@JsonKey(fromJson: parseDouble) double allocatedAmount,@JsonKey(fromJson: parseDouble) double unallocated, int invoiceCount, String? invoiceRrn, String? receivedOn, String? narration, String? occupationId, String? houseId, String? voidReason, String? categoryName,@JsonKey(fromJson: parseDouble) double rentOwed,@JsonKey(fromJson: parseDouble) double rentOwedBefore
});




}
/// @nodoc
class _$PaymentModelCopyWithImpl<$Res>
    implements $PaymentModelCopyWith<$Res> {
  _$PaymentModelCopyWithImpl(this._self, this._then);

  final PaymentModel _self;
  final $Res Function(PaymentModel) _then;

/// Create a copy of PaymentModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? rrn = freezed,Object? status = null,Object? statusLabel = freezed,Object? method = freezed,Object? methodLabel = freezed,Object? reference = freezed,Object? tenantName = freezed,Object? paidBy = freezed,Object? payerPhone = freezed,Object? houseCode = freezed,Object? houseNumber = freezed,Object? houseLabel = freezed,Object? propertyName = freezed,Object? estateName = freezed,Object? amount = null,Object? allocatedAmount = null,Object? unallocated = null,Object? invoiceCount = null,Object? invoiceRrn = freezed,Object? receivedOn = freezed,Object? narration = freezed,Object? occupationId = freezed,Object? houseId = freezed,Object? voidReason = freezed,Object? categoryName = freezed,Object? rentOwed = null,Object? rentOwedBefore = null,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,rrn: freezed == rrn ? _self.rrn : rrn // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as int,statusLabel: freezed == statusLabel ? _self.statusLabel : statusLabel // ignore: cast_nullable_to_non_nullable
as String?,method: freezed == method ? _self.method : method // ignore: cast_nullable_to_non_nullable
as String?,methodLabel: freezed == methodLabel ? _self.methodLabel : methodLabel // ignore: cast_nullable_to_non_nullable
as String?,reference: freezed == reference ? _self.reference : reference // ignore: cast_nullable_to_non_nullable
as String?,tenantName: freezed == tenantName ? _self.tenantName : tenantName // ignore: cast_nullable_to_non_nullable
as String?,paidBy: freezed == paidBy ? _self.paidBy : paidBy // ignore: cast_nullable_to_non_nullable
as String?,payerPhone: freezed == payerPhone ? _self.payerPhone : payerPhone // ignore: cast_nullable_to_non_nullable
as String?,houseCode: freezed == houseCode ? _self.houseCode : houseCode // ignore: cast_nullable_to_non_nullable
as String?,houseNumber: freezed == houseNumber ? _self.houseNumber : houseNumber // ignore: cast_nullable_to_non_nullable
as String?,houseLabel: freezed == houseLabel ? _self.houseLabel : houseLabel // ignore: cast_nullable_to_non_nullable
as String?,propertyName: freezed == propertyName ? _self.propertyName : propertyName // ignore: cast_nullable_to_non_nullable
as String?,estateName: freezed == estateName ? _self.estateName : estateName // ignore: cast_nullable_to_non_nullable
as String?,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,allocatedAmount: null == allocatedAmount ? _self.allocatedAmount : allocatedAmount // ignore: cast_nullable_to_non_nullable
as double,unallocated: null == unallocated ? _self.unallocated : unallocated // ignore: cast_nullable_to_non_nullable
as double,invoiceCount: null == invoiceCount ? _self.invoiceCount : invoiceCount // ignore: cast_nullable_to_non_nullable
as int,invoiceRrn: freezed == invoiceRrn ? _self.invoiceRrn : invoiceRrn // ignore: cast_nullable_to_non_nullable
as String?,receivedOn: freezed == receivedOn ? _self.receivedOn : receivedOn // ignore: cast_nullable_to_non_nullable
as String?,narration: freezed == narration ? _self.narration : narration // ignore: cast_nullable_to_non_nullable
as String?,occupationId: freezed == occupationId ? _self.occupationId : occupationId // ignore: cast_nullable_to_non_nullable
as String?,houseId: freezed == houseId ? _self.houseId : houseId // ignore: cast_nullable_to_non_nullable
as String?,voidReason: freezed == voidReason ? _self.voidReason : voidReason // ignore: cast_nullable_to_non_nullable
as String?,categoryName: freezed == categoryName ? _self.categoryName : categoryName // ignore: cast_nullable_to_non_nullable
as String?,rentOwed: null == rentOwed ? _self.rentOwed : rentOwed // ignore: cast_nullable_to_non_nullable
as double,rentOwedBefore: null == rentOwedBefore ? _self.rentOwedBefore : rentOwedBefore // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [PaymentModel].
extension PaymentModelPatterns on PaymentModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PaymentModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PaymentModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PaymentModel value)  $default,){
final _that = this;
switch (_that) {
case _PaymentModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PaymentModel value)?  $default,){
final _that = this;
switch (_that) {
case _PaymentModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id,  String? rrn,  int status,  String? statusLabel,  String? method,  String? methodLabel,  String? reference,  String? tenantName,  String? paidBy,  String? payerPhone,  String? houseCode,  String? houseNumber,  String? houseLabel,  String? propertyName,  String? estateName, @JsonKey(fromJson: parseDouble)  double amount, @JsonKey(fromJson: parseDouble)  double allocatedAmount, @JsonKey(fromJson: parseDouble)  double unallocated,  int invoiceCount,  String? invoiceRrn,  String? receivedOn,  String? narration,  String? occupationId,  String? houseId,  String? voidReason,  String? categoryName, @JsonKey(fromJson: parseDouble)  double rentOwed, @JsonKey(fromJson: parseDouble)  double rentOwedBefore)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PaymentModel() when $default != null:
return $default(_that.id,_that.rrn,_that.status,_that.statusLabel,_that.method,_that.methodLabel,_that.reference,_that.tenantName,_that.paidBy,_that.payerPhone,_that.houseCode,_that.houseNumber,_that.houseLabel,_that.propertyName,_that.estateName,_that.amount,_that.allocatedAmount,_that.unallocated,_that.invoiceCount,_that.invoiceRrn,_that.receivedOn,_that.narration,_that.occupationId,_that.houseId,_that.voidReason,_that.categoryName,_that.rentOwed,_that.rentOwedBefore);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id,  String? rrn,  int status,  String? statusLabel,  String? method,  String? methodLabel,  String? reference,  String? tenantName,  String? paidBy,  String? payerPhone,  String? houseCode,  String? houseNumber,  String? houseLabel,  String? propertyName,  String? estateName, @JsonKey(fromJson: parseDouble)  double amount, @JsonKey(fromJson: parseDouble)  double allocatedAmount, @JsonKey(fromJson: parseDouble)  double unallocated,  int invoiceCount,  String? invoiceRrn,  String? receivedOn,  String? narration,  String? occupationId,  String? houseId,  String? voidReason,  String? categoryName, @JsonKey(fromJson: parseDouble)  double rentOwed, @JsonKey(fromJson: parseDouble)  double rentOwedBefore)  $default,) {final _that = this;
switch (_that) {
case _PaymentModel():
return $default(_that.id,_that.rrn,_that.status,_that.statusLabel,_that.method,_that.methodLabel,_that.reference,_that.tenantName,_that.paidBy,_that.payerPhone,_that.houseCode,_that.houseNumber,_that.houseLabel,_that.propertyName,_that.estateName,_that.amount,_that.allocatedAmount,_that.unallocated,_that.invoiceCount,_that.invoiceRrn,_that.receivedOn,_that.narration,_that.occupationId,_that.houseId,_that.voidReason,_that.categoryName,_that.rentOwed,_that.rentOwedBefore);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id,  String? rrn,  int status,  String? statusLabel,  String? method,  String? methodLabel,  String? reference,  String? tenantName,  String? paidBy,  String? payerPhone,  String? houseCode,  String? houseNumber,  String? houseLabel,  String? propertyName,  String? estateName, @JsonKey(fromJson: parseDouble)  double amount, @JsonKey(fromJson: parseDouble)  double allocatedAmount, @JsonKey(fromJson: parseDouble)  double unallocated,  int invoiceCount,  String? invoiceRrn,  String? receivedOn,  String? narration,  String? occupationId,  String? houseId,  String? voidReason,  String? categoryName, @JsonKey(fromJson: parseDouble)  double rentOwed, @JsonKey(fromJson: parseDouble)  double rentOwedBefore)?  $default,) {final _that = this;
switch (_that) {
case _PaymentModel() when $default != null:
return $default(_that.id,_that.rrn,_that.status,_that.statusLabel,_that.method,_that.methodLabel,_that.reference,_that.tenantName,_that.paidBy,_that.payerPhone,_that.houseCode,_that.houseNumber,_that.houseLabel,_that.propertyName,_that.estateName,_that.amount,_that.allocatedAmount,_that.unallocated,_that.invoiceCount,_that.invoiceRrn,_that.receivedOn,_that.narration,_that.occupationId,_that.houseId,_that.voidReason,_that.categoryName,_that.rentOwed,_that.rentOwedBefore);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PaymentModel extends PaymentModel {
  const _PaymentModel({this.id, this.rrn, this.status = 0, this.statusLabel, this.method, this.methodLabel, this.reference, this.tenantName, this.paidBy, this.payerPhone, this.houseCode, this.houseNumber, this.houseLabel, this.propertyName, this.estateName, @JsonKey(fromJson: parseDouble) this.amount = 0, @JsonKey(fromJson: parseDouble) this.allocatedAmount = 0, @JsonKey(fromJson: parseDouble) this.unallocated = 0, this.invoiceCount = 0, this.invoiceRrn, this.receivedOn, this.narration, this.occupationId, this.houseId, this.voidReason, this.categoryName, @JsonKey(fromJson: parseDouble) this.rentOwed = 0, @JsonKey(fromJson: parseDouble) this.rentOwedBefore = 0}): super._();
  factory _PaymentModel.fromJson(Map<String, dynamic> json) => _$PaymentModelFromJson(json);

/// Hashed and salted per user. Opaque.
@override final  String? id;
/// The receipt number, which is what a tenant quotes.
@override final  String? rrn;
@override@JsonKey() final  int status;
@override final  String? statusLabel;
/// `CASH`, `STK`, `TRANSFER` — the machine-readable channel.
@override final  String? method;
/// The channel in words, from the server, which is what gets shown.
@override final  String? methodLabel;
/// The payer's own reference — an M-PESA code, a cheque number, a slip.
@override final  String? reference;
@override final  String? tenantName;
@override final  String? paidBy;
@override final  String? payerPhone;
@override final  String? houseCode;
@override final  String? houseNumber;
@override final  String? houseLabel;
@override final  String? propertyName;
@override final  String? estateName;
/// What arrived.
@override@JsonKey(fromJson: parseDouble) final  double amount;
/// How much of it was put against invoices.
@override@JsonKey(fromJson: parseDouble) final  double allocatedAmount;
/// What is still standing as credit on the tenancy.
@override@JsonKey(fromJson: parseDouble) final  double unallocated;
/// How many invoices it was spread across. One payment can settle several months.
@override@JsonKey() final  int invoiceCount;
/// The invoice it was aimed at, where it was aimed at one.
@override final  String? invoiceRrn;
@override final  String? receivedOn;
@override final  String? narration;
@override final  String? occupationId;
@override final  String? houseId;
@override final  String? voidReason;
/// The unit's category — "Two bedroom", "Shop". Shown to a tenant, who knows their unit by what
/// it is rather than by its code.
@override final  String? categoryName;
/// What the tenancy owed after this payment, and before it.
///
/// Carried on the receipt because that is the question a tenant asks next, and answering it
/// from a balance fetched later would show what they owe *now* rather than what this payment
/// left them owing.
@override@JsonKey(fromJson: parseDouble) final  double rentOwed;
@override@JsonKey(fromJson: parseDouble) final  double rentOwedBefore;

/// Create a copy of PaymentModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PaymentModelCopyWith<_PaymentModel> get copyWith => __$PaymentModelCopyWithImpl<_PaymentModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PaymentModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PaymentModel&&(identical(other.id, id) || other.id == id)&&(identical(other.rrn, rrn) || other.rrn == rrn)&&(identical(other.status, status) || other.status == status)&&(identical(other.statusLabel, statusLabel) || other.statusLabel == statusLabel)&&(identical(other.method, method) || other.method == method)&&(identical(other.methodLabel, methodLabel) || other.methodLabel == methodLabel)&&(identical(other.reference, reference) || other.reference == reference)&&(identical(other.tenantName, tenantName) || other.tenantName == tenantName)&&(identical(other.paidBy, paidBy) || other.paidBy == paidBy)&&(identical(other.payerPhone, payerPhone) || other.payerPhone == payerPhone)&&(identical(other.houseCode, houseCode) || other.houseCode == houseCode)&&(identical(other.houseNumber, houseNumber) || other.houseNumber == houseNumber)&&(identical(other.houseLabel, houseLabel) || other.houseLabel == houseLabel)&&(identical(other.propertyName, propertyName) || other.propertyName == propertyName)&&(identical(other.estateName, estateName) || other.estateName == estateName)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.allocatedAmount, allocatedAmount) || other.allocatedAmount == allocatedAmount)&&(identical(other.unallocated, unallocated) || other.unallocated == unallocated)&&(identical(other.invoiceCount, invoiceCount) || other.invoiceCount == invoiceCount)&&(identical(other.invoiceRrn, invoiceRrn) || other.invoiceRrn == invoiceRrn)&&(identical(other.receivedOn, receivedOn) || other.receivedOn == receivedOn)&&(identical(other.narration, narration) || other.narration == narration)&&(identical(other.occupationId, occupationId) || other.occupationId == occupationId)&&(identical(other.houseId, houseId) || other.houseId == houseId)&&(identical(other.voidReason, voidReason) || other.voidReason == voidReason)&&(identical(other.categoryName, categoryName) || other.categoryName == categoryName)&&(identical(other.rentOwed, rentOwed) || other.rentOwed == rentOwed)&&(identical(other.rentOwedBefore, rentOwedBefore) || other.rentOwedBefore == rentOwedBefore));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,rrn,status,statusLabel,method,methodLabel,reference,tenantName,paidBy,payerPhone,houseCode,houseNumber,houseLabel,propertyName,estateName,amount,allocatedAmount,unallocated,invoiceCount,invoiceRrn,receivedOn,narration,occupationId,houseId,voidReason,categoryName,rentOwed,rentOwedBefore]);

@override
String toString() {
  return 'PaymentModel(id: $id, rrn: $rrn, status: $status, statusLabel: $statusLabel, method: $method, methodLabel: $methodLabel, reference: $reference, tenantName: $tenantName, paidBy: $paidBy, payerPhone: $payerPhone, houseCode: $houseCode, houseNumber: $houseNumber, houseLabel: $houseLabel, propertyName: $propertyName, estateName: $estateName, amount: $amount, allocatedAmount: $allocatedAmount, unallocated: $unallocated, invoiceCount: $invoiceCount, invoiceRrn: $invoiceRrn, receivedOn: $receivedOn, narration: $narration, occupationId: $occupationId, houseId: $houseId, voidReason: $voidReason, categoryName: $categoryName, rentOwed: $rentOwed, rentOwedBefore: $rentOwedBefore)';
}


}

/// @nodoc
abstract mixin class _$PaymentModelCopyWith<$Res> implements $PaymentModelCopyWith<$Res> {
  factory _$PaymentModelCopyWith(_PaymentModel value, $Res Function(_PaymentModel) _then) = __$PaymentModelCopyWithImpl;
@override @useResult
$Res call({
 String? id, String? rrn, int status, String? statusLabel, String? method, String? methodLabel, String? reference, String? tenantName, String? paidBy, String? payerPhone, String? houseCode, String? houseNumber, String? houseLabel, String? propertyName, String? estateName,@JsonKey(fromJson: parseDouble) double amount,@JsonKey(fromJson: parseDouble) double allocatedAmount,@JsonKey(fromJson: parseDouble) double unallocated, int invoiceCount, String? invoiceRrn, String? receivedOn, String? narration, String? occupationId, String? houseId, String? voidReason, String? categoryName,@JsonKey(fromJson: parseDouble) double rentOwed,@JsonKey(fromJson: parseDouble) double rentOwedBefore
});




}
/// @nodoc
class __$PaymentModelCopyWithImpl<$Res>
    implements _$PaymentModelCopyWith<$Res> {
  __$PaymentModelCopyWithImpl(this._self, this._then);

  final _PaymentModel _self;
  final $Res Function(_PaymentModel) _then;

/// Create a copy of PaymentModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? rrn = freezed,Object? status = null,Object? statusLabel = freezed,Object? method = freezed,Object? methodLabel = freezed,Object? reference = freezed,Object? tenantName = freezed,Object? paidBy = freezed,Object? payerPhone = freezed,Object? houseCode = freezed,Object? houseNumber = freezed,Object? houseLabel = freezed,Object? propertyName = freezed,Object? estateName = freezed,Object? amount = null,Object? allocatedAmount = null,Object? unallocated = null,Object? invoiceCount = null,Object? invoiceRrn = freezed,Object? receivedOn = freezed,Object? narration = freezed,Object? occupationId = freezed,Object? houseId = freezed,Object? voidReason = freezed,Object? categoryName = freezed,Object? rentOwed = null,Object? rentOwedBefore = null,}) {
  return _then(_PaymentModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,rrn: freezed == rrn ? _self.rrn : rrn // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as int,statusLabel: freezed == statusLabel ? _self.statusLabel : statusLabel // ignore: cast_nullable_to_non_nullable
as String?,method: freezed == method ? _self.method : method // ignore: cast_nullable_to_non_nullable
as String?,methodLabel: freezed == methodLabel ? _self.methodLabel : methodLabel // ignore: cast_nullable_to_non_nullable
as String?,reference: freezed == reference ? _self.reference : reference // ignore: cast_nullable_to_non_nullable
as String?,tenantName: freezed == tenantName ? _self.tenantName : tenantName // ignore: cast_nullable_to_non_nullable
as String?,paidBy: freezed == paidBy ? _self.paidBy : paidBy // ignore: cast_nullable_to_non_nullable
as String?,payerPhone: freezed == payerPhone ? _self.payerPhone : payerPhone // ignore: cast_nullable_to_non_nullable
as String?,houseCode: freezed == houseCode ? _self.houseCode : houseCode // ignore: cast_nullable_to_non_nullable
as String?,houseNumber: freezed == houseNumber ? _self.houseNumber : houseNumber // ignore: cast_nullable_to_non_nullable
as String?,houseLabel: freezed == houseLabel ? _self.houseLabel : houseLabel // ignore: cast_nullable_to_non_nullable
as String?,propertyName: freezed == propertyName ? _self.propertyName : propertyName // ignore: cast_nullable_to_non_nullable
as String?,estateName: freezed == estateName ? _self.estateName : estateName // ignore: cast_nullable_to_non_nullable
as String?,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,allocatedAmount: null == allocatedAmount ? _self.allocatedAmount : allocatedAmount // ignore: cast_nullable_to_non_nullable
as double,unallocated: null == unallocated ? _self.unallocated : unallocated // ignore: cast_nullable_to_non_nullable
as double,invoiceCount: null == invoiceCount ? _self.invoiceCount : invoiceCount // ignore: cast_nullable_to_non_nullable
as int,invoiceRrn: freezed == invoiceRrn ? _self.invoiceRrn : invoiceRrn // ignore: cast_nullable_to_non_nullable
as String?,receivedOn: freezed == receivedOn ? _self.receivedOn : receivedOn // ignore: cast_nullable_to_non_nullable
as String?,narration: freezed == narration ? _self.narration : narration // ignore: cast_nullable_to_non_nullable
as String?,occupationId: freezed == occupationId ? _self.occupationId : occupationId // ignore: cast_nullable_to_non_nullable
as String?,houseId: freezed == houseId ? _self.houseId : houseId // ignore: cast_nullable_to_non_nullable
as String?,voidReason: freezed == voidReason ? _self.voidReason : voidReason // ignore: cast_nullable_to_non_nullable
as String?,categoryName: freezed == categoryName ? _self.categoryName : categoryName // ignore: cast_nullable_to_non_nullable
as String?,rentOwed: null == rentOwed ? _self.rentOwed : rentOwed // ignore: cast_nullable_to_non_nullable
as double,rentOwedBefore: null == rentOwedBefore ? _self.rentOwedBefore : rentOwedBefore // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
