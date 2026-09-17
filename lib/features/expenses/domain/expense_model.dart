import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/utils/json_parsers.dart';

part 'expense_model.freezed.dart';
part 'expense_model.g.dart';

/// Money a property cost — the server's `ExpenseRow`.
@freezed
abstract class ExpenseModel with _$ExpenseModel {
  const ExpenseModel._();

  const factory ExpenseModel({
    required String id,
    required String reference,
    String? propertyId,
    String? propertyName,
    String? estateId,
    String? estateName,
    required String name,
    String? description,
    @JsonKey(fromJson: parseDouble) @Default(0) double amount,
    String? incurredOn,

    /// `RECURRING`, `REPAIR`, `REFUND`, `UTILITY`, `OTHER` — the server's own list, which it
    /// validates against a pattern. The app offers exactly these and nothing else.
    required String category,

    /// How it got here. A standing charge generates one; a repair becomes one when it is resolved
    /// and costed; somebody typing it in is the third.
    String? source,
    String? sourceRef,

    /// The standing charge that raised it, where one did.
    String? expenditureId,
    @Default(0) int status,
    String? createdOn,
    String? createdBy,
  }) = _ExpenseModel;

  factory ExpenseModel.fromJson(Map<String, dynamic> json) =>
      _$ExpenseModelFromJson(json);

  /// Whether this was raised by something rather than typed.
  ///
  /// Worth showing, because it is the difference between a line somebody can correct and one that
  /// will come back next month however often it is edited — the standing charge behind it is what
  /// needs changing, and that is a decision made at a desk.
  bool get isGenerated =>
      expenditureId != null || (source != null && source != 'MANUAL');

  String get categoryLabel => switch (category.toUpperCase()) {
        'RECURRING' => 'Recurring',
        'REPAIR' => 'Repair',
        'REFUND' => 'Refund',
        'UTILITY' => 'Utility',
        _ => 'Other',
      };
}

/// A standing charge — the server's `ExpenditureRow`.
///
/// **Read only in this app.** Setting one up decides what a property is billed every month without
/// anybody looking at it again, which is a configuration decision made once at a desk rather than
/// on a handset between other things.
@freezed
abstract class RecurringExpenseModel with _$RecurringExpenseModel {
  const RecurringExpenseModel._();

  const factory RecurringExpenseModel({
    required String id,
    String? propertyId,
    String? propertyName,
    String? estateId,
    String? estateName,
    required String name,
    String? description,
    @JsonKey(fromJson: parseDouble) @Default(0) double amount,

    /// Which day of the month it is raised on.
    int? dayOfMonth,
    @Default(0) int status,
    String? createdOn,
  }) = _RecurringExpenseModel;

  factory RecurringExpenseModel.fromJson(Map<String, dynamic> json) =>
      _$RecurringExpenseModelFromJson(json);

  bool get isActive => status == 1;
}
