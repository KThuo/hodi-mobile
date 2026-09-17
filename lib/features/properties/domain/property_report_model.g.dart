// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'property_report_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PropertyReportModel _$PropertyReportModelFromJson(Map<String, dynamic> json) =>
    _PropertyReportModel(
      id: json['id'] as String,
      propertyName: json['propertyName'] as String?,
      estateId: json['estateId'] as String?,
      estateName: json['estateName'] as String?,
      totalUnits: (json['totalUnits'] as num?)?.toInt() ?? 0,
      occupiedUnits: (json['occupiedUnits'] as num?)?.toInt() ?? 0,
      periodYear: (json['periodYear'] as num?)?.toInt() ?? 0,
      periodMonth: (json['periodMonth'] as num?)?.toInt() ?? 0,
      invoiceAmount: json['invoiceAmount'] == null
          ? 0
          : parseDouble(json['invoiceAmount']),
      chargedAmount: json['chargedAmount'] == null
          ? 0
          : parseDouble(json['chargedAmount']),
      rentAmount: json['rentAmount'] == null
          ? 0
          : parseDouble(json['rentAmount']),
      serviceChargeAmount: json['serviceChargeAmount'] == null
          ? 0
          : parseDouble(json['serviceChargeAmount']),
      utilityAmount: json['utilityAmount'] == null
          ? 0
          : parseDouble(json['utilityAmount']),
      depositAmount: json['depositAmount'] == null
          ? 0
          : parseDouble(json['depositAmount']),
      broughtForwardAmount: json['broughtForwardAmount'] == null
          ? 0
          : parseDouble(json['broughtForwardAmount']),
      invoiceCount: (json['invoiceCount'] as num?)?.toInt() ?? 0,
      paymentAmount: json['paymentAmount'] == null
          ? 0
          : parseDouble(json['paymentAmount']),
      paymentCount: (json['paymentCount'] as num?)?.toInt() ?? 0,
      openingArrears: json['openingArrears'] == null
          ? 0
          : parseDouble(json['openingArrears']),
      closingArrears: json['closingArrears'] == null
          ? 0
          : parseDouble(json['closingArrears']),
      overpaymentAmount: json['overpaymentAmount'] == null
          ? 0
          : parseDouble(json['overpaymentAmount']),
      topupAmount: json['topupAmount'] == null
          ? 0
          : parseDouble(json['topupAmount']),
      cumulativeCredit: json['cumulativeCredit'] == null
          ? 0
          : parseDouble(json['cumulativeCredit']),
      clearedAmount: json['clearedAmount'] == null
          ? 0
          : parseDouble(json['clearedAmount']),
      forfeitedAmount: json['forfeitedAmount'] == null
          ? 0
          : parseDouble(json['forfeitedAmount']),
      expenseAmount: json['expenseAmount'] == null
          ? 0
          : parseDouble(json['expenseAmount']),
      expenseCount: (json['expenseCount'] as num?)?.toInt() ?? 0,
      commissionAmount: parseDoubleNullable(json['commissionAmount']),
      commissionPercent: parseDoubleNullable(json['commissionPercent']),
      netIncome: json['netIncome'] == null ? 0 : parseDouble(json['netIncome']),
      creditsAndAdjustments: json['creditsAndAdjustments'] == null
          ? 0
          : parseDouble(json['creditsAndAdjustments']),
    );

Map<String, dynamic> _$PropertyReportModelToJson(
  _PropertyReportModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'propertyName': instance.propertyName,
  'estateId': instance.estateId,
  'estateName': instance.estateName,
  'totalUnits': instance.totalUnits,
  'occupiedUnits': instance.occupiedUnits,
  'periodYear': instance.periodYear,
  'periodMonth': instance.periodMonth,
  'invoiceAmount': instance.invoiceAmount,
  'chargedAmount': instance.chargedAmount,
  'rentAmount': instance.rentAmount,
  'serviceChargeAmount': instance.serviceChargeAmount,
  'utilityAmount': instance.utilityAmount,
  'depositAmount': instance.depositAmount,
  'broughtForwardAmount': instance.broughtForwardAmount,
  'invoiceCount': instance.invoiceCount,
  'paymentAmount': instance.paymentAmount,
  'paymentCount': instance.paymentCount,
  'openingArrears': instance.openingArrears,
  'closingArrears': instance.closingArrears,
  'overpaymentAmount': instance.overpaymentAmount,
  'topupAmount': instance.topupAmount,
  'cumulativeCredit': instance.cumulativeCredit,
  'clearedAmount': instance.clearedAmount,
  'forfeitedAmount': instance.forfeitedAmount,
  'expenseAmount': instance.expenseAmount,
  'expenseCount': instance.expenseCount,
  'commissionAmount': instance.commissionAmount,
  'commissionPercent': instance.commissionPercent,
  'netIncome': instance.netIncome,
  'creditsAndAdjustments': instance.creditsAndAdjustments,
};

