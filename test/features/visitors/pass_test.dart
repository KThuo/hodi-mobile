import 'package:flutter_test/flutter_test.dart';
import 'package:hodi_mobile/features/visitors/domain/pass_code.dart';
import 'package:hodi_mobile/features/visitors/domain/pass_model.dart';

void main() {
  group('the QR on a pass', () {
    test('carries the code without its dash, behind the prefix', () {
      expect(passQrData('7K2M9-XQ4TB'), 'HODIPASS:7K2M9XQ4TB');
    });

    test('reads back what it wrote, in either case', () {
      expect(passCodeFromScan(passQrData('7K2M9-XQ4TB')), '7K2M9XQ4TB');
      expect(passCodeFromScan('hodipass:7k2m9-xq4tb'), '7K2M9XQ4TB');
    });

    test('is not fooled by other QR codes', () {
      expect(passCodeFromScan('https://example.invalid/pay?x=1'), isNull);
      expect(passCodeFromScan('HODIPASS:'), isNull);
      expect(passCodeFromScan(null), isNull);
    });
  });

  group('a pass from the server', () {
    final json = {
      'id': 'p1',
      'passCode': '7K2M9-XQ4TB',
      'state': 'VALID',
      'stateLabel': 'Valid today',
      'validFrom': '2026-10-18',
      'validUntil': '2026-10-18',
      'visitorName': 'Visitor One',
      'visitorPhone': '0700000000',
      'visitorCount': 3,
      'vehicleReg': 'KAA123A',
      'purpose': 'SOCIAL',
      'propertyName': 'Test Court',
      'houseId': 'h1',
      'unitLabel': 'M08 (Second Floor)',
      'tenantName': 'Test Host',
      'admissions': 0,
      'admissible': true,
    };

    test('parses, and says where in one line', () {
      final pass = PassModel.fromJson(json);
      expect(pass.admissible, isTrue);
      expect(pass.current, isTrue);
      expect(pass.visitorCount, 3);
      expect(pass.where, 'Test Court · M08 (Second Floor)');
    });

    test('a cancelled pass is not current', () {
      final pass = PassModel.fromJson({...json, 'state': 'CANCELLED', 'admissible': false});
      expect(pass.cancelled, isTrue);
      expect(pass.current, isFalse);
    });
  });
}
