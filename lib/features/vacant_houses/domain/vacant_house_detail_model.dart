import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/utils/json_parsers.dart';

part 'vacant_house_detail_model.freezed.dart';
part 'vacant_house_detail_model.g.dart';

/// One unit to let — the server's `ListingDetail`, from the public `/vacant-units/{id}`.
@freezed
abstract class VacantHouseDetailModel with _$VacantHouseDetailModel {
  const VacantHouseDetailModel._();

  const factory VacantHouseDetailModel({
    required String id,
    @Default('') String title,
    String? categoryName,

    /// Residential, Commercial.
    String? usageClassName,
    String? description,
    String? propertyName,
    String? area,
    @JsonKey(fromJson: parseDoubleNullable) double? rent,
    @JsonKey(fromJson: parseDoubleNullable) double? deposit,

    /// Everything payable before the keys change hands, itemised. Some of it comes back at the
    /// end and some does not, which is the distinction [MoveInCostModel.refundable] carries.
    @Default(<MoveInCostModel>[]) List<MoveInCostModel> moveInCosts,
    int? bedrooms,
    int? bathrooms,
    int? ensuiteBathrooms,
    @JsonKey(fromJson: parseDoubleNullable) double? squareFt,
    String? floorLabel,
    @Default(false) bool dsq,
    int? parkingSpaces,
    double? latitude,
    double? longitude,
    @Default(<String>[]) List<String> images,
    @Default(<ListingAmenity>[]) List<ListingAmenity> amenities,
    String? availableFrom,
    String? contactName,
    String? contactPhone,
    String? contactEmail,
  }) = _VacantHouseDetailModel;

  factory VacantHouseDetailModel.fromJson(Map<String, dynamic> json) =>
      _$VacantHouseDetailModelFromJson(json);

  bool get hasContact =>
      (contactPhone?.isNotEmpty ?? false) || (contactEmail?.isNotEmpty ?? false);

  String get roomsLine => [
        if (bedrooms != null) '$bedrooms bed',
        if (bathrooms != null) '$bathrooms bath',
        if (ensuiteBathrooms != null && ensuiteBathrooms! > 0)
          '$ensuiteBathrooms ensuite',
        if (dsq) 'DSQ',
        if (parkingSpaces != null && parkingSpaces! > 0) '$parkingSpaces parking',
      ].join(' · ');

  /// What it costs to move in: the itemised list, summed.
  ///
  /// Summed from the rows shown rather than taken from a separate total, so the figure printed
  /// under them is one somebody can add up themselves. An item with no amount contributes
  /// nothing — "deposit: one month" is a rule, not a number, and the server sends it as such.
  double get totalMoveInCost =>
      moveInCosts.fold(0, (sum, c) => sum + (c.amount ?? 0));

  /// Of that, what comes back at the end.
  double get refundableAtEnd => moveInCosts
      .where((c) => c.refundable)
      .fold(0, (sum, c) => sum + (c.amount ?? 0));
}

/// One line of what it costs to move in.
@freezed
abstract class MoveInCostModel with _$MoveInCostModel {
  const MoveInCostModel._();

  const factory MoveInCostModel({
    required String name,

    /// Null where the charge is expressed as a rule rather than a figure — "two months' rent"
    /// before a rent has been agreed. Shown as the rule, not as zero.
    @JsonKey(fromJson: parseDoubleNullable) double? amount,

    /// Whether it comes back at the end. The difference between a deposit and a fee, and the
    /// thing somebody most wants to know when they add the total up.
    @Default(false) bool refundable,

    /// Expressed in months of rent, where that is how it is set.
    int? months,
  }) = _MoveInCostModel;

  factory MoveInCostModel.fromJson(Map<String, dynamic> json) =>
      _$MoveInCostModelFromJson(json);
}

@freezed
abstract class ListingAmenity with _$ListingAmenity {
  const ListingAmenity._();

  const factory ListingAmenity({
    required String name,
    String? icon,
  }) = _ListingAmenity;

  factory ListingAmenity.fromJson(Map<String, dynamic> json) =>
      _$ListingAmenityFromJson(json);
}

/// A filter choice the server offers, with how many listings match it.
///
/// The count is the point: a category with three units behind it is worth a tap and one with none
/// is not, and the server counts so the app does not have to search to find out.
@freezed
abstract class ListingChoice with _$ListingChoice {
  const ListingChoice._();

  const factory ListingChoice({
    required String value,
    required String label,
    @Default(0) int count,
  }) = _ListingChoice;

  factory ListingChoice.fromJson(Map<String, dynamic> json) =>
      _$ListingChoiceFromJson(json);
}

/// What can be filtered on — one call, not two.
@freezed
abstract class ListingFilters with _$ListingFilters {
  const ListingFilters._();

  const factory ListingFilters({
    @Default(<ListingChoice>[]) List<ListingChoice> categories,

    /// Areas, which is what the server offers instead of house types. The app asked for
    /// `/filters/house-types` and there is no such endpoint.
    @Default(<ListingChoice>[]) List<ListingChoice> areas,
    @JsonKey(fromJson: parseDoubleNullable) double? minRent,
    @JsonKey(fromJson: parseDoubleNullable) double? maxRent,
    @Default(0) int maxBedrooms,
    @Default(0) int total,
  }) = _ListingFilters;

  factory ListingFilters.fromJson(Map<String, dynamic> json) =>
      _$ListingFiltersFromJson(json);
}
