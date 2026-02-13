import 'package:freezed_annotation/freezed_annotation.dart';

part 'metre_history_model.freezed.dart';
part 'metre_history_model.g.dart';

@freezed
abstract class MetreHistoryModel with _$MetreHistoryModel {
  const MetreHistoryModel._();
  const factory MetreHistoryModel({
    String? id,
    String? rrn,
    String? monthName,
    String? property,
    String? estate,
    @Default(0) double previousReading,
    @Default(0) double currentReading,
    @Default(0) double consumedUnits,
    @Default(0) double charge,
    @Default(0) double amount,
    String? updatedOn,
    int? imageStatus,
  }) = _MetreHistoryModel;

  factory MetreHistoryModel.fromJson(Map<String, dynamic> json) =>
      _$MetreHistoryModelFromJson(json);
}
