import 'package:flutter_test/flutter_test.dart';
import 'package:hodi_mobile/features/vacate_notices/domain/vacate_notice_detail_model.dart';
import 'package:hodi_mobile/features/vacate_notices/domain/vacate_notice_model.dart';

/// A notice to vacate.
///
/// This page rendered blank. `NoticeDetail` is `{notice, lines, nextStep, shortNotice, payments}`
/// — nested — and the model read it as a flat object with legacy names, so every field resolved
/// to null. Nothing threw, so there was no error either: an empty page and no explanation.
void main() {
  const notice = <String, dynamic>{
    'id': 'MqemPV9ynW',
    'reference': 'VN-000142',
    'occupationId': 'p8bP5wdv5a',
    'houseId': 'qNvA7xKd3m',
    'houseCode': 'B4',
    'houseNumber': 'K04',
    'houseLabel': 'K04 (Ground Floor)',
    'propertyName': 'Kilimani Heights',
    'estateName': 'Kilimani',
    'tenantUserId': 'usr7Kd2mQ',
    'tenantName': 'Test Onboard',
    'tenantPhone': '254700111222',
    'raisedBy': 'TENANT',
    'raisedByName': 'Test Onboard',
    'vacateDate': '2026-10-31',
    'reason': 'Moving closer to work',
    'status': 'PENDING',
    'rentOwed': 12000,
    'refundableDeposit': 45000,
    'totalDeductions': 17500,
    'netAmount': 27500,
    'settled': false,
    'totalPaid': 0,
    'balanceRemaining': 27500,
    'refundConfirmed': false,
    'processed': false,
    'daysToVacate': 44,
    'nextStep': 'Awaiting approval from the office.',
    'createdOn': '2026-09-17T06:00:00Z',
  };

  test('the detail nests the notice rather than flattening it', () {
    final d = VacateNoticeDetailModel.fromJson(const {
      'notice': notice,
      'lines': <dynamic>[],
      'nextStep': 'Awaiting approval from the office.',
      'payments': <dynamic>[],
    });

    // The whole bug: this used to read the outer map as the notice itself.
    expect(d.notice.reference, 'VN-000142');
    expect(d.notice.tenantName, 'Test Onboard');
    expect(d.nextStep, 'Awaiting approval from the office.');
  });

  test('the status is a word, not an integer', () {
    // The legacy model declared `int? status`, and the server sends PENDING.
    final n = VacateNoticeModel.fromJson(notice);

    expect(n.status, 'PENDING');
    expect(n.pending, isTrue);
    expect(n.statusLabel, 'Awaiting a decision');
  });

  group('the settlement', () {
    test('positive net means money goes back to the tenant', () {
      final n = VacateNoticeModel.fromJson(notice);

      expect(n.hasSettlement, isTrue);
      expect(n.isRefund, isTrue);
      expect(n.netAmount, 27500);
    });

    test('negative net means they still owe', () {
      final owing =
          VacateNoticeModel.fromJson({...notice, 'netAmount': -4500});

      expect(owing.isRefund, isFalse);
      expect(owing.netAmount, -4500);
    });

    test('no settlement yet is not a settlement of nought', () {
      // "Not worked out yet" and "nothing owed" are different answers, and the screen says which.
      final fresh = VacateNoticeModel.fromJson({
        ...notice,
        'netAmount': null,
        'rentOwed': null,
        'refundableDeposit': null,
        'totalDeductions': null,
      });

      expect(fresh.hasSettlement, isFalse);
      expect(fresh.netAmount, isNull);
    });

    test('the lines split into what is credited and what comes off', () {
      final d = VacateNoticeDetailModel.fromJson(const {
        'notice': notice,
        'lines': [
          {'source': 'DEPOSIT', 'description': 'Refundable deposit', 'amount': 45000},
          {'source': 'RENT', 'description': 'Rent owed', 'amount': -12000},
          {
            'source': 'UTILITY',
            'description': 'Water to 31 Oct',
            'amount': -5500,
            'reading': 4213,
          },
        ],
        'payments': <dynamic>[],
      });

      expect(d.credits, hasLength(1));
      expect(d.deductions, hasLength(2));
      // The reading is what lets a tenant check the charge against the dial.
      expect(d.deductions.last.reading, 4213);
      expect(d.deductions.last.isDeduction, isTrue);
    });
  });

  group('the notice period', () {
    test('short notice carries the server\'s own explanation', () {
      final d = VacateNoticeDetailModel.fromJson(const {
        'notice': notice,
        'lines': <dynamic>[],
        'payments': <dynamic>[],
        'shortNotice': {
          'required': 60,
          'given': 44,
          'shortBy': 16,
          'isShort': true,
          'chargeable': true,
          'penalty': 'RENT_IN_LIEU',
          'suggestedAmount': 24000,
          'description': '16 days short',
          'explanation': 'The tenancy requires 60 days and 44 were given.',
        },
      });

      expect(d.shortNotice!.isShort, isTrue);
      expect(d.shortNotice!.shortBy, 16);
      // Shown verbatim: somebody disputing a charge wants the reasoning, not a paraphrase.
      expect(d.shortNotice!.explanation, contains('60 days'));
    });

    test('short is not automatically chargeable', () {
      final d = VacateNoticeDetailModel.fromJson(const {
        'notice': notice,
        'lines': <dynamic>[],
        'payments': <dynamic>[],
        'shortNotice': {
          'given': 44,
          'shortBy': 16,
          'isShort': true,
          'chargeable': false,
          'penalty': 'NONE',
          'suggestedAmount': 0,
        },
      });

      // A property setting decides, and the server has read it. The card says so out loud.
      expect(d.shortNotice!.isShort, isTrue);
      expect(d.shortNotice!.chargeable, isFalse);
    });
  });

  test('a date already passed on an unprocessed notice is the one to chase', () {
    final gone = VacateNoticeModel.fromJson(
      {...notice, 'daysToVacate': -6, 'processed': false},
    );
    final done = VacateNoticeModel.fromJson(
      {...notice, 'daysToVacate': -6, 'processed': true},
    );

    expect(gone.overdue, isTrue);
    expect(done.overdue, isFalse);
  });
}
