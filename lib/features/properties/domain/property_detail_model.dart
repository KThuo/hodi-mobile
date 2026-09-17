import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../core/domain/named_ref.dart';
import '../../../core/utils/json_parsers.dart';

part 'property_detail_model.freezed.dart';
part 'property_detail_model.g.dart';

/// One property — the server's `PropertyDetail`.
///
/// **No money in here, and that is the shape of the rebuilt backend rather than an omission.**
/// The legacy endpoint returned `totalCollection`, `totalInvoiced`, `totalArrears` and a `period`
/// parameter to move them around; `PropertyController` accepts no such parameter and
/// `PropertyDetail` carries no such fields. A property's month is a report now, and the screen
/// reads it from `/reports/property-reports` — see [PropertyReportModel].
@freezed
abstract class PropertyDetailModel with _$PropertyDetailModel {
  const PropertyDetailModel._();
  const factory PropertyDetailModel({
    required String id,
    required String name,
    String? estateId,
    String? estateName,
    String? location,
    double? latitude,
    double? longitude,
    int? floors,
    @Default(0) int basementFloors,
    @Default(false) bool hasMezzanine,

    /// Live tenancies here. Not the same as [occupiedUnits]: a unit is flagged occupied, a
    /// tenancy is a person with terms and a balance. They agree in practice, but a count labelled
    /// "Tenants" has to count tenants or it promises rows it cannot show.
    @Default(0) int tenancyCount,
    String? contactName,
    String? phone,
    String? email,
    String? bankId,
    String? bankName,
    @JsonKey(fromJson: parseDoubleNullable) double? commission,
    int? invoiceGenerationDay,
    int? expenseGenerationDay,

    /// Printed on this property's invoices. Null means unset, which the screen says out loud —
    /// an invoice going out with no payment instructions is worth noticing before it is sent.
    String? paymentInstructions,
    String? invoiceFooter,
    @Default(false) bool tenantCanViewLease,
    @Default(false) bool leaseCoversOwned,
    int? defaultNoticeDays,
    String? shortNoticePenalty,
    @JsonKey(fromJson: parseDoubleNullable) double? shortNoticePenaltyAmount,
    @Default(0) int units,
    @Default(0) int occupiedUnits,
    @Default(0) int vacantUnits,
    @Default(0) int status,
    String? createdOn,

    /// The tenures this property offers — RENTAL, OWNED, BNB.
    @Default(<String>[]) List<String> tenures,
    @Default(<TenureCount>[]) List<TenureCount> tenureMix,
    @Default(<NamedRef>[]) List<NamedRef> categories,
    @Default(<NamedRef>[]) List<NamedRef> features,

    /// Who is assigned here — the answer to "who do I call about this block".
    @Default(<NamedRef>[]) List<NamedRef> caretakers,

    /// Sections whose data belongs to a module that does not exist yet. Named rather than sent
    /// as zeroes, because a zero in a money field reads as "nothing owed".
    @Default(<String>[]) List<String> pending,
  }) = _PropertyDetailModel;

  factory PropertyDetailModel.fromJson(Map<String, dynamic> json) =>
      _$PropertyDetailModelFromJson(json);

  double get occupancyRate => units > 0 ? (occupiedUnits / units) * 100 : 0;
}

/// How many units of each tenure, for the mix bar.
@freezed
abstract class TenureCount with _$TenureCount {
  const TenureCount._();
  const factory TenureCount({
    required String tenure,
    @Default(0) int units,
    @Default(0) int occupied,
  }) = _TenureCount;

  factory TenureCount.fromJson(Map<String, dynamic> json) =>
      _$TenureCountFromJson(json);
}
