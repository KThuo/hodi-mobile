import 'package:flutter_test/flutter_test.dart';
import 'package:hodi_mobile/features/vacant_houses/domain/vacant_house_detail_model.dart';
import 'package:hodi_mobile/features/vacant_houses/domain/vacant_house_model.dart';

/// A unit to let.
///
/// The id here is a **public token**, not a HashId — base 36, not salted per user, because a
/// listing link has to survive being shared with somebody who has no account. Passing it back
/// unchanged is the whole contract.
void main() {
  const row = <String, dynamic>{
    'id': '3k7f2a',
    'title': 'K04 — Two Bedroom',
    'categoryName': 'Two Bedroom',
    'propertyName': 'Kilimani Heights',
    'area': 'Kilimani',
    'rent': 45000,
    'bedrooms': 2,
    'bathrooms': 1,
    'squareFt': 850,
    'dsq': true,
    'parkingSpaces': 1,
    'latitude': -1.2921,
    'longitude': 36.8219,
    'distanceKm': 2.4,
    'images': ['/assets/a.jpg', '/assets/b.jpg'],
    'imageCount': 5,
    'availableFrom': '2026-10-01',
  };

  test('the id is a token and stays a string', () {
    // It reads as a number in base 36. Parsed as an integer it would become null, and the detail
    // request would go out with no id at all.
    expect(VacantHouseModel.fromJson(row).id, '3k7f2a');
  });

  test('the fields are the ones the server actually sends', () {
    final l = VacantHouseModel.fromJson(row);

    // Was houseName / property / category on the legacy shape, none of which exist.
    expect(l.title, 'K04 — Two Bedroom');
    expect(l.propertyName, 'Kilimani Heights');
    expect(l.categoryName, 'Two Bedroom');
    expect(l.area, 'Kilimani');
  });

  test('the rooms line leaves out what the category does not have', () {
    expect(
      VacantHouseModel.fromJson(row).roomsLine,
      '2 bed · 1 bath · DSQ · 1 parking',
    );

    final office = VacantHouseModel.fromJson(
      {...row, 'bedrooms': null, 'bathrooms': null, 'dsq': false, 'parkingSpaces': 0},
    );
    // Not "0 bed", which is wrong rather than empty.
    expect(office.roomsLine, '');
  });

  test('the cover is the first image, and none is not a crash', () {
    expect(VacantHouseModel.fromJson(row).coverImage, '/assets/a.jpg');
    expect(
      VacantHouseModel.fromJson({...row, 'images': <dynamic>[]}).coverImage,
      isNull,
    );
  });

  group('the move-in costs', () {
    const detail = <String, dynamic>{
      'id': '3k7f2a',
      'title': 'K04 — Two Bedroom',
      'propertyName': 'Kilimani Heights',
      'area': 'Kilimani',
      'rent': 45000,
      'deposit': 45000,
      'bedrooms': 2,
      'bathrooms': 1,
      'dsq': false,
      'images': <dynamic>[],
      'amenities': [
        {'name': 'Borehole', 'icon': 'water'},
      ],
      'moveInCosts': [
        {'name': 'Rent deposit', 'amount': 45000, 'refundable': true, 'months': 1},
        {'name': 'Water deposit', 'amount': 5000, 'refundable': true},
        {'name': 'Agency fee', 'amount': 10000, 'refundable': false},
      ],
      'contactName': 'Jane Mwangi',
      'contactPhone': '254700111222',
      'contactEmail': 'jane@example.invalid',
    };

    test('the total is the sum of the rows shown', () {
      expect(VacantHouseDetailModel.fromJson(detail).totalMoveInCost, 60000);
    });

    test('the refundable part is separable, because it is the question', () {
      expect(VacantHouseDetailModel.fromJson(detail).refundableAtEnd, 50000);
    });

    test('a charge expressed as a rule contributes no figure', () {
      // "Two months' rent" before a rent is agreed is a rule, not a number. Rendering it as
      // KES 0 would be a price nobody quoted.
      final d = VacantHouseDetailModel.fromJson({
        ...detail,
        'moveInCosts': [
          {'name': 'Rent deposit', 'amount': null, 'refundable': true, 'months': 2},
        ],
      });

      expect(d.totalMoveInCost, 0);
      expect(d.moveInCosts.single.amount, isNull);
      expect(d.moveInCosts.single.months, 2);
    });

    test('contact details come through, which they did not before', () {
      final d = VacantHouseDetailModel.fromJson(detail);

      expect(d.hasContact, isTrue);
      expect(d.contactPhone, '254700111222');
    });
  });

  test('the filters arrive as one shape with counts on each choice', () {
    final f = ListingFilters.fromJson(const {
      'categories': [
        {'value': 'TWO_BED', 'label': 'Two Bedroom', 'count': 3},
      ],
      'areas': [
        {'value': 'Kilimani', 'label': 'Kilimani', 'count': 5},
      ],
      'minRent': 20000,
      'maxRent': 120000,
      'maxBedrooms': 4,
      'total': 8,
    });

    // The app asked for /filters/categories and /filters/house-types. There is one endpoint, and
    // it offers areas rather than house types.
    expect(f.categories.single.count, 3);
    expect(f.areas.single.label, 'Kilimani');
    expect(f.total, 8);
  });
}
