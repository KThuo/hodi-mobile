import 'package:flutter_test/flutter_test.dart';
import 'package:hodi_mobile/features/reports/domain/tenant_report_model.dart';

/// Where a tenancy stands.
///
/// `unitLabel`, `accountBalance` and `collectionRate` are `@JsonProperty` methods on the server's
/// record rather than stored columns — they arrive on the wire like any other field. The tests
/// below are mostly about **not** recomputing them here, which is what keeps this screen, the
/// browser's report and the export saying the same thing.
void main() {
  const row = <String, dynamic>{
    'id': 'p8bP5wdv5a',
    'tenantUserId': 'usr7Kd2mQ',
    'tenantName': 'Test Onboard',
    'tenantPhone': '254700111222',
    'houseId': 'qNvA7xKd3m',
    'houseCode': 'B4',
    'houseNumber': 'K04',
    'unitLabel': 'K04 (Ground Floor)',
    'categoryName': 'Two Bedroom',
    'propertyName': 'Kilimani Heights',
    'estateName': 'Kilimani',
    'rent': 45000,
    'depositHeld': 45000,
    'occupiedOn': '2025-02-01',
    'expiresOn': '2027-01-31',
    'invoicedAmount': 540000,
    'paidAmount': 440000,
    'rentInvoiced': 495000,
    'arrears': 100000,
    'credit': 0,
    'accountBalance': 100000,
    'unpaidInvoices': 2,
    'oldestUnpaid': 63,
    'lastPaymentOn': '2026-08-14',
    'lastPaymentAmount': 45000,
    'collectionRate': 81.5,
  };

  test('the balance is the server\'s, not arrears minus credit done here', () {
    final r = TenantReportModel.fromJson(row);

    expect(r.accountBalance, 100000);
    expect(r.arrears, 100000);
    expect(r.credit, 0);
  });

  test('owing and in credit are two sides of one number', () {
    expect(TenantReportModel.fromJson(row).owes, isTrue);

    final credited = TenantReportModel.fromJson(
      {...row, 'arrears': 0, 'credit': 4500, 'accountBalance': -4500},
    );
    expect(credited.inCredit, isTrue);
    expect(credited.owes, isFalse);

    final settled =
        TenantReportModel.fromJson({...row, 'arrears': 0, 'accountBalance': 0});
    expect(settled.owes, isFalse);
    expect(settled.inCredit, isFalse);
  });

  test('a tenancy nobody invoiced has no rate, which is not nought', () {
    final fresh = TenantReportModel.fromJson(
      {...row, 'invoicedAmount': 0, 'collectionRate': null},
    );

    expect(fresh.collectionRate, isNull);
    expect(TenantReportModel.fromJson(row).collectionRate, 81.5);
  });

  test('the unit is the composed label, falling back to the code', () {
    expect(TenantReportModel.fromJson(row).unit, 'K04 (Ground Floor)');
    expect(
      TenantReportModel.fromJson({...row, 'unitLabel': null}).unit,
      'B4',
    );
  });

  test('nothing unpaid means no age to report', () {
    final clear = TenantReportModel.fromJson(
      {...row, 'unpaidInvoices': 0, 'oldestUnpaid': null},
    );

    expect(clear.unpaidInvoices, 0);
    expect(clear.oldestUnpaid, isNull);
  });

  group('the page', () {
    const page = <String, dynamic>{
      'content': [row],
      'page': 0,
      'pageSize': 50,
      'totalElements': 1,
      'totals': {
        'tenancies': 1,
        'rent': 45000,
        'depositHeld': 45000,
        'invoicedAmount': 540000,
        'paidAmount': 440000,
        'arrears': 100000,
        'credit': 0,
        'accountBalance': 100000,
        'owing': 1,
        'collectionRate': 81.5,
      },
    };

    test('the totals come off the server, beside the rows they cover', () {
      final read = TenantReportPageModel.fromJson(page);

      expect(read.totals, isNotNull);
      expect(read.totals!.owing, 1);
      expect(read.totals!.accountBalance, 100000);
    });

    test('a page covering everything is not flagged as partial', () {
      expect(TenantReportPageModel.fromJson(page).partial, isFalse);
    });

    test('a page covering part of the set says so', () {
      // The figures below the list are the totals of what came back. Presented as the whole
      // selection, they are what somebody copies into a report.
      final cut = TenantReportPageModel.fromJson({...page, 'totalElements': 412});

      expect(cut.partial, isTrue);
      expect(cut.content, hasLength(1));
      expect(cut.totalElements, 412);
    });
  });
}
