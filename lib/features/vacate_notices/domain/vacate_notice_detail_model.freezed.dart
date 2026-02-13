// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vacate_notice_detail_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$VacateNoticeDetailModel {

// Core
 String? get id; String? get rrn;// House info
 String? get houseName; String? get houseCode; String? get houseNumber;@JsonKey(fromJson: parseIntNullable) int? get houseId;// Tenant info
 String? get tenantName; String? get tenantPhone; String? get tenantEmail;@JsonKey(fromJson: parseIntNullable) int? get tenantId;// Property/Estate
 String? get propertyName;@JsonKey(fromJson: parseIntNullable) int? get propertyId; String? get estateName;@JsonKey(fromJson: parseIntNullable) int? get estateId;// Notice info
 String? get vacateDate; String? get reason; String? get flag;@JsonKey(fromJson: parseIntNullable) int? get status; String? get initiatedBy; String? get initiatedByName;@JsonKey(fromJson: parseIntNullable) int? get initiatedById;// Approval
 String? get approvedByName; String? get approvalDate; String? get approvalComments;// Processing
 bool get isProcessed; String? get processedDate; String? get processedBy;// Settlement
 String? get settlementType;@JsonKey(fromJson: parseDouble) double get rentOwed;@JsonKey(fromJson: parseDouble) double get refundableDeposit;@JsonKey(fromJson: parseDouble) double get totalExpenses;@JsonKey(fromJson: parseDouble) double get netAmount; String? get settlementDetails;// Payment
@JsonKey(fromJson: parseIntNullable) int? get paymentStatus; String? get paymentFlag;@JsonKey(fromJson: parseDouble) double get totalPaid;@JsonKey(fromJson: parseDouble) double get balanceRemaining; String? get paymentRrn; String? get paymentHistory; String? get invoiceRrn; String? get invoiceGeneratedDate;// Unpaid balance
 String? get unpaidBalanceHandling; String? get unpaidHandlingNotes;@JsonKey(fromJson: parseDouble) double get unpaidAmount;// Refund
 bool get refundConfirmed;// Metadata
 String? get createdOn; String? get createdBy; String? get modifiedOn; String? get modifiedBy;
/// Create a copy of VacateNoticeDetailModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VacateNoticeDetailModelCopyWith<VacateNoticeDetailModel> get copyWith => _$VacateNoticeDetailModelCopyWithImpl<VacateNoticeDetailModel>(this as VacateNoticeDetailModel, _$identity);

  /// Serializes this VacateNoticeDetailModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VacateNoticeDetailModel&&(identical(other.id, id) || other.id == id)&&(identical(other.rrn, rrn) || other.rrn == rrn)&&(identical(other.houseName, houseName) || other.houseName == houseName)&&(identical(other.houseCode, houseCode) || other.houseCode == houseCode)&&(identical(other.houseNumber, houseNumber) || other.houseNumber == houseNumber)&&(identical(other.houseId, houseId) || other.houseId == houseId)&&(identical(other.tenantName, tenantName) || other.tenantName == tenantName)&&(identical(other.tenantPhone, tenantPhone) || other.tenantPhone == tenantPhone)&&(identical(other.tenantEmail, tenantEmail) || other.tenantEmail == tenantEmail)&&(identical(other.tenantId, tenantId) || other.tenantId == tenantId)&&(identical(other.propertyName, propertyName) || other.propertyName == propertyName)&&(identical(other.propertyId, propertyId) || other.propertyId == propertyId)&&(identical(other.estateName, estateName) || other.estateName == estateName)&&(identical(other.estateId, estateId) || other.estateId == estateId)&&(identical(other.vacateDate, vacateDate) || other.vacateDate == vacateDate)&&(identical(other.reason, reason) || other.reason == reason)&&(identical(other.flag, flag) || other.flag == flag)&&(identical(other.status, status) || other.status == status)&&(identical(other.initiatedBy, initiatedBy) || other.initiatedBy == initiatedBy)&&(identical(other.initiatedByName, initiatedByName) || other.initiatedByName == initiatedByName)&&(identical(other.initiatedById, initiatedById) || other.initiatedById == initiatedById)&&(identical(other.approvedByName, approvedByName) || other.approvedByName == approvedByName)&&(identical(other.approvalDate, approvalDate) || other.approvalDate == approvalDate)&&(identical(other.approvalComments, approvalComments) || other.approvalComments == approvalComments)&&(identical(other.isProcessed, isProcessed) || other.isProcessed == isProcessed)&&(identical(other.processedDate, processedDate) || other.processedDate == processedDate)&&(identical(other.processedBy, processedBy) || other.processedBy == processedBy)&&(identical(other.settlementType, settlementType) || other.settlementType == settlementType)&&(identical(other.rentOwed, rentOwed) || other.rentOwed == rentOwed)&&(identical(other.refundableDeposit, refundableDeposit) || other.refundableDeposit == refundableDeposit)&&(identical(other.totalExpenses, totalExpenses) || other.totalExpenses == totalExpenses)&&(identical(other.netAmount, netAmount) || other.netAmount == netAmount)&&(identical(other.settlementDetails, settlementDetails) || other.settlementDetails == settlementDetails)&&(identical(other.paymentStatus, paymentStatus) || other.paymentStatus == paymentStatus)&&(identical(other.paymentFlag, paymentFlag) || other.paymentFlag == paymentFlag)&&(identical(other.totalPaid, totalPaid) || other.totalPaid == totalPaid)&&(identical(other.balanceRemaining, balanceRemaining) || other.balanceRemaining == balanceRemaining)&&(identical(other.paymentRrn, paymentRrn) || other.paymentRrn == paymentRrn)&&(identical(other.paymentHistory, paymentHistory) || other.paymentHistory == paymentHistory)&&(identical(other.invoiceRrn, invoiceRrn) || other.invoiceRrn == invoiceRrn)&&(identical(other.invoiceGeneratedDate, invoiceGeneratedDate) || other.invoiceGeneratedDate == invoiceGeneratedDate)&&(identical(other.unpaidBalanceHandling, unpaidBalanceHandling) || other.unpaidBalanceHandling == unpaidBalanceHandling)&&(identical(other.unpaidHandlingNotes, unpaidHandlingNotes) || other.unpaidHandlingNotes == unpaidHandlingNotes)&&(identical(other.unpaidAmount, unpaidAmount) || other.unpaidAmount == unpaidAmount)&&(identical(other.refundConfirmed, refundConfirmed) || other.refundConfirmed == refundConfirmed)&&(identical(other.createdOn, createdOn) || other.createdOn == createdOn)&&(identical(other.createdBy, createdBy) || other.createdBy == createdBy)&&(identical(other.modifiedOn, modifiedOn) || other.modifiedOn == modifiedOn)&&(identical(other.modifiedBy, modifiedBy) || other.modifiedBy == modifiedBy));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,rrn,houseName,houseCode,houseNumber,houseId,tenantName,tenantPhone,tenantEmail,tenantId,propertyName,propertyId,estateName,estateId,vacateDate,reason,flag,status,initiatedBy,initiatedByName,initiatedById,approvedByName,approvalDate,approvalComments,isProcessed,processedDate,processedBy,settlementType,rentOwed,refundableDeposit,totalExpenses,netAmount,settlementDetails,paymentStatus,paymentFlag,totalPaid,balanceRemaining,paymentRrn,paymentHistory,invoiceRrn,invoiceGeneratedDate,unpaidBalanceHandling,unpaidHandlingNotes,unpaidAmount,refundConfirmed,createdOn,createdBy,modifiedOn,modifiedBy]);

