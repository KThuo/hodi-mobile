// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payment_detail_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PaymentDetailModel {

 PaymentModel get payment;/// Which invoices this money was put against, and how much went to each.
///
/// Legacy called these `bills` and they were the invoice's charge lines — a different thing
/// entirely. These are allocations: one payment across possibly several months.
 List<PaymentAllocation> get allocations; String? get tenantPhone; String? get tenantEmail; String? get propertyLocation; String? get voidReason; String? get voidedBy; String? get voidedOn;
/// Create a copy of PaymentDetailModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PaymentDetailModelCopyWith<PaymentDetailModel> get copyWith => _$PaymentDetailModelCopyWithImpl<PaymentDetailModel>(this as PaymentDetailModel, _$identity);

  /// Serializes this PaymentDetailModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PaymentDetailModel&&(identical(other.payment, payment) || other.payment == payment)&&const DeepCollectionEquality().equals(other.allocations, allocations)&&(identical(other.tenantPhone, tenantPhone) || other.tenantPhone == tenantPhone)&&(identical(other.tenantEmail, tenantEmail) || other.tenantEmail == tenantEmail)&&(identical(other.propertyLocation, propertyLocation) || other.propertyLocation == propertyLocation)&&(identical(other.voidReason, voidReason) || other.voidReason == voidReason)&&(identical(other.voidedBy, voidedBy) || other.voidedBy == voidedBy)&&(identical(other.voidedOn, voidedOn) || other.voidedOn == voidedOn));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,payment,const DeepCollectionEquality().hash(allocations),tenantPhone,tenantEmail,propertyLocation,voidReason,voidedBy,voidedOn);

@override
String toString() {
  return 'PaymentDetailModel(payment: $payment, allocations: $allocations, tenantPhone: $tenantPhone, tenantEmail: $tenantEmail, propertyLocation: $propertyLocation, voidReason: $voidReason, voidedBy: $voidedBy, voidedOn: $voidedOn)';
}


}

