import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/utils/json_parsers.dart';

part 'tenant_report_model.freezed.dart';
part 'tenant_report_model.g.dart';

/// Where one tenancy stands — the server's `TenantReportRow`.
///
/// `unitLabel`, `accountBalance` and `collectionRate` are `@JsonProperty` methods on the record
/// rather than stored columns, which means they arrive on the wire like any other field and are
/// **not** recomputed here. That is the point: the report screen, the export and this app then
/// cannot disagree about what a balance is.
@freezed
abstract class TenantReportModel with _$TenantReportModel {
  const TenantReportModel._();

  const factory TenantReportModel({
    required String id,
    String? tenantUserId,
    required String tenantName,
    String? tenantPhone,
    String? houseId,
    String? houseCode,
    String? houseNumber,

    /// Composed by the server, as everywhere else in the platform.
    String? unitLabel,
    String? categoryName,
    String? propertyName,
    String? estateName,
    @JsonKey(fromJson: parseDouble) @Default(0) double rent,
    @JsonKey(fromJson: parseDouble) @Default(0) double depositHeld,
    String? occupiedOn,
    String? expiresOn,
    @JsonKey(fromJson: parseDouble) @Default(0) double invoicedAmount,
    @JsonKey(fromJson: parseDouble) @Default(0) double paidAmount,
    @JsonKey(fromJson: parseDouble) @Default(0) double rentInvoiced,
    @JsonKey(fromJson: parseDouble) @Default(0) double arrears,
    @JsonKey(fromJson: parseDouble) @Default(0) double credit,

    /// Arrears less credit — the one number that answers "where does this tenancy stand".
    /// Computed by the server so every screen showing it shows the same thing.
    @JsonKey(fromJson: parseDouble) @Default(0) double accountBalance,
    @Default(0) int unpaidInvoices,

    /// How many days old the oldest unpaid invoice is. Null where nothing is unpaid.
    int? oldestUnpaid,
    String? lastPaymentOn,
    @JsonKey(fromJson: parseDouble) @Default(0) double lastPaymentAmount,

    /// Null where nothing was invoiced — a tenancy nobody has billed has no rate, which is not
    /// the same as a rate of nought.
    @JsonKey(fromJson: parseDoubleNullable) double? collectionRate,
  }) = _TenantReportModel;

  factory TenantReportModel.fromJson(Map<String, dynamic> json) =>
      _$TenantReportModelFromJson(json);

  String get unit =>
      (unitLabel?.isNotEmpty ?? false) ? unitLabel! : (houseCode ?? '');

  bool get owes => accountBalance > 0;
  bool get inCredit => accountBalance < 0;
}

/// A page of the tenant report, with the server's aggregate over the rows on it.
///
/// Same rule as the property report: **read `totals`, never `content.first`.** They are the totals
/// of the rows returned, which is what the screen must say out loud when there are more.
@freezed
abstract class TenantReportPageModel with _$TenantReportPageModel {
  const TenantReportPageModel._();

  const factory TenantReportPageModel({
    @Default(<TenantReportModel>[]) List<TenantReportModel> content,
    @Default(0) int page,
    @Default(0) int pageSize,
    @Default(0) int totalElements,
    TenantReportTotalsModel? totals,
  }) = _TenantReportPageModel;

  factory TenantReportPageModel.fromJson(Map<String, dynamic> json) =>
      _$TenantReportPageModelFromJson(json);

  /// Whether the totals below cover everything, or only what came back.
  bool get partial => totalElements > content.length;
}

@freezed
abstract class TenantReportTotalsModel with _$TenantReportTotalsModel {
  const TenantReportTotalsModel._();

  const factory TenantReportTotalsModel({
    @Default(0) int tenancies,
    @JsonKey(fromJson: parseDouble) @Default(0) double rent,
    @JsonKey(fromJson: parseDouble) @Default(0) double depositHeld,
    @JsonKey(fromJson: parseDouble) @Default(0) double invoicedAmount,
    @JsonKey(fromJson: parseDouble) @Default(0) double paidAmount,
    @JsonKey(fromJson: parseDouble) @Default(0) double arrears,
    @JsonKey(fromJson: parseDouble) @Default(0) double credit,
    @JsonKey(fromJson: parseDouble) @Default(0) double accountBalance,

    /// How many of the tenancies owe anything.
    @Default(0) int owing,
    @JsonKey(fromJson: parseDoubleNullable) double? collectionRate,
  }) = _TenantReportTotalsModel;

  factory TenantReportTotalsModel.fromJson(Map<String, dynamic> json) =>
      _$TenantReportTotalsModelFromJson(json);
}
