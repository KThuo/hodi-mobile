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

    /// What has been paid against this invoice.
    ///
    /// An invoice with a balance is a subtraction, and a document showing only the charges asks
    /// the reader to take the balance on trust. The public document carried these and the
    /// signed-in one did not, so the app could show what was owed and never what had been paid
    /// against it — which is the half somebody is actually checking when they open a bill they
    /// have already sent money for.
    @Default([]) List<InvoicePaymentLine> payments,

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

  /// What the charges come to — the invoice's face value, brought-forward arrears included.
  ///
  /// Named for what it is rather than reused as "the amount". The headline on this screen is the
  /// [balance]; this is the figure it was subtracted from, and the two being one word apart is
  /// how a paid invoice came to shout its original total at somebody who owes nothing.
  double get charged => invoice.amount;

  /// The sum of what has been received. Read off the lines rather than off `paidAmount` so the
  /// rows on screen add up to the figure printed under them — a total nobody can reproduce from
  /// the rows above it is a total that gets queried.
  double get paid => payments.fold(0, (sum, p) => sum + p.amount);
}

/// One payment credited to this invoice.
@freezed
abstract class InvoicePaymentLine with _$InvoicePaymentLine {
  const InvoicePaymentLine._();

  const factory InvoicePaymentLine({
    String? narration,
    @JsonKey(fromJson: parseDouble) @Default(0) double amount,
  }) = _InvoicePaymentLine;

  factory InvoicePaymentLine.fromJson(Map<String, dynamic> json) =>
      _$InvoicePaymentLineFromJson(json);

  String get label => (narration?.isNotEmpty ?? false) ? narration! : 'Payment';
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
