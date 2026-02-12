import 'package:freezed_annotation/freezed_annotation.dart';

part 'house_feature_model.freezed.dart';
part 'house_feature_model.g.dart';

@freezed
abstract class HouseFeatureModel with _$HouseFeatureModel {
  const HouseFeatureModel._();
  const factory HouseFeatureModel({
    String? name,
    String? description,
  }) = _HouseFeatureModel;

  factory HouseFeatureModel.fromJson(Map<String, dynamic> json) =>
      _$HouseFeatureModelFromJson(json);
}
