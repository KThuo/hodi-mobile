// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tenant_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TenantDetailModel _$TenantDetailModelFromJson(
  Map<String, dynamic> json,
) => _TenantDetailModel(
  tenant: TenantModel.fromJson(json['tenant'] as Map<String, dynamic>),
  current:
      (json['current'] as List<dynamic>?)
          ?.map((e) => OccupationModel.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <OccupationModel>[],
  history:
      (json['history'] as List<dynamic>?)
          ?.map((e) => TenancyHistoryModel.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <TenancyHistoryModel>[],
  pending:
      (json['pending'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const <String>[],
);

Map<String, dynamic> _$TenantDetailModelToJson(_TenantDetailModel instance) =>
    <String, dynamic>{
      'tenant': instance.tenant,
      'current': instance.current,
      'history': instance.history,
      'pending': instance.pending,
    };

_TenancyHistoryModel _$TenancyHistoryModelFromJson(Map<String, dynamic> json) =>
    _TenancyHistoryModel(
      id: json['id'] as String,
      occupationId: json['occupationId'] as String?,
      houseId: json['houseId'] as String?,
      houseCode: json['houseCode'] as String,
      houseLabel: json['houseLabel'] as String?,
      propertyName: json['propertyName'] as String?,
      tenure: json['tenure'] as String?,
      rent: json['rent'] == null ? 0 : parseDouble(json['rent']),
      deposit: json['deposit'] == null ? 0 : parseDouble(json['deposit']),
      refundableDeposit: json['refundableDeposit'] == null
          ? 0
          : parseDouble(json['refundableDeposit']),
      occupiedOn: json['occupiedOn'] as String?,
      vacatedOn: json['vacatedOn'] as String?,
      nights: (json['nights'] as num?)?.toInt() ?? 0,
      reason: json['reason'] as String?,
      notes: json['notes'] as String?,
    );

Map<String, dynamic> _$TenancyHistoryModelToJson(
  _TenancyHistoryModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'occupationId': instance.occupationId,
  'houseId': instance.houseId,
  'houseCode': instance.houseCode,
  'houseLabel': instance.houseLabel,
  'propertyName': instance.propertyName,
  'tenure': instance.tenure,
  'rent': instance.rent,
  'deposit': instance.deposit,
  'refundableDeposit': instance.refundableDeposit,
  'occupiedOn': instance.occupiedOn,
  'vacatedOn': instance.vacatedOn,
  'nights': instance.nights,
  'reason': instance.reason,
  'notes': instance.notes,
};
