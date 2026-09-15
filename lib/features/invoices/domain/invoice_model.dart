import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/utils/json_parsers.dart';

part 'invoice_model.freezed.dart';
part 'invoice_model.g.dart';

/// One row of the invoice list — `InvoiceRow` on the server.
///
/// ## What changed, and why the names did too
///
/// Legacy called the amount `rentOwed` and what had been received `rentPaid`. Neither was true by
/// the end: an invoice carries service charge, utilities, deposits and penalties as well as rent, so
/// `rentOwed` was the whole bill under a name that claimed otherwise. The server now says [amount],
/// [paidAmount] and [outstanding], and so does this.
///
/// **[outstanding] is sent, not subtracted.** It used to be computed here as owed minus paid, which
/// is the same number until it is not — a voided invoice owes nothing whatever its amount says, and
/// subtracting would have shown the full sum as still due.
@freezed
abstract class InvoiceModel with _$InvoiceModel {
  const InvoiceModel._();

  const factory InvoiceModel({
    /// Hashed and salted per user. Opaque: never parse it, never sort by it.
    String? id,
    String? rrn,
    String? invoiceType,
    @Default(0) int status,

    /// The status in words, from the server. Preferred over reading [status]: the integers are a
    /// storage detail, and `RecordStatus.DELETED` is also 2, which has caught this codebase before.
    String? statusLabel,

    /// "September 2026" — composed by the server so the month's name exists in one language, in one
    /// place, rather than in every client that shows it.
    String? periodLabel,
    @Default(0) int periodMonth,
    @Default(0) int periodYear,
    String? tenantName,
    String? tenantPhone,
    String? houseCode,
    String? houseNumber,

    /// "WA03 (2nd Floor)" — the unit as somebody says it out loud.
    String? houseLabel,
    String? propertyName,
    String? estateName,
    @JsonKey(fromJson: parseDouble) @Default(0) double amount,
    @JsonKey(fromJson: parseDouble) @Default(0) double paidAmount,
    @JsonKey(fromJson: parseDouble) @Default(0) double outstanding,
    String? dueDate,
    String? issuedOn,

    /// When it was settled in full — the date the last payment landed, not the date it was raised.
    /// Null on anything unsettled, and on a few migrated rows whose legacy record named no date.
    String? paidOn,

    /// Past its due date and still owed. What colours the row, and the server's judgement rather
    /// than a date comparison done differently on each client.
    @Default(false) bool overdue,
    String? occupationId,
    String? houseId,
  }) = _InvoiceModel;

  factory InvoiceModel.fromJson(Map<String, dynamic> json) =>
      _$InvoiceModelFromJson(json);

  /// What is still owed. The server's figure, which accounts for voiding.
  double get balance => outstanding;

  bool get isPaid => status == 2;

  bool get isVoided => status == 4;

  /// The unit as it should be read: the spoken label where there is one, the code otherwise.
  String get unitLabel => houseLabel ?? houseCode ?? '';
}
