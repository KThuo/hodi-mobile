import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../core/utils/json_parsers.dart';

part 'property_report_model.freezed.dart';
part 'property_report_model.g.dart';

/// One property's month — the server's `PropertyReportRow`, cut down to what a phone shows.
///
/// This is where the money went when HODI was rebuilt. The property detail endpoint used to
/// carry collections and arrears; now nothing is stored and the whole row is a projection over
/// invoices, payments and expenses, which is why it reconciles with them by construction.
///
/// Two of these figures are easy to confuse and are not interchangeable:
///
/// - [invoiceAmount] is everything invoiced in the period — the period's own charge **plus**
///   arrears carried into it, less credits and adjustments.
/// - [chargedAmount] is the period's own charge alone: rent, service charge, utilities, deposits
///   and penalties together.
///
/// The gap between them is [broughtForwardAmount] and [creditsAndAdjustments], both sent, so a
/// screen showing invoiced and charged with nothing between them is a screen nobody can add up.
@freezed
abstract class PropertyReportModel with _$PropertyReportModel {
  const PropertyReportModel._();
  const factory PropertyReportModel({
    required String id,
    String? propertyName,
    String? estateId,
    String? estateName,
    @Default(0) int totalUnits,
    @Default(0) int occupiedUnits,
    @Default(0) int periodYear,
    @Default(0) int periodMonth,
    @JsonKey(fromJson: parseDouble) @Default(0) double invoiceAmount,
    @JsonKey(fromJson: parseDouble) @Default(0) double chargedAmount,

    /// The rent itself, so a column labelled Rent is the rent and not the whole charge.
    @JsonKey(fromJson: parseDouble) @Default(0) double rentAmount,

    /// An owned property's revenue, which would otherwise read as a rent of zero.
    @JsonKey(fromJson: parseDouble) @Default(0) double serviceChargeAmount,
    @JsonKey(fromJson: parseDouble) @Default(0) double utilityAmount,
    @JsonKey(fromJson: parseDouble) @Default(0) double depositAmount,

    /// Arrears carried into the period's invoices. Billed when it arose, not here.
    @JsonKey(fromJson: parseDouble) @Default(0) double broughtForwardAmount,
    @Default(0) int invoiceCount,

    /// Money that arrived in the period, whatever it settled. A cash figure.
    @JsonKey(fromJson: parseDouble) @Default(0) double paymentAmount,
    @Default(0) int paymentCount,

    /// Still owed at the start of the period, so the month reconciles.
    @JsonKey(fromJson: parseDouble) @Default(0) double openingArrears,
    @JsonKey(fromJson: parseDouble) @Default(0) double closingArrears,

    /// Credit that arose in this period, top-up included.
    @JsonKey(fromJson: parseDouble) @Default(0) double overpaymentAmount,
    @JsonKey(fromJson: parseDouble) @Default(0) double topupAmount,
    @JsonKey(fromJson: parseDouble) @Default(0) double cumulativeCredit,
    @JsonKey(fromJson: parseDouble) @Default(0) double clearedAmount,
    @JsonKey(fromJson: parseDouble) @Default(0) double forfeitedAmount,
    @JsonKey(fromJson: parseDouble) @Default(0) double expenseAmount,
    @Default(0) int expenseCount,

    /// What HODI invoiced the estate for this property this month. Null where HODI has not
    /// invoiced that month yet — a different fact from a commission of zero.
    @JsonKey(fromJson: parseDoubleNullable) double? commissionAmount,
    @JsonKey(fromJson: parseDoubleNullable) double? commissionPercent,

    /// Payments less expenses. Computed server-side so the rule lives in one place.
    @JsonKey(fromJson: parseDouble) @Default(0) double netIncome,

    /// Whatever else is on the invoices: credits, waivers, corrections, refunds. The remainder
    /// of invoiced less charged less brought forward, so the three close by construction.
    @JsonKey(fromJson: parseDouble) @Default(0) double creditsAndAdjustments,
  }) = _PropertyReportModel;

  factory PropertyReportModel.fromJson(Map<String, dynamic> json) =>
      _$PropertyReportModelFromJson(json);

  /// How much of what was invoiced has been paid. Against [invoiceAmount], which is what the
  /// tenant was actually asked for — arrears included, because those are what is being chased.
  double get collectionPercentage =>
      invoiceAmount > 0 ? (paymentAmount / invoiceAmount) * 100 : 0;
}
