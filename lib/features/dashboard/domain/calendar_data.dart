import 'package:freezed_annotation/freezed_annotation.dart';

part 'calendar_data.freezed.dart';
part 'calendar_data.g.dart';

@freezed
abstract class CalendarData with _$CalendarData {
  const CalendarData._();
  const factory CalendarData({
    @Default(0) double jan,
    @Default(0) double feb,
    @Default(0) double mar,
    @Default(0) double apr,
    @Default(0) double may,
    @Default(0) double jun,
    @Default(0) double jul,
    @Default(0) double aug,
    @Default(0) double sep,
    @Default(0) double oct,
    @Default(0) double nov,
    @Default(0) double dec,
  }) = _CalendarData;

  factory CalendarData.fromJson(Map<String, dynamic> json) =>
      _$CalendarDataFromJson(json);

  List<double> get monthlyValues =>
      [jan, feb, mar, apr, may, jun, jul, aug, sep, oct, nov, dec];
  double get total => monthlyValues.fold(0, (sum, v) => sum + v);
  double get maxMonth => monthlyValues.fold(0, (max, v) => v > max ? v : max);
}
