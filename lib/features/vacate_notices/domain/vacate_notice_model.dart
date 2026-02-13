import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../core/utils/json_parsers.dart';

part 'vacate_notice_model.freezed.dart';
part 'vacate_notice_model.g.dart';

@freezed
abstract class VacateNoticeModel with _$VacateNoticeModel {
  const VacateNoticeModel._();
  const factory VacateNoticeModel({
    String? id,
    String? rrn,
    String? houseName,
    String? houseCode,
    String? houseNumber,
    String? tenantName,
    String? tenantPhone,
    String? tenantEmail,
    String? propertyName,
    @JsonKey(fromJson: parseIntNullable) int? propertyId,
    String? estateName,
    @JsonKey(fromJson: parseIntNullable) int? estateId,
    String? vacateDate,
    String? reason,
    String? flag,
    @JsonKey(fromJson: parseIntNullable) int? status,
    String? initiatedBy,
    String? initiatedByName,
    String? settlementType,
    @JsonKey(fromJson: parseDouble) @Default(0) double netAmount,
    @JsonKey(fromJson: parseDouble) @Default(0) double totalPaid,
    String? createdOn,
  }) = _VacateNoticeModel;

  factory VacateNoticeModel.fromJson(Map<String, dynamic> json) =>
      _$VacateNoticeModelFromJson(json);

  bool get isPending => flag == 'PENDING';
  bool get isApproved => flag == 'APPROVED';
  bool get isRejected => flag == 'REJECTED';
  bool get isCancelled => flag == 'CANCELLED';
  bool get isProcessed => flag == 'PROCESSED';
}
