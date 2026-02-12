import 'package:freezed_annotation/freezed_annotation.dart';

part 'house_detail_model.freezed.dart';
part 'house_detail_model.g.dart';

@freezed
abstract class HouseDetailModel with _$HouseDetailModel {
  const HouseDetailModel._();
  const factory HouseDetailModel({
    String? houseName,
    String? houseCode,
    @Default(0) int floor,
    @Default(0) int status,
    @JsonKey(name: 'occupied') @Default(false) bool isOccupied,
    @Default(0) double rent,
    String? location,
    double? squareFt,
    String? property,
    String? category,
    String? houseType,
    String? estate,
    HouseTenant? tenant,
  }) = _HouseDetailModel;

  factory HouseDetailModel.fromJson(Map<String, dynamic> json) =>
      _$HouseDetailModelFromJson(json);
}

@freezed
abstract class HouseTenant with _$HouseTenant {
  const HouseTenant._();
  const factory HouseTenant({
    String? name,
    String? phone,
    @Default(0) double rentOwed,
    String? invoiceRrn,
    String? invoiceMonth,
    String? dueDate,
    String? occupiedOn,
    @Default(0) double refundableAmount,
  }) = _HouseTenant;

  factory HouseTenant.fromJson(Map<String, dynamic> json) =>
      _$HouseTenantFromJson(json);
}
