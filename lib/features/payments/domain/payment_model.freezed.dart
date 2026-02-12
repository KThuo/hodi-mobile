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

 int? get id; String? get paymentRrn; String? get invoiceRrn; String? get houseName; String? get houseCode; String? get estate; String? get property; String? get tenantName; String? get tenantPhone; String? get monthName; double get rentOwed; double get rentPaid; String? get paidBy; String? get paidOn; String? get status; String? get paymentRef; String? get phoneNo; String? get category; String? get houseType;
/// Create a copy of PaymentModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PaymentModelCopyWith<PaymentModel> get copyWith => _$PaymentModelCopyWithImpl<PaymentModel>(this as PaymentModel, _$identity);

  /// Serializes this PaymentModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PaymentModel&&(identical(other.id, id) || other.id == id)&&(identical(other.paymentRrn, paymentRrn) || other.paymentRrn == paymentRrn)&&(identical(other.invoiceRrn, invoiceRrn) || other.invoiceRrn == invoiceRrn)&&(identical(other.houseName, houseName) || other.houseName == houseName)&&(identical(other.houseCode, houseCode) || other.houseCode == houseCode)&&(identical(other.estate, estate) || other.estate == estate)&&(identical(other.property, property) || other.property == property)&&(identical(other.tenantName, tenantName) || other.tenantName == tenantName)&&(identical(other.tenantPhone, tenantPhone) || other.tenantPhone == tenantPhone)&&(identical(other.monthName, monthName) || other.monthName == monthName)&&(identical(other.rentOwed, rentOwed) || other.rentOwed == rentOwed)&&(identical(other.rentPaid, rentPaid) || other.rentPaid == rentPaid)&&(identical(other.paidBy, paidBy) || other.paidBy == paidBy)&&(identical(other.paidOn, paidOn) || other.paidOn == paidOn)&&(identical(other.status, status) || other.status == status)&&(identical(other.paymentRef, paymentRef) || other.paymentRef == paymentRef)&&(identical(other.phoneNo, phoneNo) || other.phoneNo == phoneNo)&&(identical(other.category, category) || other.category == category)&&(identical(other.houseType, houseType) || other.houseType == houseType));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,paymentRrn,invoiceRrn,houseName,houseCode,estate,property,tenantName,tenantPhone,monthName,rentOwed,rentPaid,paidBy,paidOn,status,paymentRef,phoneNo,category,houseType]);

@override
String toString() {
  return 'PaymentModel(id: $id, paymentRrn: $paymentRrn, invoiceRrn: $invoiceRrn, houseName: $houseName, houseCode: $houseCode, estate: $estate, property: $property, tenantName: $tenantName, tenantPhone: $tenantPhone, monthName: $monthName, rentOwed: $rentOwed, rentPaid: $rentPaid, paidBy: $paidBy, paidOn: $paidOn, status: $status, paymentRef: $paymentRef, phoneNo: $phoneNo, category: $category, houseType: $houseType)';
}


}

