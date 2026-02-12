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

@JsonKey(name: 'rrn') String? get paymentRrn; String? get invoiceRrn; String? get month; String? get estateName; String? get houseNumber; String? get date; String? get location; String? get propertyName;@JsonKey(fromJson: parseDouble) double get invoiceAmount;@JsonKey(fromJson: parseDouble) double get paidAmount;@JsonKey(fromJson: parseDouble) double get rentOwed; String? get contactNo; String? get contactEmail; String? get status; String? get tenantName; String? get tenantPhone; String? get tenantEmail; String? get paidBy; String? get paymentType;@JsonKey(name: 'bills') List<PaymentLineItem> get items; String? get currency;
/// Create a copy of PaymentDetailModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PaymentDetailModelCopyWith<PaymentDetailModel> get copyWith => _$PaymentDetailModelCopyWithImpl<PaymentDetailModel>(this as PaymentDetailModel, _$identity);

  /// Serializes this PaymentDetailModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PaymentDetailModel&&(identical(other.paymentRrn, paymentRrn) || other.paymentRrn == paymentRrn)&&(identical(other.invoiceRrn, invoiceRrn) || other.invoiceRrn == invoiceRrn)&&(identical(other.month, month) || other.month == month)&&(identical(other.estateName, estateName) || other.estateName == estateName)&&(identical(other.houseNumber, houseNumber) || other.houseNumber == houseNumber)&&(identical(other.date, date) || other.date == date)&&(identical(other.location, location) || other.location == location)&&(identical(other.propertyName, propertyName) || other.propertyName == propertyName)&&(identical(other.invoiceAmount, invoiceAmount) || other.invoiceAmount == invoiceAmount)&&(identical(other.paidAmount, paidAmount) || other.paidAmount == paidAmount)&&(identical(other.rentOwed, rentOwed) || other.rentOwed == rentOwed)&&(identical(other.contactNo, contactNo) || other.contactNo == contactNo)&&(identical(other.contactEmail, contactEmail) || other.contactEmail == contactEmail)&&(identical(other.status, status) || other.status == status)&&(identical(other.tenantName, tenantName) || other.tenantName == tenantName)&&(identical(other.tenantPhone, tenantPhone) || other.tenantPhone == tenantPhone)&&(identical(other.tenantEmail, tenantEmail) || other.tenantEmail == tenantEmail)&&(identical(other.paidBy, paidBy) || other.paidBy == paidBy)&&(identical(other.paymentType, paymentType) || other.paymentType == paymentType)&&const DeepCollectionEquality().equals(other.items, items)&&(identical(other.currency, currency) || other.currency == currency));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,paymentRrn,invoiceRrn,month,estateName,houseNumber,date,location,propertyName,invoiceAmount,paidAmount,rentOwed,contactNo,contactEmail,status,tenantName,tenantPhone,tenantEmail,paidBy,paymentType,const DeepCollectionEquality().hash(items),currency]);

@override
String toString() {
  return 'PaymentDetailModel(paymentRrn: $paymentRrn, invoiceRrn: $invoiceRrn, month: $month, estateName: $estateName, houseNumber: $houseNumber, date: $date, location: $location, propertyName: $propertyName, invoiceAmount: $invoiceAmount, paidAmount: $paidAmount, rentOwed: $rentOwed, contactNo: $contactNo, contactEmail: $contactEmail, status: $status, tenantName: $tenantName, tenantPhone: $tenantPhone, tenantEmail: $tenantEmail, paidBy: $paidBy, paymentType: $paymentType, items: $items, currency: $currency)';
}


}

