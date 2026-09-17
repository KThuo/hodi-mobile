// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'invoice_document_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$InvoiceDocumentModel {

 String get rrn; String? get invoiceType; String? get statusLabel; String? get periodLabel; String? get tenantName; String? get tenantPhone; String? get houseLabel; String? get houseCode; String? get propertyName; String? get estateName; String? get propertyLocation; List<InvoiceDocumentLine> get lines;/// What has been paid against it, and when. Listed rather than summed into a single Paid
/// total, as legacy lists them — "Payment on 27-08-2026 11:13 — UHR0Y46U0Q via Coop STK Push".
/// Kept out of [lines] because a line is a charge and these are not.
 List<InvoiceDocumentPayment> get payments;/// The face value: every charge, arrears brought forward included.
@JsonKey(fromJson: parseDouble) double get amount;@JsonKey(fromJson: parseDouble) double get paidAmount;/// What is still owed. The figure this screen leads with.
@JsonKey(fromJson: parseDouble) double get balanceDue; String? get dueDate; String? get issuedOn; bool get overdue;/// Whether it can still be paid. The server's own test, which is what the web puts its Pay
/// button behind — rather than the app deciding from a status integer it would have to keep
/// in step.
 bool get payable; String? get paymentInstructions; String? get footer;
/// Create a copy of InvoiceDocumentModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InvoiceDocumentModelCopyWith<InvoiceDocumentModel> get copyWith => _$InvoiceDocumentModelCopyWithImpl<InvoiceDocumentModel>(this as InvoiceDocumentModel, _$identity);

  /// Serializes this InvoiceDocumentModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InvoiceDocumentModel&&(identical(other.rrn, rrn) || other.rrn == rrn)&&(identical(other.invoiceType, invoiceType) || other.invoiceType == invoiceType)&&(identical(other.statusLabel, statusLabel) || other.statusLabel == statusLabel)&&(identical(other.periodLabel, periodLabel) || other.periodLabel == periodLabel)&&(identical(other.tenantName, tenantName) || other.tenantName == tenantName)&&(identical(other.tenantPhone, tenantPhone) || other.tenantPhone == tenantPhone)&&(identical(other.houseLabel, houseLabel) || other.houseLabel == houseLabel)&&(identical(other.houseCode, houseCode) || other.houseCode == houseCode)&&(identical(other.propertyName, propertyName) || other.propertyName == propertyName)&&(identical(other.estateName, estateName) || other.estateName == estateName)&&(identical(other.propertyLocation, propertyLocation) || other.propertyLocation == propertyLocation)&&const DeepCollectionEquality().equals(other.lines, lines)&&const DeepCollectionEquality().equals(other.payments, payments)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.paidAmount, paidAmount) || other.paidAmount == paidAmount)&&(identical(other.balanceDue, balanceDue) || other.balanceDue == balanceDue)&&(identical(other.dueDate, dueDate) || other.dueDate == dueDate)&&(identical(other.issuedOn, issuedOn) || other.issuedOn == issuedOn)&&(identical(other.overdue, overdue) || other.overdue == overdue)&&(identical(other.payable, payable) || other.payable == payable)&&(identical(other.paymentInstructions, paymentInstructions) || other.paymentInstructions == paymentInstructions)&&(identical(other.footer, footer) || other.footer == footer));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,rrn,invoiceType,statusLabel,periodLabel,tenantName,tenantPhone,houseLabel,houseCode,propertyName,estateName,propertyLocation,const DeepCollectionEquality().hash(lines),const DeepCollectionEquality().hash(payments),amount,paidAmount,balanceDue,dueDate,issuedOn,overdue,payable,paymentInstructions,footer]);

@override
String toString() {
  return 'InvoiceDocumentModel(rrn: $rrn, invoiceType: $invoiceType, statusLabel: $statusLabel, periodLabel: $periodLabel, tenantName: $tenantName, tenantPhone: $tenantPhone, houseLabel: $houseLabel, houseCode: $houseCode, propertyName: $propertyName, estateName: $estateName, propertyLocation: $propertyLocation, lines: $lines, payments: $payments, amount: $amount, paidAmount: $paidAmount, balanceDue: $balanceDue, dueDate: $dueDate, issuedOn: $issuedOn, overdue: $overdue, payable: $payable, paymentInstructions: $paymentInstructions, footer: $footer)';
}


}

