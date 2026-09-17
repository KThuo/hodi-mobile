import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/utils/json_parsers.dart';

part 'invoice_document_model.freezed.dart';
part 'invoice_document_model.g.dart';

/// The invoice as a document — the server's `PublicInvoice`, from `/invoices/detail/{rrn}`.
///
/// ## Why this shape and not the signed-in one
///
/// There are two reads of an invoice and they answer different questions. This one is **the
/// document**: what was charged, what has been paid against it, and what is left. It carries no
/// ids on purpose — its protection is the payload, so a guessed reference reveals only what the
/// tenant already holds on paper — and it needs no session, because the tenant following a link
/// in a rent SMS does not have one.
///
/// `/invoices/reference/{rrn}` is the other read: the ids an action needs, and who voided what.
/// It carries no payments, which is why the app showed a bill with no sign of the money sent
/// against it while the browser showed both.
///
/// `hodi-f`'s `InvoiceDetailPage` already resolved this and the app now does the same thing: the
/// document drives the screen, and the signed-in read is fetched alongside it purely for the ids,
/// tolerating failure. Its comment is the rule worth repeating — *a caretaker opening another
/// property's invoice gets the document but no actions, which is the right answer, not an error.*
@freezed
abstract class InvoiceDocumentModel with _$InvoiceDocumentModel {
  const InvoiceDocumentModel._();

  const factory InvoiceDocumentModel({
    required String rrn,
    String? invoiceType,
    String? statusLabel,
    String? periodLabel,
    String? tenantName,
    String? tenantPhone,
    String? houseLabel,
    String? houseCode,
    String? propertyName,
    String? estateName,
    String? propertyLocation,
    @Default(<InvoiceDocumentLine>[]) List<InvoiceDocumentLine> lines,

    /// What has been paid against it, and when. Listed rather than summed into a single Paid
    /// total, as legacy lists them — "Payment on 27-08-2026 11:13 — UHR0Y46U0Q via Coop STK Push".
    /// Kept out of [lines] because a line is a charge and these are not.
    @Default(<InvoiceDocumentPayment>[]) List<InvoiceDocumentPayment> payments,

    /// The face value: every charge, arrears brought forward included.
    @JsonKey(fromJson: parseDouble) @Default(0) double amount,
    @JsonKey(fromJson: parseDouble) @Default(0) double paidAmount,

    /// What is still owed. The figure this screen leads with.
    @JsonKey(fromJson: parseDouble) @Default(0) double balanceDue,
    String? dueDate,
    String? issuedOn,
    @Default(false) bool overdue,

    /// Whether it can still be paid. The server's own test, which is what the web puts its Pay
    /// button behind — rather than the app deciding from a status integer it would have to keep
    /// in step.
    @Default(false) bool payable,
    String? paymentInstructions,
    String? footer,
  }) = _InvoiceDocumentModel;

  factory InvoiceDocumentModel.fromJson(Map<String, dynamic> json) =>
      _$InvoiceDocumentModelFromJson(json);

  /// The unit as somebody reads it, falling back to the code every invoice has.
  String get unitLabel =>
      (houseLabel?.isNotEmpty ?? false) ? houseLabel! : (houseCode ?? '');

  /// Summed from the rows on screen rather than taken from [paidAmount], so the figure printed
  /// under them is one a reader can reproduce from the rows above it.
  double get paidFromRows => payments.fold(0, (sum, p) => sum + p.amount);
}

/// One charge on the document.
@freezed
abstract class InvoiceDocumentLine with _$InvoiceDocumentLine {
  const InvoiceDocumentLine._();

  const factory InvoiceDocumentLine({
    String? kind,
    String? description,
    @JsonKey(fromJson: parseDouble) @Default(0) double quantity,
    @JsonKey(fromJson: parseDouble) @Default(0) double unitAmount,
    @JsonKey(fromJson: parseDouble) @Default(0) double amount,
  }) = _InvoiceDocumentLine;

  factory InvoiceDocumentLine.fromJson(Map<String, dynamic> json) =>
      _$InvoiceDocumentLineFromJson(json);

  String get narration => description ?? '';

  /// A metered charge shows its working — "42 units × KES 120" — rather than asking somebody to
  /// divide one figure by another to check it.
  bool get hasWorking => quantity > 0 && unitAmount > 0;
}

/// One payment credited to the invoice.
@freezed
abstract class InvoiceDocumentPayment with _$InvoiceDocumentPayment {
  const InvoiceDocumentPayment._();

  const factory InvoiceDocumentPayment({
    String? narration,
    @JsonKey(fromJson: parseDouble) @Default(0) double amount,
  }) = _InvoiceDocumentPayment;

  factory InvoiceDocumentPayment.fromJson(Map<String, dynamic> json) =>
      _$InvoiceDocumentPaymentFromJson(json);

  String get label => (narration?.isNotEmpty ?? false) ? narration! : 'Payment';
}
