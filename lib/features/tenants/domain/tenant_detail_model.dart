import 'package:freezed_annotation/freezed_annotation.dart';

part 'tenant_detail_model.freezed.dart';
part 'tenant_detail_model.g.dart';

double _parseDouble(dynamic value) {
  if (value == null) return 0;
  if (value is double) return value;
  if (value is int) return value.toDouble();
  if (value is String) return double.tryParse(value) ?? 0;
  return 0;
}

@freezed
abstract class TenantDetailModel with _$TenantDetailModel {
  const TenantDetailModel._();
  const factory TenantDetailModel({
    String? name,
    String? email,
    String? phone,
    TenantFinancialSummary? content,
  }) = _TenantDetailModel;

  factory TenantDetailModel.fromJson(Map<String, dynamic> json) =>
      _$TenantDetailModelFromJson(json);
}

@freezed
abstract class TenantFinancialSummary with _$TenantFinancialSummary {
  const TenantFinancialSummary._();
  const factory TenantFinancialSummary({
    @JsonKey(fromJson: _parseDouble) @Default(0) double totalRent,
    @JsonKey(fromJson: _parseDouble) @Default(0) double totalPayment,
    @JsonKey(fromJson: _parseDouble) @Default(0) double totalArrears,
    @Default(0) int occupiedUnits,
    @JsonKey(fromJson: _parseDouble) @Default(0) double totalTopups,
    @JsonKey(fromJson: _parseDouble) @Default(0) double totalOverpayments,
  }) = _TenantFinancialSummary;

  factory TenantFinancialSummary.fromJson(Map<String, dynamic> json) =>
      _$TenantFinancialSummaryFromJson(json);
}
