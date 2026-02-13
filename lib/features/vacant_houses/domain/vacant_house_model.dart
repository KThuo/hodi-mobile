import 'package:freezed_annotation/freezed_annotation.dart';

part 'vacant_house_model.freezed.dart';
part 'vacant_house_model.g.dart';

@freezed
abstract class VacantHouseModel with _$VacantHouseModel {
  const VacantHouseModel._();
  const factory VacantHouseModel({
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
    String? distanceText,
    double? distance,
  }) = _VacantHouseModel;

  factory VacantHouseModel.fromJson(Map<String, dynamic> json) =>
      _$VacantHouseModelFromJson(json);
}
