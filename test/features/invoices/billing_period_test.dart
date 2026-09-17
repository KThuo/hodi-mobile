import 'package:flutter_test/flutter_test.dart';
import 'package:hodi_mobile/features/invoices/domain/billing_period.dart';

/// The three months a report card offers.
///
/// The arithmetic is the part worth testing: shifting a month is where December and January get
/// it wrong, and a card that offered "Month 13" or "Month 0" would be asking the server for a
/// period that does not exist.
void main() {
  test('it reads the server period', () {
    final p = BillingPeriod.fromJson(
      {'year': 2026, 'month': 9, 'label': 'September', 'options': <dynamic>[]},
    );

    expect(p.year, 2026);
    expect(p.month, 9);
    expect(p.label, 'September');
  });

  test('shifting stays inside 1-12 and rolls the year', () {
    const january = BillingPeriod(year: 2026, month: 1, label: 'January');

    expect(january.shift(-1), const BillingPeriod(year: 2025, month: 12, label: 'December'));
    expect(january.shift(-1).label, 'December');

    const december = BillingPeriod(year: 2026, month: 12, label: 'December');
    expect(december.shift(1), const BillingPeriod(year: 2027, month: 1, label: 'January'));
    expect(december.shift(1).label, 'January');
  });

  test('shifting a long way still lands on a real month', () {
    const march = BillingPeriod(year: 2026, month: 3, label: 'March');

    expect(march.shift(-14).year, 2025);
    expect(march.shift(-14).month, 1);
    expect(march.shift(25).year, 2028);
    expect(march.shift(25).month, 4);
  });

  test('the window is previous, this one, next', () {
    const september = BillingPeriod(year: 2026, month: 9, label: 'September');
    final window = september.window;

    expect(window.map((p) => p.label), ['August', 'September', 'October']);
    expect(window[1], september, reason: 'the billing month sits in the middle');
  });

  test('the window rolls the year at both ends', () {
    expect(
      const BillingPeriod(year: 2026, month: 1, label: 'January').window.first.year,
      2025,
    );
    expect(
      const BillingPeriod(year: 2026, month: 12, label: 'December').window.last.year,
      2027,
    );
  });

  test('two months are the same month whatever the label says', () {
    // Equality is by year and month, because the label is the server's wording and the card
    // compares the chosen month against the three it offers.
    expect(
      const BillingPeriod(year: 2026, month: 9, label: 'September'),
      const BillingPeriod(year: 2026, month: 9, label: 'Sep 2026'),
    );
  });
}
