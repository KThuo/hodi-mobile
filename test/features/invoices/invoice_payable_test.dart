import 'package:flutter_test/flutter_test.dart';
import 'package:hodi_mobile/features/invoices/domain/invoice_detail_model.dart';

/// What an invoice still owes, which is not what it was raised for.
///
/// `Invoice.totalPayable()` on the server is `return amount;` — the face value. Its own comment
/// explains why: arrears are a line on the invoice and already inside the amount, so the amount
/// and the total must not be two answers to one question.
///
/// This model documented that field as "the amount less what has been paid" and built `balance`
/// on it, preferring it whenever it was non-zero — which is always, for a real invoice. So the
/// fallback never ran, and every caller asking what was still owed got the original total. The
/// payment sheet opened prefilled with the whole bill for a tenant who had paid most of it.
void main() {
  const partlyPaid = <String, dynamic>{
    'invoice': {
      'id': 'MqemPV9ynW',
      'rrn': 'HPABACMLPVNH',
      'status': 1,
      'statusLabel': 'Partially Paid',
      'tenantName': 'Test Onboard',
      'houseCode': 'B4',
      'amount': 146500,
      'paidAmount': 46500,
      'outstanding': 100000,
      'dueDate': '2026-09-05',
    },
    'lines': <dynamic>[],
    'broughtForward': 0,
    // The face value, as the server sends it. Not the remainder.
    'totalPayable': 146500,
  };

  test('the balance is what is left, not what was raised', () {
    final read = InvoiceDetailModel.fromJson(partlyPaid);

    expect(read.balance, 100000);
    expect(read.totalPayable, 146500, reason: 'still carried, still the face value');
  });

  test('a fully paid invoice owes nothing', () {
    final settled = InvoiceDetailModel.fromJson({
      ...partlyPaid,
      'invoice': {
        ...(partlyPaid['invoice']! as Map).cast<String, dynamic>(),
        'status': 2,
        'statusLabel': 'Paid',
        'paidAmount': 146500,
        'outstanding': 0,
      },
    });

    // The old getter returned 146,500 here — it preferred totalPayable, which never changes.
    expect(settled.balance, 0);
    expect(settled.isPaid, isTrue);
  });

  test('an untouched invoice owes the whole of it', () {
    final fresh = InvoiceDetailModel.fromJson({
      ...partlyPaid,
      'invoice': {
        ...(partlyPaid['invoice']! as Map).cast<String, dynamic>(),
        'status': 0,
        'statusLabel': 'Unpaid',
        'paidAmount': 0,
        'outstanding': 146500,
      },
    });

    // The case that hid the bug: when nothing has been paid the two figures agree.
    expect(fresh.balance, 146500);
  });
}