/// @nodoc
abstract mixin class $PaymentModelCopyWith<$Res>  {
  factory $PaymentModelCopyWith(PaymentModel value, $Res Function(PaymentModel) _then) = _$PaymentModelCopyWithImpl;
@useResult
$Res call({
 int? id, String? paymentRrn, String? invoiceRrn, String? houseName, String? houseCode, String? estate, String? property, String? tenantName, String? tenantPhone, String? monthName, double rentOwed, double rentPaid, String? paidBy, String? paidOn, String? status, String? paymentRef, String? phoneNo, String? category, String? houseType
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
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? paymentRrn = freezed,Object? invoiceRrn = freezed,Object? houseName = freezed,Object? houseCode = freezed,Object? estate = freezed,Object? property = freezed,Object? tenantName = freezed,Object? tenantPhone = freezed,Object? monthName = freezed,Object? rentOwed = null,Object? rentPaid = null,Object? paidBy = freezed,Object? paidOn = freezed,Object? status = freezed,Object? paymentRef = freezed,Object? phoneNo = freezed,Object? category = freezed,Object? houseType = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,paymentRrn: freezed == paymentRrn ? _self.paymentRrn : paymentRrn // ignore: cast_nullable_to_non_nullable
as String?,invoiceRrn: freezed == invoiceRrn ? _self.invoiceRrn : invoiceRrn // ignore: cast_nullable_to_non_nullable
as String?,houseName: freezed == houseName ? _self.houseName : houseName // ignore: cast_nullable_to_non_nullable
as String?,houseCode: freezed == houseCode ? _self.houseCode : houseCode // ignore: cast_nullable_to_non_nullable
as String?,estate: freezed == estate ? _self.estate : estate // ignore: cast_nullable_to_non_nullable
as String?,property: freezed == property ? _self.property : property // ignore: cast_nullable_to_non_nullable
as String?,tenantName: freezed == tenantName ? _self.tenantName : tenantName // ignore: cast_nullable_to_non_nullable
as String?,tenantPhone: freezed == tenantPhone ? _self.tenantPhone : tenantPhone // ignore: cast_nullable_to_non_nullable
as String?,monthName: freezed == monthName ? _self.monthName : monthName // ignore: cast_nullable_to_non_nullable
as String?,rentOwed: null == rentOwed ? _self.rentOwed : rentOwed // ignore: cast_nullable_to_non_nullable
as double,rentPaid: null == rentPaid ? _self.rentPaid : rentPaid // ignore: cast_nullable_to_non_nullable
as double,paidBy: freezed == paidBy ? _self.paidBy : paidBy // ignore: cast_nullable_to_non_nullable
as String?,paidOn: freezed == paidOn ? _self.paidOn : paidOn // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,paymentRef: freezed == paymentRef ? _self.paymentRef : paymentRef // ignore: cast_nullable_to_non_nullable
as String?,phoneNo: freezed == phoneNo ? _self.phoneNo : phoneNo // ignore: cast_nullable_to_non_nullable
as String?,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String?,houseType: freezed == houseType ? _self.houseType : houseType // ignore: cast_nullable_to_non_nullable
as String?,
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? id,  String? paymentRrn,  String? invoiceRrn,  String? houseName,  String? houseCode,  String? estate,  String? property,  String? tenantName,  String? tenantPhone,  String? monthName,  double rentOwed,  double rentPaid,  String? paidBy,  String? paidOn,  String? status,  String? paymentRef,  String? phoneNo,  String? category,  String? houseType)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PaymentModel() when $default != null:
return $default(_that.id,_that.paymentRrn,_that.invoiceRrn,_that.houseName,_that.houseCode,_that.estate,_that.property,_that.tenantName,_that.tenantPhone,_that.monthName,_that.rentOwed,_that.rentPaid,_that.paidBy,_that.paidOn,_that.status,_that.paymentRef,_that.phoneNo,_that.category,_that.houseType);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? id,  String? paymentRrn,  String? invoiceRrn,  String? houseName,  String? houseCode,  String? estate,  String? property,  String? tenantName,  String? tenantPhone,  String? monthName,  double rentOwed,  double rentPaid,  String? paidBy,  String? paidOn,  String? status,  String? paymentRef,  String? phoneNo,  String? category,  String? houseType)  $default,) {final _that = this;
switch (_that) {
case _PaymentModel():
return $default(_that.id,_that.paymentRrn,_that.invoiceRrn,_that.houseName,_that.houseCode,_that.estate,_that.property,_that.tenantName,_that.tenantPhone,_that.monthName,_that.rentOwed,_that.rentPaid,_that.paidBy,_that.paidOn,_that.status,_that.paymentRef,_that.phoneNo,_that.category,_that.houseType);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? id,  String? paymentRrn,  String? invoiceRrn,  String? houseName,  String? houseCode,  String? estate,  String? property,  String? tenantName,  String? tenantPhone,  String? monthName,  double rentOwed,  double rentPaid,  String? paidBy,  String? paidOn,  String? status,  String? paymentRef,  String? phoneNo,  String? category,  String? houseType)?  $default,) {final _that = this;
switch (_that) {
case _PaymentModel() when $default != null:
return $default(_that.id,_that.paymentRrn,_that.invoiceRrn,_that.houseName,_that.houseCode,_that.estate,_that.property,_that.tenantName,_that.tenantPhone,_that.monthName,_that.rentOwed,_that.rentPaid,_that.paidBy,_that.paidOn,_that.status,_that.paymentRef,_that.phoneNo,_that.category,_that.houseType);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PaymentModel extends PaymentModel {
  const _PaymentModel({this.id, this.paymentRrn, this.invoiceRrn, this.houseName, this.houseCode, this.estate, this.property, this.tenantName, this.tenantPhone, this.monthName, this.rentOwed = 0, this.rentPaid = 0, this.paidBy, this.paidOn, this.status, this.paymentRef, this.phoneNo, this.category, this.houseType}): super._();
  factory _PaymentModel.fromJson(Map<String, dynamic> json) => _$PaymentModelFromJson(json);

@override final  int? id;
@override final  String? paymentRrn;
@override final  String? invoiceRrn;
@override final  String? houseName;
@override final  String? houseCode;
@override final  String? estate;
@override final  String? property;
@override final  String? tenantName;
@override final  String? tenantPhone;
@override final  String? monthName;
@override@JsonKey() final  double rentOwed;
@override@JsonKey() final  double rentPaid;
@override final  String? paidBy;
@override final  String? paidOn;
@override final  String? status;
@override final  String? paymentRef;
@override final  String? phoneNo;
@override final  String? category;
@override final  String? houseType;

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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PaymentModel&&(identical(other.id, id) || other.id == id)&&(identical(other.paymentRrn, paymentRrn) || other.paymentRrn == paymentRrn)&&(identical(other.invoiceRrn, invoiceRrn) || other.invoiceRrn == invoiceRrn)&&(identical(other.houseName, houseName) || other.houseName == houseName)&&(identical(other.houseCode, houseCode) || other.houseCode == houseCode)&&(identical(other.estate, estate) || other.estate == estate)&&(identical(other.property, property) || other.property == property)&&(identical(other.tenantName, tenantName) || other.tenantName == tenantName)&&(identical(other.tenantPhone, tenantPhone) || other.tenantPhone == tenantPhone)&&(identical(other.monthName, monthName) || other.monthName == monthName)&&(identical(other.rentOwed, rentOwed) || other.rentOwed == rentOwed)&&(identical(other.rentPaid, rentPaid) || other.rentPaid == rentPaid)&&(identical(other.paidBy, paidBy) || other.paidBy == paidBy)&&(identical(other.paidOn, paidOn) || other.paidOn == paidOn)&&(identical(other.status, status) || other.status == status)&&(identical(other.paymentRef, paymentRef) || other.paymentRef == paymentRef)&&(identical(other.phoneNo, phoneNo) || other.phoneNo == phoneNo)&&(identical(other.category, category) || other.category == category)&&(identical(other.houseType, houseType) || other.houseType == houseType));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,paymentRrn,invoiceRrn,houseName,houseCode,estate,property,tenantName,tenantPhone,monthName,rentOwed,rentPaid,paidBy,paidOn,status,paymentRef,phoneNo,category,houseType]);

