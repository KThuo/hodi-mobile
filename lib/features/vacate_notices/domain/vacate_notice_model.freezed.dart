// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vacate_notice_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$VacateNoticeModel {

 String get id; String get reference; String? get occupationId; String? get houseId; String get houseCode; String? get houseNumber; String? get houseLabel; String? get propertyId; String? get propertyName; String? get estateId; String? get estateName; String? get tenantUserId; String get tenantName; String? get tenantPhone; String? get tenantEmail;/// Who gave the notice — the tenant, or the office on their behalf.
 String? get raisedBy; String? get raisedByName; String? get vacateDate; String? get reason;/// `PENDING`, `APPROVED`, `REJECTED`, `CANCELLED`.
 String get status; String? get decidedByName; String? get decidedOn; String? get decisionNotes;// ── The settlement ─────────────────────────────────────────────────────
@JsonKey(fromJson: parseDoubleNullable) double? get rentOwed;@JsonKey(fromJson: parseDoubleNullable) double? get refundableDeposit;@JsonKey(fromJson: parseDoubleNullable) double? get totalDeductions;/// Positive means money goes back to the tenant; negative means they still owe.
@JsonKey(fromJson: parseDoubleNullable) double? get netAmount; String? get settlementType; bool get settled; String? get settledOn; String? get paymentStatus;@JsonKey(fromJson: parseDouble) double get totalPaid;@JsonKey(fromJson: parseDouble) double get balanceRemaining; bool get refundConfirmed; String? get refundReference; String? get unpaidHandling; String? get unpaidNotes;@JsonKey(fromJson: parseDoubleNullable) double? get unpaidAmount; bool get processed; String? get processedOn; String? get processedByName;/// Counted by the server. Negative means the date has passed.
 int get daysToVacate;/// What happens next, in the server's words. The single most useful line on the screen, and
/// the app does not try to work it out for itself.
 String? get nextStep; String? get createdOn; String? get updatedOn;
/// Create a copy of VacateNoticeModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VacateNoticeModelCopyWith<VacateNoticeModel> get copyWith => _$VacateNoticeModelCopyWithImpl<VacateNoticeModel>(this as VacateNoticeModel, _$identity);

  /// Serializes this VacateNoticeModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VacateNoticeModel&&(identical(other.id, id) || other.id == id)&&(identical(other.reference, reference) || other.reference == reference)&&(identical(other.occupationId, occupationId) || other.occupationId == occupationId)&&(identical(other.houseId, houseId) || other.houseId == houseId)&&(identical(other.houseCode, houseCode) || other.houseCode == houseCode)&&(identical(other.houseNumber, houseNumber) || other.houseNumber == houseNumber)&&(identical(other.houseLabel, houseLabel) || other.houseLabel == houseLabel)&&(identical(other.propertyId, propertyId) || other.propertyId == propertyId)&&(identical(other.propertyName, propertyName) || other.propertyName == propertyName)&&(identical(other.estateId, estateId) || other.estateId == estateId)&&(identical(other.estateName, estateName) || other.estateName == estateName)&&(identical(other.tenantUserId, tenantUserId) || other.tenantUserId == tenantUserId)&&(identical(other.tenantName, tenantName) || other.tenantName == tenantName)&&(identical(other.tenantPhone, tenantPhone) || other.tenantPhone == tenantPhone)&&(identical(other.tenantEmail, tenantEmail) || other.tenantEmail == tenantEmail)&&(identical(other.raisedBy, raisedBy) || other.raisedBy == raisedBy)&&(identical(other.raisedByName, raisedByName) || other.raisedByName == raisedByName)&&(identical(other.vacateDate, vacateDate) || other.vacateDate == vacateDate)&&(identical(other.reason, reason) || other.reason == reason)&&(identical(other.status, status) || other.status == status)&&(identical(other.decidedByName, decidedByName) || other.decidedByName == decidedByName)&&(identical(other.decidedOn, decidedOn) || other.decidedOn == decidedOn)&&(identical(other.decisionNotes, decisionNotes) || other.decisionNotes == decisionNotes)&&(identical(other.rentOwed, rentOwed) || other.rentOwed == rentOwed)&&(identical(other.refundableDeposit, refundableDeposit) || other.refundableDeposit == refundableDeposit)&&(identical(other.totalDeductions, totalDeductions) || other.totalDeductions == totalDeductions)&&(identical(other.netAmount, netAmount) || other.netAmount == netAmount)&&(identical(other.settlementType, settlementType) || other.settlementType == settlementType)&&(identical(other.settled, settled) || other.settled == settled)&&(identical(other.settledOn, settledOn) || other.settledOn == settledOn)&&(identical(other.paymentStatus, paymentStatus) || other.paymentStatus == paymentStatus)&&(identical(other.totalPaid, totalPaid) || other.totalPaid == totalPaid)&&(identical(other.balanceRemaining, balanceRemaining) || other.balanceRemaining == balanceRemaining)&&(identical(other.refundConfirmed, refundConfirmed) || other.refundConfirmed == refundConfirmed)&&(identical(other.refundReference, refundReference) || other.refundReference == refundReference)&&(identical(other.unpaidHandling, unpaidHandling) || other.unpaidHandling == unpaidHandling)&&(identical(other.unpaidNotes, unpaidNotes) || other.unpaidNotes == unpaidNotes)&&(identical(other.unpaidAmount, unpaidAmount) || other.unpaidAmount == unpaidAmount)&&(identical(other.processed, processed) || other.processed == processed)&&(identical(other.processedOn, processedOn) || other.processedOn == processedOn)&&(identical(other.processedByName, processedByName) || other.processedByName == processedByName)&&(identical(other.daysToVacate, daysToVacate) || other.daysToVacate == daysToVacate)&&(identical(other.nextStep, nextStep) || other.nextStep == nextStep)&&(identical(other.createdOn, createdOn) || other.createdOn == createdOn)&&(identical(other.updatedOn, updatedOn) || other.updatedOn == updatedOn));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,reference,occupationId,houseId,houseCode,houseNumber,houseLabel,propertyId,propertyName,estateId,estateName,tenantUserId,tenantName,tenantPhone,tenantEmail,raisedBy,raisedByName,vacateDate,reason,status,decidedByName,decidedOn,decisionNotes,rentOwed,refundableDeposit,totalDeductions,netAmount,settlementType,settled,settledOn,paymentStatus,totalPaid,balanceRemaining,refundConfirmed,refundReference,unpaidHandling,unpaidNotes,unpaidAmount,processed,processedOn,processedByName,daysToVacate,nextStep,createdOn,updatedOn]);

