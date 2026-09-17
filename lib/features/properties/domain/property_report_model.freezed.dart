// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'property_report_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PropertyReportModel {

 String get id; String? get propertyName; String? get estateId; String? get estateName; int get totalUnits; int get occupiedUnits; int get periodYear; int get periodMonth;@JsonKey(fromJson: parseDouble) double get invoiceAmount;@JsonKey(fromJson: parseDouble) double get chargedAmount;/// The rent itself, so a column labelled Rent is the rent and not the whole charge.
@JsonKey(fromJson: parseDouble) double get rentAmount;/// An owned property's revenue, which would otherwise read as a rent of zero.
@JsonKey(fromJson: parseDouble) double get serviceChargeAmount;@JsonKey(fromJson: parseDouble) double get utilityAmount;@JsonKey(fromJson: parseDouble) double get depositAmount;/// Arrears carried into the period's invoices. Billed when it arose, not here.
@JsonKey(fromJson: parseDouble) double get broughtForwardAmount; int get invoiceCount;/// Money that arrived in the period, whatever it settled. A cash figure.
@JsonKey(fromJson: parseDouble) double get paymentAmount; int get paymentCount;/// Still owed at the start of the period, so the month reconciles.
@JsonKey(fromJson: parseDouble) double get openingArrears;@JsonKey(fromJson: parseDouble) double get closingArrears;/// Credit that arose in this period, top-up included.
@JsonKey(fromJson: parseDouble) double get overpaymentAmount;@JsonKey(fromJson: parseDouble) double get topupAmount;@JsonKey(fromJson: parseDouble) double get cumulativeCredit;@JsonKey(fromJson: parseDouble) double get clearedAmount;@JsonKey(fromJson: parseDouble) double get forfeitedAmount;@JsonKey(fromJson: parseDouble) double get expenseAmount; int get expenseCount;/// What HODI invoiced the estate for this property this month. Null where HODI has not
/// invoiced that month yet — a different fact from a commission of zero.
@JsonKey(fromJson: parseDoubleNullable) double? get commissionAmount;@JsonKey(fromJson: parseDoubleNullable) double? get commissionPercent;/// Payments less expenses. Computed server-side so the rule lives in one place.
@JsonKey(fromJson: parseDouble) double get netIncome;/// Whatever else is on the invoices: credits, waivers, corrections, refunds. The remainder
/// of invoiced less charged less brought forward, so the three close by construction.
@JsonKey(fromJson: parseDouble) double get creditsAndAdjustments;
/// Create a copy of PropertyReportModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PropertyReportModelCopyWith<PropertyReportModel> get copyWith => _$PropertyReportModelCopyWithImpl<PropertyReportModel>(this as PropertyReportModel, _$identity);

  /// Serializes this PropertyReportModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PropertyReportModel&&(identical(other.id, id) || other.id == id)&&(identical(other.propertyName, propertyName) || other.propertyName == propertyName)&&(identical(other.estateId, estateId) || other.estateId == estateId)&&(identical(other.estateName, estateName) || other.estateName == estateName)&&(identical(other.totalUnits, totalUnits) || other.totalUnits == totalUnits)&&(identical(other.occupiedUnits, occupiedUnits) || other.occupiedUnits == occupiedUnits)&&(identical(other.periodYear, periodYear) || other.periodYear == periodYear)&&(identical(other.periodMonth, periodMonth) || other.periodMonth == periodMonth)&&(identical(other.invoiceAmount, invoiceAmount) || other.invoiceAmount == invoiceAmount)&&(identical(other.chargedAmount, chargedAmount) || other.chargedAmount == chargedAmount)&&(identical(other.rentAmount, rentAmount) || other.rentAmount == rentAmount)&&(identical(other.serviceChargeAmount, serviceChargeAmount) || other.serviceChargeAmount == serviceChargeAmount)&&(identical(other.utilityAmount, utilityAmount) || other.utilityAmount == utilityAmount)&&(identical(other.depositAmount, depositAmount) || other.depositAmount == depositAmount)&&(identical(other.broughtForwardAmount, broughtForwardAmount) || other.broughtForwardAmount == broughtForwardAmount)&&(identical(other.invoiceCount, invoiceCount) || other.invoiceCount == invoiceCount)&&(identical(other.paymentAmount, paymentAmount) || other.paymentAmount == paymentAmount)&&(identical(other.paymentCount, paymentCount) || other.paymentCount == paymentCount)&&(identical(other.openingArrears, openingArrears) || other.openingArrears == openingArrears)&&(identical(other.closingArrears, closingArrears) || other.closingArrears == closingArrears)&&(identical(other.overpaymentAmount, overpaymentAmount) || other.overpaymentAmount == overpaymentAmount)&&(identical(other.topupAmount, topupAmount) || other.topupAmount == topupAmount)&&(identical(other.cumulativeCredit, cumulativeCredit) || other.cumulativeCredit == cumulativeCredit)&&(identical(other.clearedAmount, clearedAmount) || other.clearedAmount == clearedAmount)&&(identical(other.forfeitedAmount, forfeitedAmount) || other.forfeitedAmount == forfeitedAmount)&&(identical(other.expenseAmount, expenseAmount) || other.expenseAmount == expenseAmount)&&(identical(other.expenseCount, expenseCount) || other.expenseCount == expenseCount)&&(identical(other.commissionAmount, commissionAmount) || other.commissionAmount == commissionAmount)&&(identical(other.commissionPercent, commissionPercent) || other.commissionPercent == commissionPercent)&&(identical(other.netIncome, netIncome) || other.netIncome == netIncome)&&(identical(other.creditsAndAdjustments, creditsAndAdjustments) || other.creditsAndAdjustments == creditsAndAdjustments));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,propertyName,estateId,estateName,totalUnits,occupiedUnits,periodYear,periodMonth,invoiceAmount,chargedAmount,rentAmount,serviceChargeAmount,utilityAmount,depositAmount,broughtForwardAmount,invoiceCount,paymentAmount,paymentCount,openingArrears,closingArrears,overpaymentAmount,topupAmount,cumulativeCredit,clearedAmount,forfeitedAmount,expenseAmount,expenseCount,commissionAmount,commissionPercent,netIncome,creditsAndAdjustments]);

