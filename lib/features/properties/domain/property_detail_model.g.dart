// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'property_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PropertyDetailModel _$PropertyDetailModelFromJson(
  Map<String, dynamic> json,
) => _PropertyDetailModel(
  id: json['id'] as String,
  name: json['name'] as String,
  estateId: json['estateId'] as String?,
  estateName: json['estateName'] as String?,
  location: json['location'] as String?,
  latitude: (json['latitude'] as num?)?.toDouble(),
  longitude: (json['longitude'] as num?)?.toDouble(),
  floors: (json['floors'] as num?)?.toInt(),
  basementFloors: (json['basementFloors'] as num?)?.toInt() ?? 0,
  hasMezzanine: json['hasMezzanine'] as bool? ?? false,
  tenancyCount: (json['tenancyCount'] as num?)?.toInt() ?? 0,
  contactName: json['contactName'] as String?,
  phone: json['phone'] as String?,
  email: json['email'] as String?,
  bankId: json['bankId'] as String?,
  bankName: json['bankName'] as String?,
  commission: parseDoubleNullable(json['commission']),
  invoiceGenerationDay: (json['invoiceGenerationDay'] as num?)?.toInt(),
  expenseGenerationDay: (json['expenseGenerationDay'] as num?)?.toInt(),
  paymentInstructions: json['paymentInstructions'] as String?,
  invoiceFooter: json['invoiceFooter'] as String?,
  tenantCanViewLease: json['tenantCanViewLease'] as bool? ?? false,
  leaseCoversOwned: json['leaseCoversOwned'] as bool? ?? false,
  defaultNoticeDays: (json['defaultNoticeDays'] as num?)?.toInt(),
  shortNoticePenalty: json['shortNoticePenalty'] as String?,
  shortNoticePenaltyAmount: parseDoubleNullable(
    json['shortNoticePenaltyAmount'],
  ),
  units: (json['units'] as num?)?.toInt() ?? 0,
  occupiedUnits: (json['occupiedUnits'] as num?)?.toInt() ?? 0,
  vacantUnits: (json['vacantUnits'] as num?)?.toInt() ?? 0,
  status: (json['status'] as num?)?.toInt() ?? 0,
  createdOn: json['createdOn'] as String?,
  tenures:
      (json['tenures'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const <String>[],
  tenureMix:
      (json['tenureMix'] as List<dynamic>?)
          ?.map((e) => TenureCount.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <TenureCount>[],
  categories:
      (json['categories'] as List<dynamic>?)
          ?.map((e) => NamedRef.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <NamedRef>[],
  features:
      (json['features'] as List<dynamic>?)
          ?.map((e) => NamedRef.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <NamedRef>[],
  caretakers:
      (json['caretakers'] as List<dynamic>?)
          ?.map((e) => NamedRef.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <NamedRef>[],
  pending:
      (json['pending'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const <String>[],
);

Map<String, dynamic> _$PropertyDetailModelToJson(
  _PropertyDetailModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'estateId': instance.estateId,
  'estateName': instance.estateName,
  'location': instance.location,
  'latitude': instance.latitude,
  'longitude': instance.longitude,
  'floors': instance.floors,
  'basementFloors': instance.basementFloors,
  'hasMezzanine': instance.hasMezzanine,
  'tenancyCount': instance.tenancyCount,
  'contactName': instance.contactName,
  'phone': instance.phone,
  'email': instance.email,
  'bankId': instance.bankId,
  'bankName': instance.bankName,
  'commission': instance.commission,
  'invoiceGenerationDay': instance.invoiceGenerationDay,
  'expenseGenerationDay': instance.expenseGenerationDay,
  'paymentInstructions': instance.paymentInstructions,
  'invoiceFooter': instance.invoiceFooter,
  'tenantCanViewLease': instance.tenantCanViewLease,
  'leaseCoversOwned': instance.leaseCoversOwned,
  'defaultNoticeDays': instance.defaultNoticeDays,
  'shortNoticePenalty': instance.shortNoticePenalty,
  'shortNoticePenaltyAmount': instance.shortNoticePenaltyAmount,
  'units': instance.units,
  'occupiedUnits': instance.occupiedUnits,
  'vacantUnits': instance.vacantUnits,
  'status': instance.status,
  'createdOn': instance.createdOn,
  'tenures': instance.tenures,
  'tenureMix': instance.tenureMix,
  'categories': instance.categories,
  'features': instance.features,
  'caretakers': instance.caretakers,
  'pending': instance.pending,
};

_TenureCount _$TenureCountFromJson(Map<String, dynamic> json) => _TenureCount(
  tenure: json['tenure'] as String,
  units: (json['units'] as num?)?.toInt() ?? 0,
  occupied: (json['occupied'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$TenureCountToJson(_TenureCount instance) =>
    <String, dynamic>{
      'tenure': instance.tenure,
      'units': instance.units,
      'occupied': instance.occupied,
    };
