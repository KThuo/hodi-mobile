import 'package:flutter_test/flutter_test.dart';
import 'package:hodi_mobile/features/invoices/domain/invoice_detail_model.dart';
import 'package:hodi_mobile/features/invoices/domain/invoice_model.dart';
import 'package:hodi_mobile/features/invoices/domain/payment_type_model.dart';

/// Reading an invoice off the rebuilt API.
///
/// Legacy called the whole bill `rentOwed` and what had been received `rentPaid`, and the detail
/// spelt the same money `invoiceAmount`. Renaming across three shapes is where a figure quietly ends
/// up in the wrong box, so every sample value below is different.
void main() {
  // The shape of InvoiceModels.InvoiceRow.
  const row = <String, dynamic>{
    'id': 'MqemPV9ynW',
    'rrn': 'HPABACMLPVNH',
    'invoiceType': 'Rent',
    'status': 1,
    'statusLabel': 'Partially Paid',
    'periodLabel': 'September 2026',
    'periodMonth': 9,
    'periodYear': 2026,
    'tenantName': 'Test Onboard',
    'tenantPhone': '254700111222',
    'houseCode': 'B4',
    'houseNumber': 'K04',
    'houseLabel': 'K04 (Ground Floor)',
    'propertyName': 'Kilimani Heights',
    'estateName': 'Kilimani',
    'amount': 146500,
    'paidAmount': 46500,
    'outstanding': 100000,
    'dueDate': '2026-09-05',
    'overdue': true,
    'occupationId': 'p8bP5wdv5a',
    'houseId': 'ErqPNp7v5p',
  };

  group('the list row', () {
    test('the three money figures stay apart', () {
      final invoice = InvoiceModel.fromJson(row);

      expect(invoice.amount, 146500);
      expect(invoice.paidAmount, 46500);
      expect(invoice.outstanding, 100000);
    });

    test('what is owed is the server\'s figure, not a subtraction', () {
      // Owed-minus-paid is the same number until it is not: a voided invoice owes nothing whatever
      // its amount says, and subtracting here would show the whole sum as still due.
      final voided = InvoiceModel.fromJson({...row, 'status': 4, 'outstanding': 0});

      expect(voided.balance, 0);
      expect(voided.isVoided, isTrue);
      expect(voided.amount, 146500, reason: 'the bill still says what it said');
    });

    test('the unit reads as somebody would say it', () {
      expect(InvoiceModel.fromJson(row).unitLabel, 'K04 (Ground Floor)');
      // No spoken label: fall back to the code rather than showing nothing.
      expect(InvoiceModel.fromJson({...row, 'houseLabel': null}).unitLabel, 'B4');
    });

    test('ids are opaque strings, not numbers', () {
      final invoice = InvoiceModel.fromJson(row);

      expect(invoice.id, 'MqemPV9ynW');
      expect(invoice.occupationId, 'p8bP5wdv5a');
    });
  });

  group('the detail', () {
    const detail = <String, dynamic>{
      'invoice': row,
      'lines': [
        {'kind': 'RENT', 'description': 'Rent for September 2026', 'amount': 47000},
        {'kind': 'UTILITY', 'description': 'Rent Deposit (2 months)', 'amount': 94000},
        {'kind': 'METERED', 'description': 'Water', 'quantity': 42, 'unitAmount': 120, 'amount': 5040},
      ],
      'broughtForward': 460,
      'totalPayable': 100000,
      'paymentInstructions': 'Paybill 123456',
      'footer': 'Thank you',
    };

    test('it nests the same row the list is built from', () {
      final d = InvoiceDetailModel.fromJson(detail);

      expect(d.invoice.rrn, 'HPABACMLPVNH');
      expect(d.invoice.amount, 146500);
      expect(d.rrn, 'HPABACMLPVNH');
    });

    test('brought forward is stated, because the lines do not add up to the total without it', () {
      final d = InvoiceDetailModel.fromJson(detail);
      final lines = d.lines.fold<double>(0, (sum, l) => sum + l.amount);

      expect(d.broughtForward, 460);
      expect(lines, isNot(d.invoice.amount),
          reason: 'a screen adding the lines and expecting the total would look like a maths bug');
    });

    test('a metered line keeps its working', () {
      final metered = InvoiceDetailModel.fromJson(detail).lines.last;

      expect(metered.hasWorking, isTrue);
      expect(metered.quantity, 42);
      expect(metered.unitAmount, 120);
      // Rent has no quantity, so it must not claim to show working.
      expect(InvoiceDetailModel.fromJson(detail).lines.first.hasWorking, isFalse);
    });
  });

  group('how it may be paid', () {
    test('a prompt is told apart by what the server says, not by an id', () {
      // Legacy decided this with `typeId == '12'`. A channel the app had not memorised read
      // "Unknown" and rendered the wrong form.
      final stk = PaymentTypeModel.fromJson(
          {'id': 'aBc', 'name': 'M-PESA', 'renderAs': 'STK'});
      final cash = PaymentTypeModel.fromJson(
          {'id': 'dEf', 'name': 'Cash', 'renderAs': 'CASH'});

      expect(stk.isPrompt, isTrue);
      expect(cash.isPrompt, isFalse);
      expect(stk.displayName, 'M-PESA');
    });

    test('a paybill reads as a line somebody can follow down a phone', () {
      final bank = PaymentTypeModel.fromJson({
        'id': 'gHi',
        'name': 'Equity',
        'renderAs': 'VALIDATE',
        'payBillNo': '247247',
        'accountNo': 'B4-0925',
      });

      expect(bank.accountLine, 'Paybill 247247 · Acct B4-0925');
      expect(bank.isTransfer, isTrue);
    });

    test('a channel with no paybill offers no line rather than a half one', () {
      expect(PaymentTypeModel.fromJson({'renderAs': 'CASH'}).accountLine, isNull);
    });
  });
}