/// @nodoc
abstract mixin class $PaymentDetailModelCopyWith<$Res>  {
  factory $PaymentDetailModelCopyWith(PaymentDetailModel value, $Res Function(PaymentDetailModel) _then) = _$PaymentDetailModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'rrn') String? paymentRrn, String? invoiceRrn, String? month, String? estateName, String? houseNumber, String? date, String? location, String? propertyName,@JsonKey(fromJson: parseDouble) double invoiceAmount,@JsonKey(fromJson: parseDouble) double paidAmount,@JsonKey(fromJson: parseDouble) double rentOwed, String? contactNo, String? contactEmail, String? status, String? tenantName, String? tenantPhone, String? tenantEmail, String? paidBy, String? paymentType,@JsonKey(name: 'bills') List<PaymentLineItem> items, String? currency
});




}
/// @nodoc
class _$PaymentDetailModelCopyWithImpl<$Res>
    implements $PaymentDetailModelCopyWith<$Res> {
  _$PaymentDetailModelCopyWithImpl(this._self, this._then);

  final PaymentDetailModel _self;
  final $Res Function(PaymentDetailModel) _then;

/// Create a copy of PaymentDetailModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? paymentRrn = freezed,Object? invoiceRrn = freezed,Object? month = freezed,Object? estateName = freezed,Object? houseNumber = freezed,Object? date = freezed,Object? location = freezed,Object? propertyName = freezed,Object? invoiceAmount = null,Object? paidAmount = null,Object? rentOwed = null,Object? contactNo = freezed,Object? contactEmail = freezed,Object? status = freezed,Object? tenantName = freezed,Object? tenantPhone = freezed,Object? tenantEmail = freezed,Object? paidBy = freezed,Object? paymentType = freezed,Object? items = null,Object? currency = freezed,}) {
  return _then(_self.copyWith(
paymentRrn: freezed == paymentRrn ? _self.paymentRrn : paymentRrn // ignore: cast_nullable_to_non_nullable
as String?,invoiceRrn: freezed == invoiceRrn ? _self.invoiceRrn : invoiceRrn // ignore: cast_nullable_to_non_nullable
as String?,month: freezed == month ? _self.month : month // ignore: cast_nullable_to_non_nullable
as String?,estateName: freezed == estateName ? _self.estateName : estateName // ignore: cast_nullable_to_non_nullable
as String?,houseNumber: freezed == houseNumber ? _self.houseNumber : houseNumber // ignore: cast_nullable_to_non_nullable
as String?,date: freezed == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String?,location: freezed == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String?,propertyName: freezed == propertyName ? _self.propertyName : propertyName // ignore: cast_nullable_to_non_nullable
as String?,invoiceAmount: null == invoiceAmount ? _self.invoiceAmount : invoiceAmount // ignore: cast_nullable_to_non_nullable
as double,paidAmount: null == paidAmount ? _self.paidAmount : paidAmount // ignore: cast_nullable_to_non_nullable
as double,rentOwed: null == rentOwed ? _self.rentOwed : rentOwed // ignore: cast_nullable_to_non_nullable
as double,contactNo: freezed == contactNo ? _self.contactNo : contactNo // ignore: cast_nullable_to_non_nullable
as String?,contactEmail: freezed == contactEmail ? _self.contactEmail : contactEmail // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,tenantName: freezed == tenantName ? _self.tenantName : tenantName // ignore: cast_nullable_to_non_nullable
as String?,tenantPhone: freezed == tenantPhone ? _self.tenantPhone : tenantPhone // ignore: cast_nullable_to_non_nullable
as String?,tenantEmail: freezed == tenantEmail ? _self.tenantEmail : tenantEmail // ignore: cast_nullable_to_non_nullable
as String?,paidBy: freezed == paidBy ? _self.paidBy : paidBy // ignore: cast_nullable_to_non_nullable
as String?,paymentType: freezed == paymentType ? _self.paymentType : paymentType // ignore: cast_nullable_to_non_nullable
as String?,items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<PaymentLineItem>,currency: freezed == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String?,
  ));
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'rrn')  String? paymentRrn,  String? invoiceRrn,  String? month,  String? estateName,  String? houseNumber,  String? date,  String? location,  String? propertyName, @JsonKey(fromJson: parseDouble)  double invoiceAmount, @JsonKey(fromJson: parseDouble)  double paidAmount, @JsonKey(fromJson: parseDouble)  double rentOwed,  String? contactNo,  String? contactEmail,  String? status,  String? tenantName,  String? tenantPhone,  String? tenantEmail,  String? paidBy,  String? paymentType, @JsonKey(name: 'bills')  List<PaymentLineItem> items,  String? currency)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PaymentDetailModel() when $default != null:
return $default(_that.paymentRrn,_that.invoiceRrn,_that.month,_that.estateName,_that.houseNumber,_that.date,_that.location,_that.propertyName,_that.invoiceAmount,_that.paidAmount,_that.rentOwed,_that.contactNo,_that.contactEmail,_that.status,_that.tenantName,_that.tenantPhone,_that.tenantEmail,_that.paidBy,_that.paymentType,_that.items,_that.currency);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'rrn')  String? paymentRrn,  String? invoiceRrn,  String? month,  String? estateName,  String? houseNumber,  String? date,  String? location,  String? propertyName, @JsonKey(fromJson: parseDouble)  double invoiceAmount, @JsonKey(fromJson: parseDouble)  double paidAmount, @JsonKey(fromJson: parseDouble)  double rentOwed,  String? contactNo,  String? contactEmail,  String? status,  String? tenantName,  String? tenantPhone,  String? tenantEmail,  String? paidBy,  String? paymentType, @JsonKey(name: 'bills')  List<PaymentLineItem> items,  String? currency)  $default,) {final _that = this;
switch (_that) {
case _PaymentDetailModel():
return $default(_that.paymentRrn,_that.invoiceRrn,_that.month,_that.estateName,_that.houseNumber,_that.date,_that.location,_that.propertyName,_that.invoiceAmount,_that.paidAmount,_that.rentOwed,_that.contactNo,_that.contactEmail,_that.status,_that.tenantName,_that.tenantPhone,_that.tenantEmail,_that.paidBy,_that.paymentType,_that.items,_that.currency);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'rrn')  String? paymentRrn,  String? invoiceRrn,  String? month,  String? estateName,  String? houseNumber,  String? date,  String? location,  String? propertyName, @JsonKey(fromJson: parseDouble)  double invoiceAmount, @JsonKey(fromJson: parseDouble)  double paidAmount, @JsonKey(fromJson: parseDouble)  double rentOwed,  String? contactNo,  String? contactEmail,  String? status,  String? tenantName,  String? tenantPhone,  String? tenantEmail,  String? paidBy,  String? paymentType, @JsonKey(name: 'bills')  List<PaymentLineItem> items,  String? currency)?  $default,) {final _that = this;
switch (_that) {
case _PaymentDetailModel() when $default != null:
return $default(_that.paymentRrn,_that.invoiceRrn,_that.month,_that.estateName,_that.houseNumber,_that.date,_that.location,_that.propertyName,_that.invoiceAmount,_that.paidAmount,_that.rentOwed,_that.contactNo,_that.contactEmail,_that.status,_that.tenantName,_that.tenantPhone,_that.tenantEmail,_that.paidBy,_that.paymentType,_that.items,_that.currency);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PaymentDetailModel extends PaymentDetailModel {
  const _PaymentDetailModel({@JsonKey(name: 'rrn') this.paymentRrn, this.invoiceRrn, this.month, this.estateName, this.houseNumber, this.date, this.location, this.propertyName, @JsonKey(fromJson: parseDouble) this.invoiceAmount = 0, @JsonKey(fromJson: parseDouble) this.paidAmount = 0, @JsonKey(fromJson: parseDouble) this.rentOwed = 0, this.contactNo, this.contactEmail, this.status, this.tenantName, this.tenantPhone, this.tenantEmail, this.paidBy, this.paymentType, @JsonKey(name: 'bills') final  List<PaymentLineItem> items = const [], this.currency}): _items = items,super._();
  factory _PaymentDetailModel.fromJson(Map<String, dynamic> json) => _$PaymentDetailModelFromJson(json);

@override@JsonKey(name: 'rrn') final  String? paymentRrn;
@override final  String? invoiceRrn;
@override final  String? month;
@override final  String? estateName;
@override final  String? houseNumber;
@override final  String? date;
@override final  String? location;
@override final  String? propertyName;
@override@JsonKey(fromJson: parseDouble) final  double invoiceAmount;
@override@JsonKey(fromJson: parseDouble) final  double paidAmount;
@override@JsonKey(fromJson: parseDouble) final  double rentOwed;
@override final  String? contactNo;
@override final  String? contactEmail;
@override final  String? status;
@override final  String? tenantName;
@override final  String? tenantPhone;
@override final  String? tenantEmail;
@override final  String? paidBy;
@override final  String? paymentType;
 final  List<PaymentLineItem> _items;
@override@JsonKey(name: 'bills') List<PaymentLineItem> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

@override final  String? currency;

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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PaymentDetailModel&&(identical(other.paymentRrn, paymentRrn) || other.paymentRrn == paymentRrn)&&(identical(other.invoiceRrn, invoiceRrn) || other.invoiceRrn == invoiceRrn)&&(identical(other.month, month) || other.month == month)&&(identical(other.estateName, estateName) || other.estateName == estateName)&&(identical(other.houseNumber, houseNumber) || other.houseNumber == houseNumber)&&(identical(other.date, date) || other.date == date)&&(identical(other.location, location) || other.location == location)&&(identical(other.propertyName, propertyName) || other.propertyName == propertyName)&&(identical(other.invoiceAmount, invoiceAmount) || other.invoiceAmount == invoiceAmount)&&(identical(other.paidAmount, paidAmount) || other.paidAmount == paidAmount)&&(identical(other.rentOwed, rentOwed) || other.rentOwed == rentOwed)&&(identical(other.contactNo, contactNo) || other.contactNo == contactNo)&&(identical(other.contactEmail, contactEmail) || other.contactEmail == contactEmail)&&(identical(other.status, status) || other.status == status)&&(identical(other.tenantName, tenantName) || other.tenantName == tenantName)&&(identical(other.tenantPhone, tenantPhone) || other.tenantPhone == tenantPhone)&&(identical(other.tenantEmail, tenantEmail) || other.tenantEmail == tenantEmail)&&(identical(other.paidBy, paidBy) || other.paidBy == paidBy)&&(identical(other.paymentType, paymentType) || other.paymentType == paymentType)&&const DeepCollectionEquality().equals(other._items, _items)&&(identical(other.currency, currency) || other.currency == currency));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,paymentRrn,invoiceRrn,month,estateName,houseNumber,date,location,propertyName,invoiceAmount,paidAmount,rentOwed,contactNo,contactEmail,status,tenantName,tenantPhone,tenantEmail,paidBy,paymentType,const DeepCollectionEquality().hash(_items),currency]);

