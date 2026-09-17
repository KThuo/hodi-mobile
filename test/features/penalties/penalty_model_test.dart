import 'package:flutter_test/flutter_test.dart';
import 'package:hodi_mobile/features/penalties/domain/penalty_models.dart';

/// A late-payment charge.
///
/// The distinction this model exists to keep is **waived versus reversed**. Waiving forgives a
/// charge that was correctly raised; reversing says it should never have been raised at all. The
/// server keeps two endpoints, two reasons and two sets of timestamps for exactly that, and a
/// screen that collapsed them into "cancelled" would throw away the thing the records are for.
void main() {
  const row = <String, dynamic>{
    'id': 'MqemPV9ynW',
    'reference': 'PEN-000188',
    'penaltyRuleId': 'r1',
    'ruleName': 'Late rent — 5%',
    'triggerOn': 'INVOICE_OVERDUE',
    'estateName': 'Kilimani',
    'propertyName': 'Kilimani Heights',
    'houseCode': 'B4',
    'sourceType': 'INVOICE',
    'sourceId': 'inv1',
    'sourceRef': 'HPABACMLPVNH',
    'subjectName': 'Test Onboard',
    'baseAmount': 45000,
    'basis': 'PERCENT',
    'rate': 5,
    'occurrence': 3,
    'amount': 2250,
    'calculationNote': '5% of KES 45,000 outstanding at 6 September',
    'status': 'PENDING',
    'open': true,
    'waived': false,
    'createdOn': '2026-09-06T06:00:00Z',
  };

  test('the status reads in words, and an unknown code reads as itself', () {
    expect(PenaltyChargeModel.fromJson(row).statusLabel, 'Awaiting a decision');
    expect(
      PenaltyChargeModel.fromJson({...row, 'status': 'APPLIED'}).statusLabel,
      'On the invoice',
    );
    // Rather than guessing at a code added on the server after this build shipped.
    expect(
      PenaltyChargeModel.fromJson({...row, 'status': 'SOMETHING_NEW'}).statusLabel,
      'SOMETHING_NEW',
    );
  });

  group('waived is not reversed', () {
    final waived = <String, dynamic>{
      ...row,
      'status': 'WAIVED',
      'open': false,
      'waived': true,
      'waivedBy': 'jane',
      'waivedOn': '2026-09-10T09:00:00Z',
      'waiverReason': 'Paid the same week.',
    };
    final reversed = <String, dynamic>{
      ...row,
      'status': 'REVERSED',
      'open': false,
      'waived': false,
      'reversedBy': 'jane',
      'reversedOn': '2026-09-10T09:00:00Z',
      'reversalReason': 'The rule misfired on a credit note.',
    };

    test('each keeps its own flag, reason and author', () {
      final w = PenaltyChargeModel.fromJson(waived);
      final r = PenaltyChargeModel.fromJson(reversed);

      expect(w.waived, isTrue);
      expect(w.reversed, isFalse);
      expect(w.waiverReason, 'Paid the same week.');
      expect(w.reversalReason, isNull);

      expect(r.reversed, isTrue);
      expect(r.waived, isFalse);
      expect(r.reversalReason, 'The rule misfired on a credit note.');
      expect(r.waiverReason, isNull);
    });

    test('the reason reads from whichever happened', () {
      expect(
        PenaltyChargeModel.fromJson(waived).decisionReason,
        'Paid the same week.',
      );
      expect(
        PenaltyChargeModel.fromJson(reversed).decisionReason,
        'The rule misfired on a credit note.',
      );
      // Still standing: there is no decision to report.
      expect(PenaltyChargeModel.fromJson(row).decisionReason, isNull);
    });
  });

  test('open is the server\'s answer, not a reading of the status', () {
    expect(PenaltyChargeModel.fromJson(row).open, isTrue);
    expect(
      PenaltyChargeModel.fromJson({...row, 'status': 'APPLIED', 'open': false}).open,
      isFalse,
    );
  });

  group('the working out', () {
    test('the server\'s note wins where there is one', () {
      expect(
        PenaltyChargeModel.fromJson(row).workingOut,
        '5% of KES 45,000 outstanding at 6 September',
      );
    });

    test('a percentage rule falls back to the rate', () {
      final noNote =
          PenaltyChargeModel.fromJson({...row, 'calculationNote': null});

      expect(noNote.workingOut, '5% of the balance');
    });

    test('a fixed rule says so', () {
      final fixed = PenaltyChargeModel.fromJson(
        {...row, 'calculationNote': null, 'basis': 'FIXED', 'baseAmount': 0},
      );

      expect(fixed.workingOut, 'Fixed charge');
    });
  });

  test('the occurrence count comes through', () {
    // A third late month is a different conversation from a first, which is why the server counts
    // rather than leaving it to be inferred from a history nobody has loaded.
    expect(PenaltyChargeModel.fromJson(row).occurrence, 3);
  });
}
