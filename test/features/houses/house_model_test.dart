import 'package:flutter_test/flutter_test.dart';
import 'package:hodi_mobile/features/houses/domain/house_detail_model.dart';
import 'package:hodi_mobile/features/houses/domain/house_model.dart';

/// Reading a unit off the rebuilt API.
///
/// These models were the last two left on the legacy shape, and the way they failed is worth
/// keeping a test against: `id` was declared `int`, the server sends a HashId string, and the
/// whole page threw in generated `fromJson` rather than rendering one wrong row. Nothing in
/// `flutter analyze` sees that, which is why it survived a migration that touched everything else.
void main() {
  // The shape of TenancyModels.UnitSummary.
  const row = <String, dynamic>{
    'id': 'qNvA7xKd3m',
    'houseCode': 'B4',
    'houseNumber': 'K04',
    'floor': 1,
    'mezzanine': false,
    'floorLabel': 'First Floor',
    'label': 'K04 (First Floor)',
    'propertyId': 'ErqPNp7v5p',
    'propertyName': 'Kilimani Heights',
    'estateId': 'p8bP5wdv5a',
    'estateName': 'Kilimani',
    'categoryName': 'Two Bedroom',
    'usageClassName': 'Residential',
    'tenure': 'RENTAL',
    'beds': 2,
    'baths': 2,
    'ensuite': 1,
    'dsq': true,
    'parking': 1,
    'squareFt': 850.5,
    'rent': 45000,
    'occupied': true,
    'status': 1,
    'createdOn': '2026-01-04T09:12:00Z',
  };

  group('the list row', () {
    test('every id is an opaque string', () {
      final house = HouseModel.fromJson(row);

      expect(house.id, 'qNvA7xKd3m');
      expect(house.propertyId, 'ErqPNp7v5p');
      expect(house.estateId, 'p8bP5wdv5a');
    });

    test('the unit reads as somebody would say it', () {
      expect(HouseModel.fromJson(row).displayName, 'K04 (First Floor)');
      // No composed label: the code, which every unit has and which is what goes on a payment
      // reference. Never an empty line.
      expect(HouseModel.fromJson({...row, 'label': null}).displayName, 'B4');
    });

    test('the names the legacy model asked for are not the names sent', () {
      final house = HouseModel.fromJson(row);

      // These four arrived under 'property', 'estate', 'category' and 'houseType' before the
      // rebuild. Reading the new spelling is the whole of the fix.
      expect(house.propertyName, 'Kilimani Heights');
      expect(house.estateName, 'Kilimani');
      expect(house.categoryName, 'Two Bedroom');
      expect(house.usageClassName, 'Residential');
    });

    test('an owned unit has no rent, which is not a rent of nought', () {
      final owned = HouseModel.fromJson({...row, 'tenure': 'OWNED', 'rent': null});

      expect(owned.rent, isNull, reason: 'it carries a service charge instead');
      expect(HouseModel.fromJson(row).rent, 45000);
    });

    test('a category with no bedrooms says nothing rather than nought', () {
      final stall = HouseModel.fromJson({...row, 'beds': null, 'baths': null});

      expect(stall.beds, isNull);
      expect(stall.baths, isNull);
    });
  });

  group('the detail', () {
    // The shape of TenancyDetails.UnitDetail. Note what is absent: there is no nested tenant,
    // no rentOwed and no refundableAmount. A tenancy is a separate read.
    const detail = <String, dynamic>{
      'id': 'qNvA7xKd3m',
      'houseCode': 'B4',
      'houseNumber': 'K04',
      'floor': 1,
      'mezzanine': false,
      'floorLabel': 'First Floor',
      'propertyId': 'ErqPNp7v5p',
      'propertyName': 'Kilimani Heights',
      'estateId': 'p8bP5wdv5a',
      'estateName': 'Kilimani',
      'location': 'Ngong Road',
      'categoryName': 'Two Bedroom',
      'usageClassName': 'Residential',
      'tenure': 'RENTAL',
      'beds': 2,
      'baths': 2,
      'ensuite': 1,
      'dsq': false,
      'parking': 1,
      'squareFt': 850.5,
      'rent': 45000,
      'occupied': false,
      'lastOccupied': '2026-03-31',
      'status': 1,
      'createdOn': '2026-01-04T09:12:00Z',
      'features': [
        {'id': 'aa11', 'label': 'Balcony', 'note': null, 'icon': 'balcony'},
        {'id': 'bb22', 'label': 'Borehole', 'note': null, 'icon': null},
      ],
      'pending': ['collections'],
    };

    test('features arrive with the unit, not from a second request', () {
      final unit = HouseDetailModel.fromJson(detail);

      expect(unit.features.map((f) => f.label), ['Balcony', 'Borehole']);
      expect(unit.features.first.icon, 'balcony');
    });

    test('a vacant unit distinguishes never-let from let-and-empty', () {
      expect(HouseDetailModel.fromJson(detail).lastOccupied, '2026-03-31');
      // Null is "never occupied", which reads differently from a date and must not become one.
      expect(
        HouseDetailModel.fromJson({...detail, 'lastOccupied': null}).lastOccupied,
        isNull,
      );
    });

    test('pending names what the server has not computed', () {
      // Sent rather than zeroes: a zero in a money field reads as "nothing owed" when the truth
      // is "not yet computed".
      expect(HouseDetailModel.fromJson(detail).pending, ['collections']);
    });

    test('the floor is words, because the number alone cannot say mezzanine', () {
      final mezzanine = HouseDetailModel.fromJson(
        {...detail, 'floor': 0, 'mezzanine': true, 'floorLabel': 'Mezzanine'},
      );
      final ground = HouseDetailModel.fromJson(
        {...detail, 'floor': 0, 'mezzanine': false, 'floorLabel': 'Ground Floor'},
      );

      expect(mezzanine.floor, ground.floor, reason: 'they share the number');
      expect(mezzanine.floorLabel, 'Mezzanine');
      expect(ground.floorLabel, 'Ground Floor');
    });
  });
}
