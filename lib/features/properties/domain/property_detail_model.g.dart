// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'property_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PropertyDetailModel _$PropertyDetailModelFromJson(Map<String, dynamic> json) =>
    _PropertyDetailModel(
      name: json['name'] as String?,
      floors: (json['floors'] as num?)?.toInt() ?? 0,
      status: json['status'] as String?,
      estate: json['estate'] as String?,
      location: json['location'] as String?,
      adminMail: json['adminMail'] as String?,
      adminPhone: json['adminPhone'] as String?,
      units: (json['units'] as num?)?.toInt() ?? 0,
      occupiedUnits: (json['occupiedUnits'] as num?)?.toInt() ?? 0,
      categories: (json['categories'] as num?)?.toInt() ?? 0,
      features: (json['features'] as num?)?.toInt() ?? 0,
      totalCollection: (json['totalCollection'] as num?)?.toDouble() ?? 0,
      totalExpense: (json['totalExpense'] as num?)?.toDouble() ?? 0,
      totalInvoiced: (json['totalInvoiced'] as num?)?.toDouble() ?? 0,
      totalRent: (json['totalRent'] as num?)?.toDouble() ?? 0,
      totalArrears: (json['totalArrears'] as num?)?.toDouble() ?? 0,
      totalOverpayment: (json['totalOverpayment'] as num?)?.toDouble() ?? 0,
      totalTopup: (json['totalTopup'] as num?)?.toDouble() ?? 0,
      cumulativeOverpayment:
          (json['cumulativeOverpayment'] as num?)?.toDouble() ?? 0,
      chargeableCommission:
          (json['chargeableCommission'] as num?)?.toDouble() ?? 0,
      invoiceDay: (json['invoiceDay'] as num?)?.toInt(),
      expenseDay: (json['expenseDay'] as num?)?.toInt(),
      monthName: json['monthName'] as String?,
      month: (json['month'] as num?)?.toInt(),
      year: (json['year'] as num?)?.toInt(),
      period: json['period'] as String?,
      previousMonthName: json['previousMonthName'] as String?,
      currentMonthName: json['currentMonthName'] as String?,
      nextMonthName: json['nextMonthName'] as String?,
      invoiceFooter: json['invoiceFooter'] as String?,
      paymentInstructions: json['paymentInstructions'] as String?,
    );

Map<String, dynamic> _$PropertyDetailModelToJson(
  _PropertyDetailModel instance,
) => <String, dynamic>{
  'name': instance.name,
  'floors': instance.floors,
  'status': instance.status,
  'estate': instance.estate,
  'location': instance.location,
  'adminMail': instance.adminMail,
  'adminPhone': instance.adminPhone,
  'units': instance.units,
  'occupiedUnits': instance.occupiedUnits,
  'categories': instance.categories,
  'features': instance.features,
  'totalCollection': instance.totalCollection,
  'totalExpense': instance.totalExpense,
  'totalInvoiced': instance.totalInvoiced,
  'totalRent': instance.totalRent,
  'totalArrears': instance.totalArrears,
  'totalOverpayment': instance.totalOverpayment,
  'totalTopup': instance.totalTopup,
  'cumulativeOverpayment': instance.cumulativeOverpayment,
  'chargeableCommission': instance.chargeableCommission,
  'invoiceDay': instance.invoiceDay,
  'expenseDay': instance.expenseDay,
  'monthName': instance.monthName,
  'month': instance.month,
  'year': instance.year,
  'period': instance.period,
  'previousMonthName': instance.previousMonthName,
  'currentMonthName': instance.currentMonthName,
  'nextMonthName': instance.nextMonthName,
  'invoiceFooter': instance.invoiceFooter,
  'paymentInstructions': instance.paymentInstructions,
};