/// @nodoc
abstract mixin class $PaymentDetailModelCopyWith<$Res>  {
  factory $PaymentDetailModelCopyWith(PaymentDetailModel value, $Res Function(PaymentDetailModel) _then) = _$PaymentDetailModelCopyWithImpl;
@useResult
$Res call({
 PaymentModel payment, List<PaymentAllocation> allocations, String? tenantPhone, String? tenantEmail, String? propertyLocation, String? voidReason, String? voidedBy, String? voidedOn
});


$PaymentModelCopyWith<$Res> get payment;

}
/// @nodoc
class _$PaymentDetailModelCopyWithImpl<$Res>
    implements $PaymentDetailModelCopyWith<$Res> {
  _$PaymentDetailModelCopyWithImpl(this._self, this._then);

  final PaymentDetailModel _self;
  final $Res Function(PaymentDetailModel) _then;

/// Create a copy of PaymentDetailModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? payment = null,Object? allocations = null,Object? tenantPhone = freezed,Object? tenantEmail = freezed,Object? propertyLocation = freezed,Object? voidReason = freezed,Object? voidedBy = freezed,Object? voidedOn = freezed,}) {
  return _then(_self.copyWith(
payment: null == payment ? _self.payment : payment // ignore: cast_nullable_to_non_nullable
as PaymentModel,allocations: null == allocations ? _self.allocations : allocations // ignore: cast_nullable_to_non_nullable
as List<PaymentAllocation>,tenantPhone: freezed == tenantPhone ? _self.tenantPhone : tenantPhone // ignore: cast_nullable_to_non_nullable
as String?,tenantEmail: freezed == tenantEmail ? _self.tenantEmail : tenantEmail // ignore: cast_nullable_to_non_nullable
as String?,propertyLocation: freezed == propertyLocation ? _self.propertyLocation : propertyLocation // ignore: cast_nullable_to_non_nullable
as String?,voidReason: freezed == voidReason ? _self.voidReason : voidReason // ignore: cast_nullable_to_non_nullable
as String?,voidedBy: freezed == voidedBy ? _self.voidedBy : voidedBy // ignore: cast_nullable_to_non_nullable
as String?,voidedOn: freezed == voidedOn ? _self.voidedOn : voidedOn // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of PaymentDetailModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PaymentModelCopyWith<$Res> get payment {
  
  return $PaymentModelCopyWith<$Res>(_self.payment, (value) {
    return _then(_self.copyWith(payment: value));
  });
}
}


/// Adds pattern-matching-related methods to [PaymentDetailModel].
extension PaymentDetailModelPatterns on PaymentDetailModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PaymentDetailModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PaymentDetailModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PaymentDetailModel value)  $default,){
final _that = this;
switch (_that) {
case _PaymentDetailModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PaymentDetailModel value)?  $default,){
final _that = this;
switch (_that) {
case _PaymentDetailModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( PaymentModel payment,  List<PaymentAllocation> allocations,  String? tenantPhone,  String? tenantEmail,  String? propertyLocation,  String? voidReason,  String? voidedBy,  String? voidedOn)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PaymentDetailModel() when $default != null:
return $default(_that.payment,_that.allocations,_that.tenantPhone,_that.tenantEmail,_that.propertyLocation,_that.voidReason,_that.voidedBy,_that.voidedOn);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( PaymentModel payment,  List<PaymentAllocation> allocations,  String? tenantPhone,  String? tenantEmail,  String? propertyLocation,  String? voidReason,  String? voidedBy,  String? voidedOn)  $default,) {final _that = this;
switch (_that) {
case _PaymentDetailModel():
return $default(_that.payment,_that.allocations,_that.tenantPhone,_that.tenantEmail,_that.propertyLocation,_that.voidReason,_that.voidedBy,_that.voidedOn);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( PaymentModel payment,  List<PaymentAllocation> allocations,  String? tenantPhone,  String? tenantEmail,  String? propertyLocation,  String? voidReason,  String? voidedBy,  String? voidedOn)?  $default,) {final _that = this;
switch (_that) {
case _PaymentDetailModel() when $default != null:
return $default(_that.payment,_that.allocations,_that.tenantPhone,_that.tenantEmail,_that.propertyLocation,_that.voidReason,_that.voidedBy,_that.voidedOn);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PaymentDetailModel extends PaymentDetailModel {
  const _PaymentDetailModel({required this.payment, final  List<PaymentAllocation> allocations = const [], this.tenantPhone, this.tenantEmail, this.propertyLocation, this.voidReason, this.voidedBy, this.voidedOn}): _allocations = allocations,super._();
  factory _PaymentDetailModel.fromJson(Map<String, dynamic> json) => _$PaymentDetailModelFromJson(json);

@override final  PaymentModel payment;
/// Which invoices this money was put against, and how much went to each.
///
/// Legacy called these `bills` and they were the invoice's charge lines — a different thing
/// entirely. These are allocations: one payment across possibly several months.
 final  List<PaymentAllocation> _allocations;
/// Which invoices this money was put against, and how much went to each.
///
/// Legacy called these `bills` and they were the invoice's charge lines — a different thing
/// entirely. These are allocations: one payment across possibly several months.
@override@JsonKey() List<PaymentAllocation> get allocations {
  if (_allocations is EqualUnmodifiableListView) return _allocations;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_allocations);
}

@override final  String? tenantPhone;
@override final  String? tenantEmail;
@override final  String? propertyLocation;
@override final  String? voidReason;
@override final  String? voidedBy;
@override final  String? voidedOn;

/// Create a copy of PaymentDetailModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PaymentDetailModelCopyWith<_PaymentDetailModel> get copyWith => __$PaymentDetailModelCopyWithImpl<_PaymentDetailModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PaymentDetailModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PaymentDetailModel&&(identical(other.payment, payment) || other.payment == payment)&&const DeepCollectionEquality().equals(other._allocations, _allocations)&&(identical(other.tenantPhone, tenantPhone) || other.tenantPhone == tenantPhone)&&(identical(other.tenantEmail, tenantEmail) || other.tenantEmail == tenantEmail)&&(identical(other.propertyLocation, propertyLocation) || other.propertyLocation == propertyLocation)&&(identical(other.voidReason, voidReason) || other.voidReason == voidReason)&&(identical(other.voidedBy, voidedBy) || other.voidedBy == voidedBy)&&(identical(other.voidedOn, voidedOn) || other.voidedOn == voidedOn));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,payment,const DeepCollectionEquality().hash(_allocations),tenantPhone,tenantEmail,propertyLocation,voidReason,voidedBy,voidedOn);

@override
String toString() {
  return 'PaymentDetailModel(payment: $payment, allocations: $allocations, tenantPhone: $tenantPhone, tenantEmail: $tenantEmail, propertyLocation: $propertyLocation, voidReason: $voidReason, voidedBy: $voidedBy, voidedOn: $voidedOn)';
}


}

/// @nodoc
abstract mixin class _$PaymentDetailModelCopyWith<$Res> implements $PaymentDetailModelCopyWith<$Res> {
  factory _$PaymentDetailModelCopyWith(_PaymentDetailModel value, $Res Function(_PaymentDetailModel) _then) = __$PaymentDetailModelCopyWithImpl;
@override @useResult
$Res call({
 PaymentModel payment, List<PaymentAllocation> allocations, String? tenantPhone, String? tenantEmail, String? propertyLocation, String? voidReason, String? voidedBy, String? voidedOn
});


@override $PaymentModelCopyWith<$Res> get payment;

}
/// @nodoc
class __$PaymentDetailModelCopyWithImpl<$Res>
    implements _$PaymentDetailModelCopyWith<$Res> {
  __$PaymentDetailModelCopyWithImpl(this._self, this._then);

  final _PaymentDetailModel _self;
  final $Res Function(_PaymentDetailModel) _then;

/// Create a copy of PaymentDetailModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? payment = null,Object? allocations = null,Object? tenantPhone = freezed,Object? tenantEmail = freezed,Object? propertyLocation = freezed,Object? voidReason = freezed,Object? voidedBy = freezed,Object? voidedOn = freezed,}) {
  return _then(_PaymentDetailModel(
payment: null == payment ? _self.payment : payment // ignore: cast_nullable_to_non_nullable
as PaymentModel,allocations: null == allocations ? _self._allocations : allocations // ignore: cast_nullable_to_non_nullable
as List<PaymentAllocation>,tenantPhone: freezed == tenantPhone ? _self.tenantPhone : tenantPhone // ignore: cast_nullable_to_non_nullable
as String?,tenantEmail: freezed == tenantEmail ? _self.tenantEmail : tenantEmail // ignore: cast_nullable_to_non_nullable
as String?,propertyLocation: freezed == propertyLocation ? _self.propertyLocation : propertyLocation // ignore: cast_nullable_to_non_nullable
as String?,voidReason: freezed == voidReason ? _self.voidReason : voidReason // ignore: cast_nullable_to_non_nullable
as String?,voidedBy: freezed == voidedBy ? _self.voidedBy : voidedBy // ignore: cast_nullable_to_non_nullable
as String?,voidedOn: freezed == voidedOn ? _self.voidedOn : voidedOn // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of PaymentDetailModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PaymentModelCopyWith<$Res> get payment {
  
  return $PaymentModelCopyWith<$Res>(_self.payment, (value) {
    return _then(_self.copyWith(payment: value));
  });
}
}


/// @nodoc
mixin _$PaymentAllocation {

 String? get invoiceId; String? get invoiceRrn; String? get periodLabel;/// What that invoice came to in total — context for the part of it this payment covered.
@JsonKey(fromJson: parseDouble) double get invoiceAmount;/// How much of this payment went to it.
@JsonKey(fromJson: parseDouble) double get amount;
/// Create a copy of PaymentAllocation
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PaymentAllocationCopyWith<PaymentAllocation> get copyWith => _$PaymentAllocationCopyWithImpl<PaymentAllocation>(this as PaymentAllocation, _$identity);

  /// Serializes this PaymentAllocation to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PaymentAllocation&&(identical(other.invoiceId, invoiceId) || other.invoiceId == invoiceId)&&(identical(other.invoiceRrn, invoiceRrn) || other.invoiceRrn == invoiceRrn)&&(identical(other.periodLabel, periodLabel) || other.periodLabel == periodLabel)&&(identical(other.invoiceAmount, invoiceAmount) || other.invoiceAmount == invoiceAmount)&&(identical(other.amount, amount) || other.amount == amount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,invoiceId,invoiceRrn,periodLabel,invoiceAmount,amount);

@override
String toString() {
  return 'PaymentAllocation(invoiceId: $invoiceId, invoiceRrn: $invoiceRrn, periodLabel: $periodLabel, invoiceAmount: $invoiceAmount, amount: $amount)';
}


}

/// @nodoc
abstract mixin class $PaymentAllocationCopyWith<$Res>  {
  factory $PaymentAllocationCopyWith(PaymentAllocation value, $Res Function(PaymentAllocation) _then) = _$PaymentAllocationCopyWithImpl;
@useResult
$Res call({
 String? invoiceId, String? invoiceRrn, String? periodLabel,@JsonKey(fromJson: parseDouble) double invoiceAmount,@JsonKey(fromJson: parseDouble) double amount
});




}
/// @nodoc
class _$PaymentAllocationCopyWithImpl<$Res>
    implements $PaymentAllocationCopyWith<$Res> {
  _$PaymentAllocationCopyWithImpl(this._self, this._then);

  final PaymentAllocation _self;
  final $Res Function(PaymentAllocation) _then;

/// Create a copy of PaymentAllocation
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? invoiceId = freezed,Object? invoiceRrn = freezed,Object? periodLabel = freezed,Object? invoiceAmount = null,Object? amount = null,}) {
  return _then(_self.copyWith(
invoiceId: freezed == invoiceId ? _self.invoiceId : invoiceId // ignore: cast_nullable_to_non_nullable
as String?,invoiceRrn: freezed == invoiceRrn ? _self.invoiceRrn : invoiceRrn // ignore: cast_nullable_to_non_nullable
as String?,periodLabel: freezed == periodLabel ? _self.periodLabel : periodLabel // ignore: cast_nullable_to_non_nullable
as String?,invoiceAmount: null == invoiceAmount ? _self.invoiceAmount : invoiceAmount // ignore: cast_nullable_to_non_nullable
as double,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [PaymentAllocation].
extension PaymentAllocationPatterns on PaymentAllocation {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PaymentAllocation value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PaymentAllocation() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PaymentAllocation value)  $default,){
final _that = this;
switch (_that) {
case _PaymentAllocation():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PaymentAllocation value)?  $default,){
final _that = this;
switch (_that) {
case _PaymentAllocation() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? invoiceId,  String? invoiceRrn,  String? periodLabel, @JsonKey(fromJson: parseDouble)  double invoiceAmount, @JsonKey(fromJson: parseDouble)  double amount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PaymentAllocation() when $default != null:
return $default(_that.invoiceId,_that.invoiceRrn,_that.periodLabel,_that.invoiceAmount,_that.amount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? invoiceId,  String? invoiceRrn,  String? periodLabel, @JsonKey(fromJson: parseDouble)  double invoiceAmount, @JsonKey(fromJson: parseDouble)  double amount)  $default,) {final _that = this;
switch (_that) {
case _PaymentAllocation():
return $default(_that.invoiceId,_that.invoiceRrn,_that.periodLabel,_that.invoiceAmount,_that.amount);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? invoiceId,  String? invoiceRrn,  String? periodLabel, @JsonKey(fromJson: parseDouble)  double invoiceAmount, @JsonKey(fromJson: parseDouble)  double amount)?  $default,) {final _that = this;
switch (_that) {
case _PaymentAllocation() when $default != null:
return $default(_that.invoiceId,_that.invoiceRrn,_that.periodLabel,_that.invoiceAmount,_that.amount);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PaymentAllocation extends PaymentAllocation {
  const _PaymentAllocation({this.invoiceId, this.invoiceRrn, this.periodLabel, @JsonKey(fromJson: parseDouble) this.invoiceAmount = 0, @JsonKey(fromJson: parseDouble) this.amount = 0}): super._();
  factory _PaymentAllocation.fromJson(Map<String, dynamic> json) => _$PaymentAllocationFromJson(json);

@override final  String? invoiceId;
@override final  String? invoiceRrn;
@override final  String? periodLabel;
/// What that invoice came to in total — context for the part of it this payment covered.
@override@JsonKey(fromJson: parseDouble) final  double invoiceAmount;
/// How much of this payment went to it.
@override@JsonKey(fromJson: parseDouble) final  double amount;

/// Create a copy of PaymentAllocation
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PaymentAllocationCopyWith<_PaymentAllocation> get copyWith => __$PaymentAllocationCopyWithImpl<_PaymentAllocation>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PaymentAllocationToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PaymentAllocation&&(identical(other.invoiceId, invoiceId) || other.invoiceId == invoiceId)&&(identical(other.invoiceRrn, invoiceRrn) || other.invoiceRrn == invoiceRrn)&&(identical(other.periodLabel, periodLabel) || other.periodLabel == periodLabel)&&(identical(other.invoiceAmount, invoiceAmount) || other.invoiceAmount == invoiceAmount)&&(identical(other.amount, amount) || other.amount == amount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,invoiceId,invoiceRrn,periodLabel,invoiceAmount,amount);

@override
String toString() {
  return 'PaymentAllocation(invoiceId: $invoiceId, invoiceRrn: $invoiceRrn, periodLabel: $periodLabel, invoiceAmount: $invoiceAmount, amount: $amount)';
}


}

/// @nodoc
abstract mixin class _$PaymentAllocationCopyWith<$Res> implements $PaymentAllocationCopyWith<$Res> {
  factory _$PaymentAllocationCopyWith(_PaymentAllocation value, $Res Function(_PaymentAllocation) _then) = __$PaymentAllocationCopyWithImpl;
@override @useResult
$Res call({
 String? invoiceId, String? invoiceRrn, String? periodLabel,@JsonKey(fromJson: parseDouble) double invoiceAmount,@JsonKey(fromJson: parseDouble) double amount
});




}
/// @nodoc
class __$PaymentAllocationCopyWithImpl<$Res>
    implements _$PaymentAllocationCopyWith<$Res> {
  __$PaymentAllocationCopyWithImpl(this._self, this._then);

  final _PaymentAllocation _self;
  final $Res Function(_PaymentAllocation) _then;

/// Create a copy of PaymentAllocation
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? invoiceId = freezed,Object? invoiceRrn = freezed,Object? periodLabel = freezed,Object? invoiceAmount = null,Object? amount = null,}) {
  return _then(_PaymentAllocation(
invoiceId: freezed == invoiceId ? _self.invoiceId : invoiceId // ignore: cast_nullable_to_non_nullable
as String?,invoiceRrn: freezed == invoiceRrn ? _self.invoiceRrn : invoiceRrn // ignore: cast_nullable_to_non_nullable
as String?,periodLabel: freezed == periodLabel ? _self.periodLabel : periodLabel // ignore: cast_nullable_to_non_nullable
as String?,invoiceAmount: null == invoiceAmount ? _self.invoiceAmount : invoiceAmount // ignore: cast_nullable_to_non_nullable
as double,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
