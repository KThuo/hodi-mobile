import 'package:freezed_annotation/freezed_annotation.dart';

part 'invoice_model.freezed.dart';
part 'invoice_model.g.dart';

@freezed
abstract class InvoiceModel with _$InvoiceModel {
  const InvoiceModel._();
  const factory InvoiceModel({
    int? id,
    String? rrn,
    String? houseName,
    String? houseCode,
    String? estate,
    String? property,
    String? tenantName,
    String? tenantPhone,
    String? monthName,
    @Default(0) double rentOwed,
    @Default(0) double rentPaid,
    String? category,
    String? houseType,
    String? dueDate,
    String? paidOn,
    String? voidedOn,
    String? status,
    String? overdueEstate,
  }) = _InvoiceModel;

  factory InvoiceModel.fromJson(Map<String, dynamic> json) =>
      _$InvoiceModelFromJson(json);

  double get balance => rentOwed - rentPaid;
  bool get isPaid => status == '2' || (rentOwed > 0 && rentPaid >= rentOwed);
  bool get isVoided => status == '4';
}
