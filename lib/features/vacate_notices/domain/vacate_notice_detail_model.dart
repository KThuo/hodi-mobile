import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../core/utils/json_parsers.dart';

part 'vacate_notice_detail_model.freezed.dart';
part 'vacate_notice_detail_model.g.dart';

@freezed
abstract class VacateNoticeDetailModel with _$VacateNoticeDetailModel {
  const VacateNoticeDetailModel._();
  const factory VacateNoticeDetailModel({
    // Core
    String? id,
    String? rrn,

    // House info
    String? houseName,
    String? houseCode,
    String? houseNumber,
    @JsonKey(fromJson: parseIntNullable) int? houseId,

    // Tenant info
    String? tenantName,
    String? tenantPhone,
    String? tenantEmail,
    @JsonKey(fromJson: parseIntNullable) int? tenantId,

    // Property/Estate
    String? propertyName,
    @JsonKey(fromJson: parseIntNullable) int? propertyId,
    String? estateName,
    @JsonKey(fromJson: parseIntNullable) int? estateId,

    // Notice info
    String? vacateDate,
    String? reason,
    String? flag,
    @JsonKey(fromJson: parseIntNullable) int? status,
    String? initiatedBy,
    String? initiatedByName,
    @JsonKey(fromJson: parseIntNullable) int? initiatedById,

    // Approval
    String? approvedByName,
    String? approvalDate,
    String? approvalComments,

    // Processing
    @Default(false) bool isProcessed,
    String? processedDate,
    String? processedBy,

    // Settlement
    String? settlementType,
    @JsonKey(fromJson: parseDouble) @Default(0) double rentOwed,
    @JsonKey(fromJson: parseDouble) @Default(0) double refundableDeposit,
    @JsonKey(fromJson: parseDouble) @Default(0) double totalExpenses,
    @JsonKey(fromJson: parseDouble) @Default(0) double netAmount,
    String? settlementDetails,

    // Payment
    @JsonKey(fromJson: parseIntNullable) int? paymentStatus,
    String? paymentFlag,
    @JsonKey(fromJson: parseDouble) @Default(0) double totalPaid,
    @JsonKey(fromJson: parseDouble) @Default(0) double balanceRemaining,
    String? paymentRrn,
    String? paymentHistory,
    String? invoiceRrn,
    String? invoiceGeneratedDate,

    // Unpaid balance
    String? unpaidBalanceHandling,
    String? unpaidHandlingNotes,
    @JsonKey(fromJson: parseDouble) @Default(0) double unpaidAmount,

    // Refund
    @Default(false) bool refundConfirmed,

    // Metadata
    String? createdOn,
    String? createdBy,
    String? modifiedOn,
    String? modifiedBy,
  }) = _VacateNoticeDetailModel;

  factory VacateNoticeDetailModel.fromJson(Map<String, dynamic> json) =>
      _$VacateNoticeDetailModelFromJson(json);

  bool get isPending => flag == 'PENDING';
  bool get isApproved => flag == 'APPROVED';
  bool get isRejected => flag == 'REJECTED';
  bool get isCancelled => flag == 'CANCELLED';
  bool get hasSettlement => settlementType != null && settlementType!.isNotEmpty;
  bool get isRefund => settlementType == 'REFUND';
  bool get isInvoice => settlementType == 'INVOICE';
  bool get isBalanced => settlementType == 'BALANCED';
}