@override
String toString() {
  return 'VacateNoticeDetailModel(id: $id, rrn: $rrn, houseName: $houseName, houseCode: $houseCode, houseNumber: $houseNumber, houseId: $houseId, tenantName: $tenantName, tenantPhone: $tenantPhone, tenantEmail: $tenantEmail, tenantId: $tenantId, propertyName: $propertyName, propertyId: $propertyId, estateName: $estateName, estateId: $estateId, vacateDate: $vacateDate, reason: $reason, flag: $flag, status: $status, initiatedBy: $initiatedBy, initiatedByName: $initiatedByName, initiatedById: $initiatedById, approvedByName: $approvedByName, approvalDate: $approvalDate, approvalComments: $approvalComments, isProcessed: $isProcessed, processedDate: $processedDate, processedBy: $processedBy, settlementType: $settlementType, rentOwed: $rentOwed, refundableDeposit: $refundableDeposit, totalExpenses: $totalExpenses, netAmount: $netAmount, settlementDetails: $settlementDetails, paymentStatus: $paymentStatus, paymentFlag: $paymentFlag, totalPaid: $totalPaid, balanceRemaining: $balanceRemaining, paymentRrn: $paymentRrn, paymentHistory: $paymentHistory, invoiceRrn: $invoiceRrn, invoiceGeneratedDate: $invoiceGeneratedDate, unpaidBalanceHandling: $unpaidBalanceHandling, unpaidHandlingNotes: $unpaidHandlingNotes, unpaidAmount: $unpaidAmount, refundConfirmed: $refundConfirmed, createdOn: $createdOn, createdBy: $createdBy, modifiedOn: $modifiedOn, modifiedBy: $modifiedBy)';
}


}

