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
    @Default(0) int floor,
    @Default(0) double rent,
    double? squareFt,
    @JsonKey(name: 'property') String? propertyName,
    @JsonKey(name: 'estate') String? estateName,
    @JsonKey(name: 'category') String? categoryName,
    @JsonKey(name: 'houseType') String? typeName,
    String? location,
    @Default(false) bool occupied,
    @Default(0) int status,
    @JsonKey(name: 'features') @Default(0) int featureCount,
    String? imageFilename,
  }) = _HouseModel;

  factory HouseModel.fromJson(Map<String, dynamic> json) =>
      _$HouseModelFromJson(json);
}
