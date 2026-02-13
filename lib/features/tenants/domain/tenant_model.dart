import 'package:freezed_annotation/freezed_annotation.dart';

part 'tenant_model.freezed.dart';
part 'tenant_model.g.dart';

@freezed
abstract class TenantModel with _$TenantModel {
  const TenantModel._();
  const factory TenantModel({
    int? id,
    String? houseCode,
    String? houseName,
    String? tenantName,
    String? tenantPhone,
    String? category,
    String? estate,
    String? property,
    String? houseType,
    @Default(0) double rentOwed,
    String? dueDate,
    int? houseId,
    int? propertyId,
    @Default(0) double rent,
    String? payDate,
    String? userId,
    @Default(false) bool self,
  }) = _TenantModel;

  factory TenantModel.fromJson(Map<String, dynamic> json) =>
      _$TenantModelFromJson(json);

  bool get hasDebt => rentOwed > 0;
  bool get hasCredit => rentOwed < 0;
}
