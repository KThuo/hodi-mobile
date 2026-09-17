import 'package:flutter_test/flutter_test.dart';
import 'package:hodi_mobile/features/tenants/domain/tenant_detail_model.dart';
import 'package:hodi_mobile/features/tenants/domain/tenant_model.dart';

/// A tenant.
///
/// The legacy model assumed a person, with one unit, carrying a rent balance. The rebuilt endpoint
/// makes none of those three assumptions: a tenant is a user who may be an organisation, may
/// occupy several units, and whose money belongs to the tenancies rather than to them.
void main() {
  const row = <String, dynamic>{
    'id': 'usr7Kd2mQ',
    'kind': 'PERSON',
    'organisation': false,
    'displayName': 'Test Onboard',
    'firstName': 'Test',
    'lastName': 'Onboard',
    'idNumber': '12345678',
    'phone': '254700111222',
    'email': 'test@example.invalid',
    'username': 'test',
    'invited': true,
    'estateId': 'est001',
    'occupying': [
      {'houseId': 'qNvA7xKd3m', 'houseCode': 'B4', 'label': 'K04 (Ground Floor)'},
      {'houseId': 'zRt3Lp8x1y', 'houseCode': 'C2', 'label': 'C2 (First Floor)'},
    ],
    'status': 1,
    'createdOn': '2025-02-01T09:12:00Z',
  };

  test('the id is an opaque string', () {
    // Declared int? before, which threw on the HashId the server sends and took the list with it.
    expect(TenantModel.fromJson(row).id, 'usr7Kd2mQ');
  });

  test('a tenant can occupy more than one unit', () {
    final t = TenantModel.fromJson(row);

    // The legacy model had a single houseCode, so a second tenancy was invisible.
    expect(t.occupying, hasLength(2));
    expect(t.unitsLine, 'K04 (Ground Floor), C2 (First Floor)');
    expect(t.housed, isTrue);
  });

  test('a tenant between tenancies is a real state, not missing data', () {
    final between = TenantModel.fromJson({...row, 'occupying': <dynamic>[]});

    expect(between.housed, isFalse);
    expect(between.unitsLine, '');
  });

  test('an organisation is told from a person', () {
    final company = TenantModel.fromJson({
      ...row,
      'kind': 'ORGANISATION',
      'organisation': true,
      'displayName': 'Acme Limited',
      'registeredName': 'Acme Limited',
      'contactName': 'Jane Mwangi',
    });

    // Initials on a limited company read as somebody's name, so the screen uses a glyph instead.
    expect(company.organisation, isTrue);
    expect(company.contactName, 'Jane Mwangi');
  });

  test('initials survive one name, two spaces, and none', () {
    expect(TenantModel.fromJson(row).initials, 'TO');
    expect(
      TenantModel.fromJson({...row, 'displayName': 'Prince'}).initials,
      'P',
    );
    // 'A  B'.split(' ') is ['A', '', 'B'], and parts[1][0] on the empty string is a RangeError.
    expect(
      TenantModel.fromJson({...row, 'displayName': 'Test  Onboard'}).initials,
      'TO',
    );
  });

  group('the detail', () {
    final detail = <String, dynamic>{
      'tenant': row,
      'current': [
        {
          'id': 'occ1',
          'houseId': 'qNvA7xKd3m',
          'houseCode': 'B4',
          'houseLabel': 'K04 (Ground Floor)',
          'propertyName': 'Kilimani Heights',
          'rent': 45000,
          'rentOwed': 100000,
          'occupiedOn': '2025-02-01',
        },
        {
          'id': 'occ2',
          'houseId': 'zRt3Lp8x1y',
          'houseCode': 'C2',
          'propertyName': 'Kilimani Heights',
          'rent': 30000,
          'rentOwed': -5000,
          'occupiedOn': '2026-01-01',
        },
      ],
      'history': [
        {
          'id': 'h1',
          'occupationId': 'occ0',
          'houseId': 'old1',
          'houseCode': 'A1',
          'propertyName': 'Kileleshwa Court',
          'rent': 38000,
          'occupiedOn': '2023-01-01',
          'vacatedOn': '2025-01-31',
          'nights': 761,
          'reason': 'Moved to a larger unit',
        },
      ],
      'pending': ['collections'],
    };

    test('it nests the same row the list is built from', () {
      final d = TenantDetailModel.fromJson(detail);

      expect(d.tenant.displayName, 'Test Onboard');
      expect(d.current, hasLength(2));
    });

    test('the money is summed from the tenancies, not read off the tenant', () {
      final d = TenantDetailModel.fromJson(detail);

      // Two tenancies: 100,000 owing on one and 5,000 in credit on the other.
      expect(d.totalRent, 75000);
      expect(d.totalOwed, 95000);
      expect(d.inArrears, isTrue);
    });

    test('a tenant in net credit is not in arrears', () {
      final d = TenantDetailModel.fromJson({
        ...detail,
        'current': [
          {
            'id': 'occ1',
            'houseId': 'h',
            'houseCode': 'B4',
            'rent': 45000,
            'rentOwed': -2000,
            'occupiedOn': '2025-02-01',
          },
        ],
      });

      expect(d.totalOwed, -2000);
      expect(d.inArrears, isFalse);
    });

    test('history reads in months rather than nights past a few weeks', () {
      final h = TenantDetailModel.fromJson(detail).history.single;

      expect(h.unit, 'A1');
      // 761 nights is two years, and saying "761 nights" of a tenancy is not how anybody speaks.
      expect(h.duration, '2.1 years');
    });

    test('a short stay still reads in nights', () {
      final h = TenancyHistoryModel.fromJson(const {
        'id': 'h2',
        'houseCode': 'A1',
        'nights': 12,
      });

      expect(h.duration, '12 nights');
    });

    test('pending names what the server has not computed', () {
      expect(TenantDetailModel.fromJson(detail).pending, ['collections']);
    });
  });
}
