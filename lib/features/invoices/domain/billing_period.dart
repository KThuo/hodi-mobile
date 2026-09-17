/// A month the platform bills into — the server's `PeriodResponse`.
///
/// **Not the calendar month.** A billing month can be opened late or held open, and once
/// `NEXT_MONTH_INVOICE_DAY` has passed the server is already billing into the month ahead. A
/// client that worked the month out from `DateTime.now()` would offer a different one from the
/// one invoices are being raised into, which is how somebody ends up reading September's figures
/// against August's invoices.
class BillingPeriod {
  final int year;
  final int month;
  final String label;

  const BillingPeriod({
    required this.year,
    required this.month,
    required this.label,
  });

  factory BillingPeriod.fromJson(Map<String, dynamic> json) => BillingPeriod(
        year: (json['year'] as num?)?.toInt() ?? 0,
        month: (json['month'] as num?)?.toInt() ?? 0,
        label: json['label']?.toString() ?? '',
      );

  /// The calendar month, for when the server cannot be asked. A wrong month is better than no
  /// card at all, and it is wrong only in the window where billing has moved on and this has not.
  factory BillingPeriod.fromClock() {
    final now = DateTime.now();
    return BillingPeriod(
      year: now.year,
      month: now.month,
      label: monthNames[now.month - 1],
    );
  }

  static const monthNames = <String>[
    'January', 'February', 'March', 'April', 'May', 'June',
    'July', 'August', 'September', 'October', 'November', 'December',
  ];

  /// [by] months away from this one, rolling the year over.
  ///
  /// Done in months-since-year-zero rather than with `DateTime`, because `DateTime(2026, 13)` is
  /// January 2027 by luck rather than by intent, and `DateTime(2026, 0)` is December 2025 — both
  /// right, neither obvious, and both silently wrong if a day ever gets involved.
  BillingPeriod shift(int by) {
    final zero = year * 12 + (month - 1) + by;
    final y = zero ~/ 12;
    final m = (zero % 12) + 1;
    return BillingPeriod(year: y, month: m, label: monthNames[m - 1]);
  }

  /// Previous, this one, next — the three the card offers.
  ///
  /// Next is a real question, not a guess at the future: past the invoice day the server is
  /// already raising into it, so "has next month been raised yet" is answerable and worth asking.
  List<BillingPeriod> get window => [shift(-1), this, shift(1)];

  String get shortLabel => label.isEmpty ? '$month' : label.substring(0, 3);

  @override
  bool operator ==(Object other) =>
      other is BillingPeriod && other.year == year && other.month == month;

  @override
  int get hashCode => Object.hash(year, month);

  @override
  String toString() => '$label $year';
}
