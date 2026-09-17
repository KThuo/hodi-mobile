import 'package:flutter_test/flutter_test.dart';
import 'package:hodi_mobile/features/invoices/domain/invoice_detail_model.dart';

/// An invoice is a subtraction, and the screen has to be able to show the working.
///
/// The detail carried charges and a total and nothing else, so a part-paid invoice showed its
/// original face value with no sign of the money already sent against it — and the headline
/// figure was that face value rather than what was actually owed.
void main() {
  const detail = <String, dynamic>{
    'invoice': {
      'id': 'MqemPV9ynW',
      'rrn': 'HPABACMLPVNH',
      'invoiceType': 'Rent',
      'status': 1,
      'statusLabel': 'Partially Paid',
      'periodLabel': 'September 2026',
      'tenantName': 'Test Onboard',
      'houseCode': 'B4',
      'amount': 146500,
      'paidAmount': 46500,
      'outstanding': 100000,
      'dueDate': '2026-09-05',
      'overdue': true,
    },
    'lines': [
      {'kind': 'RENT', 'description': 'Rent', 'amount': 120000},
      {'kind': 'UTILITY', 'description': 'Water', 'amount': 26500},
    ],
    'payments': [
      {'narration': 'M-PESA RJ84KD01', 'amount': 30000},
      {'narration': 'Cash at office', 'amount': 16500},
    ],
    'broughtForward': 0,
    'totalPayable': 100000,
  };

  test('the payments credited to the invoice come through', () {
    final read = InvoiceDetailModel.fromJson(detail);

    expect(read.payments, hasLength(2));
    expect(read.payments.first.label, 'M-PESA RJ84KD01');
    expect(read.payments.first.amount, 30000);
  });

  test('a payment with no narration still has something to print', () {
    final read = InvoiceDetailModel.fromJson({
      ...detail,
      'payments': [
        {'narration': null, 'amount': 5000},
      ],
    });

    expect(read.payments.single.label, 'Payment');
  });

  test('the balance is what is owed, not the face value', () {
    final read = InvoiceDetailModel.fromJson(detail);

    // The headline on the screen. It was `charged`, which shouts the original total at somebody
    // who has already paid two thirds of it.
    expect(read.balance, 100000);
    expect(read.charged, 146500);
  });

  test('the rows add up to the balance', () {
    final read = InvoiceDetailModel.fromJson(detail);

    // Charges less payments is the balance, so a reader can check the document rather than take
    // it on trust. 146,500 - 46,500 = 100,000.
    expect(read.paid, 46500);
    expect(read.charged - read.paid, read.balance);
  });

  test('paid is summed from the lines shown, not read off a separate field', () {
    // The rows on screen have to add up to the figure printed under them. Taking paidAmount from
    // the row instead would let the two disagree whenever an allocation is missing from the list.
    final read = InvoiceDetailModel.fromJson(detail);
    final fromRows = read.payments.fold<double>(0, (s, p) => s + p.amount);

    expect(read.paid, fromRows);
  });

  test('an invoice with no payments is not a broken one', () {
    final unpaid = InvoiceDetailModel.fromJson({
      ...detail,
      'payments': <dynamic>[],
      'totalPayable': 146500,
    });

    expect(unpaid.payments, isEmpty);
    expect(unpaid.paid, 0);
    expect(unpaid.balance, 146500);
  });
}
