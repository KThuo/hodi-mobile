import 'package:flutter_test/flutter_test.dart';
import 'package:hodi_mobile/features/expenses/domain/expense_model.dart';
import 'package:hodi_mobile/features/expenses/providers/expense_providers.dart';

/// What a property cost.
void main() {
  const row = <String, dynamic>{
    'id': 'MqemPV9ynW',
    'reference': 'EX-000231',
    'propertyId': 'ErqPNp7v5p',
    'propertyName': 'Kilimani Heights',
    'estateId': 'est001',
    'estateName': 'Kilimani',
    'name': 'Replacement borehole pump',
    'description': 'Old one seized.',
    'amount': 84500,
    'incurredOn': '2026-09-12',
    'category': 'REPAIR',
    'source': 'MANUAL',
    'sourceRef': null,
    'expenditureId': null,
    'status': 1,
    'createdOn': '2026-09-12T14:00:00Z',
    'createdBy': 'jane',
  };

  test('it reads the row', () {
    final e = ExpenseModel.fromJson(row);

    expect(e.reference, 'EX-000231');
    expect(e.amount, 84500);
    expect(e.categoryLabel, 'Repair');
  });

  group('generated versus typed', () {
    test('one somebody typed can be corrected', () {
      expect(ExpenseModel.fromJson(row).isGenerated, isFalse);
    });

    test('one a standing charge raised cannot', () {
      // Correcting it changes nothing — the charge behind it raises another next month — so the
      // screen sends somebody to the charge rather than offering an edit that does not hold.
      final generated = ExpenseModel.fromJson(
        {...row, 'expenditureId': 'exp99', 'source': 'RECURRING'},
      );

      expect(generated.isGenerated, isTrue);
    });

    test('one raised by a resolved repair is also generated', () {
      final fromJob = ExpenseModel.fromJson(
        {...row, 'source': 'MAINTENANCE', 'sourceRef': 'MR-000412'},
      );

      expect(fromJob.isGenerated, isTrue);
    });
  });

  test('an unknown category still reads as something', () {
    // The server validates against its own list, but a category added there before a release here
    // should render as a word rather than as a blank.
    expect(
      ExpenseModel.fromJson({...row, 'category': 'SOMETHING_NEW'}).categoryLabel,
      'Other',
    );
  });

  test('the categories offered are the ones the server accepts', () {
    // ExpenseRequest.category is validated against RECURRING|REPAIR|REFUND|UTILITY|OTHER. A
    // picker offering anything outside that offers a choice that will be refused.
    expect(
      expenseCategories.map((c) => c.code).toSet(),
      {'RECURRING', 'REPAIR', 'REFUND', 'UTILITY', 'OTHER'},
    );
  });

  test('a standing charge knows whether it is live', () {
    const recurring = <String, dynamic>{
      'id': 'exp99',
      'propertyId': 'ErqPNp7v5p',
      'propertyName': 'Kilimani Heights',
      'name': 'Security',
      'amount': 40000,
      'dayOfMonth': 1,
      'status': 1,
    };

    expect(RecurringExpenseModel.fromJson(recurring).isActive, isTrue);
    expect(
      RecurringExpenseModel.fromJson({...recurring, 'status': 0}).isActive,
      isFalse,
    );
  });
}
