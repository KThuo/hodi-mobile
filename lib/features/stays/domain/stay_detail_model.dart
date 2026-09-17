import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/utils/json_parsers.dart';

part 'stay_detail_model.freezed.dart';
part 'stay_detail_model.g.dart';

/// One stay — the server's `StayDetail`, from the public `/stays/{id}`.
///
/// `id` here is a **public token**, not a HashId: `PublicIds.require(token)` decodes it. Same rule
/// applies — pass it back exactly as it arrived.
@freezed
abstract class StayDetailModel with _$StayDetailModel {
  const StayDetailModel._();

  const factory StayDetailModel({
    required String id,
    required String title,
    String? categoryName,
    String? description,
    String? propertyName,
    String? area,
    @JsonKey(fromJson: parseDoubleNullable) double? nightlyRate,
    int? bedrooms,
    int? bathrooms,
    int? sleeps,
    double? latitude,
    double? longitude,
    @Default(<String>[]) List<String> images,
    @Default(<StayAmenity>[]) List<StayAmenity> amenities,

    /// The shortest booking this place takes. Shown before somebody picks dates, because finding
    /// out after choosing is finding out too late.
    @Default(1) int minNights,
    String? contactName,
    String? contactPhone,
    String? contactEmail,
  }) = _StayDetailModel;

  factory StayDetailModel.fromJson(Map<String, dynamic> json) =>
      _$StayDetailModelFromJson(json);

  /// "2 bedrooms · sleeps 4", or as much of it as the server gave.
  String get sleepsLine => [
        if (bedrooms != null) '$bedrooms bedroom${bedrooms == 1 ? '' : 's'}',
        if (bathrooms != null) '$bathrooms bath${bathrooms == 1 ? '' : 's'}',
        if (sleeps != null) 'sleeps $sleeps',
      ].join(' · ');

  bool get hasContact =>
      (contactPhone?.isNotEmpty ?? false) || (contactEmail?.isNotEmpty ?? false);
}

@freezed
abstract class StayAmenity with _$StayAmenity {
  const StayAmenity._();

  const factory StayAmenity({
    required String name,
    String? icon,
  }) = _StayAmenity;

  factory StayAmenity.fromJson(Map<String, dynamic> json) =>
      _$StayAmenityFromJson(json);
}

/// What a set of dates costs — the server's `StayQuote`.
///
/// **A stay that cannot be sold is an answer, not an error.** The controller says so: "those
/// nights are taken" is information a guest asked for. So [available] false comes back as a
/// success with [reasons] in it, and the screen reads those out rather than showing a failure.
@freezed
abstract class StayQuoteModel with _$StayQuoteModel {
  const StayQuoteModel._();

  const factory StayQuoteModel({
    String? checkIn,
    String? checkOut,
    @Default(0) int nights,
    @JsonKey(fromJson: parseDouble) @Default(0) double nightsTotal,
    @JsonKey(fromJson: parseDouble) @Default(0) double cleaningFee,
    @JsonKey(fromJson: parseDouble) @Default(0) double total,
    @Default('KES') String currency,
    @Default(1) int minNights,
    @Default(false) bool available,

    /// Why not, in the server's words — "those nights are taken", "under the minimum stay".
    @Default(<String>[]) List<String> reasons,
  }) = _StayQuoteModel;

  factory StayQuoteModel.fromJson(Map<String, dynamic> json) =>
      _$StayQuoteModelFromJson(json);
}
