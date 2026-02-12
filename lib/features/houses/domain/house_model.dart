import 'package:freezed_annotation/freezed_annotation.dart';

part 'house_model.freezed.dart';
part 'house_model.g.dart';

@freezed
abstract class HouseModel with _$HouseModel {
  const HouseModel._();
  const factory HouseModel({
    required int id,
    String? houseName,
    String? houseCode,
    String? houseNumber,
    String? floor,
    @Default(0) double rent,
    String? squareFt,
    String? propertyName,
    String? estateName,
    String? categoryName,
    String? typeName,
    String? location,
    @Default(false) bool occupied,
    String? status,
    @Default(0) int featureCount,
    String? imageFilename,
  }) = _HouseModel;

  factory HouseModel.fromJson(Map<String, dynamic> json) =>
      _$HouseModelFromJson(json);
}
