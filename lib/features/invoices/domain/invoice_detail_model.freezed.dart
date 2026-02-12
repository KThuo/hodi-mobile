// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'invoice_detail_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$InvoiceDetailModel {

 String? get rrn; String? get month; String? get estateName; String? get houseNumber; String? get houseCode; String? get date; String? get location; String? get propertyName;@JsonKey(fromJson: parseDouble) double get invoiceAmount;@JsonKey(fromJson: parseDouble) double get rentOwed;@JsonKey(fromJson: parseDouble) double get paidAmount; String? get contactNo; String? get contactEmail; String? get status; int get flag; String? get tenantName; String? get tenantPhone; String? get tenantEmail; String? get message;@JsonKey(name: 'bills') List<InvoiceLineItem> get items; bool get self; int? get propertyId; int? get estateId; int? get id; String? get currency; String? get paymentInstructions; String? get invoiceFooter;
/// Create a copy of InvoiceDetailModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InvoiceDetailModelCopyWith<InvoiceDetailModel> get copyWith => _$InvoiceDetailModelCopyWithImpl<InvoiceDetailModel>(this as InvoiceDetailModel, _$identity);

  /// Serializes this InvoiceDetailModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InvoiceDetailModel&&(identical(other.rrn, rrn) || other.rrn == rrn)&&(identical(other.month, month) || other.month == month)&&(identical(other.estateName, estateName) || other.estateName == estateName)&&(identical(other.houseNumber, houseNumber) || other.houseNumber == houseNumber)&&(identical(other.houseCode, houseCode) || other.houseCode == houseCode)&&(identical(other.date, date) || other.date == date)&&(identical(other.location, location) || other.location == location)&&(identical(other.propertyName, propertyName) || other.propertyName == propertyName)&&(identical(other.invoiceAmount, invoiceAmount) || other.invoiceAmount == invoiceAmount)&&(identical(other.rentOwed, rentOwed) || other.rentOwed == rentOwed)&&(identical(other.paidAmount, paidAmount) || other.paidAmount == paidAmount)&&(identical(other.contactNo, contactNo) || other.contactNo == contactNo)&&(identical(other.contactEmail, contactEmail) || other.contactEmail == contactEmail)&&(identical(other.status, status) || other.status == status)&&(identical(other.flag, flag) || other.flag == flag)&&(identical(other.tenantName, tenantName) || other.tenantName == tenantName)&&(identical(other.tenantPhone, tenantPhone) || other.tenantPhone == tenantPhone)&&(identical(other.tenantEmail, tenantEmail) || other.tenantEmail == tenantEmail)&&(identical(other.message, message) || other.message == message)&&const DeepCollectionEquality().equals(other.items, items)&&(identical(other.self, self) || other.self == self)&&(identical(other.propertyId, propertyId) || other.propertyId == propertyId)&&(identical(other.estateId, estateId) || other.estateId == estateId)&&(identical(other.id, id) || other.id == id)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.paymentInstructions, paymentInstructions) || other.paymentInstructions == paymentInstructions)&&(identical(other.invoiceFooter, invoiceFooter) || other.invoiceFooter == invoiceFooter));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,rrn,month,estateName,houseNumber,houseCode,date,location,propertyName,invoiceAmount,rentOwed,paidAmount,contactNo,contactEmail,status,flag,tenantName,tenantPhone,tenantEmail,message,const DeepCollectionEquality().hash(items),self,propertyId,estateId,id,currency,paymentInstructions,invoiceFooter]);

@override
String toString() {
  return 'InvoiceDetailModel(rrn: $rrn, month: $month, estateName: $estateName, houseNumber: $houseNumber, houseCode: $houseCode, date: $date, location: $location, propertyName: $propertyName, invoiceAmount: $invoiceAmount, rentOwed: $rentOwed, paidAmount: $paidAmount, contactNo: $contactNo, contactEmail: $contactEmail, status: $status, flag: $flag, tenantName: $tenantName, tenantPhone: $tenantPhone, tenantEmail: $tenantEmail, message: $message, items: $items, self: $self, propertyId: $propertyId, estateId: $estateId, id: $id, currency: $currency, paymentInstructions: $paymentInstructions, invoiceFooter: $invoiceFooter)';
}


}

