import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/utils/json_parsers.dart';

part 'vacant_house_model.freezed.dart';
part 'vacant_house_model.g.dart';

/// A unit to let, as it appears in the To Let list — the server's `Listing`.
///
/// ## The id is a public token, not a HashId
///
/// `PublicIds` encodes it: base 36, reversible, and deliberately not salted per user, because a
/// listing link has to survive being shared with somebody who has no account. Pass it back exactly
/// as it arrived — the detail endpoint decodes it with `PublicIds.require`.
@freezed
abstract class VacantHouseModel with _$VacantHouseModel {
  const VacantHouseModel._();

  const factory VacantHouseModel({
    required String id,

    /// What to call it, composed by the server. There is no `houseName`.
    @Default('') String title,
    String? categoryName,
    String? propertyName,

    /// Where it is, as somebody would say it — "Kilimani", not a coordinate.
    String? area,
    @JsonKey(fromJson: parseDoubleNullable) double? rent,
    int? bedrooms,
    int? bathrooms,
    @JsonKey(fromJson: parseDoubleNullable) double? squareFt,
    @Default(false) bool dsq,
    int? parkingSpaces,
    double? latitude,
    double? longitude,

    /// How far from where somebody searched, when they searched by location.
    @JsonKey(fromJson: parseDoubleNullable) double? distanceKm,
    @Default(<String>[]) List<String> images,
    @Default(0) int imageCount,
    String? availableFrom,
  }) = _VacantHouseModel;

  factory VacantHouseModel.fromJson(Map<String, dynamic> json) =>
      _$VacantHouseModelFromJson(json);

  /// "2 bed · 1 bath · DSQ", or as much of it as the server gave. Nothing where the category has
  /// no bedrooms — an office or a stall — because "0 bed" is wrong rather than empty.
  String get roomsLine => [
        if (bedrooms != null) '$bedrooms bed',
        if (bathrooms != null) '$bathrooms bath',
        if (dsq) 'DSQ',
        if (parkingSpaces != null && parkingSpaces! > 0) '$parkingSpaces parking',
      ].join(' · ');

  String? get coverImage => images.isEmpty ? null : images.first;
}
