import 'package:freezed_annotation/freezed_annotation.dart';

part 'house_model.freezed.dart';
part 'house_model.g.dart';

/// A unit as it appears in a list row — the server's `UnitSummary`.
///
/// `id`, `propertyId` and `estateId` are `String`. They are HashIds, salted per user, and the
/// wire carries them as strings: this model declared `int id` until the migration, which made the
/// whole page fail to parse rather than render one wrong row.
///
/// There is no `houseName`. A unit is identified by its code and read aloud by its [label] —
/// "A12 (First Floor)" — which the server composes so that the list, the detail page and every
/// unit picker say the floor identically.
@freezed
abstract class HouseModel with _$HouseModel {
  const HouseModel._();
  const factory HouseModel({
    required String id,
    required String houseCode,
    String? houseNumber,
    int? floor,

    /// Floor 0 as well, so this is what tells a mezzanine unit from a ground-floor one.
    @Default(false) bool mezzanine,

    /// The floor in words — "Ground Floor", "First Floor", "Basement".
    String? floorLabel,

    /// Number and floor together, which is how somebody reads a unit out.
    String? label,
    String? propertyId,
    String? propertyName,
    String? estateId,
    String? estateName,
    String? categoryName,

    /// Residential, Commercial — the legacy list's "House Type" column.
    String? usageClassName,
    String? tenure,

    /// Null where the category does not allow bedrooms — an office, a stall. Render nothing
    /// rather than "0 beds", which is wrong rather than empty.
    int? beds,
    int? baths,
    int? ensuite,
    @Default(false) bool dsq,
    int? parking,
    double? squareFt,

    /// Null for an owned unit, which carries a service charge instead.
    double? rent,
    @Default(false) bool occupied,
    @Default(0) int status,
    String? createdOn,
  }) = _HouseModel;

  factory HouseModel.fromJson(Map<String, dynamic> json) =>
      _$HouseModelFromJson(json);

  /// What to put on the row. The label where the server composed one, the code otherwise —
  /// never an empty line, because a unit always has a code.
  String get displayName => (label?.isNotEmpty ?? false) ? label! : houseCode;
}
