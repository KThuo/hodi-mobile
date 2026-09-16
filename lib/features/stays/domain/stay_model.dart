import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/utils/json_parsers.dart';

part 'stay_model.freezed.dart';
part 'stay_model.g.dart';

/// One bookable stay — `Stay` on the server's public half.
///
/// ## The id is not a HashId
///
/// Everything else in this app carries an id salted per user, which is right for a tenant's own
/// invoice and wrong for a listing: a link pasted into a group chat would be undecodable for
/// everybody but the sender. Stays are addressed by a constant public token instead, exactly as the
/// web's `/stays/:id` is.
///
/// ## Two prices, and only sometimes
///
/// [nightlyRate] is per night — the average across the chosen dates, because a weekend rate and a
/// weekday rate are different numbers and quoting either as "the" rate would be a lie. [stayTotal]
/// exists only when dates were given; without them there is nothing to total, and a screen showing
/// zero there would be inventing a quote.
@freezed
abstract class StayModel with _$StayModel {
  const StayModel._();

  const factory StayModel({
    required String id,
    @Default('') String title,
    String? categoryName,
    String? propertyName,

    /// Where it is, as somebody would say it — "Kilimani", not a coordinate.
    String? area,
    @JsonKey(fromJson: parseDoubleNullable) double? nightlyRate,
    @JsonKey(fromJson: parseDoubleNullable) double? stayTotal,
    int? nights,
    int? bedrooms,
    int? bathrooms,
    int? sleeps,
    double? latitude,
    double? longitude,
    double? distanceKm,
    @Default([]) List<String> images,
    @Default(0) int imageCount,
  }) = _StayModel;

  factory StayModel.fromJson(Map<String, dynamic> json) => _$StayModelFromJson(json);

  String? get coverImage => images.isEmpty ? null : images.first;

  /// "2 bedrooms · sleeps 4" — the two facts somebody scans a listing for.
  String get summary {
    final parts = <String>[];
    if (bedrooms != null) parts.add('$bedrooms bedroom${bedrooms == 1 ? '' : 's'}');
    if (sleeps != null) parts.add('sleeps $sleeps');
    return parts.join(' · ');
  }

  bool get mappable => latitude != null && longitude != null;
}
