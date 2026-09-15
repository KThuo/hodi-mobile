import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/utils/json_parsers.dart';
import 'payment_model.dart';

part 'payment_detail_model.freezed.dart';
part 'payment_detail_model.g.dart';

/// One receipt, with what it paid — `PaymentDetail` on the server.
///
/// Nests the row rather than restating it, as the invoice detail does. `payment` here is the same
/// [PaymentModel] the list is built from, so there is one definition of a receipt and the detail
/// adds only what a detail has: which invoices the money went against, and the contact details a
/// printed receipt carries.
@freezed
abstract class PaymentDetailModel with _$PaymentDetailModel {
  const PaymentDetailModel._();

  const factory PaymentDetailModel({
    required PaymentModel payment,

    /// Which invoices this money was put against, and how much went to each.
    ///
    /// Legacy called these `bills` and they were the invoice's charge lines — a different thing
    /// entirely. These are allocations: one payment across possibly several months.
    @Default([]) List<PaymentAllocation> allocations,
    String? tenantPhone,
    String? tenantEmail,
    String? propertyLocation,
    String? voidReason,
    String? voidedBy,
    String? voidedOn,
  }) = _PaymentDetailModel;

  factory PaymentDetailModel.fromJson(Map<String, dynamic> json) =>
      _$PaymentDetailModelFromJson(json);

  String? get rrn => payment.rrn;

  bool get isVoided => payment.isVoided;

  /// What the allocations account for. Compared against the payment's own amount, the difference is
  /// [PaymentModel.unallocated] — and a receipt that cannot explain where its money went is the one
  /// thing a tenant will ask about.
  double get allocated =>
      allocations.fold<double>(0, (sum, a) => sum + a.amount);
}

/// One invoice this payment was put against.
@freezed
abstract class PaymentAllocation with _$PaymentAllocation {
  const PaymentAllocation._();

  const factory PaymentAllocation({
    String? invoiceId,
    String? invoiceRrn,
    String? periodLabel,

    /// What that invoice came to in total — context for the part of it this payment covered.
    @JsonKey(fromJson: parseDouble) @Default(0) double invoiceAmount,

    /// How much of this payment went to it.
    @JsonKey(fromJson: parseDouble) @Default(0) double amount,
  }) = _PaymentAllocation;

  factory PaymentAllocation.fromJson(Map<String, dynamic> json) =>
      _$PaymentAllocationFromJson(json);

  /// Whether this payment settled that invoice outright, or only part of it.
  bool get settlesIt => invoiceAmount > 0 && amount >= invoiceAmount;
}
