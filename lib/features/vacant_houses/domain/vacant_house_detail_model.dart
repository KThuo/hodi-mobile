import 'package:freezed_annotation/freezed_annotation.dart';

part 'vacant_house_detail_model.freezed.dart';
part 'vacant_house_detail_model.g.dart';

@freezed
abstract class VacantHouseDetailModel with _$VacantHouseDetailModel {
  const VacantHouseDetailModel._();
  const factory VacantHouseDetailModel({
    String? id,
    String? houseName,
    String? houseNumber,
    String? houseCode,
    @Default(0) int floor,
    String? description,
    String? category,
    String? houseType,
    String? location,
    double? latitude,
    double? longitude,
    String? property,
    String? estate,
    @Default(0) double rent,
    double? squareFt,
    @Default(0) int featureCount,
    String? lastOccupied,
    String? imageUrl,
    @Default([]) List<VacantHouseBill> utilityBills,
    @Default([]) List<VacantHouseBill> onboardFees,
    @Default(0) double totalMonthlyBills,
    @Default(0) double totalOnboardFees,
    @Default(0) double maxRefundableAmount,
    @Default([]) List<VacantHouseFeature> houseFeatures,
    @Default([]) List<VacantHouseImage> categoryImages,
  }) = _VacantHouseDetailModel;

  factory VacantHouseDetailModel.fromJson(Map<String, dynamic> json) =>
      _$VacantHouseDetailModelFromJson(json);

  double get totalMoveInCost => rent + totalMonthlyBills + totalOnboardFees;
}

@freezed
abstract class VacantHouseBill with _$VacantHouseBill {
  const factory VacantHouseBill({
    int? id,
    String? name,
    @Default(0) double amount,
    @Default(false) bool isOnboard,
  }) = _VacantHouseBill;

  factory VacantHouseBill.fromJson(Map<String, dynamic> json) =>
      _$VacantHouseBillFromJson(json);
}

@freezed
abstract class VacantHouseFeature with _$VacantHouseFeature {
  const factory VacantHouseFeature({
    int? id,
    String? name,
  }) = _VacantHouseFeature;

  factory VacantHouseFeature.fromJson(Map<String, dynamic> json) =>
      _$VacantHouseFeatureFromJson(json);
}

@freezed
abstract class VacantHouseImage with _$VacantHouseImage {
  const factory VacantHouseImage({
    int? id,
    String? filename,
    String? originalName,
    String? imageUrl,
  }) = _VacantHouseImage;

  factory VacantHouseImage.fromJson(Map<String, dynamic> json) =>
      _$VacantHouseImageFromJson(json);
}
