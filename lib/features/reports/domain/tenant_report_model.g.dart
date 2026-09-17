// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tenant_report_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TenantReportModel _$TenantReportModelFromJson(Map<String, dynamic> json) =>
    _TenantReportModel(
      id: json['id'] as String,
      tenantUserId: json['tenantUserId'] as String?,
      tenantName: json['tenantName'] as String,
      tenantPhone: json['tenantPhone'] as String?,
      houseId: json['houseId'] as String?,
      houseCode: json['houseCode'] as String?,
      houseNumber: json['houseNumber'] as String?,
      unitLabel: json['unitLabel'] as String?,
      categoryName: json['categoryName'] as String?,
      propertyName: json['propertyName'] as String?,
      estateName: json['estateName'] as String?,
      rent: json['rent'] == null ? 0 : parseDouble(json['rent']),
      depositHeld: json['depositHeld'] == null
          ? 0
          : parseDouble(json['depositHeld']),
      occupiedOn: json['occupiedOn'] as String?,
      expiresOn: json['expiresOn'] as String?,
      invoicedAmount: json['invoicedAmount'] == null
          ? 0
          : parseDouble(json['invoicedAmount']),
      paidAmount: json['paidAmount'] == null
          ? 0
          : parseDouble(json['paidAmount']),
      rentInvoiced: json['rentInvoiced'] == null
          ? 0
          : parseDouble(json['rentInvoiced']),
      arrears: json['arrears'] == null ? 0 : parseDouble(json['arrears']),
      credit: json['credit'] == null ? 0 : parseDouble(json['credit']),
      accountBalance: json['accountBalance'] == null
          ? 0
          : parseDouble(json['accountBalance']),
      unpaidInvoices: (json['unpaidInvoices'] as num?)?.toInt() ?? 0,
      oldestUnpaid: (json['oldestUnpaid'] as num?)?.toInt(),
      lastPaymentOn: json['lastPaymentOn'] as String?,
      lastPaymentAmount: json['lastPaymentAmount'] == null
          ? 0
          : parseDouble(json['lastPaymentAmount']),
      collectionRate: parseDoubleNullable(json['collectionRate']),
    );

Map<String, dynamic> _$TenantReportModelToJson(_TenantReportModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'tenantUserId': instance.tenantUserId,
      'tenantName': instance.tenantName,
      'tenantPhone': instance.tenantPhone,
      'houseId': instance.houseId,
      'houseCode': instance.houseCode,
      'houseNumber': instance.houseNumber,
      'unitLabel': instance.unitLabel,
      'categoryName': instance.categoryName,
      'propertyName': instance.propertyName,
      'estateName': instance.estateName,
      'rent': instance.rent,
      'depositHeld': instance.depositHeld,
      'occupiedOn': instance.occupiedOn,
      'expiresOn': instance.expiresOn,
      'invoicedAmount': instance.invoicedAmount,
      'paidAmount': instance.paidAmount,
      'rentInvoiced': instance.rentInvoiced,
      'arrears': instance.arrears,
      'credit': instance.credit,
      'accountBalance': instance.accountBalance,
      'unpaidInvoices': instance.unpaidInvoices,
      'oldestUnpaid': instance.oldestUnpaid,
      'lastPaymentOn': instance.lastPaymentOn,
      'lastPaymentAmount': instance.lastPaymentAmount,
      'collectionRate': instance.collectionRate,
    };

_TenantReportPageModel _$TenantReportPageModelFromJson(
  Map<String, dynamic> json,
) => _TenantReportPageModel(
  content:
      (json['content'] as List<dynamic>?)
          ?.map((e) => TenantReportModel.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <TenantReportModel>[],
  page: (json['page'] as num?)?.toInt() ?? 0,
  pageSize: (json['pageSize'] as num?)?.toInt() ?? 0,
  totalElements: (json['totalElements'] as num?)?.toInt() ?? 0,
  totals: json['totals'] == null
      ? null
      : TenantReportTotalsModel.fromJson(
          json['totals'] as Map<String, dynamic>,
        ),
);

Map<String, dynamic> _$TenantReportPageModelToJson(
  _TenantReportPageModel instance,
) => <String, dynamic>{
  'content': instance.content,
  'page': instance.page,
  'pageSize': instance.pageSize,
  'totalElements': instance.totalElements,
  'totals': instance.totals,
};

_TenantReportTotalsModel _$TenantReportTotalsModelFromJson(
  Map<String, dynamic> json,
) => _TenantReportTotalsModel(
  tenancies: (json['tenancies'] as num?)?.toInt() ?? 0,
  rent: json['rent'] == null ? 0 : parseDouble(json['rent']),
  depositHeld: json['depositHeld'] == null
      ? 0
      : parseDouble(json['depositHeld']),
  invoicedAmount: json['invoicedAmount'] == null
      ? 0
      : parseDouble(json['invoicedAmount']),
  paidAmount: json['paidAmount'] == null ? 0 : parseDouble(json['paidAmount']),
  arrears: json['arrears'] == null ? 0 : parseDouble(json['arrears']),
  credit: json['credit'] == null ? 0 : parseDouble(json['credit']),
  accountBalance: json['accountBalance'] == null
      ? 0
      : parseDouble(json['accountBalance']),
  owing: (json['owing'] as num?)?.toInt() ?? 0,
  collectionRate: parseDoubleNullable(json['collectionRate']),
);

Map<String, dynamic> _$TenantReportTotalsModelToJson(
  _TenantReportTotalsModel instance,
) => <String, dynamic>{
  'tenancies': instance.tenancies,
  'rent': instance.rent,
  'depositHeld': instance.depositHeld,
  'invoicedAmount': instance.invoicedAmount,
  'paidAmount': instance.paidAmount,
  'arrears': instance.arrears,
  'credit': instance.credit,
  'accountBalance': instance.accountBalance,
  'owing': instance.owing,
  'collectionRate': instance.collectionRate,
};
