import 'package:flutter_test/flutter_test.dart';
import 'package:hodi_mobile/features/properties/domain/property_detail_model.dart';
import 'package:hodi_mobile/features/properties/domain/property_model.dart';
import 'package:hodi_mobile/features/properties/domain/property_report_model.dart';

/// Reading a property off the rebuilt API.
///
/// The interesting change here is not the id — it is that **the money left**. The legacy detail
/// endpoint carried collections, arrears and a `period` parameter to move them a month either
/// way. `PropertyDetail` carries none of it and `PropertyController` takes no such parameter: a
/// property's month is a report now, projected over invoices, payments and expenses rather than
/// stored, which is why it reconciles with them.
void main() {
  // The shape of TenancyModels.PropertySummary.
  const row = <String, dynamic>{
    'id': 'ErqPNp7v5p',
    'name': 'Kilimani Heights',
    'estateId': 'p8bP5wdv5a',
    'estateName': 'Kilimani',
    'location': 'Ngong Road',
    'contactName': 'Jane Mwangi',
    'phone': '254700111222',
    'email': 'jane@example.invalid',
    'floors': 6,
    'units': 24,
    'occupiedUnits': 19,
    'vacantUnits': 5,
    'invoiceGenerationDay': 1,
    'commission': 7.5,
    'bankId': 'bnk001',
    'bankName': 'Test Bank',
    'status': 1,
    'createdOn': '2026-01-04T09:12:00Z',
  };

  group('the list row', () {
    test('every id is an opaque string', () {
      final property = PropertyModel.fromJson(row);

      expect(property.id, 'ErqPNp7v5p');
      expect(property.estateId, 'p8bP5wdv5a');
      expect(property.bankId, 'bnk001');
    });

    test('vacant is the server\'s count, not a subtraction', () {
      // The old model had no vacantUnits and derived it. Same answer here, and it stops being the
      // same answer the moment a unit is deleted but still counted somewhere.
      expect(PropertyModel.fromJson(row).vacant, 5);
    });

    test('occupied units are sent under their own name', () {
      // Legacy called this 'occupied'. Reading the wrong key gave every property nought occupied
      // and so an occupancy rate of nought.
      expect(PropertyModel.fromJson(row).occupiedUnits, 19);
      expect(PropertyModel.fromJson(row).occupancyRate, closeTo(79.16, 0.01));
    });
  });

  group('the detail', () {
    // The shape of TenancyDetails.PropertyDetail.
    const detail = <String, dynamic>{
      'id': 'ErqPNp7v5p',
      'name': 'Kilimani Heights',
      'estateId': 'p8bP5wdv5a',
      'estateName': 'Kilimani',
      'location': 'Ngong Road',
      'latitude': -1.2921,
      'longitude': 36.8219,
      'floors': 6,
      'basementFloors': 1,
      'hasMezzanine': true,
      'tenancyCount': 18,
      'contactName': 'Jane Mwangi',
      'phone': '254700111222',
      'email': 'jane@example.invalid',
      'bankId': 'bnk001',
      'bankName': 'Test Bank',
      'commission': 7.5,
      'invoiceGenerationDay': 1,
      'expenseGenerationDay': 3,
      'paymentInstructions': 'Paybill 123456',
      'invoiceFooter': null,
      'tenantCanViewLease': true,
      'leaseCoversOwned': false,
      'defaultNoticeDays': 60,
      'shortNoticePenalty': 'NONE',
      'shortNoticePenaltyAmount': null,
      'units': 24,
      'occupiedUnits': 19,
      'vacantUnits': 5,
      'status': 1,
      'createdOn': '2026-01-04T09:12:00Z',
      'tenures': ['RENTAL', 'BNB'],
      'tenureMix': [
        {'tenure': 'RENTAL', 'units': 20, 'occupied': 17},
        {'tenure': 'BNB', 'units': 4, 'occupied': 2},
      ],
      'categories': [
        {'id': 'c1', 'label': 'Two Bedroom', 'note': '12 units', 'icon': null},
      ],
      'features': [
        {'id': 'f1', 'label': 'Lift', 'note': null, 'icon': 'lift'},
      ],
      'caretakers': [
        {'id': 'u1', 'label': 'Peter Otieno', 'note': '254700333444', 'icon': null},
      ],
      'pending': ['collections', 'arrears'],
    };

    test('tenancies are counted separately from occupied units', () {
      final property = PropertyDetailModel.fromJson(detail);

      // They agree in practice and are not the same thing: a unit is flagged occupied, a tenancy
      // is a person with terms and a balance. A tab labelled Tenants must count tenants.
      expect(property.occupiedUnits, 19);
      expect(property.tenancyCount, 18);
    });

    test('the chips arrive as ids and labels', () {
      final property = PropertyDetailModel.fromJson(detail);

      expect(property.categories.single.label, 'Two Bedroom');
      expect(property.categories.single.note, '12 units');
      expect(property.caretakers.single.label, 'Peter Otieno');
      expect(property.features.single.icon, 'lift');
    });

    test('the tenure mix adds up to the units', () {
      final property = PropertyDetailModel.fromJson(detail);
      final mixed = property.tenureMix.fold(0, (sum, t) => sum + t.units);

      expect(mixed, property.units);
    });

    test('status is an integer, and 1 is the live one', () {
      // Not a word any more. 2 is DELETED here — and also PAID on an invoice, which is why this
      // is read as a record lifecycle rather than as a bare number somewhere else.
      expect(PropertyDetailModel.fromJson(detail).status, 1);
      expect(PropertyDetailModel.fromJson({...detail, 'status': 2}).status, 2);
    });
  });

  group('the month', () {
    // The shape of AnalyticsModels.PropertyReportRow, which is where the money went.
    const report = <String, dynamic>{
      'id': 'ErqPNp7v5p',
      'propertyName': 'Kilimani Heights',
      'estateId': 'p8bP5wdv5a',
      'estateName': 'Kilimani',
      'totalUnits': 24,
      'occupiedUnits': 19,
      'periodYear': 2026,
      'periodMonth': 8,
      'invoiceAmount': 1_020_800,
      'chargedAmount': 500_000,
      'rentAmount': 380_000,
      'serviceChargeAmount': 0,
      'utilityAmount': 90_000,
      'depositAmount': 30_000,
      'broughtForwardAmount': 672_600,
      'invoiceCount': 19,
      'paymentAmount': 810_000,
      'paymentCount': 22,
      'openingArrears': 672_600,
      'closingArrears': 210_800,
      'overpaymentAmount': 22_700,
      'totalCredit': 800_700,
      'topupAmount': 18_000,
      'cumulativeCredit': 140,
      'clearedAmount': 470_000,
      'forfeitedAmount': 0,
      'expenseAmount': 120_000,
      'expenseCount': 7,
      'commissionAmount': 60_750,
      'commissionPercent': 7.5,
      'netIncome': 690_000,
      'creditsAndAdjustments': -151_800,
    };

    test('invoiced, charged and brought forward close', () {
      final month = PropertyReportModel.fromJson(report);

      // The server computes creditsAndAdjustments as the remainder precisely so this holds, and
      // goes on holding when somebody adds an invoice line kind.
      expect(
        month.chargedAmount + month.broughtForwardAmount + month.creditsAndAdjustments,
        month.invoiceAmount,
      );
    });

    test('rent is the rent, not the whole charge', () {
      final month = PropertyReportModel.fromJson(report);

      // The legacy report labelled the charge "Rent" and put "Utilities" beside it, which read as
      // two siblings when the second is inside the first.
      expect(month.rentAmount, lessThan(month.chargedAmount));
      expect(month.utilityAmount, 90_000);
    });

    test('credit arising and credit held are different figures', () {
      final month = PropertyReportModel.fromJson(report);

      // 22,700 arose in the period; 140 is still held at the end of it; 800,700 is every
      // unallocated payment standing today. Three numbers, and none of them substitutes.
      expect(month.overpaymentAmount, 22_700);
      expect(month.cumulativeCredit, 140);
    });

    test('no commission line is not a commission of nought', () {
      final unbilled =
          PropertyReportModel.fromJson({...report, 'commissionAmount': null, 'commissionPercent': null});

      expect(unbilled.commissionAmount, isNull);
      expect(PropertyReportModel.fromJson(report).commissionAmount, 60_750);
    });

    test('collection is measured against what was asked for', () {
      final month = PropertyReportModel.fromJson(report);

      // Against invoiced, arrears included, because those are what is being chased. Against
      // charged alone a property settling its carried arrears reads as collecting over 100%.
      expect(month.collectionPercentage, closeTo(79.35, 0.01));
    });
  });
}
