import 'package:flutter_test/flutter_test.dart';
import 'package:hodi_mobile/features/payments/domain/payment_detail_model.dart';
import 'package:hodi_mobile/features/payments/domain/payment_model.dart';

/// Reading a receipt off the rebuilt API.
///
/// The payload below is the shape `/api/v1/payments` actually returned from a running instance.
/// Legacy carried `rentOwed` and `rentPaid` on a *payment*, as though a receipt had an invoice's
/// fields — so the figures below are all different, because that rename is where one ends up in the
/// wrong box.
void main() {
  const row = <String, dynamic>{
    'id': 'Ynw72g9LXQ',
    'rrn': 'PTABACMKBSKN',
    'status': 0,
    'statusLabel': 'Received',
    'method': 'CASH',
    'methodLabel': 'Cash',
    'reference': 'MPX7QK21',
    'tenantName': 'Eric Thuo',
    'paidBy': 'Jane Thuo',
    'payerPhone': '254700111222',
    'houseCode': 'B28',
    'houseLabel': 'B28 (Fourth Floor)',
    'propertyName': 'Coral Apartments',
    'estateName': 'Nyali Ridge',
    'categoryName': 'Two bedroom',
    'amount': 50000,
    'allocatedAmount': 47000,
    'unallocated': 3000,
    'invoiceCount': 1,
    'invoiceRrn': 'HPABACMKBKQZ',
    'receivedOn': '2026-09-14T08:12:00Z',
    'rentOwed': 0,
    'rentOwedBefore': 47000,
    'occupationId': '56NVjLYvnG',
  };

  group('the receipt row', () {
    test('what arrived, what was placed, and what is left over', () {
      final p = PaymentModel.fromJson(row);

      // The three are different questions. A screen showing only `amount` cannot tell a receipt
      // that settled something from one still waiting to.
      expect(p.amount, 50000);
      expect(p.allocatedAmount, 47000);
      expect(p.unallocated, 3000);
      expect(p.hasCredit, isTrue);
    });

    test('the channel is the server\'s wording, not an id the app memorised', () {
      expect(PaymentModel.fromJson(row).channel, 'Cash');
      // No label: fall back to the code rather than showing nothing.
      expect(PaymentModel.fromJson({...row, 'methodLabel': null}).channel, 'CASH');
    });

    test('the balance before and after are both kept', () {
      final p = PaymentModel.fromJson(row);

      // Answering "what do I owe now" from a balance fetched later would show today's figure
      // rather than what this payment left them owing.
      expect(p.rentOwedBefore, 47000);
      expect(p.rentOwed, 0);
    });

    test('a voided receipt says so', () {
      expect(PaymentModel.fromJson({...row, 'status': 4}).isVoided, isTrue);
      expect(PaymentModel.fromJson(row).isVoided, isFalse);
    });

    test('money that found a home leaves no credit', () {
      final exact = PaymentModel.fromJson(
          {...row, 'amount': 47000, 'allocatedAmount': 47000, 'unallocated': 0});

      expect(exact.hasCredit, isFalse);
    });
  });

  group('the detail', () {
    const detail = <String, dynamic>{
      'payment': row,
      'allocations': [
        {
          'invoiceId': 'z8Kyzd8jQD',
          'invoiceRrn': 'HPABACMKBKQZ',
          'periodLabel': 'September 2026',
          'invoiceAmount': 47000,
          'amount': 47000,
        },
      ],
      'tenantPhone': '254700111222',
      'propertyLocation': 'Nyali, Mombasa',
    };

    test('allocations are invoices settled, not charge lines', () {
      final d = PaymentDetailModel.fromJson(detail);

      // Legacy called these `bills` and they were the invoice's charges — a different thing. These
      // say which invoice the money went to, which is what a receipt is for.
      expect(d.allocations, hasLength(1));
      expect(d.allocations.first.invoiceRrn, 'HPABACMKBKQZ');
      expect(d.allocations.first.periodLabel, 'September 2026');
      expect(d.allocations.first.settlesIt, isTrue);
    });

    test('a part payment says so rather than looking like a settlement', () {
      final part = PaymentDetailModel.fromJson({
        ...detail,
        'allocations': [
          {'invoiceRrn': 'HP1', 'periodLabel': 'August 2026', 'invoiceAmount': 47000, 'amount': 20000},
        ],
      });

      expect(part.allocations.first.settlesIt, isFalse);
    });

    test('what the allocations account for is checkable against the amount', () {
      final d = PaymentDetailModel.fromJson(detail);

      // 50,000 arrived, 47,000 was placed. A receipt that cannot explain the difference is the one
      // thing a tenant queries — which is why unallocated is on the document.
      expect(d.allocated, 47000);
      expect(d.payment.amount - d.allocated, d.payment.unallocated);
    });

    test('it nests the same row the list is built from', () {
      expect(PaymentDetailModel.fromJson(detail).rrn, 'PTABACMKBSKN');
    });
  });
}
