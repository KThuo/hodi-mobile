// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'invoice_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$InvoiceModel {

/// Hashed and salted per user. Opaque: never parse it, never sort by it.
 String? get id; String? get rrn; String? get invoiceType; int get status;/// The status in words, from the server. Preferred over reading [status]: the integers are a
/// storage detail, and `RecordStatus.DELETED` is also 2, which has caught this codebase before.
 String? get statusLabel;/// "September 2026" — composed by the server so the month's name exists in one language, in one
/// place, rather than in every client that shows it.
 String? get periodLabel; int get periodMonth; int get periodYear; String? get tenantName; String? get tenantPhone; String? get houseCode; String? get houseNumber;/// "WA03 (2nd Floor)" — the unit as somebody says it out loud.
 String? get houseLabel; String? get propertyName; String? get estateName;@JsonKey(fromJson: parseDouble) double get amount;@JsonKey(fromJson: parseDouble) double get paidAmount;@JsonKey(fromJson: parseDouble) double get outstanding; String? get dueDate; String? get issuedOn;/// When it was settled in full — the date the last payment landed, not the date it was raised.
/// Null on anything unsettled, and on a few migrated rows whose legacy record named no date.
 String? get paidOn;/// Past its due date and still owed. What colours the row, and the server's judgement rather
/// than a date comparison done differently on each client.
 bool get overdue; String? get occupationId; String? get houseId;
/// Create a copy of InvoiceModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InvoiceModelCopyWith<InvoiceModel> get copyWith => _$InvoiceModelCopyWithImpl<InvoiceModel>(this as InvoiceModel, _$identity);

  /// Serializes this InvoiceModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InvoiceModel&&(identical(other.id, id) || other.id == id)&&(identical(other.rrn, rrn) || other.rrn == rrn)&&(identical(other.invoiceType, invoiceType) || other.invoiceType == invoiceType)&&(identical(other.status, status) || other.status == status)&&(identical(other.statusLabel, statusLabel) || other.statusLabel == statusLabel)&&(identical(other.periodLabel, periodLabel) || other.periodLabel == periodLabel)&&(identical(other.periodMonth, periodMonth) || other.periodMonth == periodMonth)&&(identical(other.periodYear, periodYear) || other.periodYear == periodYear)&&(identical(other.tenantName, tenantName) || other.tenantName == tenantName)&&(identical(other.tenantPhone, tenantPhone) || other.tenantPhone == tenantPhone)&&(identical(other.houseCode, houseCode) || other.houseCode == houseCode)&&(identical(other.houseNumber, houseNumber) || other.houseNumber == houseNumber)&&(identical(other.houseLabel, houseLabel) || other.houseLabel == houseLabel)&&(identical(other.propertyName, propertyName) || other.propertyName == propertyName)&&(identical(other.estateName, estateName) || other.estateName == estateName)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.paidAmount, paidAmount) || other.paidAmount == paidAmount)&&(identical(other.outstanding, outstanding) || other.outstanding == outstanding)&&(identical(other.dueDate, dueDate) || other.dueDate == dueDate)&&(identical(other.issuedOn, issuedOn) || other.issuedOn == issuedOn)&&(identical(other.paidOn, paidOn) || other.paidOn == paidOn)&&(identical(other.overdue, overdue) || other.overdue == overdue)&&(identical(other.occupationId, occupationId) || other.occupationId == occupationId)&&(identical(other.houseId, houseId) || other.houseId == houseId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,rrn,invoiceType,status,statusLabel,periodLabel,periodMonth,periodYear,tenantName,tenantPhone,houseCode,houseNumber,houseLabel,propertyName,estateName,amount,paidAmount,outstanding,dueDate,issuedOn,paidOn,overdue,occupationId,houseId]);

@override
String toString() {
  return 'InvoiceModel(id: $id, rrn: $rrn, invoiceType: $invoiceType, status: $status, statusLabel: $statusLabel, periodLabel: $periodLabel, periodMonth: $periodMonth, periodYear: $periodYear, tenantName: $tenantName, tenantPhone: $tenantPhone, houseCode: $houseCode, houseNumber: $houseNumber, houseLabel: $houseLabel, propertyName: $propertyName, estateName: $estateName, amount: $amount, paidAmount: $paidAmount, outstanding: $outstanding, dueDate: $dueDate, issuedOn: $issuedOn, paidOn: $paidOn, overdue: $overdue, occupationId: $occupationId, houseId: $houseId)';
}


}

