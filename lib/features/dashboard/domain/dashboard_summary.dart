import 'package:freezed_annotation/freezed_annotation.dart';

part 'dashboard_summary.freezed.dart';
part 'dashboard_summary.g.dart';

/// The figures behind the dashboard cards.
///
/// ## One view model, two endpoints
///
/// Legacy answered both cards from `/dashboard/table-data` with a `status` parameter — `2` meant
/// overall, `4` meant the month — and returned one flat object either way. The rebuilt backend
/// splits them, because *all time* and *this month* are different questions that were being
/// averaged together: `GET /dashboard/overall` and `GET /dashboard/monthly`.
///
/// They return different records, and this stays one type on purpose. The cards show the same
/// figures for both periods, so a single view model with a factory per endpoint keeps the screen
/// from branching on which question it asked. Where a figure only exists on one side it is nought
/// and the card says so, rather than the model pretending both shapes are the same.
@freezed
abstract class DashboardSummary with _$DashboardSummary {
  const DashboardSummary._();

  const factory DashboardSummary({
    @Default(0) double totalInvoice,
    @Default(0) double totalRent,
    @Default(0) double totalPayment,
    @Default(0) double totalExpense,
    @Default(0) double totalArrears,
    @Default(0) double totalOverpayments,
    @Default(0) double totalTopups,
    @Default(0) double totalClearedAmount,

    /// Unallocated money standing across live payments **today** — a balance, not something that
    /// arose in the period. The backend's own note warns these two are not interchangeable, and
    /// that showing the difference between them once made the dashboard read 782,700 where the
    /// portal read 4,700.
    @Default(0) double totalCredit,
    @Default(0) double totalForfeited,

    /// How many properties the figures above cover. Distinct, not rows.
    int? properties,
    int? totalUnits,
    int? occupiedUnits,

    /// The period these figures are for, in the server's words — "September 2026", "All time".
    String? label,
  }) = _DashboardSummary;

  factory DashboardSummary.fromJson(Map<String, dynamic> json) =>
      _$DashboardSummaryFromJson(json);

  /// `GET /dashboard/overall` — `{label, totals}`, all time unless a year is named.
  ///
  /// **`invoiced` fills both [totalInvoice] and [totalRent], and that is not a fudge.** The overall
  /// query selects `sum(property_reports.rent_amount) as invoiced` — the period's own charge — which
  /// is what legacy has always meant by "Total Invoice". It deliberately does *not* sum
  /// `invoices.amount`, because that carries each month's arrears forward and summing it counts the
  /// same debt once for every month it was carried; the backend's own note records that this read
  /// 2,466,110 where the portal showed 3,361,910.
  ///
  /// So the two names are one figure here, and the cards may read either. Leaving [totalRent] unset
  /// is what made "Total Invoiced" show nought against a database holding 121,000.
  factory DashboardSummary.fromOverall(Map<String, dynamic> json) {
    final t = _map(json['totals']);
    final invoiced = _num(t['invoiced']);
    return DashboardSummary(
      label: json['label']?.toString(),
      totalInvoice: invoiced,
      totalRent: invoiced,
      totalPayment: _num(t['collected']),
      totalExpense: _num(t['spent']),
      totalArrears: _num(t['arrears']),
      totalCredit: _num(t['credit']),
      totalTopups: _num(t['topups']),
      totalOverpayments: _num(t['overpayments']),
      totalClearedAmount: _num(t['cleared']),
      totalForfeited: _num(t['forfeited']),
    );
  }

  /// `GET /dashboard/monthly` — `{year, month, label, totals, occupancy, collections}`.
  ///
  /// Units come from `occupancy` rather than from `totals`, although both carry them: occupancy is
  /// the record whose whole job is counting them, and it guarantees a non-negative `vacant`.
  factory DashboardSummary.fromMonthly(Map<String, dynamic> json) {
    final t = _map(json['totals']);
    final o = _map(json['occupancy']);
    return DashboardSummary(
      label: json['label']?.toString(),
      totalInvoice: _num(t['invoiceAmount']),
      totalRent: _num(t['rentAmount']),
      totalPayment: _num(t['paymentAmount']),
      totalExpense: _num(t['expenseAmount']),
      // Closing, not opening: the card asks what is owed now, not what was owed before the month.
      totalArrears: _num(t['closingArrears']),
      totalOverpayments: _num(t['overpaymentAmount']),
      totalTopups: _num(t['topupAmount']),
      totalClearedAmount: _num(t['clearedAmount']),
      totalCredit: _num(t['totalCredit']),
      totalForfeited: _num(t['forfeitedAmount']),
      properties: (o['properties'] as num?)?.toInt(),
      totalUnits: (o['units'] as num?)?.toInt(),
      occupiedUnits: (o['occupied'] as num?)?.toInt(),
    );
  }

  static Map<String, dynamic> _map(dynamic v) =>
      v is Map ? Map<String, dynamic>.from(v) : const {};

  /// Money arrives as a JSON number, but a `BigDecimal` can serialise as a string — so parse both
  /// rather than crash the card on a value that is perfectly valid.
  static double _num(dynamic v) {
    if (v is num) return v.toDouble();
    if (v is String) return double.tryParse(v) ?? 0;
    return 0;
  }

  double get collectionRate =>
      totalInvoice > 0 ? (totalPayment / totalInvoice) * 100 : 0;

  double get occupancyRate => (totalUnits != null && totalUnits! > 0)
      ? ((occupiedUnits ?? 0) / totalUnits!) * 100
      : 0;

  /// Never negative, however the counters disagree — a card reading minus two empty units is worse
  /// than one reading nought. The backend makes the same guarantee on its side.
  int get vacantUnits {
    final units = totalUnits ?? 0;
    final occupied = occupiedUnits ?? 0;
    return units - occupied < 0 ? 0 : units - occupied;
  }
}
