// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'maintenance_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MaintenanceRequestModel _$MaintenanceRequestModelFromJson(
  Map<String, dynamic> json,
) => _MaintenanceRequestModel(
  id: json['id'] as String,
  requestRef: json['requestRef'] as String,
  propertyName: json['propertyName'] as String?,
  houseCode: json['houseCode'] as String?,
  houseNumber: json['houseNumber'] as String?,
  reporterName: json['reporterName'] as String?,
  categoryName: json['categoryName'] as String?,
  title: json['title'] as String,
  description: json['description'] as String?,
  priority: json['priority'] as String?,
  status: json['status'] as String,
  statusLabel: json['statusLabel'] as String?,
  statusReason: json['statusReason'] as String?,
  assigneeName: json['assigneeName'] as String?,
  submittedOn: json['submittedOn'] as String?,
  acknowledgedOn: json['acknowledgedOn'] as String?,
  resolvedOn: json['resolvedOn'] as String?,
  closedOn: json['closedOn'] as String?,
  dueOn: json['dueOn'] as String?,
  slaBreached: json['slaBreached'] as bool? ?? false,
  late: json['late'] as bool? ?? false,
  dueLabel: json['dueLabel'] as String?,
  actionsTaken: json['actionsTaken'] as String?,
  resolutionNotes: json['resolutionNotes'] as String?,
  tenantRating: (json['tenantRating'] as num?)?.toInt(),
  tenantFeedback: json['tenantFeedback'] as String?,
  open: json['open'] as bool? ?? false,
);

Map<String, dynamic> _$MaintenanceRequestModelToJson(
  _MaintenanceRequestModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'requestRef': instance.requestRef,
  'propertyName': instance.propertyName,
  'houseCode': instance.houseCode,
  'houseNumber': instance.houseNumber,
  'reporterName': instance.reporterName,
  'categoryName': instance.categoryName,
  'title': instance.title,
  'description': instance.description,
  'priority': instance.priority,
  'status': instance.status,
  'statusLabel': instance.statusLabel,
  'statusReason': instance.statusReason,
  'assigneeName': instance.assigneeName,
  'submittedOn': instance.submittedOn,
  'acknowledgedOn': instance.acknowledgedOn,
  'resolvedOn': instance.resolvedOn,
  'closedOn': instance.closedOn,
  'dueOn': instance.dueOn,
  'slaBreached': instance.slaBreached,
  'late': instance.late,
  'dueLabel': instance.dueLabel,
  'actionsTaken': instance.actionsTaken,
  'resolutionNotes': instance.resolutionNotes,
  'tenantRating': instance.tenantRating,
  'tenantFeedback': instance.tenantFeedback,
  'open': instance.open,
};

_MaintenanceDetailModel _$MaintenanceDetailModelFromJson(
  Map<String, dynamic> json,
) => _MaintenanceDetailModel(
  request: MaintenanceRequestModel.fromJson(
    json['request'] as Map<String, dynamic>,
  ),
  timeline:
      (json['timeline'] as List<dynamic>?)
          ?.map(
            (e) => MaintenanceUpdateModel.fromJson(e as Map<String, dynamic>),
          )
          .toList() ??
      const <MaintenanceUpdateModel>[],
);

Map<String, dynamic> _$MaintenanceDetailModelToJson(
  _MaintenanceDetailModel instance,
) => <String, dynamic>{
  'request': instance.request,
  'timeline': instance.timeline,
};

_MaintenanceUpdateModel _$MaintenanceUpdateModelFromJson(
  Map<String, dynamic> json,
) => _MaintenanceUpdateModel(
  id: json['id'] as String,
  updateType: json['updateType'] as String?,
  fromLabel: json['fromLabel'] as String?,
  toLabel: json['toLabel'] as String?,
  comment: json['comment'] as String?,
  visibleToTenant: json['visibleToTenant'] as bool? ?? true,
  performedByName: json['performedByName'] as String?,
  performedOn: json['performedOn'] as String?,
);

Map<String, dynamic> _$MaintenanceUpdateModelToJson(
  _MaintenanceUpdateModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'updateType': instance.updateType,
  'fromLabel': instance.fromLabel,
  'toLabel': instance.toLabel,
  'comment': instance.comment,
  'visibleToTenant': instance.visibleToTenant,
  'performedByName': instance.performedByName,
  'performedOn': instance.performedOn,
};

_MaintenanceCategoryModel _$MaintenanceCategoryModelFromJson(
  Map<String, dynamic> json,
) => _MaintenanceCategoryModel(
  id: json['id'] as String,
  name: json['name'] as String,
  defaultPriority: json['defaultPriority'] as String?,
  estateName: json['estateName'] as String?,
  platform: json['platform'] as bool? ?? false,
  status: (json['status'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$MaintenanceCategoryModelToJson(
  _MaintenanceCategoryModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'defaultPriority': instance.defaultPriority,
  'estateName': instance.estateName,
  'platform': instance.platform,
  'status': instance.status,
};

_MaintenanceWorkloadModel _$MaintenanceWorkloadModelFromJson(
  Map<String, dynamic> json,
) => _MaintenanceWorkloadModel(
  open: json['open'] == null ? 0 : parseIntOrZero(json['open']),
  unassigned: json['unassigned'] == null
      ? 0
      : parseIntOrZero(json['unassigned']),
  late: json['late'] == null ? 0 : parseIntOrZero(json['late']),
  awaitingClosure: json['awaitingClosure'] == null
      ? 0
      : parseIntOrZero(json['awaitingClosure']),
);

Map<String, dynamic> _$MaintenanceWorkloadModelToJson(
  _MaintenanceWorkloadModel instance,
) => <String, dynamic>{
  'open': instance.open,
  'unassigned': instance.unassigned,
  'late': instance.late,
  'awaitingClosure': instance.awaitingClosure,
};