/// @nodoc
abstract mixin class $InvoiceModelCopyWith<$Res>  {
  factory $InvoiceModelCopyWith(InvoiceModel value, $Res Function(InvoiceModel) _then) = _$InvoiceModelCopyWithImpl;
@useResult
$Res call({
 String? id, String? rrn, String? invoiceType, int status, String? statusLabel, String? periodLabel, int periodMonth, int periodYear, String? tenantName, String? tenantPhone, String? houseCode, String? houseNumber, String? houseLabel, String? propertyName, String? estateName,@JsonKey(fromJson: parseDouble) double amount,@JsonKey(fromJson: parseDouble) double paidAmount,@JsonKey(fromJson: parseDouble) double outstanding, String? dueDate, String? issuedOn, String? paidOn, bool overdue, String? occupationId, String? houseId
});




}
/// @nodoc
class _$InvoiceModelCopyWithImpl<$Res>
    implements $InvoiceModelCopyWith<$Res> {
  _$InvoiceModelCopyWithImpl(this._self, this._then);

  final InvoiceModel _self;
  final $Res Function(InvoiceModel) _then;

/// Create a copy of InvoiceModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? rrn = freezed,Object? invoiceType = freezed,Object? status = null,Object? statusLabel = freezed,Object? periodLabel = freezed,Object? periodMonth = null,Object? periodYear = null,Object? tenantName = freezed,Object? tenantPhone = freezed,Object? houseCode = freezed,Object? houseNumber = freezed,Object? houseLabel = freezed,Object? propertyName = freezed,Object? estateName = freezed,Object? amount = null,Object? paidAmount = null,Object? outstanding = null,Object? dueDate = freezed,Object? issuedOn = freezed,Object? paidOn = freezed,Object? overdue = null,Object? occupationId = freezed,Object? houseId = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,rrn: freezed == rrn ? _self.rrn : rrn // ignore: cast_nullable_to_non_nullable
as String?,invoiceType: freezed == invoiceType ? _self.invoiceType : invoiceType // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as int,statusLabel: freezed == statusLabel ? _self.statusLabel : statusLabel // ignore: cast_nullable_to_non_nullable
as String?,periodLabel: freezed == periodLabel ? _self.periodLabel : periodLabel // ignore: cast_nullable_to_non_nullable
as String?,periodMonth: null == periodMonth ? _self.periodMonth : periodMonth // ignore: cast_nullable_to_non_nullable
as int,periodYear: null == periodYear ? _self.periodYear : periodYear // ignore: cast_nullable_to_non_nullable
as int,tenantName: freezed == tenantName ? _self.tenantName : tenantName // ignore: cast_nullable_to_non_nullable
as String?,tenantPhone: freezed == tenantPhone ? _self.tenantPhone : tenantPhone // ignore: cast_nullable_to_non_nullable
as String?,houseCode: freezed == houseCode ? _self.houseCode : houseCode // ignore: cast_nullable_to_non_nullable
as String?,houseNumber: freezed == houseNumber ? _self.houseNumber : houseNumber // ignore: cast_nullable_to_non_nullable
as String?,houseLabel: freezed == houseLabel ? _self.houseLabel : houseLabel // ignore: cast_nullable_to_non_nullable
as String?,propertyName: freezed == propertyName ? _self.propertyName : propertyName // ignore: cast_nullable_to_non_nullable
as String?,estateName: freezed == estateName ? _self.estateName : estateName // ignore: cast_nullable_to_non_nullable
as String?,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,paidAmount: null == paidAmount ? _self.paidAmount : paidAmount // ignore: cast_nullable_to_non_nullable
as double,outstanding: null == outstanding ? _self.outstanding : outstanding // ignore: cast_nullable_to_non_nullable
as double,dueDate: freezed == dueDate ? _self.dueDate : dueDate // ignore: cast_nullable_to_non_nullable
as String?,issuedOn: freezed == issuedOn ? _self.issuedOn : issuedOn // ignore: cast_nullable_to_non_nullable
as String?,paidOn: freezed == paidOn ? _self.paidOn : paidOn // ignore: cast_nullable_to_non_nullable
as String?,overdue: null == overdue ? _self.overdue : overdue // ignore: cast_nullable_to_non_nullable
as bool,occupationId: freezed == occupationId ? _self.occupationId : occupationId // ignore: cast_nullable_to_non_nullable
as String?,houseId: freezed == houseId ? _self.houseId : houseId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [InvoiceModel].
extension InvoiceModelPatterns on InvoiceModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _InvoiceModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _InvoiceModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _InvoiceModel value)  $default,){
final _that = this;
switch (_that) {
case _InvoiceModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _InvoiceModel value)?  $default,){
final _that = this;
switch (_that) {
case _InvoiceModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id,  String? rrn,  String? invoiceType,  int status,  String? statusLabel,  String? periodLabel,  int periodMonth,  int periodYear,  String? tenantName,  String? tenantPhone,  String? houseCode,  String? houseNumber,  String? houseLabel,  String? propertyName,  String? estateName, @JsonKey(fromJson: parseDouble)  double amount, @JsonKey(fromJson: parseDouble)  double paidAmount, @JsonKey(fromJson: parseDouble)  double outstanding,  String? dueDate,  String? issuedOn,  String? paidOn,  bool overdue,  String? occupationId,  String? houseId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _InvoiceModel() when $default != null:
return $default(_that.id,_that.rrn,_that.invoiceType,_that.status,_that.statusLabel,_that.periodLabel,_that.periodMonth,_that.periodYear,_that.tenantName,_that.tenantPhone,_that.houseCode,_that.houseNumber,_that.houseLabel,_that.propertyName,_that.estateName,_that.amount,_that.paidAmount,_that.outstanding,_that.dueDate,_that.issuedOn,_that.paidOn,_that.overdue,_that.occupationId,_that.houseId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id,  String? rrn,  String? invoiceType,  int status,  String? statusLabel,  String? periodLabel,  int periodMonth,  int periodYear,  String? tenantName,  String? tenantPhone,  String? houseCode,  String? houseNumber,  String? houseLabel,  String? propertyName,  String? estateName, @JsonKey(fromJson: parseDouble)  double amount, @JsonKey(fromJson: parseDouble)  double paidAmount, @JsonKey(fromJson: parseDouble)  double outstanding,  String? dueDate,  String? issuedOn,  String? paidOn,  bool overdue,  String? occupationId,  String? houseId)  $default,) {final _that = this;
switch (_that) {
case _InvoiceModel():
return $default(_that.id,_that.rrn,_that.invoiceType,_that.status,_that.statusLabel,_that.periodLabel,_that.periodMonth,_that.periodYear,_that.tenantName,_that.tenantPhone,_that.houseCode,_that.houseNumber,_that.houseLabel,_that.propertyName,_that.estateName,_that.amount,_that.paidAmount,_that.outstanding,_that.dueDate,_that.issuedOn,_that.paidOn,_that.overdue,_that.occupationId,_that.houseId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id,  String? rrn,  String? invoiceType,  int status,  String? statusLabel,  String? periodLabel,  int periodMonth,  int periodYear,  String? tenantName,  String? tenantPhone,  String? houseCode,  String? houseNumber,  String? houseLabel,  String? propertyName,  String? estateName, @JsonKey(fromJson: parseDouble)  double amount, @JsonKey(fromJson: parseDouble)  double paidAmount, @JsonKey(fromJson: parseDouble)  double outstanding,  String? dueDate,  String? issuedOn,  String? paidOn,  bool overdue,  String? occupationId,  String? houseId)?  $default,) {final _that = this;
switch (_that) {
case _InvoiceModel() when $default != null:
return $default(_that.id,_that.rrn,_that.invoiceType,_that.status,_that.statusLabel,_that.periodLabel,_that.periodMonth,_that.periodYear,_that.tenantName,_that.tenantPhone,_that.houseCode,_that.houseNumber,_that.houseLabel,_that.propertyName,_that.estateName,_that.amount,_that.paidAmount,_that.outstanding,_that.dueDate,_that.issuedOn,_that.paidOn,_that.overdue,_that.occupationId,_that.houseId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _InvoiceModel extends InvoiceModel {
  const _InvoiceModel({this.id, this.rrn, this.invoiceType, this.status = 0, this.statusLabel, this.periodLabel, this.periodMonth = 0, this.periodYear = 0, this.tenantName, this.tenantPhone, this.houseCode, this.houseNumber, this.houseLabel, this.propertyName, this.estateName, @JsonKey(fromJson: parseDouble) this.amount = 0, @JsonKey(fromJson: parseDouble) this.paidAmount = 0, @JsonKey(fromJson: parseDouble) this.outstanding = 0, this.dueDate, this.issuedOn, this.paidOn, this.overdue = false, this.occupationId, this.houseId}): super._();
  factory _InvoiceModel.fromJson(Map<String, dynamic> json) => _$InvoiceModelFromJson(json);

/// Hashed and salted per user. Opaque: never parse it, never sort by it.
@override final  String? id;
@override final  String? rrn;
@override final  String? invoiceType;
@override@JsonKey() final  int status;
/// The status in words, from the server. Preferred over reading [status]: the integers are a
/// storage detail, and `RecordStatus.DELETED` is also 2, which has caught this codebase before.
@override final  String? statusLabel;
/// "September 2026" — composed by the server so the month's name exists in one language, in one
/// place, rather than in every client that shows it.
@override final  String? periodLabel;
@override@JsonKey() final  int periodMonth;
@override@JsonKey() final  int periodYear;
@override final  String? tenantName;
@override final  String? tenantPhone;
@override final  String? houseCode;
@override final  String? houseNumber;
/// "WA03 (2nd Floor)" — the unit as somebody says it out loud.
@override final  String? houseLabel;
@override final  String? propertyName;
@override final  String? estateName;
@override@JsonKey(fromJson: parseDouble) final  double amount;
@override@JsonKey(fromJson: parseDouble) final  double paidAmount;
@override@JsonKey(fromJson: parseDouble) final  double outstanding;
@override final  String? dueDate;
@override final  String? issuedOn;
/// When it was settled in full — the date the last payment landed, not the date it was raised.
/// Null on anything unsettled, and on a few migrated rows whose legacy record named no date.
@override final  String? paidOn;
/// Past its due date and still owed. What colours the row, and the server's judgement rather
/// than a date comparison done differently on each client.
@override@JsonKey() final  bool overdue;
@override final  String? occupationId;
@override final  String? houseId;

/// Create a copy of InvoiceModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InvoiceModelCopyWith<_InvoiceModel> get copyWith => __$InvoiceModelCopyWithImpl<_InvoiceModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$InvoiceModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _InvoiceModel&&(identical(other.id, id) || other.id == id)&&(identical(other.rrn, rrn) || other.rrn == rrn)&&(identical(other.invoiceType, invoiceType) || other.invoiceType == invoiceType)&&(identical(other.status, status) || other.status == status)&&(identical(other.statusLabel, statusLabel) || other.statusLabel == statusLabel)&&(identical(other.periodLabel, periodLabel) || other.periodLabel == periodLabel)&&(identical(other.periodMonth, periodMonth) || other.periodMonth == periodMonth)&&(identical(other.periodYear, periodYear) || other.periodYear == periodYear)&&(identical(other.tenantName, tenantName) || other.tenantName == tenantName)&&(identical(other.tenantPhone, tenantPhone) || other.tenantPhone == tenantPhone)&&(identical(other.houseCode, houseCode) || other.houseCode == houseCode)&&(identical(other.houseNumber, houseNumber) || other.houseNumber == houseNumber)&&(identical(other.houseLabel, houseLabel) || other.houseLabel == houseLabel)&&(identical(other.propertyName, propertyName) || other.propertyName == propertyName)&&(identical(other.estateName, estateName) || other.estateName == estateName)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.paidAmount, paidAmount) || other.paidAmount == paidAmount)&&(identical(other.outstanding, outstanding) || other.outstanding == outstanding)&&(identical(other.dueDate, dueDate) || other.dueDate == dueDate)&&(identical(other.issuedOn, issuedOn) || other.issuedOn == issuedOn)&&(identical(other.paidOn, paidOn) || other.paidOn == paidOn)&&(identical(other.overdue, overdue) || other.overdue == overdue)&&(identical(other.occupationId, occupationId) || other.occupationId == occupationId)&&(identical(other.houseId, houseId) || other.houseId == houseId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,rrn,invoiceType,status,statusLabel,periodLabel,periodMonth,periodYear,tenantName,tenantPhone,houseCode,houseNumber,houseLabel,propertyName,estateName,amount,paidAmount,outstanding,dueDate,issuedOn,paidOn,overdue,occupationId,houseId]);

@override
String toString() {
  return 'InvoiceModel(id: $id, rrn: $rrn, invoiceType: $invoiceType, status: $status, statusLabel: $statusLabel, periodLabel: $periodLabel, periodMonth: $periodMonth, periodYear: $periodYear, tenantName: $tenantName, tenantPhone: $tenantPhone, houseCode: $houseCode, houseNumber: $houseNumber, houseLabel: $houseLabel, propertyName: $propertyName, estateName: $estateName, amount: $amount, paidAmount: $paidAmount, outstanding: $outstanding, dueDate: $dueDate, issuedOn: $issuedOn, paidOn: $paidOn, overdue: $overdue, occupationId: $occupationId, houseId: $houseId)';
}


}

/// @nodoc
abstract mixin class _$InvoiceModelCopyWith<$Res> implements $InvoiceModelCopyWith<$Res> {
  factory _$InvoiceModelCopyWith(_InvoiceModel value, $Res Function(_InvoiceModel) _then) = __$InvoiceModelCopyWithImpl;
@override @useResult
$Res call({
 String? id, String? rrn, String? invoiceType, int status, String? statusLabel, String? periodLabel, int periodMonth, int periodYear, String? tenantName, String? tenantPhone, String? houseCode, String? houseNumber, String? houseLabel, String? propertyName, String? estateName,@JsonKey(fromJson: parseDouble) double amount,@JsonKey(fromJson: parseDouble) double paidAmount,@JsonKey(fromJson: parseDouble) double outstanding, String? dueDate, String? issuedOn, String? paidOn, bool overdue, String? occupationId, String? houseId
});




}
/// @nodoc
class __$InvoiceModelCopyWithImpl<$Res>
    implements _$InvoiceModelCopyWith<$Res> {
  __$InvoiceModelCopyWithImpl(this._self, this._then);

  final _InvoiceModel _self;
  final $Res Function(_InvoiceModel) _then;

/// Create a copy of InvoiceModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? rrn = freezed,Object? invoiceType = freezed,Object? status = null,Object? statusLabel = freezed,Object? periodLabel = freezed,Object? periodMonth = null,Object? periodYear = null,Object? tenantName = freezed,Object? tenantPhone = freezed,Object? houseCode = freezed,Object? houseNumber = freezed,Object? houseLabel = freezed,Object? propertyName = freezed,Object? estateName = freezed,Object? amount = null,Object? paidAmount = null,Object? outstanding = null,Object? dueDate = freezed,Object? issuedOn = freezed,Object? paidOn = freezed,Object? overdue = null,Object? occupationId = freezed,Object? houseId = freezed,}) {
  return _then(_InvoiceModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,rrn: freezed == rrn ? _self.rrn : rrn // ignore: cast_nullable_to_non_nullable
as String?,invoiceType: freezed == invoiceType ? _self.invoiceType : invoiceType // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as int,statusLabel: freezed == statusLabel ? _self.statusLabel : statusLabel // ignore: cast_nullable_to_non_nullable
as String?,periodLabel: freezed == periodLabel ? _self.periodLabel : periodLabel // ignore: cast_nullable_to_non_nullable
as String?,periodMonth: null == periodMonth ? _self.periodMonth : periodMonth // ignore: cast_nullable_to_non_nullable
as int,periodYear: null == periodYear ? _self.periodYear : periodYear // ignore: cast_nullable_to_non_nullable
as int,tenantName: freezed == tenantName ? _self.tenantName : tenantName // ignore: cast_nullable_to_non_nullable
as String?,tenantPhone: freezed == tenantPhone ? _self.tenantPhone : tenantPhone // ignore: cast_nullable_to_non_nullable
as String?,houseCode: freezed == houseCode ? _self.houseCode : houseCode // ignore: cast_nullable_to_non_nullable
as String?,houseNumber: freezed == houseNumber ? _self.houseNumber : houseNumber // ignore: cast_nullable_to_non_nullable
as String?,houseLabel: freezed == houseLabel ? _self.houseLabel : houseLabel // ignore: cast_nullable_to_non_nullable
as String?,propertyName: freezed == propertyName ? _self.propertyName : propertyName // ignore: cast_nullable_to_non_nullable
as String?,estateName: freezed == estateName ? _self.estateName : estateName // ignore: cast_nullable_to_non_nullable
as String?,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,paidAmount: null == paidAmount ? _self.paidAmount : paidAmount // ignore: cast_nullable_to_non_nullable
as double,outstanding: null == outstanding ? _self.outstanding : outstanding // ignore: cast_nullable_to_non_nullable
as double,dueDate: freezed == dueDate ? _self.dueDate : dueDate // ignore: cast_nullable_to_non_nullable
as String?,issuedOn: freezed == issuedOn ? _self.issuedOn : issuedOn // ignore: cast_nullable_to_non_nullable
as String?,paidOn: freezed == paidOn ? _self.paidOn : paidOn // ignore: cast_nullable_to_non_nullable
as String?,overdue: null == overdue ? _self.overdue : overdue // ignore: cast_nullable_to_non_nullable
as bool,occupationId: freezed == occupationId ? _self.occupationId : occupationId // ignore: cast_nullable_to_non_nullable
as String?,houseId: freezed == houseId ? _self.houseId : houseId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
