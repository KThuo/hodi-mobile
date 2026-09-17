import 'package:flutter_test/flutter_test.dart';
import 'package:hodi_mobile/features/invoices/domain/invoice_document_model.dart';

/// The invoice as a document — `/invoices/detail/{rrn}`, which is the read the web's invoice page
/// is built from and the one the app should have been using all along.
///
/// The app read `/invoices/reference/{rrn}` instead, which carries the ids an action needs and no
/// payments at all. So a part-paid invoice showed its face value with no sign of the money already
/// sent against it, and the fix looked like it needed a backend change until somebody checked what
/// the browser was calling.
void main() {
  const document = <String, dynamic>{
    'rrn': 'HPABACMLPVNH',
    'invoiceType': 'Rent',
    'statusLabel': 'Partially Paid',
    'periodLabel': 'September 2026',
    'tenantName': 'Test Onboard',
    'tenantPhone': '254700111222',
    'houseLabel': 'K04 (Ground Floor)',
    'houseCode': 'B4',
    'propertyName': 'Kilimani Heights',
    'estateName': 'Kilimani',
    'propertyLocation': 'Ngong Road',
    'lines': [
      {'kind': 'RENT', 'description': 'Rent', 'quantity': 0, 'unitAmount': 0, 'amount': 120000},
      {'kind': 'METERED', 'description': 'Water', 'quantity': 42, 'unitAmount': 120, 'amount': 5040},
    ],
    'payments': [
      {'narration': 'Payment on 27-08-2026 11:13 - UHR0Y46U0Q via Coop STK Push', 'amount': 30000},
      {'narration': 'Cash at office', 'amount': 16500},
    ],
    'amount': 146500,
    'paidAmount': 46500,
    'balanceDue': 100000,
    'dueDate': '2026-09-05',
    'issuedOn': '2026-09-01T06:00:00Z',
    'overdue': true,
    'payable': true,
    'paymentInstructions': 'Paybill 123456, account B4',
    'footer': 'Thank you',
  };

  test('the payments are on the document', () {
    final read = InvoiceDocumentModel.fromJson(document);

    expect(read.payments, hasLength(2));
    expect(read.payments.first.label, contains('Coop STK Push'));
    expect(read.payments.first.amount, 30000);
  });

  test('a payment with no narration still has something to print', () {
    final read = InvoiceDocumentModel.fromJson({
      ...document,
      'payments': [
        {'narration': null, 'amount': 5000},
      ],
    });

    expect(read.payments.single.label, 'Payment');
  });

  test('the balance is the figure to lead with, and the charge is beside it', () {
    final read = InvoiceDocumentModel.fromJson(document);

    // The headline was `amount`, which shouts the original total at somebody who has already paid
    // two thirds of it.
    expect(read.balanceDue, 100000);
    expect(read.amount, 146500);
  });

  test('the rows on screen add up to the balance', () {
    final read = InvoiceDocumentModel.fromJson(document);

    // Charges less payments is the balance, so the document can be checked rather than believed.
    expect(read.paidFromRows, 46500);
    expect(read.amount - read.paidFromRows, read.balanceDue);
  });

  test('paid is summed from the rows, not taken from the separate total', () {
    final read = InvoiceDocumentModel.fromJson(document);

    // They agree here and must be allowed to disagree visibly if an allocation ever goes missing
    // from the list: a total nobody can reproduce from the rows above it is a total that gets
    // queried.
    expect(read.paidFromRows, read.paidAmount);
  });

  test('payable is the server\'s answer, not a status the app re-derives', () {
    expect(InvoiceDocumentModel.fromJson(document).payable, isTrue);
    expect(
      InvoiceDocumentModel.fromJson({...document, 'payable': false}).payable,
      isFalse,
    );
  });

  test('a metered line keeps its working', () {
    final read = InvoiceDocumentModel.fromJson(document);

    expect(read.lines.last.hasWorking, isTrue);
    expect(read.lines.last.quantity, 42);
    expect(read.lines.last.unitAmount, 120);
    // A plain rent line has nothing to show.
    expect(read.lines.first.hasWorking, isFalse);
  });

  test('the unit reads as somebody would say it', () {
    expect(InvoiceDocumentModel.fromJson(document).unitLabel, 'K04 (Ground Floor)');
    expect(
      InvoiceDocumentModel.fromJson({...document, 'houseLabel': null}).unitLabel,
      'B4',
    );
  });

  test('an invoice with no payments is not a broken one', () {
    final unpaid = InvoiceDocumentModel.fromJson({
      ...document,
      'payments': <dynamic>[],
      'paidAmount': 0,
      'balanceDue': 146500,
    });

    expect(unpaid.payments, isEmpty);
    expect(unpaid.paidFromRows, 0);
    expect(unpaid.balanceDue, 146500);
  });
}
