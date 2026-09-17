import 'package:flutter_test/flutter_test.dart';
import 'package:hodi_mobile/features/occupations/domain/occupation_model.dart';
import 'package:hodi_mobile/features/occupations/domain/tenancy_balance_model.dart';

/// Reading a tenancy, which is what "My houses" is a list of.
///
/// The one thing worth guarding here is the sign. `rentOwed` is a single column carrying arrears
/// as positive and credit as negative — the legacy portal's convention, kept — and the way that
/// goes wrong is a screen printing a negative amount under a heading that says "Arrears", which
/// tells somebody in credit that they owe money.
void main() {
  // The shape of OccupancyModels.OccupationRow.
  const row = <String, dynamic>{
    'id': 'p8bP5wdv5a',
    'tenantUserId': 'usr7Kd2mQ',
    'tenantName': 'Test Onboard',
    'tenantPhone': '254700111222',
    'tenantIsOrganisation': false,
    'houseId': 'qNvA7xKd3m',
    'houseCode': 'B4',
    'houseNumber': 'K04',
    'houseLabel': 'K04 (Ground Floor)',
    'propertyId': 'ErqPNp7v5p',
    'propertyName': 'Kilimani Heights',
    'estateId': 'est001',
    'estateName': 'Kilimani',
    'categoryId': 'c1',
    'categoryName': 'Two Bedroom',
    'usageClassName': 'Residential',
    'tenure': 'RENTAL',
    'rent': 45000,
    'deposit': 90000,
    'refundableDeposit': 45000,
    'rentOwed': 100000,
    'dueDay': 5,
    'nextDueOn': '2026-10-05',
    'occupiedOn': '2025-02-01',
    'expiresOn': '2027-01-31',
    'daysToExpiry': 501,
    'noticeDays': 60,
    'status': 1,
    'createdOn': '2025-02-01T09:12:00Z',
  };

  group('the tenancy', () {
    test('every id is an opaque string', () {
      final tenancy = OccupationModel.fromJson(row);

      expect(tenancy.id, 'p8bP5wdv5a');
      expect(tenancy.houseId, 'qNvA7xKd3m');
      expect(tenancy.tenantUserId, 'usr7Kd2mQ');
    });

    test('one column, and the sign decides which word goes above it', () {
      final owing = OccupationModel.fromJson(row);
      final credit = OccupationModel.fromJson({...row, 'rentOwed': -4500});
      final settled = OccupationModel.fromJson({...row, 'rentOwed': 0});

      expect(owing.inArrears, isTrue);
      expect(owing.inCredit, isFalse);

      expect(credit.inCredit, isTrue);
      expect(credit.inArrears, isFalse);

      expect(settled.inArrears, isFalse);
      expect(settled.inCredit, isFalse);
    });

    test('the unit reads as somebody would say it', () {
      expect(OccupationModel.fromJson(row).displayName, 'K04 (Ground Floor)');
      expect(
        OccupationModel.fromJson({...row, 'houseLabel': null}).displayName,
        'B4',
      );
    });

    test('a term already passed is a normal state, not a missing date', () {
      // A periodic tenancy that ran past its first term. Negative is the answer, not an error.
      final periodic = OccupationModel.fromJson({...row, 'daysToExpiry': -212});

      expect(periodic.daysToExpiry, -212);
      expect(periodic.expiresOn, isNotNull);
    });

    test('no agreed end is different from an end nobody recorded', () {
      final open = OccupationModel.fromJson(
        {...row, 'expiresOn': null, 'daysToExpiry': null},
      );

      expect(open.expiresOn, isNull);
      expect(open.daysToExpiry, isNull);
    });
  });

  group('the balance', () {
    const balance = <String, dynamic>{
      'occupationId': 'p8bP5wdv5a',
      'houseCode': 'B4',
      'houseNumber': 'K04',
      'tenantName': 'Test Onboard',
      'outstanding': 100000,
      'creditInHand': 4500,
      'invoices': [
        {
          'id': 'MqemPV9ynW',
          'rrn': 'HPABACMLPVNH',
          'periodLabel': 'September 2026',
          'amount': 146500,
          'outstanding': 100000,
          'dueDate': '2026-09-05',
          'overdue': true,
        },
      ],
    };

    test('what is owed and what is held are two facts, not one', () {
      final read = TenancyBalanceModel.fromJson(balance);

      // Netting them off would leave 95,500 and lose the fact that 4,500 is already in hand.
      expect(read.outstanding, 100000);
      expect(read.creditInHand, 4500);
      expect(read.settled, isFalse);
    });

    test('nothing outstanding reads as settled', () {
      final clear = TenancyBalanceModel.fromJson(
        {...balance, 'outstanding': 0, 'invoices': <dynamic>[]},
      );

      expect(clear.settled, isTrue);
      expect(clear.invoices, isEmpty);
    });

    test('the unsettled invoices come with it, so the header can count them', () {
      final read = TenancyBalanceModel.fromJson(balance);

      expect(read.invoices.single.rrn, 'HPABACMLPVNH');
      expect(read.invoices.single.overdue, isTrue);
      expect(read.invoices.single.outstanding, 100000);
    });
  });
}
