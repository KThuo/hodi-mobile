import 'package:flutter_test/flutter_test.dart';
import 'package:hodi_mobile/features/dashboard/domain/dashboard_summary.dart';

/// The dashboard reads two differently-shaped payloads into one card.
///
/// Mapping a money field to the wrong key does not throw — it produces a plausible number in the
/// wrong box, which is the worst kind of wrong on a screen whose whole job is figures. So each
/// mapping is pinned against the shapes `DashboardController` actually returns.
///
/// The values below are deliberately all different, so a transposed pair cannot pass by coincidence.
void main() {
  group('overall', () {
    // GET /dashboard/overall -> AnalyticsModels.OverallView
    final payload = <String, dynamic>{
      'label': 'All time',
      'totals': {
        'invoiced': 900000,
        'collected': 750000,
        'spent': 120000,
        'arrears': 150000,
        'credit': 4700,
        'topups': 2100,
        'overpayments': 22700,
        'cleared': 31000,
        'forfeited': 8000,
      },
    };

    test('every figure lands in its own box', () {
      final s = DashboardSummary.fromOverall(payload);

      expect(s.label, 'All time');
      expect(s.totalInvoice, 900000);
      expect(s.totalPayment, 750000);
      expect(s.totalExpense, 120000);
      expect(s.totalArrears, 150000);
      expect(s.totalTopups, 2100);
      expect(s.totalClearedAmount, 31000);
      expect(s.totalForfeited, 8000);
    });

    test('credit and overpayments stay apart', () {
      final s = DashboardSummary.fromOverall(payload);

      // The backend's own warning: credit is a balance standing today, overpayment is what arose in
      // the period. Showing one as the other once had the dashboard reading 782,700 against a
      // portal showing 4,700.
      expect(s.totalCredit, 4700);
      expect(s.totalOverpayments, 22700);
    });

    test('the Total Invoiced card has a figure to show', () {
      final s = DashboardSummary.fromOverall(payload);

      // Regression. The card reads totalRent, fromOverall left it unset, and it showed nought
      // against a database holding 121,000. The overall query selects sum(rent_amount) AS invoiced,
      // so the two names are one figure and both must carry it.
      expect(s.totalRent, 900000);
      expect(s.totalInvoice, s.totalRent);
    });

    test('no units, so occupancy declines to invent a rate', () {
      final s = DashboardSummary.fromOverall(payload);

      expect(s.totalUnits, isNull);
      expect(s.occupancyRate, 0);
      expect(s.vacantUnits, 0);
    });
  });

  group('monthly', () {
    // GET /dashboard/monthly -> AnalyticsModels.MonthlyView
    final payload = <String, dynamic>{
      'year': 2026,
      'month': 9,
      'label': 'September 2026',
      'totals': {
        'invoiceAmount': 480000,
        'rentAmount': 400000,
        'paymentAmount': 390000,
        'expenseAmount': 45000,
        'openingArrears': 60000,
        'closingArrears': 75000,
        'overpaymentAmount': 5000,
        'topupAmount': 1200,
        'clearedAmount': 3300,
        'totalCredit': 9900,
        'forfeitedAmount': 700,
      },
      'occupancy': {'properties': 8, 'units': 226, 'occupied': 187, 'vacant': 39},
    };

    test('arrears is the closing figure, not the opening one', () {
      final s = DashboardSummary.fromMonthly(payload);

      // The card asks what is owed now, not what was owed before the month began. Both are in the
      // payload and they differ, which is exactly why this is asserted.
      expect(s.totalArrears, 75000);
      expect(s.totalArrears, isNot(60000));
    });

    test('the money fields are not transposed', () {
      final s = DashboardSummary.fromMonthly(payload);

      expect(s.totalInvoice, 480000);
      expect(s.totalRent, 400000);
      expect(s.totalPayment, 390000);
      expect(s.totalExpense, 45000);
      expect(s.totalOverpayments, 5000);
      expect(s.totalTopups, 1200);
      expect(s.totalClearedAmount, 3300);
      expect(s.totalCredit, 9900);
    });

    test('units come from occupancy, and the rates follow', () {
      final s = DashboardSummary.fromMonthly(payload);

      expect(s.properties, 8);
      expect(s.totalUnits, 226);
      expect(s.occupiedUnits, 187);
      expect(s.vacantUnits, 39);
      expect(s.occupancyRate, closeTo(82.7, 0.05));
      expect(s.collectionRate, closeTo(81.25, 0.01));
    });
  });

  group('what arrives is not always a JSON number', () {
    test('a decimal serialised as a string still reads', () {
      // BigDecimal can reach the wire quoted depending on serialiser configuration. A card that
      // crashed on a perfectly valid value would be a worse bug than the formatting it guards.
      final s = DashboardSummary.fromOverall({
        'totals': {'invoiced': '12345.67', 'collected': 100},
      });

      expect(s.totalInvoice, closeTo(12345.67, 0.001));
      expect(s.totalPayment, 100);
    });

    test('missing sections read as nought rather than throwing', () {
      final s = DashboardSummary.fromMonthly({'label': 'September 2026'});

      expect(s.totalInvoice, 0);
      expect(s.totalUnits, isNull);
      expect(s.collectionRate, 0);
    });
  });
}
