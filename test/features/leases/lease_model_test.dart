import 'package:flutter_test/flutter_test.dart';
import 'package:hodi_mobile/features/leases/domain/lease_models.dart';

/// A tenancy agreement.
///
/// A lease **is** an occupation on this platform — `/leases/mine/{id}` takes the occupation id —
/// which is why a tenant reaches theirs from My Houses rather than from a list they are not
/// allowed to load.
void main() {
  const row = <String, dynamic>{
    'id': 'p8bP5wdv5a',
    'tenantName': 'Test Onboard',
    'tenantPhone': '254700111222',
    'houseCode': 'B4',
    'houseLabel': 'K04 (Ground Floor)',
    'propertyName': 'Kilimani Heights',
    'estateName': 'Kilimani',
    'tenure': 'RENTAL',
    'rent': 45000,
    'dueDay': 5,
    'occupiedOn': '2025-02-01',
    'expiresOn': '2027-01-31',
    'daysToExpiry': 501,
    'noticeDays': 60,
    'documents': 2,
    'term': 'Fixed',
  };

  test('the unit prefers the composed label', () {
    expect(LeaseModel.fromJson(row).unit, 'K04 (Ground Floor)');
    expect(LeaseModel.fromJson({...row, 'houseLabel': null}).unit, 'B4');
  });

  group('where the term stands', () {
    test('one ending soon is flagged', () {
      expect(LeaseModel.fromJson({...row, 'daysToExpiry': 30}).expiringWithin(60), isTrue);
      expect(LeaseModel.fromJson(row).expiringWithin(60), isFalse);
    });

    test('a lapsed term is not "expiring soon"', () {
      // A periodic tenancy that ran past its first term is normal, not urgent — and a negative
      // number is less than 60, which is how a naive test would light it up amber.
      final lapsed = LeaseModel.fromJson({...row, 'daysToExpiry': -212});

      expect(lapsed.lapsed, isTrue);
      expect(lapsed.expiringWithin(60), isFalse);
    });

    test('no end date is neither lapsed nor expiring', () {
      final periodic =
          LeaseModel.fromJson({...row, 'expiresOn': null, 'daysToExpiry': null});

      expect(periodic.expiringWithin(60), isFalse);
      expect(periodic.lapsed, isFalse);
    });
  });

  group('the detail', () {
    // Not spread from `row`: on the list row `documents` is a count, and on the detail it is the
    // documents themselves. Same name, different shape — which is worth seeing written out.
    const detail = <String, dynamic>{
      'id': 'p8bP5wdv5a',
      'tenantName': 'Test Onboard',
      'houseCode': 'B4',
      'houseLabel': 'K04 (Ground Floor)',
      'propertyName': 'Kilimani Heights',
      'tenure': 'RENTAL',
      'rent': 45000,
      'dueDay': 5,
      'occupiedOn': '2025-02-01',
      'expiresOn': '2027-01-31',
      'daysToExpiry': 501,
      'noticeDays': 60,
      'term': 'Fixed',
      'houseId': 'qNvA7xKd3m',
      'propertyId': 'ErqPNp7v5p',
      'deposit': 90000,
      'refundableDeposit': 45000,
      'specialConditions': 'No pets.',
      'tenantCanView': true,
      'agreementApplies': true,
      'documents': [
        {
          'id': 'd1',
          'kind': 'SIGNED',
          'title': 'Signed agreement',
          'fileName': 'signed.pdf',
          'contentType': 'application/pdf',
          'byteSize': 248000,
          'superseded': false,
          'uploadedOn': '2025-02-03T09:00:00Z',
          'uploadedBy': 'jane',
        },
        {
          'id': 'd0',
          'kind': 'SIGNED',
          'title': 'Signed agreement (first draft)',
          'fileName': 'draft.pdf',
          'byteSize': 900,
          'superseded': true,
          'uploadedOn': '2025-01-30T09:00:00Z',
        },
      ],
      'history': [
        {
          'id': 'c1',
          'changeType': 'RENT_REVIEW',
          'effectiveOn': '2026-02-01',
          'rentBefore': 40000,
          'rentAfter': 45000,
          'reason': 'Annual review',
          'recordedOn': '2026-01-15T09:00:00Z',
          'recordedBy': 'jane',
        },
      ],
    };

    test('superseded documents are kept and separable', () {
      final d = LeaseDetailModel.fromJson(detail);

      expect(d.documents, hasLength(2));
      // An agreement's history is the point of keeping its documents, so a replaced version is
      // shown and marked rather than dropped.
      expect(d.current, hasLength(1));
      expect(d.current.single.label, 'Signed agreement');
    });

    test('a document size reads as a size', () {
      final d = LeaseDetailModel.fromJson(detail);

      expect(d.documents.first.size, '242 KB');
      expect(d.documents.last.size, '900 B');
    });

    test('a document with no title falls back to its filename', () {
      final untitled = LeaseDocumentModel.fromJson(
        const {'id': 'x', 'kind': 'SIGNED', 'fileName': 'scan.pdf', 'byteSize': 10},
      );

      expect(untitled.label, 'scan.pdf');
      expect(
        LeaseDocumentModel.fromJson(const {'id': 'x', 'kind': 'INVENTORY'}).label,
        'INVENTORY',
      );
    });

    test('a rent review says what moved, both sides', () {
      final change = LeaseDetailModel.fromJson(detail).history.single;

      expect(change.rentMoved, isTrue);
      expect(change.rentBefore, 40000);
      expect(change.rentAfter, 45000);
      // A rent review is not an expiry change, and the screen must not print one as the other.
      expect(change.expiryMoved, isFalse);
      expect(change.dueDayMoved, isFalse);
    });

    test('whether the generated agreement applies is the server\'s answer', () {
      // An owned unit can be excluded by the property's lease settings. Offering a download that
      // would come back empty is worse than not offering one.
      expect(LeaseDetailModel.fromJson(detail).agreementApplies, isTrue);
      expect(
        LeaseDetailModel.fromJson({...detail, 'agreementApplies': false})
            .agreementApplies,
        isFalse,
      );
    });
  });
}