@override
String toString() {
  return 'VacateNoticeModel(id: $id, reference: $reference, occupationId: $occupationId, houseId: $houseId, houseCode: $houseCode, houseNumber: $houseNumber, houseLabel: $houseLabel, propertyId: $propertyId, propertyName: $propertyName, estateId: $estateId, estateName: $estateName, tenantUserId: $tenantUserId, tenantName: $tenantName, tenantPhone: $tenantPhone, tenantEmail: $tenantEmail, raisedBy: $raisedBy, raisedByName: $raisedByName, vacateDate: $vacateDate, reason: $reason, status: $status, decidedByName: $decidedByName, decidedOn: $decidedOn, decisionNotes: $decisionNotes, rentOwed: $rentOwed, refundableDeposit: $refundableDeposit, totalDeductions: $totalDeductions, netAmount: $netAmount, settlementType: $settlementType, settled: $settled, settledOn: $settledOn, paymentStatus: $paymentStatus, totalPaid: $totalPaid, balanceRemaining: $balanceRemaining, refundConfirmed: $refundConfirmed, refundReference: $refundReference, unpaidHandling: $unpaidHandling, unpaidNotes: $unpaidNotes, unpaidAmount: $unpaidAmount, processed: $processed, processedOn: $processedOn, processedByName: $processedByName, daysToVacate: $daysToVacate, nextStep: $nextStep, createdOn: $createdOn, updatedOn: $updatedOn)';
}


}