/// @nodoc
abstract mixin class $InvoiceDocumentModelCopyWith<$Res>  {
  factory $InvoiceDocumentModelCopyWith(InvoiceDocumentModel value, $Res Function(InvoiceDocumentModel) _then) = _$InvoiceDocumentModelCopyWithImpl;
@useResult
$Res call({
 String rrn, String? invoiceType, String? statusLabel, String? periodLabel, String? tenantName, String? tenantPhone, String? houseLabel, String? houseCode, String? propertyName, String? estateName, String? propertyLocation, List<InvoiceDocumentLine> lines, List<InvoiceDocumentPayment> payments,@JsonKey(fromJson: parseDouble) double amount,@JsonKey(fromJson: parseDouble) double paidAmount,@JsonKey(fromJson: parseDouble) double balanceDue, String? dueDate, String? issuedOn, bool overdue, bool payable, String? paymentInstructions, String? footer
});




}
/// @nodoc
class _$InvoiceDocumentModelCopyWithImpl<$Res>
    implements $InvoiceDocumentModelCopyWith<$Res> {
  _$InvoiceDocumentModelCopyWithImpl(this._self, this._then);

  final InvoiceDocumentModel _self;
  final $Res Function(InvoiceDocumentModel) _then;

/// Create a copy of InvoiceDocumentModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? rrn = null,Object? invoiceType = freezed,Object? statusLabel = freezed,Object? periodLabel = freezed,Object? tenantName = freezed,Object? tenantPhone = freezed,Object? houseLabel = freezed,Object? houseCode = freezed,Object? propertyName = freezed,Object? estateName = freezed,Object? propertyLocation = freezed,Object? lines = null,Object? payments = null,Object? amount = null,Object? paidAmount = null,Object? balanceDue = null,Object? dueDate = freezed,Object? issuedOn = freezed,Object? overdue = null,Object? payable = null,Object? paymentInstructions = freezed,Object? footer = freezed,}) {
  return _then(_self.copyWith(
rrn: null == rrn ? _self.rrn : rrn // ignore: cast_nullable_to_non_nullable
as String,invoiceType: freezed == invoiceType ? _self.invoiceType : invoiceType // ignore: cast_nullable_to_non_nullable
as String?,statusLabel: freezed == statusLabel ? _self.statusLabel : statusLabel // ignore: cast_nullable_to_non_nullable
as String?,periodLabel: freezed == periodLabel ? _self.periodLabel : periodLabel // ignore: cast_nullable_to_non_nullable
as String?,tenantName: freezed == tenantName ? _self.tenantName : tenantName // ignore: cast_nullable_to_non_nullable
as String?,tenantPhone: freezed == tenantPhone ? _self.tenantPhone : tenantPhone // ignore: cast_nullable_to_non_nullable
as String?,houseLabel: freezed == houseLabel ? _self.houseLabel : houseLabel // ignore: cast_nullable_to_non_nullable
as String?,houseCode: freezed == houseCode ? _self.houseCode : houseCode // ignore: cast_nullable_to_non_nullable
as String?,propertyName: freezed == propertyName ? _self.propertyName : propertyName // ignore: cast_nullable_to_non_nullable
as String?,estateName: freezed == estateName ? _self.estateName : estateName // ignore: cast_nullable_to_non_nullable
as String?,propertyLocation: freezed == propertyLocation ? _self.propertyLocation : propertyLocation // ignore: cast_nullable_to_non_nullable
as String?,lines: null == lines ? _self.lines : lines // ignore: cast_nullable_to_non_nullable
as List<InvoiceDocumentLine>,payments: null == payments ? _self.payments : payments // ignore: cast_nullable_to_non_nullable
as List<InvoiceDocumentPayment>,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,paidAmount: null == paidAmount ? _self.paidAmount : paidAmount // ignore: cast_nullable_to_non_nullable
as double,balanceDue: null == balanceDue ? _self.balanceDue : balanceDue // ignore: cast_nullable_to_non_nullable
as double,dueDate: freezed == dueDate ? _self.dueDate : dueDate // ignore: cast_nullable_to_non_nullable
as String?,issuedOn: freezed == issuedOn ? _self.issuedOn : issuedOn // ignore: cast_nullable_to_non_nullable
as String?,overdue: null == overdue ? _self.overdue : overdue // ignore: cast_nullable_to_non_nullable
as bool,payable: null == payable ? _self.payable : payable // ignore: cast_nullable_to_non_nullable
as bool,paymentInstructions: freezed == paymentInstructions ? _self.paymentInstructions : paymentInstructions // ignore: cast_nullable_to_non_nullable
as String?,footer: freezed == footer ? _self.footer : footer // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [InvoiceDocumentModel].
extension InvoiceDocumentModelPatterns on InvoiceDocumentModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _InvoiceDocumentModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _InvoiceDocumentModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _InvoiceDocumentModel value)  $default,){
final _that = this;
switch (_that) {
case _InvoiceDocumentModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _InvoiceDocumentModel value)?  $default,){
final _that = this;
switch (_that) {
case _InvoiceDocumentModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String rrn,  String? invoiceType,  String? statusLabel,  String? periodLabel,  String? tenantName,  String? tenantPhone,  String? houseLabel,  String? houseCode,  String? propertyName,  String? estateName,  String? propertyLocation,  List<InvoiceDocumentLine> lines,  List<InvoiceDocumentPayment> payments, @JsonKey(fromJson: parseDouble)  double amount, @JsonKey(fromJson: parseDouble)  double paidAmount, @JsonKey(fromJson: parseDouble)  double balanceDue,  String? dueDate,  String? issuedOn,  bool overdue,  bool payable,  String? paymentInstructions,  String? footer)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _InvoiceDocumentModel() when $default != null:
return $default(_that.rrn,_that.invoiceType,_that.statusLabel,_that.periodLabel,_that.tenantName,_that.tenantPhone,_that.houseLabel,_that.houseCode,_that.propertyName,_that.estateName,_that.propertyLocation,_that.lines,_that.payments,_that.amount,_that.paidAmount,_that.balanceDue,_that.dueDate,_that.issuedOn,_that.overdue,_that.payable,_that.paymentInstructions,_that.footer);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String rrn,  String? invoiceType,  String? statusLabel,  String? periodLabel,  String? tenantName,  String? tenantPhone,  String? houseLabel,  String? houseCode,  String? propertyName,  String? estateName,  String? propertyLocation,  List<InvoiceDocumentLine> lines,  List<InvoiceDocumentPayment> payments, @JsonKey(fromJson: parseDouble)  double amount, @JsonKey(fromJson: parseDouble)  double paidAmount, @JsonKey(fromJson: parseDouble)  double balanceDue,  String? dueDate,  String? issuedOn,  bool overdue,  bool payable,  String? paymentInstructions,  String? footer)  $default,) {final _that = this;
switch (_that) {
case _InvoiceDocumentModel():
return $default(_that.rrn,_that.invoiceType,_that.statusLabel,_that.periodLabel,_that.tenantName,_that.tenantPhone,_that.houseLabel,_that.houseCode,_that.propertyName,_that.estateName,_that.propertyLocation,_that.lines,_that.payments,_that.amount,_that.paidAmount,_that.balanceDue,_that.dueDate,_that.issuedOn,_that.overdue,_that.payable,_that.paymentInstructions,_that.footer);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String rrn,  String? invoiceType,  String? statusLabel,  String? periodLabel,  String? tenantName,  String? tenantPhone,  String? houseLabel,  String? houseCode,  String? propertyName,  String? estateName,  String? propertyLocation,  List<InvoiceDocumentLine> lines,  List<InvoiceDocumentPayment> payments, @JsonKey(fromJson: parseDouble)  double amount, @JsonKey(fromJson: parseDouble)  double paidAmount, @JsonKey(fromJson: parseDouble)  double balanceDue,  String? dueDate,  String? issuedOn,  bool overdue,  bool payable,  String? paymentInstructions,  String? footer)?  $default,) {final _that = this;
switch (_that) {
case _InvoiceDocumentModel() when $default != null:
return $default(_that.rrn,_that.invoiceType,_that.statusLabel,_that.periodLabel,_that.tenantName,_that.tenantPhone,_that.houseLabel,_that.houseCode,_that.propertyName,_that.estateName,_that.propertyLocation,_that.lines,_that.payments,_that.amount,_that.paidAmount,_that.balanceDue,_that.dueDate,_that.issuedOn,_that.overdue,_that.payable,_that.paymentInstructions,_that.footer);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _InvoiceDocumentModel extends InvoiceDocumentModel {
  const _InvoiceDocumentModel({required this.rrn, this.invoiceType, this.statusLabel, this.periodLabel, this.tenantName, this.tenantPhone, this.houseLabel, this.houseCode, this.propertyName, this.estateName, this.propertyLocation, final  List<InvoiceDocumentLine> lines = const <InvoiceDocumentLine>[], final  List<InvoiceDocumentPayment> payments = const <InvoiceDocumentPayment>[], @JsonKey(fromJson: parseDouble) this.amount = 0, @JsonKey(fromJson: parseDouble) this.paidAmount = 0, @JsonKey(fromJson: parseDouble) this.balanceDue = 0, this.dueDate, this.issuedOn, this.overdue = false, this.payable = false, this.paymentInstructions, this.footer}): _lines = lines,_payments = payments,super._();
  factory _InvoiceDocumentModel.fromJson(Map<String, dynamic> json) => _$InvoiceDocumentModelFromJson(json);

@override final  String rrn;
@override final  String? invoiceType;
@override final  String? statusLabel;
@override final  String? periodLabel;
@override final  String? tenantName;
@override final  String? tenantPhone;
@override final  String? houseLabel;
@override final  String? houseCode;
@override final  String? propertyName;
@override final  String? estateName;
@override final  String? propertyLocation;
 final  List<InvoiceDocumentLine> _lines;
@override@JsonKey() List<InvoiceDocumentLine> get lines {
  if (_lines is EqualUnmodifiableListView) return _lines;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_lines);
}

/// What has been paid against it, and when. Listed rather than summed into a single Paid
/// total, as legacy lists them — "Payment on 27-08-2026 11:13 — UHR0Y46U0Q via Coop STK Push".
/// Kept out of [lines] because a line is a charge and these are not.
 final  List<InvoiceDocumentPayment> _payments;
/// What has been paid against it, and when. Listed rather than summed into a single Paid
/// total, as legacy lists them — "Payment on 27-08-2026 11:13 — UHR0Y46U0Q via Coop STK Push".
/// Kept out of [lines] because a line is a charge and these are not.
@override@JsonKey() List<InvoiceDocumentPayment> get payments {
  if (_payments is EqualUnmodifiableListView) return _payments;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_payments);
}

/// The face value: every charge, arrears brought forward included.
@override@JsonKey(fromJson: parseDouble) final  double amount;
@override@JsonKey(fromJson: parseDouble) final  double paidAmount;
/// What is still owed. The figure this screen leads with.
@override@JsonKey(fromJson: parseDouble) final  double balanceDue;
@override final  String? dueDate;
@override final  String? issuedOn;
@override@JsonKey() final  bool overdue;
/// Whether it can still be paid. The server's own test, which is what the web puts its Pay
/// button behind — rather than the app deciding from a status integer it would have to keep
/// in step.
@override@JsonKey() final  bool payable;
@override final  String? paymentInstructions;
@override final  String? footer;

/// Create a copy of InvoiceDocumentModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InvoiceDocumentModelCopyWith<_InvoiceDocumentModel> get copyWith => __$InvoiceDocumentModelCopyWithImpl<_InvoiceDocumentModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$InvoiceDocumentModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _InvoiceDocumentModel&&(identical(other.rrn, rrn) || other.rrn == rrn)&&(identical(other.invoiceType, invoiceType) || other.invoiceType == invoiceType)&&(identical(other.statusLabel, statusLabel) || other.statusLabel == statusLabel)&&(identical(other.periodLabel, periodLabel) || other.periodLabel == periodLabel)&&(identical(other.tenantName, tenantName) || other.tenantName == tenantName)&&(identical(other.tenantPhone, tenantPhone) || other.tenantPhone == tenantPhone)&&(identical(other.houseLabel, houseLabel) || other.houseLabel == houseLabel)&&(identical(other.houseCode, houseCode) || other.houseCode == houseCode)&&(identical(other.propertyName, propertyName) || other.propertyName == propertyName)&&(identical(other.estateName, estateName) || other.estateName == estateName)&&(identical(other.propertyLocation, propertyLocation) || other.propertyLocation == propertyLocation)&&const DeepCollectionEquality().equals(other._lines, _lines)&&const DeepCollectionEquality().equals(other._payments, _payments)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.paidAmount, paidAmount) || other.paidAmount == paidAmount)&&(identical(other.balanceDue, balanceDue) || other.balanceDue == balanceDue)&&(identical(other.dueDate, dueDate) || other.dueDate == dueDate)&&(identical(other.issuedOn, issuedOn) || other.issuedOn == issuedOn)&&(identical(other.overdue, overdue) || other.overdue == overdue)&&(identical(other.payable, payable) || other.payable == payable)&&(identical(other.paymentInstructions, paymentInstructions) || other.paymentInstructions == paymentInstructions)&&(identical(other.footer, footer) || other.footer == footer));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,rrn,invoiceType,statusLabel,periodLabel,tenantName,tenantPhone,houseLabel,houseCode,propertyName,estateName,propertyLocation,const DeepCollectionEquality().hash(_lines),const DeepCollectionEquality().hash(_payments),amount,paidAmount,balanceDue,dueDate,issuedOn,overdue,payable,paymentInstructions,footer]);

@override
String toString() {
  return 'InvoiceDocumentModel(rrn: $rrn, invoiceType: $invoiceType, statusLabel: $statusLabel, periodLabel: $periodLabel, tenantName: $tenantName, tenantPhone: $tenantPhone, houseLabel: $houseLabel, houseCode: $houseCode, propertyName: $propertyName, estateName: $estateName, propertyLocation: $propertyLocation, lines: $lines, payments: $payments, amount: $amount, paidAmount: $paidAmount, balanceDue: $balanceDue, dueDate: $dueDate, issuedOn: $issuedOn, overdue: $overdue, payable: $payable, paymentInstructions: $paymentInstructions, footer: $footer)';
}


}