@override
String toString() {
  return 'PropertyReportModel(id: $id, propertyName: $propertyName, estateId: $estateId, estateName: $estateName, totalUnits: $totalUnits, occupiedUnits: $occupiedUnits, periodYear: $periodYear, periodMonth: $periodMonth, invoiceAmount: $invoiceAmount, chargedAmount: $chargedAmount, rentAmount: $rentAmount, serviceChargeAmount: $serviceChargeAmount, utilityAmount: $utilityAmount, depositAmount: $depositAmount, broughtForwardAmount: $broughtForwardAmount, invoiceCount: $invoiceCount, paymentAmount: $paymentAmount, paymentCount: $paymentCount, openingArrears: $openingArrears, closingArrears: $closingArrears, overpaymentAmount: $overpaymentAmount, topupAmount: $topupAmount, cumulativeCredit: $cumulativeCredit, clearedAmount: $clearedAmount, forfeitedAmount: $forfeitedAmount, expenseAmount: $expenseAmount, expenseCount: $expenseCount, commissionAmount: $commissionAmount, commissionPercent: $commissionPercent, netIncome: $netIncome, creditsAndAdjustments: $creditsAndAdjustments)';
}


}

/// @nodoc
abstract mixin class $PropertyReportModelCopyWith<$Res>  {
  factory $PropertyReportModelCopyWith(PropertyReportModel value, $Res Function(PropertyReportModel) _then) = _$PropertyReportModelCopyWithImpl;
@useResult
$Res call({
 String id, String? propertyName, String? estateId, String? estateName, int totalUnits, int occupiedUnits, int periodYear, int periodMonth,@JsonKey(fromJson: parseDouble) double invoiceAmount,@JsonKey(fromJson: parseDouble) double chargedAmount,@JsonKey(fromJson: parseDouble) double rentAmount,@JsonKey(fromJson: parseDouble) double serviceChargeAmount,@JsonKey(fromJson: parseDouble) double utilityAmount,@JsonKey(fromJson: parseDouble) double depositAmount,@JsonKey(fromJson: parseDouble) double broughtForwardAmount, int invoiceCount,@JsonKey(fromJson: parseDouble) double paymentAmount, int paymentCount,@JsonKey(fromJson: parseDouble) double openingArrears,@JsonKey(fromJson: parseDouble) double closingArrears,@JsonKey(fromJson: parseDouble) double overpaymentAmount,@JsonKey(fromJson: parseDouble) double topupAmount,@JsonKey(fromJson: parseDouble) double cumulativeCredit,@JsonKey(fromJson: parseDouble) double clearedAmount,@JsonKey(fromJson: parseDouble) double forfeitedAmount,@JsonKey(fromJson: parseDouble) double expenseAmount, int expenseCount,@JsonKey(fromJson: parseDoubleNullable) double? commissionAmount,@JsonKey(fromJson: parseDoubleNullable) double? commissionPercent,@JsonKey(fromJson: parseDouble) double netIncome,@JsonKey(fromJson: parseDouble) double creditsAndAdjustments
});




}
/// @nodoc
class _$PropertyReportModelCopyWithImpl<$Res>
    implements $PropertyReportModelCopyWith<$Res> {
  _$PropertyReportModelCopyWithImpl(this._self, this._then);

  final PropertyReportModel _self;
  final $Res Function(PropertyReportModel) _then;

/// Create a copy of PropertyReportModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? propertyName = freezed,Object? estateId = freezed,Object? estateName = freezed,Object? totalUnits = null,Object? occupiedUnits = null,Object? periodYear = null,Object? periodMonth = null,Object? invoiceAmount = null,Object? chargedAmount = null,Object? rentAmount = null,Object? serviceChargeAmount = null,Object? utilityAmount = null,Object? depositAmount = null,Object? broughtForwardAmount = null,Object? invoiceCount = null,Object? paymentAmount = null,Object? paymentCount = null,Object? openingArrears = null,Object? closingArrears = null,Object? overpaymentAmount = null,Object? topupAmount = null,Object? cumulativeCredit = null,Object? clearedAmount = null,Object? forfeitedAmount = null,Object? expenseAmount = null,Object? expenseCount = null,Object? commissionAmount = freezed,Object? commissionPercent = freezed,Object? netIncome = null,Object? creditsAndAdjustments = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,propertyName: freezed == propertyName ? _self.propertyName : propertyName // ignore: cast_nullable_to_non_nullable
as String?,estateId: freezed == estateId ? _self.estateId : estateId // ignore: cast_nullable_to_non_nullable
as String?,estateName: freezed == estateName ? _self.estateName : estateName // ignore: cast_nullable_to_non_nullable
as String?,totalUnits: null == totalUnits ? _self.totalUnits : totalUnits // ignore: cast_nullable_to_non_nullable
as int,occupiedUnits: null == occupiedUnits ? _self.occupiedUnits : occupiedUnits // ignore: cast_nullable_to_non_nullable
as int,periodYear: null == periodYear ? _self.periodYear : periodYear // ignore: cast_nullable_to_non_nullable
as int,periodMonth: null == periodMonth ? _self.periodMonth : periodMonth // ignore: cast_nullable_to_non_nullable
as int,invoiceAmount: null == invoiceAmount ? _self.invoiceAmount : invoiceAmount // ignore: cast_nullable_to_non_nullable
as double,chargedAmount: null == chargedAmount ? _self.chargedAmount : chargedAmount // ignore: cast_nullable_to_non_nullable
as double,rentAmount: null == rentAmount ? _self.rentAmount : rentAmount // ignore: cast_nullable_to_non_nullable
as double,serviceChargeAmount: null == serviceChargeAmount ? _self.serviceChargeAmount : serviceChargeAmount // ignore: cast_nullable_to_non_nullable
as double,utilityAmount: null == utilityAmount ? _self.utilityAmount : utilityAmount // ignore: cast_nullable_to_non_nullable
as double,depositAmount: null == depositAmount ? _self.depositAmount : depositAmount // ignore: cast_nullable_to_non_nullable
as double,broughtForwardAmount: null == broughtForwardAmount ? _self.broughtForwardAmount : broughtForwardAmount // ignore: cast_nullable_to_non_nullable
as double,invoiceCount: null == invoiceCount ? _self.invoiceCount : invoiceCount // ignore: cast_nullable_to_non_nullable
as int,paymentAmount: null == paymentAmount ? _self.paymentAmount : paymentAmount // ignore: cast_nullable_to_non_nullable
as double,paymentCount: null == paymentCount ? _self.paymentCount : paymentCount // ignore: cast_nullable_to_non_nullable
as int,openingArrears: null == openingArrears ? _self.openingArrears : openingArrears // ignore: cast_nullable_to_non_nullable
as double,closingArrears: null == closingArrears ? _self.closingArrears : closingArrears // ignore: cast_nullable_to_non_nullable
as double,overpaymentAmount: null == overpaymentAmount ? _self.overpaymentAmount : overpaymentAmount // ignore: cast_nullable_to_non_nullable
as double,topupAmount: null == topupAmount ? _self.topupAmount : topupAmount // ignore: cast_nullable_to_non_nullable
as double,cumulativeCredit: null == cumulativeCredit ? _self.cumulativeCredit : cumulativeCredit // ignore: cast_nullable_to_non_nullable
as double,clearedAmount: null == clearedAmount ? _self.clearedAmount : clearedAmount // ignore: cast_nullable_to_non_nullable
as double,forfeitedAmount: null == forfeitedAmount ? _self.forfeitedAmount : forfeitedAmount // ignore: cast_nullable_to_non_nullable
as double,expenseAmount: null == expenseAmount ? _self.expenseAmount : expenseAmount // ignore: cast_nullable_to_non_nullable
as double,expenseCount: null == expenseCount ? _self.expenseCount : expenseCount // ignore: cast_nullable_to_non_nullable
as int,commissionAmount: freezed == commissionAmount ? _self.commissionAmount : commissionAmount // ignore: cast_nullable_to_non_nullable
as double?,commissionPercent: freezed == commissionPercent ? _self.commissionPercent : commissionPercent // ignore: cast_nullable_to_non_nullable
as double?,netIncome: null == netIncome ? _self.netIncome : netIncome // ignore: cast_nullable_to_non_nullable
as double,creditsAndAdjustments: null == creditsAndAdjustments ? _self.creditsAndAdjustments : creditsAndAdjustments // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [PropertyReportModel].
extension PropertyReportModelPatterns on PropertyReportModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PropertyReportModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PropertyReportModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PropertyReportModel value)  $default,){
final _that = this;
switch (_that) {
case _PropertyReportModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PropertyReportModel value)?  $default,){
final _that = this;
switch (_that) {
case _PropertyReportModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String? propertyName,  String? estateId,  String? estateName,  int totalUnits,  int occupiedUnits,  int periodYear,  int periodMonth, @JsonKey(fromJson: parseDouble)  double invoiceAmount, @JsonKey(fromJson: parseDouble)  double chargedAmount, @JsonKey(fromJson: parseDouble)  double rentAmount, @JsonKey(fromJson: parseDouble)  double serviceChargeAmount, @JsonKey(fromJson: parseDouble)  double utilityAmount, @JsonKey(fromJson: parseDouble)  double depositAmount, @JsonKey(fromJson: parseDouble)  double broughtForwardAmount,  int invoiceCount, @JsonKey(fromJson: parseDouble)  double paymentAmount,  int paymentCount, @JsonKey(fromJson: parseDouble)  double openingArrears, @JsonKey(fromJson: parseDouble)  double closingArrears, @JsonKey(fromJson: parseDouble)  double overpaymentAmount, @JsonKey(fromJson: parseDouble)  double topupAmount, @JsonKey(fromJson: parseDouble)  double cumulativeCredit, @JsonKey(fromJson: parseDouble)  double clearedAmount, @JsonKey(fromJson: parseDouble)  double forfeitedAmount, @JsonKey(fromJson: parseDouble)  double expenseAmount,  int expenseCount, @JsonKey(fromJson: parseDoubleNullable)  double? commissionAmount, @JsonKey(fromJson: parseDoubleNullable)  double? commissionPercent, @JsonKey(fromJson: parseDouble)  double netIncome, @JsonKey(fromJson: parseDouble)  double creditsAndAdjustments)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PropertyReportModel() when $default != null:
return $default(_that.id,_that.propertyName,_that.estateId,_that.estateName,_that.totalUnits,_that.occupiedUnits,_that.periodYear,_that.periodMonth,_that.invoiceAmount,_that.chargedAmount,_that.rentAmount,_that.serviceChargeAmount,_that.utilityAmount,_that.depositAmount,_that.broughtForwardAmount,_that.invoiceCount,_that.paymentAmount,_that.paymentCount,_that.openingArrears,_that.closingArrears,_that.overpaymentAmount,_that.topupAmount,_that.cumulativeCredit,_that.clearedAmount,_that.forfeitedAmount,_that.expenseAmount,_that.expenseCount,_that.commissionAmount,_that.commissionPercent,_that.netIncome,_that.creditsAndAdjustments);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String? propertyName,  String? estateId,  String? estateName,  int totalUnits,  int occupiedUnits,  int periodYear,  int periodMonth, @JsonKey(fromJson: parseDouble)  double invoiceAmount, @JsonKey(fromJson: parseDouble)  double chargedAmount, @JsonKey(fromJson: parseDouble)  double rentAmount, @JsonKey(fromJson: parseDouble)  double serviceChargeAmount, @JsonKey(fromJson: parseDouble)  double utilityAmount, @JsonKey(fromJson: parseDouble)  double depositAmount, @JsonKey(fromJson: parseDouble)  double broughtForwardAmount,  int invoiceCount, @JsonKey(fromJson: parseDouble)  double paymentAmount,  int paymentCount, @JsonKey(fromJson: parseDouble)  double openingArrears, @JsonKey(fromJson: parseDouble)  double closingArrears, @JsonKey(fromJson: parseDouble)  double overpaymentAmount, @JsonKey(fromJson: parseDouble)  double topupAmount, @JsonKey(fromJson: parseDouble)  double cumulativeCredit, @JsonKey(fromJson: parseDouble)  double clearedAmount, @JsonKey(fromJson: parseDouble)  double forfeitedAmount, @JsonKey(fromJson: parseDouble)  double expenseAmount,  int expenseCount, @JsonKey(fromJson: parseDoubleNullable)  double? commissionAmount, @JsonKey(fromJson: parseDoubleNullable)  double? commissionPercent, @JsonKey(fromJson: parseDouble)  double netIncome, @JsonKey(fromJson: parseDouble)  double creditsAndAdjustments)  $default,) {final _that = this;
switch (_that) {
case _PropertyReportModel():
return $default(_that.id,_that.propertyName,_that.estateId,_that.estateName,_that.totalUnits,_that.occupiedUnits,_that.periodYear,_that.periodMonth,_that.invoiceAmount,_that.chargedAmount,_that.rentAmount,_that.serviceChargeAmount,_that.utilityAmount,_that.depositAmount,_that.broughtForwardAmount,_that.invoiceCount,_that.paymentAmount,_that.paymentCount,_that.openingArrears,_that.closingArrears,_that.overpaymentAmount,_that.topupAmount,_that.cumulativeCredit,_that.clearedAmount,_that.forfeitedAmount,_that.expenseAmount,_that.expenseCount,_that.commissionAmount,_that.commissionPercent,_that.netIncome,_that.creditsAndAdjustments);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String? propertyName,  String? estateId,  String? estateName,  int totalUnits,  int occupiedUnits,  int periodYear,  int periodMonth, @JsonKey(fromJson: parseDouble)  double invoiceAmount, @JsonKey(fromJson: parseDouble)  double chargedAmount, @JsonKey(fromJson: parseDouble)  double rentAmount, @JsonKey(fromJson: parseDouble)  double serviceChargeAmount, @JsonKey(fromJson: parseDouble)  double utilityAmount, @JsonKey(fromJson: parseDouble)  double depositAmount, @JsonKey(fromJson: parseDouble)  double broughtForwardAmount,  int invoiceCount, @JsonKey(fromJson: parseDouble)  double paymentAmount,  int paymentCount, @JsonKey(fromJson: parseDouble)  double openingArrears, @JsonKey(fromJson: parseDouble)  double closingArrears, @JsonKey(fromJson: parseDouble)  double overpaymentAmount, @JsonKey(fromJson: parseDouble)  double topupAmount, @JsonKey(fromJson: parseDouble)  double cumulativeCredit, @JsonKey(fromJson: parseDouble)  double clearedAmount, @JsonKey(fromJson: parseDouble)  double forfeitedAmount, @JsonKey(fromJson: parseDouble)  double expenseAmount,  int expenseCount, @JsonKey(fromJson: parseDoubleNullable)  double? commissionAmount, @JsonKey(fromJson: parseDoubleNullable)  double? commissionPercent, @JsonKey(fromJson: parseDouble)  double netIncome, @JsonKey(fromJson: parseDouble)  double creditsAndAdjustments)?  $default,) {final _that = this;
switch (_that) {
case _PropertyReportModel() when $default != null:
return $default(_that.id,_that.propertyName,_that.estateId,_that.estateName,_that.totalUnits,_that.occupiedUnits,_that.periodYear,_that.periodMonth,_that.invoiceAmount,_that.chargedAmount,_that.rentAmount,_that.serviceChargeAmount,_that.utilityAmount,_that.depositAmount,_that.broughtForwardAmount,_that.invoiceCount,_that.paymentAmount,_that.paymentCount,_that.openingArrears,_that.closingArrears,_that.overpaymentAmount,_that.topupAmount,_that.cumulativeCredit,_that.clearedAmount,_that.forfeitedAmount,_that.expenseAmount,_that.expenseCount,_that.commissionAmount,_that.commissionPercent,_that.netIncome,_that.creditsAndAdjustments);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PropertyReportModel extends PropertyReportModel {
  const _PropertyReportModel({required this.id, this.propertyName, this.estateId, this.estateName, this.totalUnits = 0, this.occupiedUnits = 0, this.periodYear = 0, this.periodMonth = 0, @JsonKey(fromJson: parseDouble) this.invoiceAmount = 0, @JsonKey(fromJson: parseDouble) this.chargedAmount = 0, @JsonKey(fromJson: parseDouble) this.rentAmount = 0, @JsonKey(fromJson: parseDouble) this.serviceChargeAmount = 0, @JsonKey(fromJson: parseDouble) this.utilityAmount = 0, @JsonKey(fromJson: parseDouble) this.depositAmount = 0, @JsonKey(fromJson: parseDouble) this.broughtForwardAmount = 0, this.invoiceCount = 0, @JsonKey(fromJson: parseDouble) this.paymentAmount = 0, this.paymentCount = 0, @JsonKey(fromJson: parseDouble) this.openingArrears = 0, @JsonKey(fromJson: parseDouble) this.closingArrears = 0, @JsonKey(fromJson: parseDouble) this.overpaymentAmount = 0, @JsonKey(fromJson: parseDouble) this.topupAmount = 0, @JsonKey(fromJson: parseDouble) this.cumulativeCredit = 0, @JsonKey(fromJson: parseDouble) this.clearedAmount = 0, @JsonKey(fromJson: parseDouble) this.forfeitedAmount = 0, @JsonKey(fromJson: parseDouble) this.expenseAmount = 0, this.expenseCount = 0, @JsonKey(fromJson: parseDoubleNullable) this.commissionAmount, @JsonKey(fromJson: parseDoubleNullable) this.commissionPercent, @JsonKey(fromJson: parseDouble) this.netIncome = 0, @JsonKey(fromJson: parseDouble) this.creditsAndAdjustments = 0}): super._();
  factory _PropertyReportModel.fromJson(Map<String, dynamic> json) => _$PropertyReportModelFromJson(json);

@override final  String id;
@override final  String? propertyName;
@override final  String? estateId;
@override final  String? estateName;
@override@JsonKey() final  int totalUnits;
@override@JsonKey() final  int occupiedUnits;
@override@JsonKey() final  int periodYear;
@override@JsonKey() final  int periodMonth;
@override@JsonKey(fromJson: parseDouble) final  double invoiceAmount;
@override@JsonKey(fromJson: parseDouble) final  double chargedAmount;
/// The rent itself, so a column labelled Rent is the rent and not the whole charge.
@override@JsonKey(fromJson: parseDouble) final  double rentAmount;
/// An owned property's revenue, which would otherwise read as a rent of zero.
@override@JsonKey(fromJson: parseDouble) final  double serviceChargeAmount;
@override@JsonKey(fromJson: parseDouble) final  double utilityAmount;
@override@JsonKey(fromJson: parseDouble) final  double depositAmount;
/// Arrears carried into the period's invoices. Billed when it arose, not here.
@override@JsonKey(fromJson: parseDouble) final  double broughtForwardAmount;
@override@JsonKey() final  int invoiceCount;
/// Money that arrived in the period, whatever it settled. A cash figure.
@override@JsonKey(fromJson: parseDouble) final  double paymentAmount;
@override@JsonKey() final  int paymentCount;
/// Still owed at the start of the period, so the month reconciles.
@override@JsonKey(fromJson: parseDouble) final  double openingArrears;
@override@JsonKey(fromJson: parseDouble) final  double closingArrears;
/// Credit that arose in this period, top-up included.
@override@JsonKey(fromJson: parseDouble) final  double overpaymentAmount;
@override@JsonKey(fromJson: parseDouble) final  double topupAmount;
@override@JsonKey(fromJson: parseDouble) final  double cumulativeCredit;
@override@JsonKey(fromJson: parseDouble) final  double clearedAmount;
@override@JsonKey(fromJson: parseDouble) final  double forfeitedAmount;
@override@JsonKey(fromJson: parseDouble) final  double expenseAmount;
@override@JsonKey() final  int expenseCount;
/// What HODI invoiced the estate for this property this month. Null where HODI has not
/// invoiced that month yet — a different fact from a commission of zero.
@override@JsonKey(fromJson: parseDoubleNullable) final  double? commissionAmount;
@override@JsonKey(fromJson: parseDoubleNullable) final  double? commissionPercent;
/// Payments less expenses. Computed server-side so the rule lives in one place.
@override@JsonKey(fromJson: parseDouble) final  double netIncome;
/// Whatever else is on the invoices: credits, waivers, corrections, refunds. The remainder
/// of invoiced less charged less brought forward, so the three close by construction.
@override@JsonKey(fromJson: parseDouble) final  double creditsAndAdjustments;

/// Create a copy of PropertyReportModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PropertyReportModelCopyWith<_PropertyReportModel> get copyWith => __$PropertyReportModelCopyWithImpl<_PropertyReportModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PropertyReportModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PropertyReportModel&&(identical(other.id, id) || other.id == id)&&(identical(other.propertyName, propertyName) || other.propertyName == propertyName)&&(identical(other.estateId, estateId) || other.estateId == estateId)&&(identical(other.estateName, estateName) || other.estateName == estateName)&&(identical(other.totalUnits, totalUnits) || other.totalUnits == totalUnits)&&(identical(other.occupiedUnits, occupiedUnits) || other.occupiedUnits == occupiedUnits)&&(identical(other.periodYear, periodYear) || other.periodYear == periodYear)&&(identical(other.periodMonth, periodMonth) || other.periodMonth == periodMonth)&&(identical(other.invoiceAmount, invoiceAmount) || other.invoiceAmount == invoiceAmount)&&(identical(other.chargedAmount, chargedAmount) || other.chargedAmount == chargedAmount)&&(identical(other.rentAmount, rentAmount) || other.rentAmount == rentAmount)&&(identical(other.serviceChargeAmount, serviceChargeAmount) || other.serviceChargeAmount == serviceChargeAmount)&&(identical(other.utilityAmount, utilityAmount) || other.utilityAmount == utilityAmount)&&(identical(other.depositAmount, depositAmount) || other.depositAmount == depositAmount)&&(identical(other.broughtForwardAmount, broughtForwardAmount) || other.broughtForwardAmount == broughtForwardAmount)&&(identical(other.invoiceCount, invoiceCount) || other.invoiceCount == invoiceCount)&&(identical(other.paymentAmount, paymentAmount) || other.paymentAmount == paymentAmount)&&(identical(other.paymentCount, paymentCount) || other.paymentCount == paymentCount)&&(identical(other.openingArrears, openingArrears) || other.openingArrears == openingArrears)&&(identical(other.closingArrears, closingArrears) || other.closingArrears == closingArrears)&&(identical(other.overpaymentAmount, overpaymentAmount) || other.overpaymentAmount == overpaymentAmount)&&(identical(other.topupAmount, topupAmount) || other.topupAmount == topupAmount)&&(identical(other.cumulativeCredit, cumulativeCredit) || other.cumulativeCredit == cumulativeCredit)&&(identical(other.clearedAmount, clearedAmount) || other.clearedAmount == clearedAmount)&&(identical(other.forfeitedAmount, forfeitedAmount) || other.forfeitedAmount == forfeitedAmount)&&(identical(other.expenseAmount, expenseAmount) || other.expenseAmount == expenseAmount)&&(identical(other.expenseCount, expenseCount) || other.expenseCount == expenseCount)&&(identical(other.commissionAmount, commissionAmount) || other.commissionAmount == commissionAmount)&&(identical(other.commissionPercent, commissionPercent) || other.commissionPercent == commissionPercent)&&(identical(other.netIncome, netIncome) || other.netIncome == netIncome)&&(identical(other.creditsAndAdjustments, creditsAndAdjustments) || other.creditsAndAdjustments == creditsAndAdjustments));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,propertyName,estateId,estateName,totalUnits,occupiedUnits,periodYear,periodMonth,invoiceAmount,chargedAmount,rentAmount,serviceChargeAmount,utilityAmount,depositAmount,broughtForwardAmount,invoiceCount,paymentAmount,paymentCount,openingArrears,closingArrears,overpaymentAmount,topupAmount,cumulativeCredit,clearedAmount,forfeitedAmount,expenseAmount,expenseCount,commissionAmount,commissionPercent,netIncome,creditsAndAdjustments]);

@override
String toString() {
  return 'PropertyReportModel(id: $id, propertyName: $propertyName, estateId: $estateId, estateName: $estateName, totalUnits: $totalUnits, occupiedUnits: $occupiedUnits, periodYear: $periodYear, periodMonth: $periodMonth, invoiceAmount: $invoiceAmount, chargedAmount: $chargedAmount, rentAmount: $rentAmount, serviceChargeAmount: $serviceChargeAmount, utilityAmount: $utilityAmount, depositAmount: $depositAmount, broughtForwardAmount: $broughtForwardAmount, invoiceCount: $invoiceCount, paymentAmount: $paymentAmount, paymentCount: $paymentCount, openingArrears: $openingArrears, closingArrears: $closingArrears, overpaymentAmount: $overpaymentAmount, topupAmount: $topupAmount, cumulativeCredit: $cumulativeCredit, clearedAmount: $clearedAmount, forfeitedAmount: $forfeitedAmount, expenseAmount: $expenseAmount, expenseCount: $expenseCount, commissionAmount: $commissionAmount, commissionPercent: $commissionPercent, netIncome: $netIncome, creditsAndAdjustments: $creditsAndAdjustments)';
}


}

/// @nodoc
abstract mixin class _$PropertyReportModelCopyWith<$Res> implements $PropertyReportModelCopyWith<$Res> {
  factory _$PropertyReportModelCopyWith(_PropertyReportModel value, $Res Function(_PropertyReportModel) _then) = __$PropertyReportModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String? propertyName, String? estateId, String? estateName, int totalUnits, int occupiedUnits, int periodYear, int periodMonth,@JsonKey(fromJson: parseDouble) double invoiceAmount,@JsonKey(fromJson: parseDouble) double chargedAmount,@JsonKey(fromJson: parseDouble) double rentAmount,@JsonKey(fromJson: parseDouble) double serviceChargeAmount,@JsonKey(fromJson: parseDouble) double utilityAmount,@JsonKey(fromJson: parseDouble) double depositAmount,@JsonKey(fromJson: parseDouble) double broughtForwardAmount, int invoiceCount,@JsonKey(fromJson: parseDouble) double paymentAmount, int paymentCount,@JsonKey(fromJson: parseDouble) double openingArrears,@JsonKey(fromJson: parseDouble) double closingArrears,@JsonKey(fromJson: parseDouble) double overpaymentAmount,@JsonKey(fromJson: parseDouble) double topupAmount,@JsonKey(fromJson: parseDouble) double cumulativeCredit,@JsonKey(fromJson: parseDouble) double clearedAmount,@JsonKey(fromJson: parseDouble) double forfeitedAmount,@JsonKey(fromJson: parseDouble) double expenseAmount, int expenseCount,@JsonKey(fromJson: parseDoubleNullable) double? commissionAmount,@JsonKey(fromJson: parseDoubleNullable) double? commissionPercent,@JsonKey(fromJson: parseDouble) double netIncome,@JsonKey(fromJson: parseDouble) double creditsAndAdjustments
});




}
/// @nodoc
class __$PropertyReportModelCopyWithImpl<$Res>
    implements _$PropertyReportModelCopyWith<$Res> {
  __$PropertyReportModelCopyWithImpl(this._self, this._then);

  final _PropertyReportModel _self;
  final $Res Function(_PropertyReportModel) _then;

/// Create a copy of PropertyReportModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? propertyName = freezed,Object? estateId = freezed,Object? estateName = freezed,Object? totalUnits = null,Object? occupiedUnits = null,Object? periodYear = null,Object? periodMonth = null,Object? invoiceAmount = null,Object? chargedAmount = null,Object? rentAmount = null,Object? serviceChargeAmount = null,Object? utilityAmount = null,Object? depositAmount = null,Object? broughtForwardAmount = null,Object? invoiceCount = null,Object? paymentAmount = null,Object? paymentCount = null,Object? openingArrears = null,Object? closingArrears = null,Object? overpaymentAmount = null,Object? topupAmount = null,Object? cumulativeCredit = null,Object? clearedAmount = null,Object? forfeitedAmount = null,Object? expenseAmount = null,Object? expenseCount = null,Object? commissionAmount = freezed,Object? commissionPercent = freezed,Object? netIncome = null,Object? creditsAndAdjustments = null,}) {
  return _then(_PropertyReportModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,propertyName: freezed == propertyName ? _self.propertyName : propertyName // ignore: cast_nullable_to_non_nullable
as String?,estateId: freezed == estateId ? _self.estateId : estateId // ignore: cast_nullable_to_non_nullable
as String?,estateName: freezed == estateName ? _self.estateName : estateName // ignore: cast_nullable_to_non_nullable
as String?,totalUnits: null == totalUnits ? _self.totalUnits : totalUnits // ignore: cast_nullable_to_non_nullable
as int,occupiedUnits: null == occupiedUnits ? _self.occupiedUnits : occupiedUnits // ignore: cast_nullable_to_non_nullable
as int,periodYear: null == periodYear ? _self.periodYear : periodYear // ignore: cast_nullable_to_non_nullable
as int,periodMonth: null == periodMonth ? _self.periodMonth : periodMonth // ignore: cast_nullable_to_non_nullable
as int,invoiceAmount: null == invoiceAmount ? _self.invoiceAmount : invoiceAmount // ignore: cast_nullable_to_non_nullable
as double,chargedAmount: null == chargedAmount ? _self.chargedAmount : chargedAmount // ignore: cast_nullable_to_non_nullable
as double,rentAmount: null == rentAmount ? _self.rentAmount : rentAmount // ignore: cast_nullable_to_non_nullable
as double,serviceChargeAmount: null == serviceChargeAmount ? _self.serviceChargeAmount : serviceChargeAmount // ignore: cast_nullable_to_non_nullable
as double,utilityAmount: null == utilityAmount ? _self.utilityAmount : utilityAmount // ignore: cast_nullable_to_non_nullable
as double,depositAmount: null == depositAmount ? _self.depositAmount : depositAmount // ignore: cast_nullable_to_non_nullable
as double,broughtForwardAmount: null == broughtForwardAmount ? _self.broughtForwardAmount : broughtForwardAmount // ignore: cast_nullable_to_non_nullable
as double,invoiceCount: null == invoiceCount ? _self.invoiceCount : invoiceCount // ignore: cast_nullable_to_non_nullable
as int,paymentAmount: null == paymentAmount ? _self.paymentAmount : paymentAmount // ignore: cast_nullable_to_non_nullable
as double,paymentCount: null == paymentCount ? _self.paymentCount : paymentCount // ignore: cast_nullable_to_non_nullable
as int,openingArrears: null == openingArrears ? _self.openingArrears : openingArrears // ignore: cast_nullable_to_non_nullable
as double,closingArrears: null == closingArrears ? _self.closingArrears : closingArrears // ignore: cast_nullable_to_non_nullable
as double,overpaymentAmount: null == overpaymentAmount ? _self.overpaymentAmount : overpaymentAmount // ignore: cast_nullable_to_non_nullable
as double,topupAmount: null == topupAmount ? _self.topupAmount : topupAmount // ignore: cast_nullable_to_non_nullable
as double,cumulativeCredit: null == cumulativeCredit ? _self.cumulativeCredit : cumulativeCredit // ignore: cast_nullable_to_non_nullable
as double,clearedAmount: null == clearedAmount ? _self.clearedAmount : clearedAmount // ignore: cast_nullable_to_non_nullable
as double,forfeitedAmount: null == forfeitedAmount ? _self.forfeitedAmount : forfeitedAmount // ignore: cast_nullable_to_non_nullable
as double,expenseAmount: null == expenseAmount ? _self.expenseAmount : expenseAmount // ignore: cast_nullable_to_non_nullable
as double,expenseCount: null == expenseCount ? _self.expenseCount : expenseCount // ignore: cast_nullable_to_non_nullable
as int,commissionAmount: freezed == commissionAmount ? _self.commissionAmount : commissionAmount // ignore: cast_nullable_to_non_nullable
as double?,commissionPercent: freezed == commissionPercent ? _self.commissionPercent : commissionPercent // ignore: cast_nullable_to_non_nullable
as double?,netIncome: null == netIncome ? _self.netIncome : netIncome // ignore: cast_nullable_to_non_nullable
as double,creditsAndAdjustments: null == creditsAndAdjustments ? _self.creditsAndAdjustments : creditsAndAdjustments // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
