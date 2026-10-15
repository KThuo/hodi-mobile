import 'package:freezed_annotation/freezed_annotation.dart';

part 'pass_model.freezed.dart';
part 'pass_model.g.dart';

/// A pass a tenant sent their visitor — the server's `PassRow`.
///
/// [state] is decided on the server so the tenant's screen and the gate's never disagree:
/// `VALID`, `NOT_YET`, `EXPIRED`, `CANCELLED`, `HOST_LEFT` or `ON_SITE`. [stateLabel] is the same
/// in words, ready to show. Only a [admissible] pass can be admitted.
@freezed
abstract class PassModel with _$PassModel {
  const PassModel._();

  const factory PassModel({
    required String id,

    /// As shown and read out: `7K2M9-XQ4TB`.
    required String passCode,
    required String state,
    required String stateLabel,
    required String validFrom,
    required String validUntil,
    required String visitorName,
    String? visitorPhone,
    String? idType,

    /// Masked, as on a visit.
    String? idNumber,
    @Default(false) bool hasIdNumber,
    @Default(1) int visitorCount,
    String? vehicleReg,
    @Default('SOCIAL') String purpose,
    String? purposeNotes,
    String? estateName,
    String? propertyName,
    String? houseId,

    /// The unit as somebody at the gate says it — `M08 (Second Floor)`.
    @Default('') String unitLabel,

    /// The host.
    String? tenantName,
    String? cancelledOn,
    String? createdOn,
    @Default(0) int admissions,
    String? openVisitId,
    String? onSiteSince,
    @Default(false) bool admissible,
  }) = _PassModel;

  factory PassModel.fromJson(Map<String, dynamic> json) =>
      _$PassModelFromJson(json);

  bool get cancelled => state == 'CANCELLED';

  /// Still worth showing the visitor: not cancelled, not over, the host still there.
  bool get current =>
      state == 'VALID' || state == 'NOT_YET' || state == 'ON_SITE';

  /// Where, in one line: `Riverside Court · M08 (Second Floor)`.
  String get where => [
        if (propertyName != null && propertyName!.isNotEmpty) propertyName!,
        if (unitLabel.isNotEmpty) unitLabel,
      ].join(' · ');
}
