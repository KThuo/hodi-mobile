// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'visit_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_VisitModel _$VisitModelFromJson(Map<String, dynamic> json) => _VisitModel(
  id: json['id'] as String,
  visitRef: json['visitRef'] as String,
  propertyName: json['propertyName'] as String?,
  houseCode: json['houseCode'] as String?,
  houseNumber: json['houseNumber'] as String?,
  unitLabel: json['unitLabel'] as String?,
  tenantName: json['tenantName'] as String?,
  visitorName: json['visitorName'] as String,
  visitorPhone: json['visitorPhone'] as String?,
  idType: json['idType'] as String?,
  idNumber: json['idNumber'] as String?,
  hasIdNumber: json['hasIdNumber'] as bool? ?? false,
  visitorCount: (json['visitorCount'] as num?)?.toInt() ?? 1,
  vehicleReg: json['vehicleReg'] as String?,
  vehicleMake: json['vehicleMake'] as String?,
  vehicleColour: json['vehicleColour'] as String?,
  purpose: json['purpose'] as String?,
  purposeNotes: json['purposeNotes'] as String?,
  checkedInOn: json['checkedInOn'] as String?,
  checkedOutOn: json['checkedOutOn'] as String?,
  dwellMinutes: (json['dwellMinutes'] as num?)?.toInt(),
  onSiteFor: json['onSiteFor'] as String?,
  onSite: json['onSite'] as bool? ?? false,
  approvalStatus: json['approvalStatus'] as String,
  approvalDecidedOn: json['approvalDecidedOn'] as String?,
  overrideReason: json['overrideReason'] as String?,
  gateName: json['gateName'] as String?,
  checkedInByName: json['checkedInByName'] as String?,
  checkedOutByName: json['checkedOutByName'] as String?,
  status: (json['status'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$VisitModelToJson(_VisitModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'visitRef': instance.visitRef,
      'propertyName': instance.propertyName,
      'houseCode': instance.houseCode,
      'houseNumber': instance.houseNumber,
      'unitLabel': instance.unitLabel,
      'tenantName': instance.tenantName,
      'visitorName': instance.visitorName,
      'visitorPhone': instance.visitorPhone,
      'idType': instance.idType,
      'idNumber': instance.idNumber,
      'hasIdNumber': instance.hasIdNumber,
      'visitorCount': instance.visitorCount,
      'vehicleReg': instance.vehicleReg,
      'vehicleMake': instance.vehicleMake,
      'vehicleColour': instance.vehicleColour,
      'purpose': instance.purpose,
      'purposeNotes': instance.purposeNotes,
      'checkedInOn': instance.checkedInOn,
      'checkedOutOn': instance.checkedOutOn,
      'dwellMinutes': instance.dwellMinutes,
      'onSiteFor': instance.onSiteFor,
      'onSite': instance.onSite,
      'approvalStatus': instance.approvalStatus,
      'approvalDecidedOn': instance.approvalDecidedOn,
      'overrideReason': instance.overrideReason,
      'gateName': instance.gateName,
      'checkedInByName': instance.checkedInByName,
      'checkedOutByName': instance.checkedOutByName,
      'status': instance.status,
    };

_OnSiteSummaryModel _$OnSiteSummaryModelFromJson(Map<String, dynamic> json) =>
    _OnSiteSummaryModel(
      onSite: (json['onSite'] as num?)?.toInt() ?? 0,
      awaitingApproval: (json['awaitingApproval'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$OnSiteSummaryModelToJson(_OnSiteSummaryModel instance) =>
    <String, dynamic>{
      'onSite': instance.onSite,
      'awaitingApproval': instance.awaitingApproval,
    };

_KnownVisitorModel _$KnownVisitorModelFromJson(Map<String, dynamic> json) =>
    _KnownVisitorModel(
      visitorName: json['visitorName'] as String,
      visitorPhone: json['visitorPhone'] as String?,
      idType: json['idType'] as String?,
      idNumber: json['idNumber'] as String?,
      vehicleReg: json['vehicleReg'] as String?,
      visits: (json['visits'] as num?)?.toInt() ?? 0,
      lastSeenOn: json['lastSeenOn'] as String?,
    );

Map<String, dynamic> _$KnownVisitorModelToJson(_KnownVisitorModel instance) =>
    <String, dynamic>{
      'visitorName': instance.visitorName,
      'visitorPhone': instance.visitorPhone,
      'idType': instance.idType,
      'idNumber': instance.idNumber,
      'vehicleReg': instance.vehicleReg,
      'visits': instance.visits,
      'lastSeenOn': instance.lastSeenOn,
    };

_CheckInResultModel _$CheckInResultModelFromJson(Map<String, dynamic> json) =>
    _CheckInResultModel(
      visit: json['visit'] == null
          ? null
          : VisitModel.fromJson(json['visit'] as Map<String, dynamic>),
      outcome: json['outcome'] as String,
      message: json['message'] as String,
      barReason: json['barReason'] as String?,
    );

Map<String, dynamic> _$CheckInResultModelToJson(_CheckInResultModel instance) =>
    <String, dynamic>{
      'visit': instance.visit,
      'outcome': instance.outcome,
      'message': instance.message,
      'barReason': instance.barReason,
    };
