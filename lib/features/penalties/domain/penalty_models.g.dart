// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'penalty_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PenaltyChargeModel _$PenaltyChargeModelFromJson(Map<String, dynamic> json) =>
    _PenaltyChargeModel(
      id: json['id'] as String,
      reference: json['reference'] as String,
      ruleName: json['ruleName'] as String?,
      triggerOn: json['triggerOn'] as String?,
      estateName: json['estateName'] as String?,
      propertyName: json['propertyName'] as String?,
      houseCode: json['houseCode'] as String?,
      sourceType: json['sourceType'] as String?,
      sourceRef: json['sourceRef'] as String?,
      subjectName: json['subjectName'] as String?,
      baseAmount: json['baseAmount'] == null
          ? 0
          : parseDouble(json['baseAmount']),
      basis: json['basis'] as String?,
      rate: json['rate'] == null ? 0 : parseDouble(json['rate']),
      occurrence: (json['occurrence'] as num?)?.toInt() ?? 1,
      amount: json['amount'] == null ? 0 : parseDouble(json['amount']),
      periodStart: json['periodStart'] as String?,
      periodEnd: json['periodEnd'] as String?,
      calculationNote: json['calculationNote'] as String?,
      status: json['status'] as String,
      open: json['open'] as bool? ?? false,
      waived: json['waived'] as bool? ?? false,
      invoiceId: json['invoiceId'] as String?,
      appliedOn: json['appliedOn'] as String?,
      waivedBy: json['waivedBy'] as String?,
      waivedOn: json['waivedOn'] as String?,
      waiverReason: json['waiverReason'] as String?,
      reversedBy: json['reversedBy'] as String?,
      reversedOn: json['reversedOn'] as String?,
      reversalReason: json['reversalReason'] as String?,
      createdOn: json['createdOn'] as String?,
      createdBy: json['createdBy'] as String?,
    );

Map<String, dynamic> _$PenaltyChargeModelToJson(_PenaltyChargeModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'reference': instance.reference,
      'ruleName': instance.ruleName,
      'triggerOn': instance.triggerOn,
      'estateName': instance.estateName,
      'propertyName': instance.propertyName,
      'houseCode': instance.houseCode,
      'sourceType': instance.sourceType,
      'sourceRef': instance.sourceRef,
      'subjectName': instance.subjectName,
      'baseAmount': instance.baseAmount,
      'basis': instance.basis,
      'rate': instance.rate,
      'occurrence': instance.occurrence,
      'amount': instance.amount,
      'periodStart': instance.periodStart,
      'periodEnd': instance.periodEnd,
      'calculationNote': instance.calculationNote,
      'status': instance.status,
      'open': instance.open,
      'waived': instance.waived,
      'invoiceId': instance.invoiceId,
      'appliedOn': instance.appliedOn,
      'waivedBy': instance.waivedBy,
      'waivedOn': instance.waivedOn,
      'waiverReason': instance.waiverReason,
      'reversedBy': instance.reversedBy,
      'reversedOn': instance.reversedOn,
      'reversalReason': instance.reversalReason,
      'createdOn': instance.createdOn,
      'createdBy': instance.createdBy,
    };
