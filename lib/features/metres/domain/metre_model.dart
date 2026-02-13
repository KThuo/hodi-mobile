import 'package:freezed_annotation/freezed_annotation.dart';

part 'metre_model.freezed.dart';
part 'metre_model.g.dart';

@freezed
abstract class MetreModel with _$MetreModel {
  const MetreModel._();
  const factory MetreModel({
    String? id,
    String? metreNo,
    String? billName,
    String? houseName,
    String? property,
    String? estate,
    @Default(0) double previousReading,
    @Default(0) double currentReading,
    @Default(0) double consumedUnits,
    @Default(0) double charge,
    @Default(0) double amount,
    @Default(1) int status,
    String? updatedOn,
    int? imageStatus,
    @Default(false) bool updatable,
    int? month,
    int? year,
    String? monthName,
    String? historyId,
  }) = _MetreModel;

  factory MetreModel.fromJson(Map<String, dynamic> json) =>
      _$MetreModelFromJson(json);

  bool get isActive => status == 1;
}