@override
String toString() {
  return 'PaymentDetailModel(paymentRrn: $paymentRrn, invoiceRrn: $invoiceRrn, month: $month, estateName: $estateName, houseNumber: $houseNumber, date: $date, location: $location, propertyName: $propertyName, invoiceAmount: $invoiceAmount, paidAmount: $paidAmount, rentOwed: $rentOwed, contactNo: $contactNo, contactEmail: $contactEmail, status: $status, tenantName: $tenantName, tenantPhone: $tenantPhone, tenantEmail: $tenantEmail, paidBy: $paidBy, paymentType: $paymentType, items: $items, currency: $currency)';
}


}

/// @nodoc
abstract mixin class _$PaymentDetailModelCopyWith<$Res> implements $PaymentDetailModelCopyWith<$Res> {
  factory _$PaymentDetailModelCopyWith(_PaymentDetailModel value, $Res Function(_PaymentDetailModel) _then) = __$PaymentDetailModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'rrn') String? paymentRrn, String? invoiceRrn, String? month, String? estateName, String? houseNumber, String? date, String? location, String? propertyName,@JsonKey(fromJson: parseDouble) double invoiceAmount,@JsonKey(fromJson: parseDouble) double paidAmount,@JsonKey(fromJson: parseDouble) double rentOwed, String? contactNo, String? contactEmail, String? status, String? tenantName, String? tenantPhone, String? tenantEmail, String? paidBy, String? paymentType,@JsonKey(name: 'bills') List<PaymentLineItem> items, String? currency
});




}
/// @nodoc
class __$PaymentDetailModelCopyWithImpl<$Res>
    implements _$PaymentDetailModelCopyWith<$Res> {
  __$PaymentDetailModelCopyWithImpl(this._self, this._then);

  final _PaymentDetailModel _self;
  final $Res Function(_PaymentDetailModel) _then;

/// Create a copy of PaymentDetailModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? paymentRrn = freezed,Object? invoiceRrn = freezed,Object? month = freezed,Object? estateName = freezed,Object? houseNumber = freezed,Object? date = freezed,Object? location = freezed,Object? propertyName = freezed,Object? invoiceAmount = null,Object? paidAmount = null,Object? rentOwed = null,Object? contactNo = freezed,Object? contactEmail = freezed,Object? status = freezed,Object? tenantName = freezed,Object? tenantPhone = freezed,Object? tenantEmail = freezed,Object? paidBy = freezed,Object? paymentType = freezed,Object? items = null,Object? currency = freezed,}) {
  return _then(_PaymentDetailModel(
paymentRrn: freezed == paymentRrn ? _self.paymentRrn : paymentRrn // ignore: cast_nullable_to_non_nullable
as String?,invoiceRrn: freezed == invoiceRrn ? _self.invoiceRrn : invoiceRrn // ignore: cast_nullable_to_non_nullable
as String?,month: freezed == month ? _self.month : month // ignore: cast_nullable_to_non_nullable
as String?,estateName: freezed == estateName ? _self.estateName : estateName // ignore: cast_nullable_to_non_nullable
as String?,houseNumber: freezed == houseNumber ? _self.houseNumber : houseNumber // ignore: cast_nullable_to_non_nullable
as String?,date: freezed == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String?,location: freezed == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String?,propertyName: freezed == propertyName ? _self.propertyName : propertyName // ignore: cast_nullable_to_non_nullable
as String?,invoiceAmount: null == invoiceAmount ? _self.invoiceAmount : invoiceAmount // ignore: cast_nullable_to_non_nullable
as double,paidAmount: null == paidAmount ? _self.paidAmount : paidAmount // ignore: cast_nullable_to_non_nullable
as double,rentOwed: null == rentOwed ? _self.rentOwed : rentOwed // ignore: cast_nullable_to_non_nullable
as double,contactNo: freezed == contactNo ? _self.contactNo : contactNo // ignore: cast_nullable_to_non_nullable
as String?,contactEmail: freezed == contactEmail ? _self.contactEmail : contactEmail // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,tenantName: freezed == tenantName ? _self.tenantName : tenantName // ignore: cast_nullable_to_non_nullable
as String?,tenantPhone: freezed == tenantPhone ? _self.tenantPhone : tenantPhone // ignore: cast_nullable_to_non_nullable
as String?,tenantEmail: freezed == tenantEmail ? _self.tenantEmail : tenantEmail // ignore: cast_nullable_to_non_nullable
as String?,paidBy: freezed == paidBy ? _self.paidBy : paidBy // ignore: cast_nullable_to_non_nullable
as String?,paymentType: freezed == paymentType ? _self.paymentType : paymentType // ignore: cast_nullable_to_non_nullable
as String?,items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<PaymentLineItem>,currency: freezed == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$PaymentLineItem {

 String? get narration;@JsonKey(fromJson: parseDouble) double get value;
/// Create a copy of PaymentLineItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PaymentLineItemCopyWith<PaymentLineItem> get copyWith => _$PaymentLineItemCopyWithImpl<PaymentLineItem>(this as PaymentLineItem, _$identity);

  /// Serializes this PaymentLineItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PaymentLineItem&&(identical(other.narration, narration) || other.narration == narration)&&(identical(other.value, value) || other.value == value));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,narration,value);

@override
String toString() {
  return 'PaymentLineItem(narration: $narration, value: $value)';
}


}

/// @nodoc
abstract mixin class $PaymentLineItemCopyWith<$Res>  {
  factory $PaymentLineItemCopyWith(PaymentLineItem value, $Res Function(PaymentLineItem) _then) = _$PaymentLineItemCopyWithImpl;
@useResult
$Res call({
 String? narration,@JsonKey(fromJson: parseDouble) double value
});




}
/// @nodoc
class _$PaymentLineItemCopyWithImpl<$Res>
    implements $PaymentLineItemCopyWith<$Res> {
  _$PaymentLineItemCopyWithImpl(this._self, this._then);

  final PaymentLineItem _self;
  final $Res Function(PaymentLineItem) _then;

/// Create a copy of PaymentLineItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? narration = freezed,Object? value = null,}) {
  return _then(_self.copyWith(
narration: freezed == narration ? _self.narration : narration // ignore: cast_nullable_to_non_nullable
as String?,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [PaymentLineItem].
extension PaymentLineItemPatterns on PaymentLineItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PaymentLineItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PaymentLineItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PaymentLineItem value)  $default,){
final _that = this;
switch (_that) {
case _PaymentLineItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PaymentLineItem value)?  $default,){
final _that = this;
switch (_that) {
case _PaymentLineItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? narration, @JsonKey(fromJson: parseDouble)  double value)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PaymentLineItem() when $default != null:
return $default(_that.narration,_that.value);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? narration, @JsonKey(fromJson: parseDouble)  double value)  $default,) {final _that = this;
switch (_that) {
case _PaymentLineItem():
return $default(_that.narration,_that.value);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? narration, @JsonKey(fromJson: parseDouble)  double value)?  $default,) {final _that = this;
switch (_that) {
case _PaymentLineItem() when $default != null:
return $default(_that.narration,_that.value);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PaymentLineItem extends PaymentLineItem {
  const _PaymentLineItem({this.narration, @JsonKey(fromJson: parseDouble) this.value = 0}): super._();
  factory _PaymentLineItem.fromJson(Map<String, dynamic> json) => _$PaymentLineItemFromJson(json);

@override final  String? narration;
@override@JsonKey(fromJson: parseDouble) final  double value;

/// Create a copy of PaymentLineItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PaymentLineItemCopyWith<_PaymentLineItem> get copyWith => __$PaymentLineItemCopyWithImpl<_PaymentLineItem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PaymentLineItemToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PaymentLineItem&&(identical(other.narration, narration) || other.narration == narration)&&(identical(other.value, value) || other.value == value));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,narration,value);

@override
String toString() {
  return 'PaymentLineItem(narration: $narration, value: $value)';
}


}

/// @nodoc
abstract mixin class _$PaymentLineItemCopyWith<$Res> implements $PaymentLineItemCopyWith<$Res> {
  factory _$PaymentLineItemCopyWith(_PaymentLineItem value, $Res Function(_PaymentLineItem) _then) = __$PaymentLineItemCopyWithImpl;
@override @useResult
$Res call({
 String? narration,@JsonKey(fromJson: parseDouble) double value
});




}
/// @nodoc
class __$PaymentLineItemCopyWithImpl<$Res>
    implements _$PaymentLineItemCopyWith<$Res> {
  __$PaymentLineItemCopyWithImpl(this._self, this._then);

  final _PaymentLineItem _self;
  final $Res Function(_PaymentLineItem) _then;

/// Create a copy of PaymentLineItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? narration = freezed,Object? value = null,}) {
  return _then(_PaymentLineItem(
narration: freezed == narration ? _self.narration : narration // ignore: cast_nullable_to_non_nullable
as String?,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
