import 'package:flutter_test/flutter_test.dart';
import 'package:hodi_mobile/features/visitors/domain/visit_model.dart';

/// Somebody at the gate.
///
/// The thing this model must not get wrong is the identity number. `idNumber` arrives already
/// masked and the real one is behind its own authority — so nothing here should ever be mistaken
/// for the document number itself, and `hasIdNumber` is the question a gate is actually asking.
void main() {
  const row = <String, dynamic>{
    'id': 'MqemPV9ynW',
    'visitRef': 'V-000188',
    'propertyName': 'Kilimani Heights',
    'houseCode': 'B4',
    'houseNumber': 'K04',
    'unitLabel': 'K04 (Ground Floor)',
    'tenantName': 'Test Onboard',
    'visitorName': 'Amina Yusuf',
    'visitorPhone': '254700111222',
    'idType': 'National ID',
    'idNumber': '****5678',
    'hasIdNumber': true,
    'visitorCount': 2,
    'vehicleReg': 'KDA 123X',
    'vehicleMake': 'Toyota',
    'vehicleColour': 'White',
    'purpose': 'GUEST',
    'purposeNotes': 'Visiting for the afternoon',
    'checkedInOn': '2026-09-17T09:14:00Z',
    'checkedOutOn': null,
    'onSiteFor': '2 hours',
    'onSite': true,
    'approvalStatus': 'PENDING',
    'status': 1,
  };

  test('the id number is whatever the server masked, and nothing more', () {
    final v = VisitModel.fromJson(row);

    // The real one lives behind ROLE_VISIT_REVEAL and this app never asks for it.
    expect(v.idNumber, '****5678');
    expect(v.hasIdNumber, isTrue);
  });

  test('no identification taken is a different answer from a masked one', () {
    final v = VisitModel.fromJson(
      {...row, 'idNumber': null, 'hasIdNumber': false, 'idType': null},
    );

    expect(v.hasIdNumber, isFalse);
    expect(v.idNumber, isNull);
  });

  group('the decision', () {
    test('pending is the state the screen exists for', () {
      final v = VisitModel.fromJson(row);

      expect(v.awaitingDecision, isTrue);
      expect(v.approved, isFalse);
      expect(v.rejected, isFalse);
    });

    test('approved and refused are told apart', () {
      expect(
        VisitModel.fromJson({...row, 'approvalStatus': 'APPROVED'}).approved,
        isTrue,
      );
      expect(
        VisitModel.fromJson({...row, 'approvalStatus': 'REJECTED'}).rejected,
        isTrue,
      );
    });

    test('a visit needing no approval is not waiting on anybody', () {
      final v = VisitModel.fromJson({...row, 'approvalStatus': 'NOT_REQUIRED'});

      expect(v.awaitingDecision, isFalse);
      expect(v.approved, isFalse);
    });
  });

  group('what the card reads out', () {
    test('the unit prefers the composed label', () {
      expect(VisitModel.fromJson(row).unit, 'K04 (Ground Floor)');
      expect(
        VisitModel.fromJson({...row, 'unitLabel': null}).unit,
        'K04',
      );
      expect(
        VisitModel.fromJson({...row, 'unitLabel': null, 'houseNumber': null}).unit,
        'B4',
      );
    });

    test('the vehicle leads with the plate', () {
      // A gate reads the registration first and the rest only to confirm it.
      expect(VisitModel.fromJson(row).vehicle, 'KDA 123X · White Toyota');
      expect(
        VisitModel.fromJson({...row, 'vehicleMake': null, 'vehicleColour': null})
            .vehicle,
        'KDA 123X',
      );
    });

    test('no vehicle says nothing rather than an empty line', () {
      expect(VisitModel.fromJson({...row, 'vehicleReg': null}).vehicle, isNull);
    });

    test('a party is named only when it is more than one', () {
      expect(VisitModel.fromJson(row).partyLabel, '2 people');
      // One visitor is what a row already implies.
      expect(VisitModel.fromJson({...row, 'visitorCount': 1}).partyLabel, isNull);
    });
  });

  test('the summary counts read as nought rather than missing', () {
    expect(OnSiteSummaryModel.fromJson(const {}).awaitingApproval, 0);
    expect(
      OnSiteSummaryModel.fromJson(const {'onSite': 5, 'awaitingApproval': 2})
          .awaitingApproval,
      2,
    );
  });
}
