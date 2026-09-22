import 'package:flutter_test/flutter_test.dart';
import 'package:hodi_mobile/features/invoices/domain/slip_result_model.dart';

void main() {
  group('a confirmed slip', () {
    test('carries the channel it turned out to be, not an account', () {
      // The form no longer asks which of an estate's accounts the money went into; the
      // confirmation establishes it. What comes back is the catalogue's name and id.
      final result = SlipResultModel.fromJson({
        'valid': true,
        'message': 'Slip confirmed for 12000.00',
        'statementId': 'aB3xY',
        'reference': 'SJ42KL9QT1',
        'amount': 12000,
        'payerName': 'Jane Mwangi',
        'confirmedBy': 'GATEWAY',
        'paymentTypeId': 'k93mZ',
        'paymentTypeName': 'KCB Till',
      });

      expect(result.valid, isTrue);
      expect(result.amount, 12000);
      expect(result.paymentTypeName, 'KCB Till');
      expect(result.paymentTypeId, 'k93mZ');
    });

    test('a refusal is an answer, not an error', () {
      // The endpoint resolves either way, so the sheet reads `valid` rather than catching.
      final result = SlipResultModel.fromJson({
        'valid': false,
        'message': 'That reference could not be confirmed. Check it and try again.',
      });

      expect(result.valid, isFalse);
      expect(result.message, contains('could not be confirmed'));
      expect(result.amount, isNull);
      expect(result.paymentTypeName, isNull);
    });

    test('an amount arriving as a string is still a number', () {
      // Money crosses as a string from some of these endpoints; a slip whose amount parsed to
      // null would show a confirmation with nothing confirmed.
      expect(SlipResultModel.fromJson({'valid': true, 'amount': '8500.50'}).amount, 8500.50);
    });

    test('a local hit says so, because it means the credit was already here', () {
      expect(
        SlipResultModel.fromJson({'valid': true, 'confirmedBy': 'LOCAL'}).confirmedBy,
        'LOCAL',
      );
    });
  });
}