_PropertyReportPageModel _$PropertyReportPageModelFromJson(
  Map<String, dynamic> json,
) => _PropertyReportPageModel(
  content:
      (json['content'] as List<dynamic>?)
          ?.map((e) => PropertyReportModel.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <PropertyReportModel>[],
  page: (json['page'] as num?)?.toInt() ?? 0,
  pageSize: (json['pageSize'] as num?)?.toInt() ?? 0,
  totalElements: (json['totalElements'] as num?)?.toInt() ?? 0,
  totals: json['totals'] == null
      ? null
      : PropertyReportTotalsModel.fromJson(
          json['totals'] as Map<String, dynamic>,
        ),
);

Map<String, dynamic> _$PropertyReportPageModelToJson(
  _PropertyReportPageModel instance,
) => <String, dynamic>{
  'content': instance.content,
  'page': instance.page,
  'pageSize': instance.pageSize,
  'totalElements': instance.totalElements,
  'totals': instance.totals,
};

_PropertyReportTotalsModel _$PropertyReportTotalsModelFromJson(
  Map<String, dynamic> json,
) => _PropertyReportTotalsModel(
  properties: (json['properties'] as num?)?.toInt() ?? 0,
  totalUnits: (json['totalUnits'] as num?)?.toInt() ?? 0,
  occupiedUnits: (json['occupiedUnits'] as num?)?.toInt() ?? 0,
  invoiceAmount: json['invoiceAmount'] == null
      ? 0
      : parseDouble(json['invoiceAmount']),
  chargedAmount: json['chargedAmount'] == null
      ? 0
      : parseDouble(json['chargedAmount']),
  rentAmount: json['rentAmount'] == null ? 0 : parseDouble(json['rentAmount']),
  serviceChargeAmount: json['serviceChargeAmount'] == null
      ? 0
      : parseDouble(json['serviceChargeAmount']),
  utilityAmount: json['utilityAmount'] == null
      ? 0
      : parseDouble(json['utilityAmount']),
  depositAmount: json['depositAmount'] == null
      ? 0
      : parseDouble(json['depositAmount']),
  broughtForwardAmount: json['broughtForwardAmount'] == null
      ? 0
      : parseDouble(json['broughtForwardAmount']),
  paymentAmount: json['paymentAmount'] == null
      ? 0
      : parseDouble(json['paymentAmount']),
  openingArrears: json['openingArrears'] == null
      ? 0
      : parseDouble(json['openingArrears']),
  closingArrears: json['closingArrears'] == null
      ? 0
      : parseDouble(json['closingArrears']),
  overpaymentAmount: json['overpaymentAmount'] == null
      ? 0
      : parseDouble(json['overpaymentAmount']),
  totalCredit: json['totalCredit'] == null
      ? 0
      : parseDouble(json['totalCredit']),
  topupAmount: json['topupAmount'] == null
      ? 0
      : parseDouble(json['topupAmount']),
  cumulativeCredit: json['cumulativeCredit'] == null
      ? 0
      : parseDouble(json['cumulativeCredit']),
  clearedAmount: json['clearedAmount'] == null
      ? 0
      : parseDouble(json['clearedAmount']),
  forfeitedAmount: json['forfeitedAmount'] == null
      ? 0
      : parseDouble(json['forfeitedAmount']),
  expenseAmount: json['expenseAmount'] == null
      ? 0
      : parseDouble(json['expenseAmount']),
  commissionAmount: parseDoubleNullable(json['commissionAmount']),
  netIncome: json['netIncome'] == null ? 0 : parseDouble(json['netIncome']),
  collectionRate: parseDoubleNullable(json['collectionRate']),
  creditsAndAdjustments: json['creditsAndAdjustments'] == null
      ? 0
      : parseDouble(json['creditsAndAdjustments']),
);

Map<String, dynamic> _$PropertyReportTotalsModelToJson(
  _PropertyReportTotalsModel instance,
) => <String, dynamic>{
  'properties': instance.properties,
  'totalUnits': instance.totalUnits,
  'occupiedUnits': instance.occupiedUnits,
  'invoiceAmount': instance.invoiceAmount,
  'chargedAmount': instance.chargedAmount,
  'rentAmount': instance.rentAmount,
  'serviceChargeAmount': instance.serviceChargeAmount,
  'utilityAmount': instance.utilityAmount,
  'depositAmount': instance.depositAmount,
  'broughtForwardAmount': instance.broughtForwardAmount,
  'paymentAmount': instance.paymentAmount,
  'openingArrears': instance.openingArrears,
  'closingArrears': instance.closingArrears,
  'overpaymentAmount': instance.overpaymentAmount,
  'totalCredit': instance.totalCredit,
  'topupAmount': instance.topupAmount,
  'cumulativeCredit': instance.cumulativeCredit,
  'clearedAmount': instance.clearedAmount,
  'forfeitedAmount': instance.forfeitedAmount,
  'expenseAmount': instance.expenseAmount,
  'commissionAmount': instance.commissionAmount,
  'netIncome': instance.netIncome,
  'collectionRate': instance.collectionRate,
  'creditsAndAdjustments': instance.creditsAndAdjustments,
};