/// @nodoc
abstract mixin class _$InvoiceDocumentModelCopyWith<$Res> implements $InvoiceDocumentModelCopyWith<$Res> {
  factory _$InvoiceDocumentModelCopyWith(_InvoiceDocumentModel value, $Res Function(_InvoiceDocumentModel) _then) = __$InvoiceDocumentModelCopyWithImpl;
@override @useResult
$Res call({
 String rrn, String? invoiceType, String? statusLabel, String? periodLabel, String? tenantName, String? tenantPhone, String? houseLabel, String? houseCode, String? propertyName, String? estateName, String? propertyLocation, List<InvoiceDocumentLine> lines, List<InvoiceDocumentPayment> payments,@JsonKey(fromJson: parseDouble) double amount,@JsonKey(fromJson: parseDouble) double paidAmount,@JsonKey(fromJson: parseDouble) double balanceDue, String? dueDate, String? issuedOn, bool overdue, bool payable, String? paymentInstructions, String? footer
});




}
/// @nodoc
class __$InvoiceDocumentModelCopyWithImpl<$Res>
    implements _$InvoiceDocumentModelCopyWith<$Res> {
  __$InvoiceDocumentModelCopyWithImpl(this._self, this._then);

  final _InvoiceDocumentModel _self;
  final $Res Function(_InvoiceDocumentModel) _then;

/// Create a copy of InvoiceDocumentModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? rrn = null,Object? invoiceType = freezed,Object? statusLabel = freezed,Object? periodLabel = freezed,Object? tenantName = freezed,Object? tenantPhone = freezed,Object? houseLabel = freezed,Object? houseCode = freezed,Object? propertyName = freezed,Object? estateName = freezed,Object? propertyLocation = freezed,Object? lines = null,Object? payments = null,Object? amount = null,Object? paidAmount = null,Object? balanceDue = null,Object? dueDate = freezed,Object? issuedOn = freezed,Object? overdue = null,Object? payable = null,Object? paymentInstructions = freezed,Object? footer = freezed,}) {
  return _then(_InvoiceDocumentModel(
rrn: null == rrn ? _self.rrn : rrn // ignore: cast_nullable_to_non_nullable
as String,invoiceType: freezed == invoiceType ? _self.invoiceType : invoiceType // ignore: cast_nullable_to_non_nullable
as String?,statusLabel: freezed == statusLabel ? _self.statusLabel : statusLabel // ignore: cast_nullable_to_non_nullable
as String?,periodLabel: freezed == periodLabel ? _self.periodLabel : periodLabel // ignore: cast_nullable_to_non_nullable
as String?,tenantName: freezed == tenantName ? _self.tenantName : tenantName // ignore: cast_nullable_to_non_nullable
as String?,tenantPhone: freezed == tenantPhone ? _self.tenantPhone : tenantPhone // ignore: cast_nullable_to_non_nullable
as String?,houseLabel: freezed == houseLabel ? _self.houseLabel : houseLabel // ignore: cast_nullable_to_non_nullable
as String?,houseCode: freezed == houseCode ? _self.houseCode : houseCode // ignore: cast_nullable_to_non_nullable
as String?,propertyName: freezed == propertyName ? _self.propertyName : propertyName // ignore: cast_nullable_to_non_nullable
as String?,estateName: freezed == estateName ? _self.estateName : estateName // ignore: cast_nullable_to_non_nullable
as String?,propertyLocation: freezed == propertyLocation ? _self.propertyLocation : propertyLocation // ignore: cast_nullable_to_non_nullable
as String?,lines: null == lines ? _self._lines : lines // ignore: cast_nullable_to_non_nullable
as List<InvoiceDocumentLine>,payments: null == payments ? _self._payments : payments // ignore: cast_nullable_to_non_nullable
as List<InvoiceDocumentPayment>,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,paidAmount: null == paidAmount ? _self.paidAmount : paidAmount // ignore: cast_nullable_to_non_nullable
as double,balanceDue: null == balanceDue ? _self.balanceDue : balanceDue // ignore: cast_nullable_to_non_nullable
as double,dueDate: freezed == dueDate ? _self.dueDate : dueDate // ignore: cast_nullable_to_non_nullable
as String?,issuedOn: freezed == issuedOn ? _self.issuedOn : issuedOn // ignore: cast_nullable_to_non_nullable
as String?,overdue: null == overdue ? _self.overdue : overdue // ignore: cast_nullable_to_non_nullable
as bool,payable: null == payable ? _self.payable : payable // ignore: cast_nullable_to_non_nullable
as bool,paymentInstructions: freezed == paymentInstructions ? _self.paymentInstructions : paymentInstructions // ignore: cast_nullable_to_non_nullable
as String?,footer: freezed == footer ? _self.footer : footer // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$InvoiceDocumentLine {

 String? get kind; String? get description;@JsonKey(fromJson: parseDouble) double get quantity;@JsonKey(fromJson: parseDouble) double get unitAmount;@JsonKey(fromJson: parseDouble) double get amount;
/// Create a copy of InvoiceDocumentLine
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InvoiceDocumentLineCopyWith<InvoiceDocumentLine> get copyWith => _$InvoiceDocumentLineCopyWithImpl<InvoiceDocumentLine>(this as InvoiceDocumentLine, _$identity);

  /// Serializes this InvoiceDocumentLine to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InvoiceDocumentLine&&(identical(other.kind, kind) || other.kind == kind)&&(identical(other.description, description) || other.description == description)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.unitAmount, unitAmount) || other.unitAmount == unitAmount)&&(identical(other.amount, amount) || other.amount == amount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,kind,description,quantity,unitAmount,amount);

@override
String toString() {
  return 'InvoiceDocumentLine(kind: $kind, description: $description, quantity: $quantity, unitAmount: $unitAmount, amount: $amount)';
}


}

/// @nodoc
abstract mixin class $InvoiceDocumentLineCopyWith<$Res>  {
  factory $InvoiceDocumentLineCopyWith(InvoiceDocumentLine value, $Res Function(InvoiceDocumentLine) _then) = _$InvoiceDocumentLineCopyWithImpl;
@useResult
$Res call({
 String? kind, String? description,@JsonKey(fromJson: parseDouble) double quantity,@JsonKey(fromJson: parseDouble) double unitAmount,@JsonKey(fromJson: parseDouble) double amount
});




}
/// @nodoc
class _$InvoiceDocumentLineCopyWithImpl<$Res>
    implements $InvoiceDocumentLineCopyWith<$Res> {
  _$InvoiceDocumentLineCopyWithImpl(this._self, this._then);

  final InvoiceDocumentLine _self;
  final $Res Function(InvoiceDocumentLine) _then;

/// Create a copy of InvoiceDocumentLine
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? kind = freezed,Object? description = freezed,Object? quantity = null,Object? unitAmount = null,Object? amount = null,}) {
  return _then(_self.copyWith(
kind: freezed == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as double,unitAmount: null == unitAmount ? _self.unitAmount : unitAmount // ignore: cast_nullable_to_non_nullable
as double,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [InvoiceDocumentLine].
extension InvoiceDocumentLinePatterns on InvoiceDocumentLine {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _InvoiceDocumentLine value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _InvoiceDocumentLine() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _InvoiceDocumentLine value)  $default,){
final _that = this;
switch (_that) {
case _InvoiceDocumentLine():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _InvoiceDocumentLine value)?  $default,){
final _that = this;
switch (_that) {
case _InvoiceDocumentLine() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? kind,  String? description, @JsonKey(fromJson: parseDouble)  double quantity, @JsonKey(fromJson: parseDouble)  double unitAmount, @JsonKey(fromJson: parseDouble)  double amount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _InvoiceDocumentLine() when $default != null:
return $default(_that.kind,_that.description,_that.quantity,_that.unitAmount,_that.amount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? kind,  String? description, @JsonKey(fromJson: parseDouble)  double quantity, @JsonKey(fromJson: parseDouble)  double unitAmount, @JsonKey(fromJson: parseDouble)  double amount)  $default,) {final _that = this;
switch (_that) {
case _InvoiceDocumentLine():
return $default(_that.kind,_that.description,_that.quantity,_that.unitAmount,_that.amount);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? kind,  String? description, @JsonKey(fromJson: parseDouble)  double quantity, @JsonKey(fromJson: parseDouble)  double unitAmount, @JsonKey(fromJson: parseDouble)  double amount)?  $default,) {final _that = this;
switch (_that) {
case _InvoiceDocumentLine() when $default != null:
return $default(_that.kind,_that.description,_that.quantity,_that.unitAmount,_that.amount);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _InvoiceDocumentLine extends InvoiceDocumentLine {
  const _InvoiceDocumentLine({this.kind, this.description, @JsonKey(fromJson: parseDouble) this.quantity = 0, @JsonKey(fromJson: parseDouble) this.unitAmount = 0, @JsonKey(fromJson: parseDouble) this.amount = 0}): super._();
  factory _InvoiceDocumentLine.fromJson(Map<String, dynamic> json) => _$InvoiceDocumentLineFromJson(json);

@override final  String? kind;
@override final  String? description;
@override@JsonKey(fromJson: parseDouble) final  double quantity;
@override@JsonKey(fromJson: parseDouble) final  double unitAmount;
@override@JsonKey(fromJson: parseDouble) final  double amount;

/// Create a copy of InvoiceDocumentLine
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InvoiceDocumentLineCopyWith<_InvoiceDocumentLine> get copyWith => __$InvoiceDocumentLineCopyWithImpl<_InvoiceDocumentLine>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$InvoiceDocumentLineToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _InvoiceDocumentLine&&(identical(other.kind, kind) || other.kind == kind)&&(identical(other.description, description) || other.description == description)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.unitAmount, unitAmount) || other.unitAmount == unitAmount)&&(identical(other.amount, amount) || other.amount == amount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,kind,description,quantity,unitAmount,amount);

@override
String toString() {
  return 'InvoiceDocumentLine(kind: $kind, description: $description, quantity: $quantity, unitAmount: $unitAmount, amount: $amount)';
}


}

/// @nodoc
abstract mixin class _$InvoiceDocumentLineCopyWith<$Res> implements $InvoiceDocumentLineCopyWith<$Res> {
  factory _$InvoiceDocumentLineCopyWith(_InvoiceDocumentLine value, $Res Function(_InvoiceDocumentLine) _then) = __$InvoiceDocumentLineCopyWithImpl;
@override @useResult
$Res call({
 String? kind, String? description,@JsonKey(fromJson: parseDouble) double quantity,@JsonKey(fromJson: parseDouble) double unitAmount,@JsonKey(fromJson: parseDouble) double amount
});




}
/// @nodoc
class __$InvoiceDocumentLineCopyWithImpl<$Res>
    implements _$InvoiceDocumentLineCopyWith<$Res> {
  __$InvoiceDocumentLineCopyWithImpl(this._self, this._then);

  final _InvoiceDocumentLine _self;
  final $Res Function(_InvoiceDocumentLine) _then;

/// Create a copy of InvoiceDocumentLine
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? kind = freezed,Object? description = freezed,Object? quantity = null,Object? unitAmount = null,Object? amount = null,}) {
  return _then(_InvoiceDocumentLine(
kind: freezed == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as double,unitAmount: null == unitAmount ? _self.unitAmount : unitAmount // ignore: cast_nullable_to_non_nullable
as double,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}


/// @nodoc
mixin _$InvoiceDocumentPayment {

 String? get narration;@JsonKey(fromJson: parseDouble) double get amount;
/// Create a copy of InvoiceDocumentPayment
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InvoiceDocumentPaymentCopyWith<InvoiceDocumentPayment> get copyWith => _$InvoiceDocumentPaymentCopyWithImpl<InvoiceDocumentPayment>(this as InvoiceDocumentPayment, _$identity);

  /// Serializes this InvoiceDocumentPayment to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InvoiceDocumentPayment&&(identical(other.narration, narration) || other.narration == narration)&&(identical(other.amount, amount) || other.amount == amount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,narration,amount);

@override
String toString() {
  return 'InvoiceDocumentPayment(narration: $narration, amount: $amount)';
}


}

/// @nodoc
abstract mixin class $InvoiceDocumentPaymentCopyWith<$Res>  {
  factory $InvoiceDocumentPaymentCopyWith(InvoiceDocumentPayment value, $Res Function(InvoiceDocumentPayment) _then) = _$InvoiceDocumentPaymentCopyWithImpl;
@useResult
$Res call({
 String? narration,@JsonKey(fromJson: parseDouble) double amount
});




}
/// @nodoc
class _$InvoiceDocumentPaymentCopyWithImpl<$Res>
    implements $InvoiceDocumentPaymentCopyWith<$Res> {
  _$InvoiceDocumentPaymentCopyWithImpl(this._self, this._then);

  final InvoiceDocumentPayment _self;
  final $Res Function(InvoiceDocumentPayment) _then;

/// Create a copy of InvoiceDocumentPayment
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? narration = freezed,Object? amount = null,}) {
  return _then(_self.copyWith(
narration: freezed == narration ? _self.narration : narration // ignore: cast_nullable_to_non_nullable
as String?,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [InvoiceDocumentPayment].
extension InvoiceDocumentPaymentPatterns on InvoiceDocumentPayment {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _InvoiceDocumentPayment value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _InvoiceDocumentPayment() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _InvoiceDocumentPayment value)  $default,){
final _that = this;
switch (_that) {
case _InvoiceDocumentPayment():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _InvoiceDocumentPayment value)?  $default,){
final _that = this;
switch (_that) {
case _InvoiceDocumentPayment() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? narration, @JsonKey(fromJson: parseDouble)  double amount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _InvoiceDocumentPayment() when $default != null:
return $default(_that.narration,_that.amount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? narration, @JsonKey(fromJson: parseDouble)  double amount)  $default,) {final _that = this;
switch (_that) {
case _InvoiceDocumentPayment():
return $default(_that.narration,_that.amount);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? narration, @JsonKey(fromJson: parseDouble)  double amount)?  $default,) {final _that = this;
switch (_that) {
case _InvoiceDocumentPayment() when $default != null:
return $default(_that.narration,_that.amount);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _InvoiceDocumentPayment extends InvoiceDocumentPayment {
  const _InvoiceDocumentPayment({this.narration, @JsonKey(fromJson: parseDouble) this.amount = 0}): super._();
  factory _InvoiceDocumentPayment.fromJson(Map<String, dynamic> json) => _$InvoiceDocumentPaymentFromJson(json);

@override final  String? narration;
@override@JsonKey(fromJson: parseDouble) final  double amount;

/// Create a copy of InvoiceDocumentPayment
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InvoiceDocumentPaymentCopyWith<_InvoiceDocumentPayment> get copyWith => __$InvoiceDocumentPaymentCopyWithImpl<_InvoiceDocumentPayment>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$InvoiceDocumentPaymentToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _InvoiceDocumentPayment&&(identical(other.narration, narration) || other.narration == narration)&&(identical(other.amount, amount) || other.amount == amount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,narration,amount);

@override
String toString() {
  return 'InvoiceDocumentPayment(narration: $narration, amount: $amount)';
}


}

/// @nodoc
abstract mixin class _$InvoiceDocumentPaymentCopyWith<$Res> implements $InvoiceDocumentPaymentCopyWith<$Res> {
  factory _$InvoiceDocumentPaymentCopyWith(_InvoiceDocumentPayment value, $Res Function(_InvoiceDocumentPayment) _then) = __$InvoiceDocumentPaymentCopyWithImpl;
@override @useResult
$Res call({
 String? narration,@JsonKey(fromJson: parseDouble) double amount
});




}
/// @nodoc
class __$InvoiceDocumentPaymentCopyWithImpl<$Res>
    implements _$InvoiceDocumentPaymentCopyWith<$Res> {
  __$InvoiceDocumentPaymentCopyWithImpl(this._self, this._then);

  final _InvoiceDocumentPayment _self;
  final $Res Function(_InvoiceDocumentPayment) _then;

/// Create a copy of InvoiceDocumentPayment
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? narration = freezed,Object? amount = null,}) {
  return _then(_InvoiceDocumentPayment(
narration: freezed == narration ? _self.narration : narration // ignore: cast_nullable_to_non_nullable
as String?,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
