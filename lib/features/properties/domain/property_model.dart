import 'package:freezed_annotation/freezed_annotation.dart';

part 'property_model.freezed.dart';
part 'property_model.g.dart';

@freezed
abstract class PropertyModel with _$PropertyModel {
  const PropertyModel._();
  const factory PropertyModel({
    required int id,
    String? name,
    String? estateName,
    int? estateId,
    String? location,
    @Default(0) int floors,
    @Default(0) int units,
    @Default(0) int occupied,
    @Default(0) int categories,
    @Default(0) int features,
    String? email,
    @Default(0) double commission,
    String? createdOn,
    @Default(0) int status,
  }) = _PropertyModel;

  factory PropertyModel.fromJson(Map<String, dynamic> json) =>
      _$PropertyModelFromJson(json);

  int get vacant => units - occupied;
  double get occupancyRate => units > 0 ? (occupied / units) * 100 : 0;
}
