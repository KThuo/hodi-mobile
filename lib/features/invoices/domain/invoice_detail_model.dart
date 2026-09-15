import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/utils/json_parsers.dart';
import 'invoice_model.dart';

part 'invoice_detail_model.freezed.dart';
part 'invoice_detail_model.g.dart';

/// One invoice, with its lines — `InvoiceDetail` on the server.
///
/// ## It nests the row rather than repeating it
///
/// The server returns `{invoice, lines, broughtForward, totalPayable, …}`, where `invoice` is the
/// very same `InvoiceRow` the list is built from. Legacy flattened the two into one object with its
/// own spelling of every field, so the list said `rentOwed` and the detail said `invoiceAmount` for
/// the same money, and a change to one shape never reached the other.
///
/// Keeping the nesting means [invoice] is the same [InvoiceModel] the list row uses — one definition
/// of what an invoice is, and the detail screen adds only what a detail has: the lines, what was
/// carried forward, and the words printed at the foot of the document.
@freezed
abstract class InvoiceDetailModel with _$InvoiceDetailModel {
  const InvoiceDetailModel._();

  const factory InvoiceDetailModel({
    required InvoiceModel invoice,
    @Default([]) List<InvoiceLineItem> lines,

    /// Arrears carried into this invoice from earlier periods.
    ///
    /// Inside [InvoiceModel.amount] and outside the sum of [lines], which is why it is stated
    /// separately: a detail screen that added the lines and expected the total would be short by
    /// exactly this, and would look like an arithmetic bug rather than a brought-forward balance.
    @JsonKey(fromJson: parseDouble) @Default(0) double broughtForward,

    /// What is actually due — the amount less what has been paid.
    @JsonKey(fromJson: parseDouble) @Default(0) double totalPayable,
    String? voidReason,
    String? voidedBy,
    String? voidedOn,

    /// How to pay, and the footer — both resolved server-side from the property and the estate, so
    /// a document the app renders says what the printed one says.
    String? paymentInstructions,
    String? footer,
  }) = _InvoiceDetailModel;

  factory InvoiceDetailModel.fromJson(Map<String, dynamic> json) =>
      _$InvoiceDetailModelFromJson(json);

  String? get rrn => invoice.rrn;

  bool get isPaid => invoice.isPaid;

  bool get isVoided => invoice.isVoided;

  /// What is still owed. [totalPayable] where the server sent one, the row's own figure otherwise.
  double get balance => totalPayable != 0 ? totalPayable : invoice.outstanding;
}

/// One line on the document.
@freezed
abstract class InvoiceLineItem with _$InvoiceLineItem {
  const InvoiceLineItem._();

  const factory InvoiceLineItem({
    /// `RENT`, `UTILITY`, `METERED`, `BROUGHT_FORWARD` — what sort of charge this is.
    String? kind,
    String? description,
    @JsonKey(fromJson: parseDouble) @Default(0) double quantity,
    @JsonKey(fromJson: parseDouble) @Default(0) double unitAmount,
    @JsonKey(fromJson: parseDouble) @Default(0) double amount,
  }) = _InvoiceLineItem;

  factory InvoiceLineItem.fromJson(Map<String, dynamic> json) =>
      _$InvoiceLineItemFromJson(json);

  /// What to print. The description, with the working shown where a line has one — a metered charge
  /// reads "42 units × KES 120" rather than asking somebody to divide.
  String get narration => description ?? '';

  bool get hasWorking => quantity > 0 && unitAmount > 0;
}
