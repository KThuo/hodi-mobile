import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/utils/json_parsers.dart';
import '../../occupations/domain/occupation_model.dart';
import 'tenant_model.dart';

part 'tenant_detail_model.freezed.dart';
part 'tenant_detail_model.g.dart';

/// One tenant, with where they live now and where they have lived — the server's `TenantDetail`.
///
/// **It nests the row rather than repeating it**, the same shape as invoices and maintenance: the
/// `tenant` here is the very `TenantRow` the list is built from, so there is one definition of
/// what a tenant is and the detail adds only what a detail has.
///
/// The legacy model expected a flat `{name, email, phone, content: {...financial summary}}`. None
/// of that is sent. A tenant's money belongs to their tenancies, which is why [current] carries
/// `OccupationRow` — rent, deposit, arrears, due day — rather than the tenant carrying a balance.
@freezed
abstract class TenantDetailModel with _$TenantDetailModel {
  const TenantDetailModel._();

  const factory TenantDetailModel({
    required TenantModel tenant,

    /// Live tenancies. More than one is normal.
    @Default(<OccupationModel>[]) List<OccupationModel> current,

    /// Where they have lived before, most recent first.
    @Default(<TenancyHistoryModel>[]) List<TenancyHistoryModel> history,

    /// Sections whose data belongs to a module that does not exist yet. Named rather than sent as
    /// zeroes, because a zero in a money field reads as "nothing owed".
    @Default(<String>[]) List<String> pending,
  }) = _TenantDetailModel;

  factory TenantDetailModel.fromJson(Map<String, dynamic> json) =>
      _$TenantDetailModelFromJson(json);

  /// What they owe across every live tenancy. Summed from the tenancies rather than read off the
  /// tenant, because that is where the figure lives — positive is arrears, negative is credit.
  double get totalOwed =>
      current.fold(0, (sum, o) => sum + o.rentOwed);

  /// What they pay across every live tenancy.
  double get totalRent => current.fold(0, (sum, o) => sum + o.rent);

  bool get inArrears => totalOwed > 0;
}

/// A tenancy that has ended — the server's `OccupationHistoryRow`.
@freezed
abstract class TenancyHistoryModel with _$TenancyHistoryModel {
  const TenancyHistoryModel._();

  const factory TenancyHistoryModel({
    required String id,
    String? occupationId,
    String? houseId,
    required String houseCode,
    String? houseLabel,
    String? propertyName,
    String? tenure,
    @JsonKey(fromJson: parseDouble) @Default(0) double rent,
    @JsonKey(fromJson: parseDouble) @Default(0) double deposit,
    @JsonKey(fromJson: parseDouble) @Default(0) double refundableDeposit,
    String? occupiedOn,
    String? vacatedOn,

    /// How long they were there, counted by the server.
    @Default(0) int nights,
    String? reason,
    String? notes,
  }) = _TenancyHistoryModel;

  factory TenancyHistoryModel.fromJson(Map<String, dynamic> json) =>
      _$TenancyHistoryModelFromJson(json);

  String get unit => (houseLabel?.isNotEmpty ?? false) ? houseLabel! : houseCode;

  /// Nights read badly past a few weeks. Months are what somebody says about a tenancy.
  String get duration {
    if (nights <= 0) return '';
    if (nights < 60) return '$nights nights';
    final months = (nights / 30).round();
    if (months < 24) return '$months months';
    return '${(months / 12).toStringAsFixed(1)} years';
  }
}