/// @nodoc
abstract mixin class $VacateNoticeDetailModelCopyWith<$Res>  {
  factory $VacateNoticeDetailModelCopyWith(VacateNoticeDetailModel value, $Res Function(VacateNoticeDetailModel) _then) = _$VacateNoticeDetailModelCopyWithImpl;
@useResult
$Res call({
 String? id, String? rrn, String? houseName, String? houseCode, String? houseNumber,@JsonKey(fromJson: parseIntNullable) int? houseId, String? tenantName, String? tenantPhone, String? tenantEmail,@JsonKey(fromJson: parseIntNullable) int? tenantId, String? propertyName,@JsonKey(fromJson: parseIntNullable) int? propertyId, String? estateName,@JsonKey(fromJson: parseIntNullable) int? estateId, String? vacateDate, String? reason, String? flag,@JsonKey(fromJson: parseIntNullable) int? status, String? initiatedBy, String? initiatedByName,@JsonKey(fromJson: parseIntNullable) int? initiatedById, String? approvedByName, String? approvalDate, String? approvalComments, bool isProcessed, String? processedDate, String? processedBy, String? settlementType,@JsonKey(fromJson: parseDouble) double rentOwed,@JsonKey(fromJson: parseDouble) double refundableDeposit,@JsonKey(fromJson: parseDouble) double totalExpenses,@JsonKey(fromJson: parseDouble) double netAmount, String? settlementDetails,@JsonKey(fromJson: parseIntNullable) int? paymentStatus, String? paymentFlag,@JsonKey(fromJson: parseDouble) double totalPaid,@JsonKey(fromJson: parseDouble) double balanceRemaining, String? paymentRrn, String? paymentHistory, String? invoiceRrn, String? invoiceGeneratedDate, String? unpaidBalanceHandling, String? unpaidHandlingNotes,@JsonKey(fromJson: parseDouble) double unpaidAmount, bool refundConfirmed, String? createdOn, String? createdBy, String? modifiedOn, String? modifiedBy
});




}
/// @nodoc
class _$VacateNoticeDetailModelCopyWithImpl<$Res>
    implements $VacateNoticeDetailModelCopyWith<$Res> {
  _$VacateNoticeDetailModelCopyWithImpl(this._self, this._then);

  final VacateNoticeDetailModel _self;
  final $Res Function(VacateNoticeDetailModel) _then;

/// Create a copy of VacateNoticeDetailModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? rrn = freezed,Object? houseName = freezed,Object? houseCode = freezed,Object? houseNumber = freezed,Object? houseId = freezed,Object? tenantName = freezed,Object? tenantPhone = freezed,Object? tenantEmail = freezed,Object? tenantId = freezed,Object? propertyName = freezed,Object? propertyId = freezed,Object? estateName = freezed,Object? estateId = freezed,Object? vacateDate = freezed,Object? reason = freezed,Object? flag = freezed,Object? status = freezed,Object? initiatedBy = freezed,Object? initiatedByName = freezed,Object? initiatedById = freezed,Object? approvedByName = freezed,Object? approvalDate = freezed,Object? approvalComments = freezed,Object? isProcessed = null,Object? processedDate = freezed,Object? processedBy = freezed,Object? settlementType = freezed,Object? rentOwed = null,Object? refundableDeposit = null,Object? totalExpenses = null,Object? netAmount = null,Object? settlementDetails = freezed,Object? paymentStatus = freezed,Object? paymentFlag = freezed,Object? totalPaid = null,Object? balanceRemaining = null,Object? paymentRrn = freezed,Object? paymentHistory = freezed,Object? invoiceRrn = freezed,Object? invoiceGeneratedDate = freezed,Object? unpaidBalanceHandling = freezed,Object? unpaidHandlingNotes = freezed,Object? unpaidAmount = null,Object? refundConfirmed = null,Object? createdOn = freezed,Object? createdBy = freezed,Object? modifiedOn = freezed,Object? modifiedBy = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,rrn: freezed == rrn ? _self.rrn : rrn // ignore: cast_nullable_to_non_nullable
as String?,houseName: freezed == houseName ? _self.houseName : houseName // ignore: cast_nullable_to_non_nullable
as String?,houseCode: freezed == houseCode ? _self.houseCode : houseCode // ignore: cast_nullable_to_non_nullable
as String?,houseNumber: freezed == houseNumber ? _self.houseNumber : houseNumber // ignore: cast_nullable_to_non_nullable
as String?,houseId: freezed == houseId ? _self.houseId : houseId // ignore: cast_nullable_to_non_nullable
as int?,tenantName: freezed == tenantName ? _self.tenantName : tenantName // ignore: cast_nullable_to_non_nullable
as String?,tenantPhone: freezed == tenantPhone ? _self.tenantPhone : tenantPhone // ignore: cast_nullable_to_non_nullable
as String?,tenantEmail: freezed == tenantEmail ? _self.tenantEmail : tenantEmail // ignore: cast_nullable_to_non_nullable
as String?,tenantId: freezed == tenantId ? _self.tenantId : tenantId // ignore: cast_nullable_to_non_nullable
as int?,propertyName: freezed == propertyName ? _self.propertyName : propertyName // ignore: cast_nullable_to_non_nullable
as String?,propertyId: freezed == propertyId ? _self.propertyId : propertyId // ignore: cast_nullable_to_non_nullable
as int?,estateName: freezed == estateName ? _self.estateName : estateName // ignore: cast_nullable_to_non_nullable
as String?,estateId: freezed == estateId ? _self.estateId : estateId // ignore: cast_nullable_to_non_nullable
as int?,vacateDate: freezed == vacateDate ? _self.vacateDate : vacateDate // ignore: cast_nullable_to_non_nullable
as String?,reason: freezed == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String?,flag: freezed == flag ? _self.flag : flag // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as int?,initiatedBy: freezed == initiatedBy ? _self.initiatedBy : initiatedBy // ignore: cast_nullable_to_non_nullable
as String?,initiatedByName: freezed == initiatedByName ? _self.initiatedByName : initiatedByName // ignore: cast_nullable_to_non_nullable
as String?,initiatedById: freezed == initiatedById ? _self.initiatedById : initiatedById // ignore: cast_nullable_to_non_nullable
as int?,approvedByName: freezed == approvedByName ? _self.approvedByName : approvedByName // ignore: cast_nullable_to_non_nullable
as String?,approvalDate: freezed == approvalDate ? _self.approvalDate : approvalDate // ignore: cast_nullable_to_non_nullable
as String?,approvalComments: freezed == approvalComments ? _self.approvalComments : approvalComments // ignore: cast_nullable_to_non_nullable
as String?,isProcessed: null == isProcessed ? _self.isProcessed : isProcessed // ignore: cast_nullable_to_non_nullable
as bool,processedDate: freezed == processedDate ? _self.processedDate : processedDate // ignore: cast_nullable_to_non_nullable
as String?,processedBy: freezed == processedBy ? _self.processedBy : processedBy // ignore: cast_nullable_to_non_nullable
as String?,settlementType: freezed == settlementType ? _self.settlementType : settlementType // ignore: cast_nullable_to_non_nullable
as String?,rentOwed: null == rentOwed ? _self.rentOwed : rentOwed // ignore: cast_nullable_to_non_nullable
as double,refundableDeposit: null == refundableDeposit ? _self.refundableDeposit : refundableDeposit // ignore: cast_nullable_to_non_nullable
as double,totalExpenses: null == totalExpenses ? _self.totalExpenses : totalExpenses // ignore: cast_nullable_to_non_nullable
as double,netAmount: null == netAmount ? _self.netAmount : netAmount // ignore: cast_nullable_to_non_nullable
as double,settlementDetails: freezed == settlementDetails ? _self.settlementDetails : settlementDetails // ignore: cast_nullable_to_non_nullable
as String?,paymentStatus: freezed == paymentStatus ? _self.paymentStatus : paymentStatus // ignore: cast_nullable_to_non_nullable
as int?,paymentFlag: freezed == paymentFlag ? _self.paymentFlag : paymentFlag // ignore: cast_nullable_to_non_nullable
as String?,totalPaid: null == totalPaid ? _self.totalPaid : totalPaid // ignore: cast_nullable_to_non_nullable
as double,balanceRemaining: null == balanceRemaining ? _self.balanceRemaining : balanceRemaining // ignore: cast_nullable_to_non_nullable
as double,paymentRrn: freezed == paymentRrn ? _self.paymentRrn : paymentRrn // ignore: cast_nullable_to_non_nullable
as String?,paymentHistory: freezed == paymentHistory ? _self.paymentHistory : paymentHistory // ignore: cast_nullable_to_non_nullable
as String?,invoiceRrn: freezed == invoiceRrn ? _self.invoiceRrn : invoiceRrn // ignore: cast_nullable_to_non_nullable
as String?,invoiceGeneratedDate: freezed == invoiceGeneratedDate ? _self.invoiceGeneratedDate : invoiceGeneratedDate // ignore: cast_nullable_to_non_nullable
as String?,unpaidBalanceHandling: freezed == unpaidBalanceHandling ? _self.unpaidBalanceHandling : unpaidBalanceHandling // ignore: cast_nullable_to_non_nullable
as String?,unpaidHandlingNotes: freezed == unpaidHandlingNotes ? _self.unpaidHandlingNotes : unpaidHandlingNotes // ignore: cast_nullable_to_non_nullable
as String?,unpaidAmount: null == unpaidAmount ? _self.unpaidAmount : unpaidAmount // ignore: cast_nullable_to_non_nullable
as double,refundConfirmed: null == refundConfirmed ? _self.refundConfirmed : refundConfirmed // ignore: cast_nullable_to_non_nullable
as bool,createdOn: freezed == createdOn ? _self.createdOn : createdOn // ignore: cast_nullable_to_non_nullable
as String?,createdBy: freezed == createdBy ? _self.createdBy : createdBy // ignore: cast_nullable_to_non_nullable
as String?,modifiedOn: freezed == modifiedOn ? _self.modifiedOn : modifiedOn // ignore: cast_nullable_to_non_nullable
as String?,modifiedBy: freezed == modifiedBy ? _self.modifiedBy : modifiedBy // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [VacateNoticeDetailModel].
extension VacateNoticeDetailModelPatterns on VacateNoticeDetailModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VacateNoticeDetailModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VacateNoticeDetailModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VacateNoticeDetailModel value)  $default,){
final _that = this;
switch (_that) {
case _VacateNoticeDetailModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VacateNoticeDetailModel value)?  $default,){
final _that = this;
switch (_that) {
case _VacateNoticeDetailModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id,  String? rrn,  String? houseName,  String? houseCode,  String? houseNumber, @JsonKey(fromJson: parseIntNullable)  int? houseId,  String? tenantName,  String? tenantPhone,  String? tenantEmail, @JsonKey(fromJson: parseIntNullable)  int? tenantId,  String? propertyName, @JsonKey(fromJson: parseIntNullable)  int? propertyId,  String? estateName, @JsonKey(fromJson: parseIntNullable)  int? estateId,  String? vacateDate,  String? reason,  String? flag, @JsonKey(fromJson: parseIntNullable)  int? status,  String? initiatedBy,  String? initiatedByName, @JsonKey(fromJson: parseIntNullable)  int? initiatedById,  String? approvedByName,  String? approvalDate,  String? approvalComments,  bool isProcessed,  String? processedDate,  String? processedBy,  String? settlementType, @JsonKey(fromJson: parseDouble)  double rentOwed, @JsonKey(fromJson: parseDouble)  double refundableDeposit, @JsonKey(fromJson: parseDouble)  double totalExpenses, @JsonKey(fromJson: parseDouble)  double netAmount,  String? settlementDetails, @JsonKey(fromJson: parseIntNullable)  int? paymentStatus,  String? paymentFlag, @JsonKey(fromJson: parseDouble)  double totalPaid, @JsonKey(fromJson: parseDouble)  double balanceRemaining,  String? paymentRrn,  String? paymentHistory,  String? invoiceRrn,  String? invoiceGeneratedDate,  String? unpaidBalanceHandling,  String? unpaidHandlingNotes, @JsonKey(fromJson: parseDouble)  double unpaidAmount,  bool refundConfirmed,  String? createdOn,  String? createdBy,  String? modifiedOn,  String? modifiedBy)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VacateNoticeDetailModel() when $default != null:
return $default(_that.id,_that.rrn,_that.houseName,_that.houseCode,_that.houseNumber,_that.houseId,_that.tenantName,_that.tenantPhone,_that.tenantEmail,_that.tenantId,_that.propertyName,_that.propertyId,_that.estateName,_that.estateId,_that.vacateDate,_that.reason,_that.flag,_that.status,_that.initiatedBy,_that.initiatedByName,_that.initiatedById,_that.approvedByName,_that.approvalDate,_that.approvalComments,_that.isProcessed,_that.processedDate,_that.processedBy,_that.settlementType,_that.rentOwed,_that.refundableDeposit,_that.totalExpenses,_that.netAmount,_that.settlementDetails,_that.paymentStatus,_that.paymentFlag,_that.totalPaid,_that.balanceRemaining,_that.paymentRrn,_that.paymentHistory,_that.invoiceRrn,_that.invoiceGeneratedDate,_that.unpaidBalanceHandling,_that.unpaidHandlingNotes,_that.unpaidAmount,_that.refundConfirmed,_that.createdOn,_that.createdBy,_that.modifiedOn,_that.modifiedBy);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id,  String? rrn,  String? houseName,  String? houseCode,  String? houseNumber, @JsonKey(fromJson: parseIntNullable)  int? houseId,  String? tenantName,  String? tenantPhone,  String? tenantEmail, @JsonKey(fromJson: parseIntNullable)  int? tenantId,  String? propertyName, @JsonKey(fromJson: parseIntNullable)  int? propertyId,  String? estateName, @JsonKey(fromJson: parseIntNullable)  int? estateId,  String? vacateDate,  String? reason,  String? flag, @JsonKey(fromJson: parseIntNullable)  int? status,  String? initiatedBy,  String? initiatedByName, @JsonKey(fromJson: parseIntNullable)  int? initiatedById,  String? approvedByName,  String? approvalDate,  String? approvalComments,  bool isProcessed,  String? processedDate,  String? processedBy,  String? settlementType, @JsonKey(fromJson: parseDouble)  double rentOwed, @JsonKey(fromJson: parseDouble)  double refundableDeposit, @JsonKey(fromJson: parseDouble)  double totalExpenses, @JsonKey(fromJson: parseDouble)  double netAmount,  String? settlementDetails, @JsonKey(fromJson: parseIntNullable)  int? paymentStatus,  String? paymentFlag, @JsonKey(fromJson: parseDouble)  double totalPaid, @JsonKey(fromJson: parseDouble)  double balanceRemaining,  String? paymentRrn,  String? paymentHistory,  String? invoiceRrn,  String? invoiceGeneratedDate,  String? unpaidBalanceHandling,  String? unpaidHandlingNotes, @JsonKey(fromJson: parseDouble)  double unpaidAmount,  bool refundConfirmed,  String? createdOn,  String? createdBy,  String? modifiedOn,  String? modifiedBy)  $default,) {final _that = this;
switch (_that) {
case _VacateNoticeDetailModel():
return $default(_that.id,_that.rrn,_that.houseName,_that.houseCode,_that.houseNumber,_that.houseId,_that.tenantName,_that.tenantPhone,_that.tenantEmail,_that.tenantId,_that.propertyName,_that.propertyId,_that.estateName,_that.estateId,_that.vacateDate,_that.reason,_that.flag,_that.status,_that.initiatedBy,_that.initiatedByName,_that.initiatedById,_that.approvedByName,_that.approvalDate,_that.approvalComments,_that.isProcessed,_that.processedDate,_that.processedBy,_that.settlementType,_that.rentOwed,_that.refundableDeposit,_that.totalExpenses,_that.netAmount,_that.settlementDetails,_that.paymentStatus,_that.paymentFlag,_that.totalPaid,_that.balanceRemaining,_that.paymentRrn,_that.paymentHistory,_that.invoiceRrn,_that.invoiceGeneratedDate,_that.unpaidBalanceHandling,_that.unpaidHandlingNotes,_that.unpaidAmount,_that.refundConfirmed,_that.createdOn,_that.createdBy,_that.modifiedOn,_that.modifiedBy);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id,  String? rrn,  String? houseName,  String? houseCode,  String? houseNumber, @JsonKey(fromJson: parseIntNullable)  int? houseId,  String? tenantName,  String? tenantPhone,  String? tenantEmail, @JsonKey(fromJson: parseIntNullable)  int? tenantId,  String? propertyName, @JsonKey(fromJson: parseIntNullable)  int? propertyId,  String? estateName, @JsonKey(fromJson: parseIntNullable)  int? estateId,  String? vacateDate,  String? reason,  String? flag, @JsonKey(fromJson: parseIntNullable)  int? status,  String? initiatedBy,  String? initiatedByName, @JsonKey(fromJson: parseIntNullable)  int? initiatedById,  String? approvedByName,  String? approvalDate,  String? approvalComments,  bool isProcessed,  String? processedDate,  String? processedBy,  String? settlementType, @JsonKey(fromJson: parseDouble)  double rentOwed, @JsonKey(fromJson: parseDouble)  double refundableDeposit, @JsonKey(fromJson: parseDouble)  double totalExpenses, @JsonKey(fromJson: parseDouble)  double netAmount,  String? settlementDetails, @JsonKey(fromJson: parseIntNullable)  int? paymentStatus,  String? paymentFlag, @JsonKey(fromJson: parseDouble)  double totalPaid, @JsonKey(fromJson: parseDouble)  double balanceRemaining,  String? paymentRrn,  String? paymentHistory,  String? invoiceRrn,  String? invoiceGeneratedDate,  String? unpaidBalanceHandling,  String? unpaidHandlingNotes, @JsonKey(fromJson: parseDouble)  double unpaidAmount,  bool refundConfirmed,  String? createdOn,  String? createdBy,  String? modifiedOn,  String? modifiedBy)?  $default,) {final _that = this;
switch (_that) {
case _VacateNoticeDetailModel() when $default != null:
return $default(_that.id,_that.rrn,_that.houseName,_that.houseCode,_that.houseNumber,_that.houseId,_that.tenantName,_that.tenantPhone,_that.tenantEmail,_that.tenantId,_that.propertyName,_that.propertyId,_that.estateName,_that.estateId,_that.vacateDate,_that.reason,_that.flag,_that.status,_that.initiatedBy,_that.initiatedByName,_that.initiatedById,_that.approvedByName,_that.approvalDate,_that.approvalComments,_that.isProcessed,_that.processedDate,_that.processedBy,_that.settlementType,_that.rentOwed,_that.refundableDeposit,_that.totalExpenses,_that.netAmount,_that.settlementDetails,_that.paymentStatus,_that.paymentFlag,_that.totalPaid,_that.balanceRemaining,_that.paymentRrn,_that.paymentHistory,_that.invoiceRrn,_that.invoiceGeneratedDate,_that.unpaidBalanceHandling,_that.unpaidHandlingNotes,_that.unpaidAmount,_that.refundConfirmed,_that.createdOn,_that.createdBy,_that.modifiedOn,_that.modifiedBy);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _VacateNoticeDetailModel extends VacateNoticeDetailModel {
  const _VacateNoticeDetailModel({this.id, this.rrn, this.houseName, this.houseCode, this.houseNumber, @JsonKey(fromJson: parseIntNullable) this.houseId, this.tenantName, this.tenantPhone, this.tenantEmail, @JsonKey(fromJson: parseIntNullable) this.tenantId, this.propertyName, @JsonKey(fromJson: parseIntNullable) this.propertyId, this.estateName, @JsonKey(fromJson: parseIntNullable) this.estateId, this.vacateDate, this.reason, this.flag, @JsonKey(fromJson: parseIntNullable) this.status, this.initiatedBy, this.initiatedByName, @JsonKey(fromJson: parseIntNullable) this.initiatedById, this.approvedByName, this.approvalDate, this.approvalComments, this.isProcessed = false, this.processedDate, this.processedBy, this.settlementType, @JsonKey(fromJson: parseDouble) this.rentOwed = 0, @JsonKey(fromJson: parseDouble) this.refundableDeposit = 0, @JsonKey(fromJson: parseDouble) this.totalExpenses = 0, @JsonKey(fromJson: parseDouble) this.netAmount = 0, this.settlementDetails, @JsonKey(fromJson: parseIntNullable) this.paymentStatus, this.paymentFlag, @JsonKey(fromJson: parseDouble) this.totalPaid = 0, @JsonKey(fromJson: parseDouble) this.balanceRemaining = 0, this.paymentRrn, this.paymentHistory, this.invoiceRrn, this.invoiceGeneratedDate, this.unpaidBalanceHandling, this.unpaidHandlingNotes, @JsonKey(fromJson: parseDouble) this.unpaidAmount = 0, this.refundConfirmed = false, this.createdOn, this.createdBy, this.modifiedOn, this.modifiedBy}): super._();
  factory _VacateNoticeDetailModel.fromJson(Map<String, dynamic> json) => _$VacateNoticeDetailModelFromJson(json);

// Core
@override final  String? id;
@override final  String? rrn;
// House info
@override final  String? houseName;
@override final  String? houseCode;
@override final  String? houseNumber;
@override@JsonKey(fromJson: parseIntNullable) final  int? houseId;
// Tenant info
@override final  String? tenantName;
@override final  String? tenantPhone;
@override final  String? tenantEmail;
@override@JsonKey(fromJson: parseIntNullable) final  int? tenantId;
// Property/Estate
@override final  String? propertyName;
@override@JsonKey(fromJson: parseIntNullable) final  int? propertyId;
@override final  String? estateName;
@override@JsonKey(fromJson: parseIntNullable) final  int? estateId;
// Notice info
@override final  String? vacateDate;
@override final  String? reason;
@override final  String? flag;
@override@JsonKey(fromJson: parseIntNullable) final  int? status;
@override final  String? initiatedBy;
@override final  String? initiatedByName;
@override@JsonKey(fromJson: parseIntNullable) final  int? initiatedById;
// Approval
@override final  String? approvedByName;
@override final  String? approvalDate;
@override final  String? approvalComments;
// Processing
@override@JsonKey() final  bool isProcessed;
@override final  String? processedDate;
@override final  String? processedBy;
// Settlement
@override final  String? settlementType;
@override@JsonKey(fromJson: parseDouble) final  double rentOwed;
@override@JsonKey(fromJson: parseDouble) final  double refundableDeposit;
@override@JsonKey(fromJson: parseDouble) final  double totalExpenses;
@override@JsonKey(fromJson: parseDouble) final  double netAmount;
@override final  String? settlementDetails;
// Payment
@override@JsonKey(fromJson: parseIntNullable) final  int? paymentStatus;
@override final  String? paymentFlag;
@override@JsonKey(fromJson: parseDouble) final  double totalPaid;
@override@JsonKey(fromJson: parseDouble) final  double balanceRemaining;
@override final  String? paymentRrn;
@override final  String? paymentHistory;
@override final  String? invoiceRrn;
@override final  String? invoiceGeneratedDate;
// Unpaid balance
@override final  String? unpaidBalanceHandling;
@override final  String? unpaidHandlingNotes;
@override@JsonKey(fromJson: parseDouble) final  double unpaidAmount;
// Refund
@override@JsonKey() final  bool refundConfirmed;
// Metadata
@override final  String? createdOn;
@override final  String? createdBy;
@override final  String? modifiedOn;
@override final  String? modifiedBy;

/// Create a copy of VacateNoticeDetailModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VacateNoticeDetailModelCopyWith<_VacateNoticeDetailModel> get copyWith => __$VacateNoticeDetailModelCopyWithImpl<_VacateNoticeDetailModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VacateNoticeDetailModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VacateNoticeDetailModel&&(identical(other.id, id) || other.id == id)&&(identical(other.rrn, rrn) || other.rrn == rrn)&&(identical(other.houseName, houseName) || other.houseName == houseName)&&(identical(other.houseCode, houseCode) || other.houseCode == houseCode)&&(identical(other.houseNumber, houseNumber) || other.houseNumber == houseNumber)&&(identical(other.houseId, houseId) || other.houseId == houseId)&&(identical(other.tenantName, tenantName) || other.tenantName == tenantName)&&(identical(other.tenantPhone, tenantPhone) || other.tenantPhone == tenantPhone)&&(identical(other.tenantEmail, tenantEmail) || other.tenantEmail == tenantEmail)&&(identical(other.tenantId, tenantId) || other.tenantId == tenantId)&&(identical(other.propertyName, propertyName) || other.propertyName == propertyName)&&(identical(other.propertyId, propertyId) || other.propertyId == propertyId)&&(identical(other.estateName, estateName) || other.estateName == estateName)&&(identical(other.estateId, estateId) || other.estateId == estateId)&&(identical(other.vacateDate, vacateDate) || other.vacateDate == vacateDate)&&(identical(other.reason, reason) || other.reason == reason)&&(identical(other.flag, flag) || other.flag == flag)&&(identical(other.status, status) || other.status == status)&&(identical(other.initiatedBy, initiatedBy) || other.initiatedBy == initiatedBy)&&(identical(other.initiatedByName, initiatedByName) || other.initiatedByName == initiatedByName)&&(identical(other.initiatedById, initiatedById) || other.initiatedById == initiatedById)&&(identical(other.approvedByName, approvedByName) || other.approvedByName == approvedByName)&&(identical(other.approvalDate, approvalDate) || other.approvalDate == approvalDate)&&(identical(other.approvalComments, approvalComments) || other.approvalComments == approvalComments)&&(identical(other.isProcessed, isProcessed) || other.isProcessed == isProcessed)&&(identical(other.processedDate, processedDate) || other.processedDate == processedDate)&&(identical(other.processedBy, processedBy) || other.processedBy == processedBy)&&(identical(other.settlementType, settlementType) || other.settlementType == settlementType)&&(identical(other.rentOwed, rentOwed) || other.rentOwed == rentOwed)&&(identical(other.refundableDeposit, refundableDeposit) || other.refundableDeposit == refundableDeposit)&&(identical(other.totalExpenses, totalExpenses) || other.totalExpenses == totalExpenses)&&(identical(other.netAmount, netAmount) || other.netAmount == netAmount)&&(identical(other.settlementDetails, settlementDetails) || other.settlementDetails == settlementDetails)&&(identical(other.paymentStatus, paymentStatus) || other.paymentStatus == paymentStatus)&&(identical(other.paymentFlag, paymentFlag) || other.paymentFlag == paymentFlag)&&(identical(other.totalPaid, totalPaid) || other.totalPaid == totalPaid)&&(identical(other.balanceRemaining, balanceRemaining) || other.balanceRemaining == balanceRemaining)&&(identical(other.paymentRrn, paymentRrn) || other.paymentRrn == paymentRrn)&&(identical(other.paymentHistory, paymentHistory) || other.paymentHistory == paymentHistory)&&(identical(other.invoiceRrn, invoiceRrn) || other.invoiceRrn == invoiceRrn)&&(identical(other.invoiceGeneratedDate, invoiceGeneratedDate) || other.invoiceGeneratedDate == invoiceGeneratedDate)&&(identical(other.unpaidBalanceHandling, unpaidBalanceHandling) || other.unpaidBalanceHandling == unpaidBalanceHandling)&&(identical(other.unpaidHandlingNotes, unpaidHandlingNotes) || other.unpaidHandlingNotes == unpaidHandlingNotes)&&(identical(other.unpaidAmount, unpaidAmount) || other.unpaidAmount == unpaidAmount)&&(identical(other.refundConfirmed, refundConfirmed) || other.refundConfirmed == refundConfirmed)&&(identical(other.createdOn, createdOn) || other.createdOn == createdOn)&&(identical(other.createdBy, createdBy) || other.createdBy == createdBy)&&(identical(other.modifiedOn, modifiedOn) || other.modifiedOn == modifiedOn)&&(identical(other.modifiedBy, modifiedBy) || other.modifiedBy == modifiedBy));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,rrn,houseName,houseCode,houseNumber,houseId,tenantName,tenantPhone,tenantEmail,tenantId,propertyName,propertyId,estateName,estateId,vacateDate,reason,flag,status,initiatedBy,initiatedByName,initiatedById,approvedByName,approvalDate,approvalComments,isProcessed,processedDate,processedBy,settlementType,rentOwed,refundableDeposit,totalExpenses,netAmount,settlementDetails,paymentStatus,paymentFlag,totalPaid,balanceRemaining,paymentRrn,paymentHistory,invoiceRrn,invoiceGeneratedDate,unpaidBalanceHandling,unpaidHandlingNotes,unpaidAmount,refundConfirmed,createdOn,createdBy,modifiedOn,modifiedBy]);

@override
String toString() {
  return 'VacateNoticeDetailModel(id: $id, rrn: $rrn, houseName: $houseName, houseCode: $houseCode, houseNumber: $houseNumber, houseId: $houseId, tenantName: $tenantName, tenantPhone: $tenantPhone, tenantEmail: $tenantEmail, tenantId: $tenantId, propertyName: $propertyName, propertyId: $propertyId, estateName: $estateName, estateId: $estateId, vacateDate: $vacateDate, reason: $reason, flag: $flag, status: $status, initiatedBy: $initiatedBy, initiatedByName: $initiatedByName, initiatedById: $initiatedById, approvedByName: $approvedByName, approvalDate: $approvalDate, approvalComments: $approvalComments, isProcessed: $isProcessed, processedDate: $processedDate, processedBy: $processedBy, settlementType: $settlementType, rentOwed: $rentOwed, refundableDeposit: $refundableDeposit, totalExpenses: $totalExpenses, netAmount: $netAmount, settlementDetails: $settlementDetails, paymentStatus: $paymentStatus, paymentFlag: $paymentFlag, totalPaid: $totalPaid, balanceRemaining: $balanceRemaining, paymentRrn: $paymentRrn, paymentHistory: $paymentHistory, invoiceRrn: $invoiceRrn, invoiceGeneratedDate: $invoiceGeneratedDate, unpaidBalanceHandling: $unpaidBalanceHandling, unpaidHandlingNotes: $unpaidHandlingNotes, unpaidAmount: $unpaidAmount, refundConfirmed: $refundConfirmed, createdOn: $createdOn, createdBy: $createdBy, modifiedOn: $modifiedOn, modifiedBy: $modifiedBy)';
}


}

/// @nodoc
abstract mixin class _$VacateNoticeDetailModelCopyWith<$Res> implements $VacateNoticeDetailModelCopyWith<$Res> {
  factory _$VacateNoticeDetailModelCopyWith(_VacateNoticeDetailModel value, $Res Function(_VacateNoticeDetailModel) _then) = __$VacateNoticeDetailModelCopyWithImpl;
@override @useResult
$Res call({
 String? id, String? rrn, String? houseName, String? houseCode, String? houseNumber,@JsonKey(fromJson: parseIntNullable) int? houseId, String? tenantName, String? tenantPhone, String? tenantEmail,@JsonKey(fromJson: parseIntNullable) int? tenantId, String? propertyName,@JsonKey(fromJson: parseIntNullable) int? propertyId, String? estateName,@JsonKey(fromJson: parseIntNullable) int? estateId, String? vacateDate, String? reason, String? flag,@JsonKey(fromJson: parseIntNullable) int? status, String? initiatedBy, String? initiatedByName,@JsonKey(fromJson: parseIntNullable) int? initiatedById, String? approvedByName, String? approvalDate, String? approvalComments, bool isProcessed, String? processedDate, String? processedBy, String? settlementType,@JsonKey(fromJson: parseDouble) double rentOwed,@JsonKey(fromJson: parseDouble) double refundableDeposit,@JsonKey(fromJson: parseDouble) double totalExpenses,@JsonKey(fromJson: parseDouble) double netAmount, String? settlementDetails,@JsonKey(fromJson: parseIntNullable) int? paymentStatus, String? paymentFlag,@JsonKey(fromJson: parseDouble) double totalPaid,@JsonKey(fromJson: parseDouble) double balanceRemaining, String? paymentRrn, String? paymentHistory, String? invoiceRrn, String? invoiceGeneratedDate, String? unpaidBalanceHandling, String? unpaidHandlingNotes,@JsonKey(fromJson: parseDouble) double unpaidAmount, bool refundConfirmed, String? createdOn, String? createdBy, String? modifiedOn, String? modifiedBy
});




}
/// @nodoc
class __$VacateNoticeDetailModelCopyWithImpl<$Res>
    implements _$VacateNoticeDetailModelCopyWith<$Res> {
  __$VacateNoticeDetailModelCopyWithImpl(this._self, this._then);

  final _VacateNoticeDetailModel _self;
  final $Res Function(_VacateNoticeDetailModel) _then;

/// Create a copy of VacateNoticeDetailModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? rrn = freezed,Object? houseName = freezed,Object? houseCode = freezed,Object? houseNumber = freezed,Object? houseId = freezed,Object? tenantName = freezed,Object? tenantPhone = freezed,Object? tenantEmail = freezed,Object? tenantId = freezed,Object? propertyName = freezed,Object? propertyId = freezed,Object? estateName = freezed,Object? estateId = freezed,Object? vacateDate = freezed,Object? reason = freezed,Object? flag = freezed,Object? status = freezed,Object? initiatedBy = freezed,Object? initiatedByName = freezed,Object? initiatedById = freezed,Object? approvedByName = freezed,Object? approvalDate = freezed,Object? approvalComments = freezed,Object? isProcessed = null,Object? processedDate = freezed,Object? processedBy = freezed,Object? settlementType = freezed,Object? rentOwed = null,Object? refundableDeposit = null,Object? totalExpenses = null,Object? netAmount = null,Object? settlementDetails = freezed,Object? paymentStatus = freezed,Object? paymentFlag = freezed,Object? totalPaid = null,Object? balanceRemaining = null,Object? paymentRrn = freezed,Object? paymentHistory = freezed,Object? invoiceRrn = freezed,Object? invoiceGeneratedDate = freezed,Object? unpaidBalanceHandling = freezed,Object? unpaidHandlingNotes = freezed,Object? unpaidAmount = null,Object? refundConfirmed = null,Object? createdOn = freezed,Object? createdBy = freezed,Object? modifiedOn = freezed,Object? modifiedBy = freezed,}) {
  return _then(_VacateNoticeDetailModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,rrn: freezed == rrn ? _self.rrn : rrn // ignore: cast_nullable_to_non_nullable
as String?,houseName: freezed == houseName ? _self.houseName : houseName // ignore: cast_nullable_to_non_nullable
as String?,houseCode: freezed == houseCode ? _self.houseCode : houseCode // ignore: cast_nullable_to_non_nullable
as String?,houseNumber: freezed == houseNumber ? _self.houseNumber : houseNumber // ignore: cast_nullable_to_non_nullable
as String?,houseId: freezed == houseId ? _self.houseId : houseId // ignore: cast_nullable_to_non_nullable
as int?,tenantName: freezed == tenantName ? _self.tenantName : tenantName // ignore: cast_nullable_to_non_nullable
as String?,tenantPhone: freezed == tenantPhone ? _self.tenantPhone : tenantPhone // ignore: cast_nullable_to_non_nullable
as String?,tenantEmail: freezed == tenantEmail ? _self.tenantEmail : tenantEmail // ignore: cast_nullable_to_non_nullable
as String?,tenantId: freezed == tenantId ? _self.tenantId : tenantId // ignore: cast_nullable_to_non_nullable
as int?,propertyName: freezed == propertyName ? _self.propertyName : propertyName // ignore: cast_nullable_to_non_nullable
as String?,propertyId: freezed == propertyId ? _self.propertyId : propertyId // ignore: cast_nullable_to_non_nullable
as int?,estateName: freezed == estateName ? _self.estateName : estateName // ignore: cast_nullable_to_non_nullable
as String?,estateId: freezed == estateId ? _self.estateId : estateId // ignore: cast_nullable_to_non_nullable
as int?,vacateDate: freezed == vacateDate ? _self.vacateDate : vacateDate // ignore: cast_nullable_to_non_nullable
as String?,reason: freezed == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String?,flag: freezed == flag ? _self.flag : flag // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as int?,initiatedBy: freezed == initiatedBy ? _self.initiatedBy : initiatedBy // ignore: cast_nullable_to_non_nullable
as String?,initiatedByName: freezed == initiatedByName ? _self.initiatedByName : initiatedByName // ignore: cast_nullable_to_non_nullable
as String?,initiatedById: freezed == initiatedById ? _self.initiatedById : initiatedById // ignore: cast_nullable_to_non_nullable
as int?,approvedByName: freezed == approvedByName ? _self.approvedByName : approvedByName // ignore: cast_nullable_to_non_nullable
as String?,approvalDate: freezed == approvalDate ? _self.approvalDate : approvalDate // ignore: cast_nullable_to_non_nullable
as String?,approvalComments: freezed == approvalComments ? _self.approvalComments : approvalComments // ignore: cast_nullable_to_non_nullable
as String?,isProcessed: null == isProcessed ? _self.isProcessed : isProcessed // ignore: cast_nullable_to_non_nullable
as bool,processedDate: freezed == processedDate ? _self.processedDate : processedDate // ignore: cast_nullable_to_non_nullable
as String?,processedBy: freezed == processedBy ? _self.processedBy : processedBy // ignore: cast_nullable_to_non_nullable
as String?,settlementType: freezed == settlementType ? _self.settlementType : settlementType // ignore: cast_nullable_to_non_nullable
as String?,rentOwed: null == rentOwed ? _self.rentOwed : rentOwed // ignore: cast_nullable_to_non_nullable
as double,refundableDeposit: null == refundableDeposit ? _self.refundableDeposit : refundableDeposit // ignore: cast_nullable_to_non_nullable
as double,totalExpenses: null == totalExpenses ? _self.totalExpenses : totalExpenses // ignore: cast_nullable_to_non_nullable
as double,netAmount: null == netAmount ? _self.netAmount : netAmount // ignore: cast_nullable_to_non_nullable
as double,settlementDetails: freezed == settlementDetails ? _self.settlementDetails : settlementDetails // ignore: cast_nullable_to_non_nullable
as String?,paymentStatus: freezed == paymentStatus ? _self.paymentStatus : paymentStatus // ignore: cast_nullable_to_non_nullable
as int?,paymentFlag: freezed == paymentFlag ? _self.paymentFlag : paymentFlag // ignore: cast_nullable_to_non_nullable
as String?,totalPaid: null == totalPaid ? _self.totalPaid : totalPaid // ignore: cast_nullable_to_non_nullable
as double,balanceRemaining: null == balanceRemaining ? _self.balanceRemaining : balanceRemaining // ignore: cast_nullable_to_non_nullable
as double,paymentRrn: freezed == paymentRrn ? _self.paymentRrn : paymentRrn // ignore: cast_nullable_to_non_nullable
as String?,paymentHistory: freezed == paymentHistory ? _self.paymentHistory : paymentHistory // ignore: cast_nullable_to_non_nullable
as String?,invoiceRrn: freezed == invoiceRrn ? _self.invoiceRrn : invoiceRrn // ignore: cast_nullable_to_non_nullable
as String?,invoiceGeneratedDate: freezed == invoiceGeneratedDate ? _self.invoiceGeneratedDate : invoiceGeneratedDate // ignore: cast_nullable_to_non_nullable
as String?,unpaidBalanceHandling: freezed == unpaidBalanceHandling ? _self.unpaidBalanceHandling : unpaidBalanceHandling // ignore: cast_nullable_to_non_nullable
as String?,unpaidHandlingNotes: freezed == unpaidHandlingNotes ? _self.unpaidHandlingNotes : unpaidHandlingNotes // ignore: cast_nullable_to_non_nullable
as String?,unpaidAmount: null == unpaidAmount ? _self.unpaidAmount : unpaidAmount // ignore: cast_nullable_to_non_nullable
as double,refundConfirmed: null == refundConfirmed ? _self.refundConfirmed : refundConfirmed // ignore: cast_nullable_to_non_nullable
as bool,createdOn: freezed == createdOn ? _self.createdOn : createdOn // ignore: cast_nullable_to_non_nullable
as String?,createdBy: freezed == createdBy ? _self.createdBy : createdBy // ignore: cast_nullable_to_non_nullable
as String?,modifiedOn: freezed == modifiedOn ? _self.modifiedOn : modifiedOn // ignore: cast_nullable_to_non_nullable
as String?,modifiedBy: freezed == modifiedBy ? _self.modifiedBy : modifiedBy // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