@override
String toString() {
  return 'PaymentModel(id: $id, paymentRrn: $paymentRrn, invoiceRrn: $invoiceRrn, houseName: $houseName, houseCode: $houseCode, estate: $estate, property: $property, tenantName: $tenantName, tenantPhone: $tenantPhone, monthName: $monthName, rentOwed: $rentOwed, rentPaid: $rentPaid, paidBy: $paidBy, paidOn: $paidOn, status: $status, paymentRef: $paymentRef, phoneNo: $phoneNo, category: $category, houseType: $houseType)';
}


}

/// @nodoc
abstract mixin class _$PaymentModelCopyWith<$Res> implements $PaymentModelCopyWith<$Res> {
  factory _$PaymentModelCopyWith(_PaymentModel value, $Res Function(_PaymentModel) _then) = __$PaymentModelCopyWithImpl;
@override @useResult
$Res call({
 int? id, String? paymentRrn, String? invoiceRrn, String? houseName, String? houseCode, String? estate, String? property, String? tenantName, String? tenantPhone, String? monthName, double rentOwed, double rentPaid, String? paidBy, String? paidOn, String? status, String? paymentRef, String? phoneNo, String? category, String? houseType
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
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? paymentRrn = freezed,Object? invoiceRrn = freezed,Object? houseName = freezed,Object? houseCode = freezed,Object? estate = freezed,Object? property = freezed,Object? tenantName = freezed,Object? tenantPhone = freezed,Object? monthName = freezed,Object? rentOwed = null,Object? rentPaid = null,Object? paidBy = freezed,Object? paidOn = freezed,Object? status = freezed,Object? paymentRef = freezed,Object? phoneNo = freezed,Object? category = freezed,Object? houseType = freezed,}) {
  return _then(_PaymentModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,paymentRrn: freezed == paymentRrn ? _self.paymentRrn : paymentRrn // ignore: cast_nullable_to_non_nullable
as String?,invoiceRrn: freezed == invoiceRrn ? _self.invoiceRrn : invoiceRrn // ignore: cast_nullable_to_non_nullable
as String?,houseName: freezed == houseName ? _self.houseName : houseName // ignore: cast_nullable_to_non_nullable
as String?,houseCode: freezed == houseCode ? _self.houseCode : houseCode // ignore: cast_nullable_to_non_nullable
as String?,estate: freezed == estate ? _self.estate : estate // ignore: cast_nullable_to_non_nullable
as String?,property: freezed == property ? _self.property : property // ignore: cast_nullable_to_non_nullable
as String?,tenantName: freezed == tenantName ? _self.tenantName : tenantName // ignore: cast_nullable_to_non_nullable
as String?,tenantPhone: freezed == tenantPhone ? _self.tenantPhone : tenantPhone // ignore: cast_nullable_to_non_nullable
as String?,monthName: freezed == monthName ? _self.monthName : monthName // ignore: cast_nullable_to_non_nullable
as String?,rentOwed: null == rentOwed ? _self.rentOwed : rentOwed // ignore: cast_nullable_to_non_nullable
as double,rentPaid: null == rentPaid ? _self.rentPaid : rentPaid // ignore: cast_nullable_to_non_nullable
as double,paidBy: freezed == paidBy ? _self.paidBy : paidBy // ignore: cast_nullable_to_non_nullable
as String?,paidOn: freezed == paidOn ? _self.paidOn : paidOn // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,paymentRef: freezed == paymentRef ? _self.paymentRef : paymentRef // ignore: cast_nullable_to_non_nullable
as String?,phoneNo: freezed == phoneNo ? _self.phoneNo : phoneNo // ignore: cast_nullable_to_non_nullable
as String?,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String?,houseType: freezed == houseType ? _self.houseType : houseType // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
