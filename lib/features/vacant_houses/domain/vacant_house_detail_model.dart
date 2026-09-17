import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../core/utils/json_parsers.dart';

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
    @JsonKey(fromJson: parseIntNullable) int? floor,
    String? description,
    String? category,
    String? houseType,
    String? location,
    double? latitude,
    double? longitude,
    String? property,
    String? estate,
    @JsonKey(fromJson: parseDouble) @Default(0) double rent,
    double? squareFt,
    @JsonKey(fromJson: parseIntNullable) int? featureCount,
    String? lastOccupied,
    String? imageUrl,
    @Default([]) List<VacantHouseBill> utilityBills,
    @Default([]) List<VacantHouseBill> onboardFees,
    @JsonKey(fromJson: parseDouble) @Default(0) double totalMonthlyBills,
    @JsonKey(fromJson: parseDouble) @Default(0) double totalOnboardFees,
    @JsonKey(fromJson: parseDouble) @Default(0) double maxRefundableAmount,
    @Default([]) List<VacantHouseFeature> houseFeatures,
    @Default([]) List<VacantHouseImage> categoryImages,

    /// Who to ring about it.
    ///
    /// Sent by `VacantUnitModels` and dropped on the floor here until now, which left the app
    /// showing a listing with no way to enquire about it while the browser showed a phone number,
    /// an email address and a WhatsApp button.
    String? contactName,
    String? contactPhone,
    String? contactEmail,
  }) = _VacantHouseDetailModel;

  factory VacantHouseDetailModel.fromJson(Map<String, dynamic> json) =>
      _$VacantHouseDetailModelFromJson(json);

  double get totalMoveInCost => (rent) + totalMonthlyBills + totalOnboardFees;

  bool get hasContact =>
      (contactPhone?.isNotEmpty ?? false) || (contactEmail?.isNotEmpty ?? false);
}

@freezed
abstract class VacantHouseBill with _$VacantHouseBill {
  const factory VacantHouseBill({
    @JsonKey(fromJson: parseIntNullable) int? id,
    String? name,
    @JsonKey(fromJson: parseDouble) @Default(0) double amount,
    @Default(false) bool isOnboard,
  }) = _VacantHouseBill;

  factory VacantHouseBill.fromJson(Map<String, dynamic> json) =>
      _$VacantHouseBillFromJson(json);
}

@freezed
abstract class VacantHouseFeature with _$VacantHouseFeature {
  const factory VacantHouseFeature({
    @JsonKey(fromJson: parseIntNullable) int? id,
    String? name,
  }) = _VacantHouseFeature;

  factory VacantHouseFeature.fromJson(Map<String, dynamic> json) =>
      _$VacantHouseFeatureFromJson(json);
}

@freezed
abstract class VacantHouseImage with _$VacantHouseImage {
  const factory VacantHouseImage({
    @JsonKey(fromJson: parseIntNullable) int? id,
    String? filename,
    String? originalName,
    String? imageUrl,
  }) = _VacantHouseImage;

  factory VacantHouseImage.fromJson(Map<String, dynamic> json) =>
      _$VacantHouseImageFromJson(json);
}
