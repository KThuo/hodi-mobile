// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expense_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ExpenseModel _$ExpenseModelFromJson(Map<String, dynamic> json) =>
    _ExpenseModel(
      id: json['id'] as String,
      reference: json['reference'] as String,
      propertyId: json['propertyId'] as String?,
      propertyName: json['propertyName'] as String?,
      estateId: json['estateId'] as String?,
      estateName: json['estateName'] as String?,
      name: json['name'] as String,
      description: json['description'] as String?,
      amount: json['amount'] == null ? 0 : parseDouble(json['amount']),
      incurredOn: json['incurredOn'] as String?,
      category: json['category'] as String,
      source: json['source'] as String?,
      sourceRef: json['sourceRef'] as String?,
      expenditureId: json['expenditureId'] as String?,
      status: (json['status'] as num?)?.toInt() ?? 0,
      createdOn: json['createdOn'] as String?,
      createdBy: json['createdBy'] as String?,
    );

Map<String, dynamic> _$ExpenseModelToJson(_ExpenseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'reference': instance.reference,
      'propertyId': instance.propertyId,
      'propertyName': instance.propertyName,
      'estateId': instance.estateId,
      'estateName': instance.estateName,
      'name': instance.name,
      'description': instance.description,
      'amount': instance.amount,
      'incurredOn': instance.incurredOn,
      'category': instance.category,
      'source': instance.source,
      'sourceRef': instance.sourceRef,
      'expenditureId': instance.expenditureId,
      'status': instance.status,
      'createdOn': instance.createdOn,
      'createdBy': instance.createdBy,
    };

_RecurringExpenseModel _$RecurringExpenseModelFromJson(
  Map<String, dynamic> json,
) => _RecurringExpenseModel(
  id: json['id'] as String,
  propertyId: json['propertyId'] as String?,
  propertyName: json['propertyName'] as String?,
  estateId: json['estateId'] as String?,
  estateName: json['estateName'] as String?,
  name: json['name'] as String,
  description: json['description'] as String?,
  amount: json['amount'] == null ? 0 : parseDouble(json['amount']),
  dayOfMonth: (json['dayOfMonth'] as num?)?.toInt(),
  status: (json['status'] as num?)?.toInt() ?? 0,
  createdOn: json['createdOn'] as String?,
);

Map<String, dynamic> _$RecurringExpenseModelToJson(
  _RecurringExpenseModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'propertyId': instance.propertyId,
  'propertyName': instance.propertyName,
  'estateId': instance.estateId,
  'estateName': instance.estateName,
  'name': instance.name,
  'description': instance.description,
  'amount': instance.amount,
  'dayOfMonth': instance.dayOfMonth,
  'status': instance.status,
  'createdOn': instance.createdOn,
};