/// @nodoc
abstract mixin class $InvoiceDetailModelCopyWith<$Res>  {
  factory $InvoiceDetailModelCopyWith(InvoiceDetailModel value, $Res Function(InvoiceDetailModel) _then) = _$InvoiceDetailModelCopyWithImpl;
@useResult
$Res call({
 String? rrn, String? month, String? estateName, String? houseNumber, String? houseCode, String? date, String? location, String? propertyName,@JsonKey(fromJson: parseDouble) double invoiceAmount,@JsonKey(fromJson: parseDouble) double rentOwed,@JsonKey(fromJson: parseDouble) double paidAmount, String? contactNo, String? contactEmail, String? status, int flag, String? tenantName, String? tenantPhone, String? tenantEmail, String? message,@JsonKey(name: 'bills') List<InvoiceLineItem> items, bool self, int? propertyId, int? estateId, int? id, String? currency, String? paymentInstructions, String? invoiceFooter
});




}
/// @nodoc
class _$InvoiceDetailModelCopyWithImpl<$Res>
    implements $InvoiceDetailModelCopyWith<$Res> {
  _$InvoiceDetailModelCopyWithImpl(this._self, this._then);

  final InvoiceDetailModel _self;
  final $Res Function(InvoiceDetailModel) _then;

/// Create a copy of InvoiceDetailModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? rrn = freezed,Object? month = freezed,Object? estateName = freezed,Object? houseNumber = freezed,Object? houseCode = freezed,Object? date = freezed,Object? location = freezed,Object? propertyName = freezed,Object? invoiceAmount = null,Object? rentOwed = null,Object? paidAmount = null,Object? contactNo = freezed,Object? contactEmail = freezed,Object? status = freezed,Object? flag = null,Object? tenantName = freezed,Object? tenantPhone = freezed,Object? tenantEmail = freezed,Object? message = freezed,Object? items = null,Object? self = null,Object? propertyId = freezed,Object? estateId = freezed,Object? id = freezed,Object? currency = freezed,Object? paymentInstructions = freezed,Object? invoiceFooter = freezed,}) {
  return _then(_self.copyWith(
rrn: freezed == rrn ? _self.rrn : rrn // ignore: cast_nullable_to_non_nullable
as String?,month: freezed == month ? _self.month : month // ignore: cast_nullable_to_non_nullable
as String?,estateName: freezed == estateName ? _self.estateName : estateName // ignore: cast_nullable_to_non_nullable
as String?,houseNumber: freezed == houseNumber ? _self.houseNumber : houseNumber // ignore: cast_nullable_to_non_nullable
as String?,houseCode: freezed == houseCode ? _self.houseCode : houseCode // ignore: cast_nullable_to_non_nullable
as String?,date: freezed == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String?,location: freezed == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String?,propertyName: freezed == propertyName ? _self.propertyName : propertyName // ignore: cast_nullable_to_non_nullable
as String?,invoiceAmount: null == invoiceAmount ? _self.invoiceAmount : invoiceAmount // ignore: cast_nullable_to_non_nullable
as double,rentOwed: null == rentOwed ? _self.rentOwed : rentOwed // ignore: cast_nullable_to_non_nullable
as double,paidAmount: null == paidAmount ? _self.paidAmount : paidAmount // ignore: cast_nullable_to_non_nullable
as double,contactNo: freezed == contactNo ? _self.contactNo : contactNo // ignore: cast_nullable_to_non_nullable
as String?,contactEmail: freezed == contactEmail ? _self.contactEmail : contactEmail // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,flag: null == flag ? _self.flag : flag // ignore: cast_nullable_to_non_nullable
as int,tenantName: freezed == tenantName ? _self.tenantName : tenantName // ignore: cast_nullable_to_non_nullable
as String?,tenantPhone: freezed == tenantPhone ? _self.tenantPhone : tenantPhone // ignore: cast_nullable_to_non_nullable
as String?,tenantEmail: freezed == tenantEmail ? _self.tenantEmail : tenantEmail // ignore: cast_nullable_to_non_nullable
as String?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<InvoiceLineItem>,self: null == self ? _self.self : self // ignore: cast_nullable_to_non_nullable
as bool,propertyId: freezed == propertyId ? _self.propertyId : propertyId // ignore: cast_nullable_to_non_nullable
as int?,estateId: freezed == estateId ? _self.estateId : estateId // ignore: cast_nullable_to_non_nullable
as int?,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,currency: freezed == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String?,paymentInstructions: freezed == paymentInstructions ? _self.paymentInstructions : paymentInstructions // ignore: cast_nullable_to_non_nullable
as String?,invoiceFooter: freezed == invoiceFooter ? _self.invoiceFooter : invoiceFooter // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [InvoiceDetailModel].
extension InvoiceDetailModelPatterns on InvoiceDetailModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _InvoiceDetailModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _InvoiceDetailModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _InvoiceDetailModel value)  $default,){
final _that = this;
switch (_that) {
case _InvoiceDetailModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _InvoiceDetailModel value)?  $default,){
final _that = this;
switch (_that) {
case _InvoiceDetailModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? rrn,  String? month,  String? estateName,  String? houseNumber,  String? houseCode,  String? date,  String? location,  String? propertyName, @JsonKey(fromJson: parseDouble)  double invoiceAmount, @JsonKey(fromJson: parseDouble)  double rentOwed, @JsonKey(fromJson: parseDouble)  double paidAmount,  String? contactNo,  String? contactEmail,  String? status,  int flag,  String? tenantName,  String? tenantPhone,  String? tenantEmail,  String? message, @JsonKey(name: 'bills')  List<InvoiceLineItem> items,  bool self,  int? propertyId,  int? estateId,  int? id,  String? currency,  String? paymentInstructions,  String? invoiceFooter)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _InvoiceDetailModel() when $default != null:
return $default(_that.rrn,_that.month,_that.estateName,_that.houseNumber,_that.houseCode,_that.date,_that.location,_that.propertyName,_that.invoiceAmount,_that.rentOwed,_that.paidAmount,_that.contactNo,_that.contactEmail,_that.status,_that.flag,_that.tenantName,_that.tenantPhone,_that.tenantEmail,_that.message,_that.items,_that.self,_that.propertyId,_that.estateId,_that.id,_that.currency,_that.paymentInstructions,_that.invoiceFooter);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? rrn,  String? month,  String? estateName,  String? houseNumber,  String? houseCode,  String? date,  String? location,  String? propertyName, @JsonKey(fromJson: parseDouble)  double invoiceAmount, @JsonKey(fromJson: parseDouble)  double rentOwed, @JsonKey(fromJson: parseDouble)  double paidAmount,  String? contactNo,  String? contactEmail,  String? status,  int flag,  String? tenantName,  String? tenantPhone,  String? tenantEmail,  String? message, @JsonKey(name: 'bills')  List<InvoiceLineItem> items,  bool self,  int? propertyId,  int? estateId,  int? id,  String? currency,  String? paymentInstructions,  String? invoiceFooter)  $default,) {final _that = this;
switch (_that) {
case _InvoiceDetailModel():
return $default(_that.rrn,_that.month,_that.estateName,_that.houseNumber,_that.houseCode,_that.date,_that.location,_that.propertyName,_that.invoiceAmount,_that.rentOwed,_that.paidAmount,_that.contactNo,_that.contactEmail,_that.status,_that.flag,_that.tenantName,_that.tenantPhone,_that.tenantEmail,_that.message,_that.items,_that.self,_that.propertyId,_that.estateId,_that.id,_that.currency,_that.paymentInstructions,_that.invoiceFooter);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? rrn,  String? month,  String? estateName,  String? houseNumber,  String? houseCode,  String? date,  String? location,  String? propertyName, @JsonKey(fromJson: parseDouble)  double invoiceAmount, @JsonKey(fromJson: parseDouble)  double rentOwed, @JsonKey(fromJson: parseDouble)  double paidAmount,  String? contactNo,  String? contactEmail,  String? status,  int flag,  String? tenantName,  String? tenantPhone,  String? tenantEmail,  String? message, @JsonKey(name: 'bills')  List<InvoiceLineItem> items,  bool self,  int? propertyId,  int? estateId,  int? id,  String? currency,  String? paymentInstructions,  String? invoiceFooter)?  $default,) {final _that = this;
switch (_that) {
case _InvoiceDetailModel() when $default != null:
return $default(_that.rrn,_that.month,_that.estateName,_that.houseNumber,_that.houseCode,_that.date,_that.location,_that.propertyName,_that.invoiceAmount,_that.rentOwed,_that.paidAmount,_that.contactNo,_that.contactEmail,_that.status,_that.flag,_that.tenantName,_that.tenantPhone,_that.tenantEmail,_that.message,_that.items,_that.self,_that.propertyId,_that.estateId,_that.id,_that.currency,_that.paymentInstructions,_that.invoiceFooter);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _InvoiceDetailModel extends InvoiceDetailModel {
  const _InvoiceDetailModel({this.rrn, this.month, this.estateName, this.houseNumber, this.houseCode, this.date, this.location, this.propertyName, @JsonKey(fromJson: parseDouble) this.invoiceAmount = 0, @JsonKey(fromJson: parseDouble) this.rentOwed = 0, @JsonKey(fromJson: parseDouble) this.paidAmount = 0, this.contactNo, this.contactEmail, this.status, this.flag = 0, this.tenantName, this.tenantPhone, this.tenantEmail, this.message, @JsonKey(name: 'bills') final  List<InvoiceLineItem> items = const [], this.self = false, this.propertyId, this.estateId, this.id, this.currency, this.paymentInstructions, this.invoiceFooter}): _items = items,super._();
  factory _InvoiceDetailModel.fromJson(Map<String, dynamic> json) => _$InvoiceDetailModelFromJson(json);

@override final  String? rrn;
@override final  String? month;
@override final  String? estateName;
@override final  String? houseNumber;
@override final  String? houseCode;
@override final  String? date;
@override final  String? location;
@override final  String? propertyName;
@override@JsonKey(fromJson: parseDouble) final  double invoiceAmount;
@override@JsonKey(fromJson: parseDouble) final  double rentOwed;
@override@JsonKey(fromJson: parseDouble) final  double paidAmount;
@override final  String? contactNo;
@override final  String? contactEmail;
@override final  String? status;
@override@JsonKey() final  int flag;
@override final  String? tenantName;
@override final  String? tenantPhone;
@override final  String? tenantEmail;
@override final  String? message;
 final  List<InvoiceLineItem> _items;
@override@JsonKey(name: 'bills') List<InvoiceLineItem> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

@override@JsonKey() final  bool self;
@override final  int? propertyId;
@override final  int? estateId;
@override final  int? id;
@override final  String? currency;
@override final  String? paymentInstructions;
@override final  String? invoiceFooter;

/// Create a copy of InvoiceDetailModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InvoiceDetailModelCopyWith<_InvoiceDetailModel> get copyWith => __$InvoiceDetailModelCopyWithImpl<_InvoiceDetailModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$InvoiceDetailModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _InvoiceDetailModel&&(identical(other.rrn, rrn) || other.rrn == rrn)&&(identical(other.month, month) || other.month == month)&&(identical(other.estateName, estateName) || other.estateName == estateName)&&(identical(other.houseNumber, houseNumber) || other.houseNumber == houseNumber)&&(identical(other.houseCode, houseCode) || other.houseCode == houseCode)&&(identical(other.date, date) || other.date == date)&&(identical(other.location, location) || other.location == location)&&(identical(other.propertyName, propertyName) || other.propertyName == propertyName)&&(identical(other.invoiceAmount, invoiceAmount) || other.invoiceAmount == invoiceAmount)&&(identical(other.rentOwed, rentOwed) || other.rentOwed == rentOwed)&&(identical(other.paidAmount, paidAmount) || other.paidAmount == paidAmount)&&(identical(other.contactNo, contactNo) || other.contactNo == contactNo)&&(identical(other.contactEmail, contactEmail) || other.contactEmail == contactEmail)&&(identical(other.status, status) || other.status == status)&&(identical(other.flag, flag) || other.flag == flag)&&(identical(other.tenantName, tenantName) || other.tenantName == tenantName)&&(identical(other.tenantPhone, tenantPhone) || other.tenantPhone == tenantPhone)&&(identical(other.tenantEmail, tenantEmail) || other.tenantEmail == tenantEmail)&&(identical(other.message, message) || other.message == message)&&const DeepCollectionEquality().equals(other._items, _items)&&(identical(other.self, self) || other.self == self)&&(identical(other.propertyId, propertyId) || other.propertyId == propertyId)&&(identical(other.estateId, estateId) || other.estateId == estateId)&&(identical(other.id, id) || other.id == id)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.paymentInstructions, paymentInstructions) || other.paymentInstructions == paymentInstructions)&&(identical(other.invoiceFooter, invoiceFooter) || other.invoiceFooter == invoiceFooter));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,rrn,month,estateName,houseNumber,houseCode,date,location,propertyName,invoiceAmount,rentOwed,paidAmount,contactNo,contactEmail,status,flag,tenantName,tenantPhone,tenantEmail,message,const DeepCollectionEquality().hash(_items),self,propertyId,estateId,id,currency,paymentInstructions,invoiceFooter]);

@override
String toString() {
  return 'InvoiceDetailModel(rrn: $rrn, month: $month, estateName: $estateName, houseNumber: $houseNumber, houseCode: $houseCode, date: $date, location: $location, propertyName: $propertyName, invoiceAmount: $invoiceAmount, rentOwed: $rentOwed, paidAmount: $paidAmount, contactNo: $contactNo, contactEmail: $contactEmail, status: $status, flag: $flag, tenantName: $tenantName, tenantPhone: $tenantPhone, tenantEmail: $tenantEmail, message: $message, items: $items, self: $self, propertyId: $propertyId, estateId: $estateId, id: $id, currency: $currency, paymentInstructions: $paymentInstructions, invoiceFooter: $invoiceFooter)';
}


}

/// @nodoc
abstract mixin class _$InvoiceDetailModelCopyWith<$Res> implements $InvoiceDetailModelCopyWith<$Res> {
  factory _$InvoiceDetailModelCopyWith(_InvoiceDetailModel value, $Res Function(_InvoiceDetailModel) _then) = __$InvoiceDetailModelCopyWithImpl;
@override @useResult
$Res call({
 String? rrn, String? month, String? estateName, String? houseNumber, String? houseCode, String? date, String? location, String? propertyName,@JsonKey(fromJson: parseDouble) double invoiceAmount,@JsonKey(fromJson: parseDouble) double rentOwed,@JsonKey(fromJson: parseDouble) double paidAmount, String? contactNo, String? contactEmail, String? status, int flag, String? tenantName, String? tenantPhone, String? tenantEmail, String? message,@JsonKey(name: 'bills') List<InvoiceLineItem> items, bool self, int? propertyId, int? estateId, int? id, String? currency, String? paymentInstructions, String? invoiceFooter
});




}
/// @nodoc
class __$InvoiceDetailModelCopyWithImpl<$Res>
    implements _$InvoiceDetailModelCopyWith<$Res> {
  __$InvoiceDetailModelCopyWithImpl(this._self, this._then);

  final _InvoiceDetailModel _self;
  final $Res Function(_InvoiceDetailModel) _then;

/// Create a copy of InvoiceDetailModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? rrn = freezed,Object? month = freezed,Object? estateName = freezed,Object? houseNumber = freezed,Object? houseCode = freezed,Object? date = freezed,Object? location = freezed,Object? propertyName = freezed,Object? invoiceAmount = null,Object? rentOwed = null,Object? paidAmount = null,Object? contactNo = freezed,Object? contactEmail = freezed,Object? status = freezed,Object? flag = null,Object? tenantName = freezed,Object? tenantPhone = freezed,Object? tenantEmail = freezed,Object? message = freezed,Object? items = null,Object? self = null,Object? propertyId = freezed,Object? estateId = freezed,Object? id = freezed,Object? currency = freezed,Object? paymentInstructions = freezed,Object? invoiceFooter = freezed,}) {
  return _then(_InvoiceDetailModel(
rrn: freezed == rrn ? _self.rrn : rrn // ignore: cast_nullable_to_non_nullable
as String?,month: freezed == month ? _self.month : month // ignore: cast_nullable_to_non_nullable
as String?,estateName: freezed == estateName ? _self.estateName : estateName // ignore: cast_nullable_to_non_nullable
as String?,houseNumber: freezed == houseNumber ? _self.houseNumber : houseNumber // ignore: cast_nullable_to_non_nullable
as String?,houseCode: freezed == houseCode ? _self.houseCode : houseCode // ignore: cast_nullable_to_non_nullable
as String?,date: freezed == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String?,location: freezed == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String?,propertyName: freezed == propertyName ? _self.propertyName : propertyName // ignore: cast_nullable_to_non_nullable
as String?,invoiceAmount: null == invoiceAmount ? _self.invoiceAmount : invoiceAmount // ignore: cast_nullable_to_non_nullable
as double,rentOwed: null == rentOwed ? _self.rentOwed : rentOwed // ignore: cast_nullable_to_non_nullable
as double,paidAmount: null == paidAmount ? _self.paidAmount : paidAmount // ignore: cast_nullable_to_non_nullable
as double,contactNo: freezed == contactNo ? _self.contactNo : contactNo // ignore: cast_nullable_to_non_nullable
as String?,contactEmail: freezed == contactEmail ? _self.contactEmail : contactEmail // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,flag: null == flag ? _self.flag : flag // ignore: cast_nullable_to_non_nullable
as int,tenantName: freezed == tenantName ? _self.tenantName : tenantName // ignore: cast_nullable_to_non_nullable
as String?,tenantPhone: freezed == tenantPhone ? _self.tenantPhone : tenantPhone // ignore: cast_nullable_to_non_nullable
as String?,tenantEmail: freezed == tenantEmail ? _self.tenantEmail : tenantEmail // ignore: cast_nullable_to_non_nullable
as String?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<InvoiceLineItem>,self: null == self ? _self.self : self // ignore: cast_nullable_to_non_nullable
as bool,propertyId: freezed == propertyId ? _self.propertyId : propertyId // ignore: cast_nullable_to_non_nullable
as int?,estateId: freezed == estateId ? _self.estateId : estateId // ignore: cast_nullable_to_non_nullable
as int?,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,currency: freezed == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String?,paymentInstructions: freezed == paymentInstructions ? _self.paymentInstructions : paymentInstructions // ignore: cast_nullable_to_non_nullable
as String?,invoiceFooter: freezed == invoiceFooter ? _self.invoiceFooter : invoiceFooter // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$InvoiceLineItem {

 String? get narration;@JsonKey(fromJson: parseDouble) double get value;
/// Create a copy of InvoiceLineItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InvoiceLineItemCopyWith<InvoiceLineItem> get copyWith => _$InvoiceLineItemCopyWithImpl<InvoiceLineItem>(this as InvoiceLineItem, _$identity);

  /// Serializes this InvoiceLineItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InvoiceLineItem&&(identical(other.narration, narration) || other.narration == narration)&&(identical(other.value, value) || other.value == value));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,narration,value);

@override
String toString() {
  return 'InvoiceLineItem(narration: $narration, value: $value)';
}


}

/// @nodoc
abstract mixin class $InvoiceLineItemCopyWith<$Res>  {
  factory $InvoiceLineItemCopyWith(InvoiceLineItem value, $Res Function(InvoiceLineItem) _then) = _$InvoiceLineItemCopyWithImpl;
@useResult
$Res call({
 String? narration,@JsonKey(fromJson: parseDouble) double value
});




}
/// @nodoc
class _$InvoiceLineItemCopyWithImpl<$Res>
    implements $InvoiceLineItemCopyWith<$Res> {
  _$InvoiceLineItemCopyWithImpl(this._self, this._then);

  final InvoiceLineItem _self;
  final $Res Function(InvoiceLineItem) _then;

/// Create a copy of InvoiceLineItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? narration = freezed,Object? value = null,}) {
  return _then(_self.copyWith(
narration: freezed == narration ? _self.narration : narration // ignore: cast_nullable_to_non_nullable
as String?,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [InvoiceLineItem].
extension InvoiceLineItemPatterns on InvoiceLineItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _InvoiceLineItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _InvoiceLineItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _InvoiceLineItem value)  $default,){
final _that = this;
switch (_that) {
case _InvoiceLineItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _InvoiceLineItem value)?  $default,){
final _that = this;
switch (_that) {
case _InvoiceLineItem() when $default != null:
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
case _InvoiceLineItem() when $default != null:
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
case _InvoiceLineItem():
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
case _InvoiceLineItem() when $default != null:
return $default(_that.narration,_that.value);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _InvoiceLineItem extends InvoiceLineItem {
  const _InvoiceLineItem({this.narration, @JsonKey(fromJson: parseDouble) this.value = 0}): super._();
  factory _InvoiceLineItem.fromJson(Map<String, dynamic> json) => _$InvoiceLineItemFromJson(json);

@override final  String? narration;
@override@JsonKey(fromJson: parseDouble) final  double value;

/// Create a copy of InvoiceLineItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InvoiceLineItemCopyWith<_InvoiceLineItem> get copyWith => __$InvoiceLineItemCopyWithImpl<_InvoiceLineItem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$InvoiceLineItemToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _InvoiceLineItem&&(identical(other.narration, narration) || other.narration == narration)&&(identical(other.value, value) || other.value == value));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,narration,value);

@override
String toString() {
  return 'InvoiceLineItem(narration: $narration, value: $value)';
}


}

/// @nodoc
abstract mixin class _$InvoiceLineItemCopyWith<$Res> implements $InvoiceLineItemCopyWith<$Res> {
  factory _$InvoiceLineItemCopyWith(_InvoiceLineItem value, $Res Function(_InvoiceLineItem) _then) = __$InvoiceLineItemCopyWithImpl;
@override @useResult
$Res call({
 String? narration,@JsonKey(fromJson: parseDouble) double value
});




}
/// @nodoc
class __$InvoiceLineItemCopyWithImpl<$Res>
    implements _$InvoiceLineItemCopyWith<$Res> {
  __$InvoiceLineItemCopyWithImpl(this._self, this._then);

  final _InvoiceLineItem _self;
  final $Res Function(_InvoiceLineItem) _then;

/// Create a copy of InvoiceLineItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? narration = freezed,Object? value = null,}) {
  return _then(_InvoiceLineItem(
narration: freezed == narration ? _self.narration : narration // ignore: cast_nullable_to_non_nullable
as String?,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
