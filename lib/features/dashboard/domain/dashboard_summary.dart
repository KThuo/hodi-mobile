import 'package:freezed_annotation/freezed_annotation.dart';

part 'dashboard_summary.freezed.dart';
part 'dashboard_summary.g.dart';

@freezed
abstract class DashboardSummary with _$DashboardSummary {
  const DashboardSummary._();
  const factory DashboardSummary({
    @Default(0) double totalInvoice,
    @Default(0) double totalRent,
    @Default(0) double totalPayment,
    @Default(0) double totalExpense,
    @Default(0) double totalArrears,
    @Default(0) double monthlyOverpayments,
    @Default(0) double totalOverpayments,
    @Default(0) double totalTopups,
    @Default(0) double totalClearedAmount,
    @Default(0) int invoiceCount,
    @Default(0) int paymentCount,
    @Default(0) int expenseCount,
    int? totalUnits,
    int? occupiedUnits,
  }) = _DashboardSummary;

  factory DashboardSummary.fromJson(Map<String, dynamic> json) =>
      _$DashboardSummaryFromJson(json);

  double get collectionRate =>
      totalInvoice > 0 ? (totalPayment / totalInvoice) * 100 : 0;
  double get occupancyRate => (totalUnits != null && totalUnits! > 0)
      ? ((occupiedUnits ?? 0) / totalUnits!) * 100
      : 0;
}
