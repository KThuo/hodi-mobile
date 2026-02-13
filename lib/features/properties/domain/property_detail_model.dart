import 'package:freezed_annotation/freezed_annotation.dart';

part 'property_detail_model.freezed.dart';
part 'property_detail_model.g.dart';

@freezed
abstract class PropertyDetailModel with _$PropertyDetailModel {
  const PropertyDetailModel._();
  const factory PropertyDetailModel({
    String? name,
    @Default(0) int floors,
    String? status,
    String? estate,
    String? location,
    String? adminMail,
    String? adminPhone,
    @Default(0) int units,
    @Default(0) int occupiedUnits,
    @Default(0) int categories,
    @Default(0) int features,
    @Default(0) double totalCollection,
    @Default(0) double totalExpense,
    @Default(0) double totalInvoiced,
    @Default(0) double totalRent,
    @Default(0) double totalArrears,
    @Default(0) double totalOverpayment,
    @Default(0) double totalTopup,
    @Default(0) double cumulativeOverpayment,
    @Default(0) double chargeableCommission,
    int? invoiceDay,
    int? expenseDay,
    String? monthName,
    int? month,
    int? year,
    String? period,
    String? previousMonthName,
    String? currentMonthName,
    String? nextMonthName,
    String? invoiceFooter,
    String? paymentInstructions,
  }) = _PropertyDetailModel;

  factory PropertyDetailModel.fromJson(Map<String, dynamic> json) =>
      _$PropertyDetailModelFromJson(json);

  int get vacantUnits => units - occupiedUnits;

  double get occupancyRate => units > 0 ? (occupiedUnits / units) * 100 : 0;

  double get paymentOnInvoice => totalCollection - totalOverpayment;

  double get invoiceOverpayment => totalOverpayment - totalTopup;

  double get collectionPercentage =>
      totalInvoiced > 0 ? (paymentOnInvoice / totalInvoiced) * 100 : 0;
}