/// @nodoc
abstract mixin class $VacateNoticeModelCopyWith<$Res>  {
  factory $VacateNoticeModelCopyWith(VacateNoticeModel value, $Res Function(VacateNoticeModel) _then) = _$VacateNoticeModelCopyWithImpl;
@useResult
$Res call({
 String id, String reference, String? occupationId, String? houseId, String houseCode, String? houseNumber, String? houseLabel, String? propertyId, String? propertyName, String? estateId, String? estateName, String? tenantUserId, String tenantName, String? tenantPhone, String? tenantEmail, String? raisedBy, String? raisedByName, String? vacateDate, String? reason, String status, String? decidedByName, String? decidedOn, String? decisionNotes,@JsonKey(fromJson: parseDoubleNullable) double? rentOwed,@JsonKey(fromJson: parseDoubleNullable) double? refundableDeposit,@JsonKey(fromJson: parseDoubleNullable) double? totalDeductions,@JsonKey(fromJson: parseDoubleNullable) double? netAmount, String? settlementType, bool settled, String? settledOn, String? paymentStatus,@JsonKey(fromJson: parseDouble) double totalPaid,@JsonKey(fromJson: parseDouble) double balanceRemaining, bool refundConfirmed, String? refundReference, String? unpaidHandling, String? unpaidNotes,@JsonKey(fromJson: parseDoubleNullable) double? unpaidAmount, bool processed, String? processedOn, String? processedByName, int daysToVacate, String? nextStep, String? createdOn, String? updatedOn
});




}
/// @nodoc
class _$VacateNoticeModelCopyWithImpl<$Res>
    implements $VacateNoticeModelCopyWith<$Res> {
  _$VacateNoticeModelCopyWithImpl(this._self, this._then);

  final VacateNoticeModel _self;
  final $Res Function(VacateNoticeModel) _then;

/// Create a copy of VacateNoticeModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? reference = null,Object? occupationId = freezed,Object? houseId = freezed,Object? houseCode = null,Object? houseNumber = freezed,Object? houseLabel = freezed,Object? propertyId = freezed,Object? propertyName = freezed,Object? estateId = freezed,Object? estateName = freezed,Object? tenantUserId = freezed,Object? tenantName = null,Object? tenantPhone = freezed,Object? tenantEmail = freezed,Object? raisedBy = freezed,Object? raisedByName = freezed,Object? vacateDate = freezed,Object? reason = freezed,Object? status = null,Object? decidedByName = freezed,Object? decidedOn = freezed,Object? decisionNotes = freezed,Object? rentOwed = freezed,Object? refundableDeposit = freezed,Object? totalDeductions = freezed,Object? netAmount = freezed,Object? settlementType = freezed,Object? settled = null,Object? settledOn = freezed,Object? paymentStatus = freezed,Object? totalPaid = null,Object? balanceRemaining = null,Object? refundConfirmed = null,Object? refundReference = freezed,Object? unpaidHandling = freezed,Object? unpaidNotes = freezed,Object? unpaidAmount = freezed,Object? processed = null,Object? processedOn = freezed,Object? processedByName = freezed,Object? daysToVacate = null,Object? nextStep = freezed,Object? createdOn = freezed,Object? updatedOn = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,reference: null == reference ? _self.reference : reference // ignore: cast_nullable_to_non_nullable
as String,occupationId: freezed == occupationId ? _self.occupationId : occupationId // ignore: cast_nullable_to_non_nullable
as String?,houseId: freezed == houseId ? _self.houseId : houseId // ignore: cast_nullable_to_non_nullable
as String?,houseCode: null == houseCode ? _self.houseCode : houseCode // ignore: cast_nullable_to_non_nullable
as String,houseNumber: freezed == houseNumber ? _self.houseNumber : houseNumber // ignore: cast_nullable_to_non_nullable
as String?,houseLabel: freezed == houseLabel ? _self.houseLabel : houseLabel // ignore: cast_nullable_to_non_nullable
as String?,propertyId: freezed == propertyId ? _self.propertyId : propertyId // ignore: cast_nullable_to_non_nullable
as String?,propertyName: freezed == propertyName ? _self.propertyName : propertyName // ignore: cast_nullable_to_non_nullable
as String?,estateId: freezed == estateId ? _self.estateId : estateId // ignore: cast_nullable_to_non_nullable
as String?,estateName: freezed == estateName ? _self.estateName : estateName // ignore: cast_nullable_to_non_nullable
as String?,tenantUserId: freezed == tenantUserId ? _self.tenantUserId : tenantUserId // ignore: cast_nullable_to_non_nullable
as String?,tenantName: null == tenantName ? _self.tenantName : tenantName // ignore: cast_nullable_to_non_nullable
as String,tenantPhone: freezed == tenantPhone ? _self.tenantPhone : tenantPhone // ignore: cast_nullable_to_non_nullable
as String?,tenantEmail: freezed == tenantEmail ? _self.tenantEmail : tenantEmail // ignore: cast_nullable_to_non_nullable
as String?,raisedBy: freezed == raisedBy ? _self.raisedBy : raisedBy // ignore: cast_nullable_to_non_nullable
as String?,raisedByName: freezed == raisedByName ? _self.raisedByName : raisedByName // ignore: cast_nullable_to_non_nullable
as String?,vacateDate: freezed == vacateDate ? _self.vacateDate : vacateDate // ignore: cast_nullable_to_non_nullable
as String?,reason: freezed == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,decidedByName: freezed == decidedByName ? _self.decidedByName : decidedByName // ignore: cast_nullable_to_non_nullable
as String?,decidedOn: freezed == decidedOn ? _self.decidedOn : decidedOn // ignore: cast_nullable_to_non_nullable
as String?,decisionNotes: freezed == decisionNotes ? _self.decisionNotes : decisionNotes // ignore: cast_nullable_to_non_nullable
as String?,rentOwed: freezed == rentOwed ? _self.rentOwed : rentOwed // ignore: cast_nullable_to_non_nullable
as double?,refundableDeposit: freezed == refundableDeposit ? _self.refundableDeposit : refundableDeposit // ignore: cast_nullable_to_non_nullable
as double?,totalDeductions: freezed == totalDeductions ? _self.totalDeductions : totalDeductions // ignore: cast_nullable_to_non_nullable
as double?,netAmount: freezed == netAmount ? _self.netAmount : netAmount // ignore: cast_nullable_to_non_nullable
as double?,settlementType: freezed == settlementType ? _self.settlementType : settlementType // ignore: cast_nullable_to_non_nullable
as String?,settled: null == settled ? _self.settled : settled // ignore: cast_nullable_to_non_nullable
as bool,settledOn: freezed == settledOn ? _self.settledOn : settledOn // ignore: cast_nullable_to_non_nullable
as String?,paymentStatus: freezed == paymentStatus ? _self.paymentStatus : paymentStatus // ignore: cast_nullable_to_non_nullable
as String?,totalPaid: null == totalPaid ? _self.totalPaid : totalPaid // ignore: cast_nullable_to_non_nullable
as double,balanceRemaining: null == balanceRemaining ? _self.balanceRemaining : balanceRemaining // ignore: cast_nullable_to_non_nullable
as double,refundConfirmed: null == refundConfirmed ? _self.refundConfirmed : refundConfirmed // ignore: cast_nullable_to_non_nullable
as bool,refundReference: freezed == refundReference ? _self.refundReference : refundReference // ignore: cast_nullable_to_non_nullable
as String?,unpaidHandling: freezed == unpaidHandling ? _self.unpaidHandling : unpaidHandling // ignore: cast_nullable_to_non_nullable
as String?,unpaidNotes: freezed == unpaidNotes ? _self.unpaidNotes : unpaidNotes // ignore: cast_nullable_to_non_nullable
as String?,unpaidAmount: freezed == unpaidAmount ? _self.unpaidAmount : unpaidAmount // ignore: cast_nullable_to_non_nullable
as double?,processed: null == processed ? _self.processed : processed // ignore: cast_nullable_to_non_nullable
as bool,processedOn: freezed == processedOn ? _self.processedOn : processedOn // ignore: cast_nullable_to_non_nullable
as String?,processedByName: freezed == processedByName ? _self.processedByName : processedByName // ignore: cast_nullable_to_non_nullable
as String?,daysToVacate: null == daysToVacate ? _self.daysToVacate : daysToVacate // ignore: cast_nullable_to_non_nullable
as int,nextStep: freezed == nextStep ? _self.nextStep : nextStep // ignore: cast_nullable_to_non_nullable
as String?,createdOn: freezed == createdOn ? _self.createdOn : createdOn // ignore: cast_nullable_to_non_nullable
as String?,updatedOn: freezed == updatedOn ? _self.updatedOn : updatedOn // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [VacateNoticeModel].
extension VacateNoticeModelPatterns on VacateNoticeModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VacateNoticeModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VacateNoticeModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VacateNoticeModel value)  $default,){
final _that = this;
switch (_that) {
case _VacateNoticeModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VacateNoticeModel value)?  $default,){
final _that = this;
switch (_that) {
case _VacateNoticeModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String reference,  String? occupationId,  String? houseId,  String houseCode,  String? houseNumber,  String? houseLabel,  String? propertyId,  String? propertyName,  String? estateId,  String? estateName,  String? tenantUserId,  String tenantName,  String? tenantPhone,  String? tenantEmail,  String? raisedBy,  String? raisedByName,  String? vacateDate,  String? reason,  String status,  String? decidedByName,  String? decidedOn,  String? decisionNotes, @JsonKey(fromJson: parseDoubleNullable)  double? rentOwed, @JsonKey(fromJson: parseDoubleNullable)  double? refundableDeposit, @JsonKey(fromJson: parseDoubleNullable)  double? totalDeductions, @JsonKey(fromJson: parseDoubleNullable)  double? netAmount,  String? settlementType,  bool settled,  String? settledOn,  String? paymentStatus, @JsonKey(fromJson: parseDouble)  double totalPaid, @JsonKey(fromJson: parseDouble)  double balanceRemaining,  bool refundConfirmed,  String? refundReference,  String? unpaidHandling,  String? unpaidNotes, @JsonKey(fromJson: parseDoubleNullable)  double? unpaidAmount,  bool processed,  String? processedOn,  String? processedByName,  int daysToVacate,  String? nextStep,  String? createdOn,  String? updatedOn)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VacateNoticeModel() when $default != null:
return $default(_that.id,_that.reference,_that.occupationId,_that.houseId,_that.houseCode,_that.houseNumber,_that.houseLabel,_that.propertyId,_that.propertyName,_that.estateId,_that.estateName,_that.tenantUserId,_that.tenantName,_that.tenantPhone,_that.tenantEmail,_that.raisedBy,_that.raisedByName,_that.vacateDate,_that.reason,_that.status,_that.decidedByName,_that.decidedOn,_that.decisionNotes,_that.rentOwed,_that.refundableDeposit,_that.totalDeductions,_that.netAmount,_that.settlementType,_that.settled,_that.settledOn,_that.paymentStatus,_that.totalPaid,_that.balanceRemaining,_that.refundConfirmed,_that.refundReference,_that.unpaidHandling,_that.unpaidNotes,_that.unpaidAmount,_that.processed,_that.processedOn,_that.processedByName,_that.daysToVacate,_that.nextStep,_that.createdOn,_that.updatedOn);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String reference,  String? occupationId,  String? houseId,  String houseCode,  String? houseNumber,  String? houseLabel,  String? propertyId,  String? propertyName,  String? estateId,  String? estateName,  String? tenantUserId,  String tenantName,  String? tenantPhone,  String? tenantEmail,  String? raisedBy,  String? raisedByName,  String? vacateDate,  String? reason,  String status,  String? decidedByName,  String? decidedOn,  String? decisionNotes, @JsonKey(fromJson: parseDoubleNullable)  double? rentOwed, @JsonKey(fromJson: parseDoubleNullable)  double? refundableDeposit, @JsonKey(fromJson: parseDoubleNullable)  double? totalDeductions, @JsonKey(fromJson: parseDoubleNullable)  double? netAmount,  String? settlementType,  bool settled,  String? settledOn,  String? paymentStatus, @JsonKey(fromJson: parseDouble)  double totalPaid, @JsonKey(fromJson: parseDouble)  double balanceRemaining,  bool refundConfirmed,  String? refundReference,  String? unpaidHandling,  String? unpaidNotes, @JsonKey(fromJson: parseDoubleNullable)  double? unpaidAmount,  bool processed,  String? processedOn,  String? processedByName,  int daysToVacate,  String? nextStep,  String? createdOn,  String? updatedOn)  $default,) {final _that = this;
switch (_that) {
case _VacateNoticeModel():
return $default(_that.id,_that.reference,_that.occupationId,_that.houseId,_that.houseCode,_that.houseNumber,_that.houseLabel,_that.propertyId,_that.propertyName,_that.estateId,_that.estateName,_that.tenantUserId,_that.tenantName,_that.tenantPhone,_that.tenantEmail,_that.raisedBy,_that.raisedByName,_that.vacateDate,_that.reason,_that.status,_that.decidedByName,_that.decidedOn,_that.decisionNotes,_that.rentOwed,_that.refundableDeposit,_that.totalDeductions,_that.netAmount,_that.settlementType,_that.settled,_that.settledOn,_that.paymentStatus,_that.totalPaid,_that.balanceRemaining,_that.refundConfirmed,_that.refundReference,_that.unpaidHandling,_that.unpaidNotes,_that.unpaidAmount,_that.processed,_that.processedOn,_that.processedByName,_that.daysToVacate,_that.nextStep,_that.createdOn,_that.updatedOn);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String reference,  String? occupationId,  String? houseId,  String houseCode,  String? houseNumber,  String? houseLabel,  String? propertyId,  String? propertyName,  String? estateId,  String? estateName,  String? tenantUserId,  String tenantName,  String? tenantPhone,  String? tenantEmail,  String? raisedBy,  String? raisedByName,  String? vacateDate,  String? reason,  String status,  String? decidedByName,  String? decidedOn,  String? decisionNotes, @JsonKey(fromJson: parseDoubleNullable)  double? rentOwed, @JsonKey(fromJson: parseDoubleNullable)  double? refundableDeposit, @JsonKey(fromJson: parseDoubleNullable)  double? totalDeductions, @JsonKey(fromJson: parseDoubleNullable)  double? netAmount,  String? settlementType,  bool settled,  String? settledOn,  String? paymentStatus, @JsonKey(fromJson: parseDouble)  double totalPaid, @JsonKey(fromJson: parseDouble)  double balanceRemaining,  bool refundConfirmed,  String? refundReference,  String? unpaidHandling,  String? unpaidNotes, @JsonKey(fromJson: parseDoubleNullable)  double? unpaidAmount,  bool processed,  String? processedOn,  String? processedByName,  int daysToVacate,  String? nextStep,  String? createdOn,  String? updatedOn)?  $default,) {final _that = this;
switch (_that) {
case _VacateNoticeModel() when $default != null:
return $default(_that.id,_that.reference,_that.occupationId,_that.houseId,_that.houseCode,_that.houseNumber,_that.houseLabel,_that.propertyId,_that.propertyName,_that.estateId,_that.estateName,_that.tenantUserId,_that.tenantName,_that.tenantPhone,_that.tenantEmail,_that.raisedBy,_that.raisedByName,_that.vacateDate,_that.reason,_that.status,_that.decidedByName,_that.decidedOn,_that.decisionNotes,_that.rentOwed,_that.refundableDeposit,_that.totalDeductions,_that.netAmount,_that.settlementType,_that.settled,_that.settledOn,_that.paymentStatus,_that.totalPaid,_that.balanceRemaining,_that.refundConfirmed,_that.refundReference,_that.unpaidHandling,_that.unpaidNotes,_that.unpaidAmount,_that.processed,_that.processedOn,_that.processedByName,_that.daysToVacate,_that.nextStep,_that.createdOn,_that.updatedOn);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _VacateNoticeModel extends VacateNoticeModel {
  const _VacateNoticeModel({required this.id, required this.reference, this.occupationId, this.houseId, required this.houseCode, this.houseNumber, this.houseLabel, this.propertyId, this.propertyName, this.estateId, this.estateName, this.tenantUserId, required this.tenantName, this.tenantPhone, this.tenantEmail, this.raisedBy, this.raisedByName, this.vacateDate, this.reason, required this.status, this.decidedByName, this.decidedOn, this.decisionNotes, @JsonKey(fromJson: parseDoubleNullable) this.rentOwed, @JsonKey(fromJson: parseDoubleNullable) this.refundableDeposit, @JsonKey(fromJson: parseDoubleNullable) this.totalDeductions, @JsonKey(fromJson: parseDoubleNullable) this.netAmount, this.settlementType, this.settled = false, this.settledOn, this.paymentStatus, @JsonKey(fromJson: parseDouble) this.totalPaid = 0, @JsonKey(fromJson: parseDouble) this.balanceRemaining = 0, this.refundConfirmed = false, this.refundReference, this.unpaidHandling, this.unpaidNotes, @JsonKey(fromJson: parseDoubleNullable) this.unpaidAmount, this.processed = false, this.processedOn, this.processedByName, this.daysToVacate = 0, this.nextStep, this.createdOn, this.updatedOn}): super._();
  factory _VacateNoticeModel.fromJson(Map<String, dynamic> json) => _$VacateNoticeModelFromJson(json);

@override final  String id;
@override final  String reference;
@override final  String? occupationId;
@override final  String? houseId;
@override final  String houseCode;
@override final  String? houseNumber;
@override final  String? houseLabel;
@override final  String? propertyId;
@override final  String? propertyName;
@override final  String? estateId;
@override final  String? estateName;
@override final  String? tenantUserId;
@override final  String tenantName;
@override final  String? tenantPhone;
@override final  String? tenantEmail;
/// Who gave the notice — the tenant, or the office on their behalf.
@override final  String? raisedBy;
@override final  String? raisedByName;
@override final  String? vacateDate;
@override final  String? reason;
/// `PENDING`, `APPROVED`, `REJECTED`, `CANCELLED`.
@override final  String status;
@override final  String? decidedByName;
@override final  String? decidedOn;
@override final  String? decisionNotes;
// ── The settlement ─────────────────────────────────────────────────────
@override@JsonKey(fromJson: parseDoubleNullable) final  double? rentOwed;
@override@JsonKey(fromJson: parseDoubleNullable) final  double? refundableDeposit;
@override@JsonKey(fromJson: parseDoubleNullable) final  double? totalDeductions;
/// Positive means money goes back to the tenant; negative means they still owe.
@override@JsonKey(fromJson: parseDoubleNullable) final  double? netAmount;
@override final  String? settlementType;
@override@JsonKey() final  bool settled;
@override final  String? settledOn;
@override final  String? paymentStatus;
@override@JsonKey(fromJson: parseDouble) final  double totalPaid;
@override@JsonKey(fromJson: parseDouble) final  double balanceRemaining;
@override@JsonKey() final  bool refundConfirmed;
@override final  String? refundReference;
@override final  String? unpaidHandling;
@override final  String? unpaidNotes;
@override@JsonKey(fromJson: parseDoubleNullable) final  double? unpaidAmount;
@override@JsonKey() final  bool processed;
@override final  String? processedOn;
@override final  String? processedByName;
/// Counted by the server. Negative means the date has passed.
@override@JsonKey() final  int daysToVacate;
/// What happens next, in the server's words. The single most useful line on the screen, and
/// the app does not try to work it out for itself.
@override final  String? nextStep;
@override final  String? createdOn;
@override final  String? updatedOn;

/// Create a copy of VacateNoticeModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VacateNoticeModelCopyWith<_VacateNoticeModel> get copyWith => __$VacateNoticeModelCopyWithImpl<_VacateNoticeModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VacateNoticeModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VacateNoticeModel&&(identical(other.id, id) || other.id == id)&&(identical(other.reference, reference) || other.reference == reference)&&(identical(other.occupationId, occupationId) || other.occupationId == occupationId)&&(identical(other.houseId, houseId) || other.houseId == houseId)&&(identical(other.houseCode, houseCode) || other.houseCode == houseCode)&&(identical(other.houseNumber, houseNumber) || other.houseNumber == houseNumber)&&(identical(other.houseLabel, houseLabel) || other.houseLabel == houseLabel)&&(identical(other.propertyId, propertyId) || other.propertyId == propertyId)&&(identical(other.propertyName, propertyName) || other.propertyName == propertyName)&&(identical(other.estateId, estateId) || other.estateId == estateId)&&(identical(other.estateName, estateName) || other.estateName == estateName)&&(identical(other.tenantUserId, tenantUserId) || other.tenantUserId == tenantUserId)&&(identical(other.tenantName, tenantName) || other.tenantName == tenantName)&&(identical(other.tenantPhone, tenantPhone) || other.tenantPhone == tenantPhone)&&(identical(other.tenantEmail, tenantEmail) || other.tenantEmail == tenantEmail)&&(identical(other.raisedBy, raisedBy) || other.raisedBy == raisedBy)&&(identical(other.raisedByName, raisedByName) || other.raisedByName == raisedByName)&&(identical(other.vacateDate, vacateDate) || other.vacateDate == vacateDate)&&(identical(other.reason, reason) || other.reason == reason)&&(identical(other.status, status) || other.status == status)&&(identical(other.decidedByName, decidedByName) || other.decidedByName == decidedByName)&&(identical(other.decidedOn, decidedOn) || other.decidedOn == decidedOn)&&(identical(other.decisionNotes, decisionNotes) || other.decisionNotes == decisionNotes)&&(identical(other.rentOwed, rentOwed) || other.rentOwed == rentOwed)&&(identical(other.refundableDeposit, refundableDeposit) || other.refundableDeposit == refundableDeposit)&&(identical(other.totalDeductions, totalDeductions) || other.totalDeductions == totalDeductions)&&(identical(other.netAmount, netAmount) || other.netAmount == netAmount)&&(identical(other.settlementType, settlementType) || other.settlementType == settlementType)&&(identical(other.settled, settled) || other.settled == settled)&&(identical(other.settledOn, settledOn) || other.settledOn == settledOn)&&(identical(other.paymentStatus, paymentStatus) || other.paymentStatus == paymentStatus)&&(identical(other.totalPaid, totalPaid) || other.totalPaid == totalPaid)&&(identical(other.balanceRemaining, balanceRemaining) || other.balanceRemaining == balanceRemaining)&&(identical(other.refundConfirmed, refundConfirmed) || other.refundConfirmed == refundConfirmed)&&(identical(other.refundReference, refundReference) || other.refundReference == refundReference)&&(identical(other.unpaidHandling, unpaidHandling) || other.unpaidHandling == unpaidHandling)&&(identical(other.unpaidNotes, unpaidNotes) || other.unpaidNotes == unpaidNotes)&&(identical(other.unpaidAmount, unpaidAmount) || other.unpaidAmount == unpaidAmount)&&(identical(other.processed, processed) || other.processed == processed)&&(identical(other.processedOn, processedOn) || other.processedOn == processedOn)&&(identical(other.processedByName, processedByName) || other.processedByName == processedByName)&&(identical(other.daysToVacate, daysToVacate) || other.daysToVacate == daysToVacate)&&(identical(other.nextStep, nextStep) || other.nextStep == nextStep)&&(identical(other.createdOn, createdOn) || other.createdOn == createdOn)&&(identical(other.updatedOn, updatedOn) || other.updatedOn == updatedOn));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,reference,occupationId,houseId,houseCode,houseNumber,houseLabel,propertyId,propertyName,estateId,estateName,tenantUserId,tenantName,tenantPhone,tenantEmail,raisedBy,raisedByName,vacateDate,reason,status,decidedByName,decidedOn,decisionNotes,rentOwed,refundableDeposit,totalDeductions,netAmount,settlementType,settled,settledOn,paymentStatus,totalPaid,balanceRemaining,refundConfirmed,refundReference,unpaidHandling,unpaidNotes,unpaidAmount,processed,processedOn,processedByName,daysToVacate,nextStep,createdOn,updatedOn]);

@override
String toString() {
  return 'VacateNoticeModel(id: $id, reference: $reference, occupationId: $occupationId, houseId: $houseId, houseCode: $houseCode, houseNumber: $houseNumber, houseLabel: $houseLabel, propertyId: $propertyId, propertyName: $propertyName, estateId: $estateId, estateName: $estateName, tenantUserId: $tenantUserId, tenantName: $tenantName, tenantPhone: $tenantPhone, tenantEmail: $tenantEmail, raisedBy: $raisedBy, raisedByName: $raisedByName, vacateDate: $vacateDate, reason: $reason, status: $status, decidedByName: $decidedByName, decidedOn: $decidedOn, decisionNotes: $decisionNotes, rentOwed: $rentOwed, refundableDeposit: $refundableDeposit, totalDeductions: $totalDeductions, netAmount: $netAmount, settlementType: $settlementType, settled: $settled, settledOn: $settledOn, paymentStatus: $paymentStatus, totalPaid: $totalPaid, balanceRemaining: $balanceRemaining, refundConfirmed: $refundConfirmed, refundReference: $refundReference, unpaidHandling: $unpaidHandling, unpaidNotes: $unpaidNotes, unpaidAmount: $unpaidAmount, processed: $processed, processedOn: $processedOn, processedByName: $processedByName, daysToVacate: $daysToVacate, nextStep: $nextStep, createdOn: $createdOn, updatedOn: $updatedOn)';
}


}

/// @nodoc
abstract mixin class _$VacateNoticeModelCopyWith<$Res> implements $VacateNoticeModelCopyWith<$Res> {
  factory _$VacateNoticeModelCopyWith(_VacateNoticeModel value, $Res Function(_VacateNoticeModel) _then) = __$VacateNoticeModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String reference, String? occupationId, String? houseId, String houseCode, String? houseNumber, String? houseLabel, String? propertyId, String? propertyName, String? estateId, String? estateName, String? tenantUserId, String tenantName, String? tenantPhone, String? tenantEmail, String? raisedBy, String? raisedByName, String? vacateDate, String? reason, String status, String? decidedByName, String? decidedOn, String? decisionNotes,@JsonKey(fromJson: parseDoubleNullable) double? rentOwed,@JsonKey(fromJson: parseDoubleNullable) double? refundableDeposit,@JsonKey(fromJson: parseDoubleNullable) double? totalDeductions,@JsonKey(fromJson: parseDoubleNullable) double? netAmount, String? settlementType, bool settled, String? settledOn, String? paymentStatus,@JsonKey(fromJson: parseDouble) double totalPaid,@JsonKey(fromJson: parseDouble) double balanceRemaining, bool refundConfirmed, String? refundReference, String? unpaidHandling, String? unpaidNotes,@JsonKey(fromJson: parseDoubleNullable) double? unpaidAmount, bool processed, String? processedOn, String? processedByName, int daysToVacate, String? nextStep, String? createdOn, String? updatedOn
});




}
/// @nodoc
class __$VacateNoticeModelCopyWithImpl<$Res>
    implements _$VacateNoticeModelCopyWith<$Res> {
  __$VacateNoticeModelCopyWithImpl(this._self, this._then);

  final _VacateNoticeModel _self;
  final $Res Function(_VacateNoticeModel) _then;

/// Create a copy of VacateNoticeModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? reference = null,Object? occupationId = freezed,Object? houseId = freezed,Object? houseCode = null,Object? houseNumber = freezed,Object? houseLabel = freezed,Object? propertyId = freezed,Object? propertyName = freezed,Object? estateId = freezed,Object? estateName = freezed,Object? tenantUserId = freezed,Object? tenantName = null,Object? tenantPhone = freezed,Object? tenantEmail = freezed,Object? raisedBy = freezed,Object? raisedByName = freezed,Object? vacateDate = freezed,Object? reason = freezed,Object? status = null,Object? decidedByName = freezed,Object? decidedOn = freezed,Object? decisionNotes = freezed,Object? rentOwed = freezed,Object? refundableDeposit = freezed,Object? totalDeductions = freezed,Object? netAmount = freezed,Object? settlementType = freezed,Object? settled = null,Object? settledOn = freezed,Object? paymentStatus = freezed,Object? totalPaid = null,Object? balanceRemaining = null,Object? refundConfirmed = null,Object? refundReference = freezed,Object? unpaidHandling = freezed,Object? unpaidNotes = freezed,Object? unpaidAmount = freezed,Object? processed = null,Object? processedOn = freezed,Object? processedByName = freezed,Object? daysToVacate = null,Object? nextStep = freezed,Object? createdOn = freezed,Object? updatedOn = freezed,}) {
  return _then(_VacateNoticeModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,reference: null == reference ? _self.reference : reference // ignore: cast_nullable_to_non_nullable
as String,occupationId: freezed == occupationId ? _self.occupationId : occupationId // ignore: cast_nullable_to_non_nullable
as String?,houseId: freezed == houseId ? _self.houseId : houseId // ignore: cast_nullable_to_non_nullable
as String?,houseCode: null == houseCode ? _self.houseCode : houseCode // ignore: cast_nullable_to_non_nullable
as String,houseNumber: freezed == houseNumber ? _self.houseNumber : houseNumber // ignore: cast_nullable_to_non_nullable
as String?,houseLabel: freezed == houseLabel ? _self.houseLabel : houseLabel // ignore: cast_nullable_to_non_nullable
as String?,propertyId: freezed == propertyId ? _self.propertyId : propertyId // ignore: cast_nullable_to_non_nullable
as String?,propertyName: freezed == propertyName ? _self.propertyName : propertyName // ignore: cast_nullable_to_non_nullable
as String?,estateId: freezed == estateId ? _self.estateId : estateId // ignore: cast_nullable_to_non_nullable
as String?,estateName: freezed == estateName ? _self.estateName : estateName // ignore: cast_nullable_to_non_nullable
as String?,tenantUserId: freezed == tenantUserId ? _self.tenantUserId : tenantUserId // ignore: cast_nullable_to_non_nullable
as String?,tenantName: null == tenantName ? _self.tenantName : tenantName // ignore: cast_nullable_to_non_nullable
as String,tenantPhone: freezed == tenantPhone ? _self.tenantPhone : tenantPhone // ignore: cast_nullable_to_non_nullable
as String?,tenantEmail: freezed == tenantEmail ? _self.tenantEmail : tenantEmail // ignore: cast_nullable_to_non_nullable
as String?,raisedBy: freezed == raisedBy ? _self.raisedBy : raisedBy // ignore: cast_nullable_to_non_nullable
as String?,raisedByName: freezed == raisedByName ? _self.raisedByName : raisedByName // ignore: cast_nullable_to_non_nullable
as String?,vacateDate: freezed == vacateDate ? _self.vacateDate : vacateDate // ignore: cast_nullable_to_non_nullable
as String?,reason: freezed == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,decidedByName: freezed == decidedByName ? _self.decidedByName : decidedByName // ignore: cast_nullable_to_non_nullable
as String?,decidedOn: freezed == decidedOn ? _self.decidedOn : decidedOn // ignore: cast_nullable_to_non_nullable
as String?,decisionNotes: freezed == decisionNotes ? _self.decisionNotes : decisionNotes // ignore: cast_nullable_to_non_nullable
as String?,rentOwed: freezed == rentOwed ? _self.rentOwed : rentOwed // ignore: cast_nullable_to_non_nullable
as double?,refundableDeposit: freezed == refundableDeposit ? _self.refundableDeposit : refundableDeposit // ignore: cast_nullable_to_non_nullable
as double?,totalDeductions: freezed == totalDeductions ? _self.totalDeductions : totalDeductions // ignore: cast_nullable_to_non_nullable
as double?,netAmount: freezed == netAmount ? _self.netAmount : netAmount // ignore: cast_nullable_to_non_nullable
as double?,settlementType: freezed == settlementType ? _self.settlementType : settlementType // ignore: cast_nullable_to_non_nullable
as String?,settled: null == settled ? _self.settled : settled // ignore: cast_nullable_to_non_nullable
as bool,settledOn: freezed == settledOn ? _self.settledOn : settledOn // ignore: cast_nullable_to_non_nullable
as String?,paymentStatus: freezed == paymentStatus ? _self.paymentStatus : paymentStatus // ignore: cast_nullable_to_non_nullable
as String?,totalPaid: null == totalPaid ? _self.totalPaid : totalPaid // ignore: cast_nullable_to_non_nullable
as double,balanceRemaining: null == balanceRemaining ? _self.balanceRemaining : balanceRemaining // ignore: cast_nullable_to_non_nullable
as double,refundConfirmed: null == refundConfirmed ? _self.refundConfirmed : refundConfirmed // ignore: cast_nullable_to_non_nullable
as bool,refundReference: freezed == refundReference ? _self.refundReference : refundReference // ignore: cast_nullable_to_non_nullable
as String?,unpaidHandling: freezed == unpaidHandling ? _self.unpaidHandling : unpaidHandling // ignore: cast_nullable_to_non_nullable
as String?,unpaidNotes: freezed == unpaidNotes ? _self.unpaidNotes : unpaidNotes // ignore: cast_nullable_to_non_nullable
as String?,unpaidAmount: freezed == unpaidAmount ? _self.unpaidAmount : unpaidAmount // ignore: cast_nullable_to_non_nullable
as double?,processed: null == processed ? _self.processed : processed // ignore: cast_nullable_to_non_nullable
as bool,processedOn: freezed == processedOn ? _self.processedOn : processedOn // ignore: cast_nullable_to_non_nullable
as String?,processedByName: freezed == processedByName ? _self.processedByName : processedByName // ignore: cast_nullable_to_non_nullable
as String?,daysToVacate: null == daysToVacate ? _self.daysToVacate : daysToVacate // ignore: cast_nullable_to_non_nullable
as int,nextStep: freezed == nextStep ? _self.nextStep : nextStep // ignore: cast_nullable_to_non_nullable
as String?,createdOn: freezed == createdOn ? _self.createdOn : createdOn // ignore: cast_nullable_to_non_nullable
as String?,updatedOn: freezed == updatedOn ? _self.updatedOn : updatedOn // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
