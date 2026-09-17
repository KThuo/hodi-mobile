import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/utils/json_parsers.dart';

part 'lease_models.freezed.dart';
part 'lease_models.g.dart';

/// A tenancy agreement as it appears in a list — the server's `LeaseRow`.
@freezed
abstract class LeaseModel with _$LeaseModel {
  const LeaseModel._();

  const factory LeaseModel({
    required String id,
    required String tenantName,
    String? tenantPhone,
    required String houseCode,
    String? houseLabel,
    String? propertyName,
    String? estateName,
    String? tenure,
    @JsonKey(fromJson: parseDouble) @Default(0) double rent,
    int? dueDay,
    String? occupiedOn,
    String? expiresOn,

    /// Negative means the term has already passed, which is a normal state for a periodic tenancy
    /// that ran past its first term — not an error, and not a reason to hide the row.
    int? daysToExpiry,
    int? noticeDays,
    @Default(0) int documents,

    /// The server's own word for where this agreement stands.
    String? term,
  }) = _LeaseModel;

  factory LeaseModel.fromJson(Map<String, dynamic> json) =>
      _$LeaseModelFromJson(json);

  String get unit =>
      (houseLabel?.isNotEmpty ?? false) ? houseLabel! : houseCode;

  /// Expiring inside [days], and not already past. The list's own judgement for a badge; the
  /// server has `/expiring` when the question is the whole list rather than one row.
  bool expiringWithin(int days) {
    final left = daysToExpiry;
    return left != null && left >= 0 && left <= days;
  }

  bool get lapsed => (daysToExpiry ?? 0) < 0;
}

/// One agreement, with its documents and the changes made to its terms.
@freezed
abstract class LeaseDetailModel with _$LeaseDetailModel {
  const LeaseDetailModel._();

  const factory LeaseDetailModel({
    required String id,
    required String tenantName,
    String? tenantPhone,
    required String houseCode,
    String? houseLabel,
    String? houseId,
    String? propertyId,
    String? propertyName,
    String? estateName,
    String? tenure,
    @JsonKey(fromJson: parseDouble) @Default(0) double rent,
    @JsonKey(fromJson: parseDouble) @Default(0) double deposit,
    @JsonKey(fromJson: parseDouble) @Default(0) double refundableDeposit,
    int? dueDay,
    String? occupiedOn,
    String? expiresOn,
    int? daysToExpiry,
    int? noticeDays,
    String? specialConditions,
    String? term,

    /// Whether the tenant may see this agreement at all. A property setting, decided by whoever
    /// runs it — so the app asks rather than assuming, and the tenant's own read is a separate
    /// path that honours it.
    @Default(false) bool tenantCanView,

    /// Whether the generated agreement applies to this tenancy. An owned unit may be excluded,
    /// which is a per-property lease setting rather than a missing document.
    @Default(false) bool agreementApplies,
    @Default(<LeaseDocumentModel>[]) List<LeaseDocumentModel> documents,
    @Default(<LeaseTermChangeModel>[]) List<LeaseTermChangeModel> history,
  }) = _LeaseDetailModel;

  factory LeaseDetailModel.fromJson(Map<String, dynamic> json) =>
      _$LeaseDetailModelFromJson(json);

  String get unit =>
      (houseLabel?.isNotEmpty ?? false) ? houseLabel! : houseCode;

  /// The documents still in force. A superseded one is kept for the record and is not what
  /// somebody opening "the agreement" means.
  List<LeaseDocumentModel> get current =>
      documents.where((d) => !d.superseded).toList();
}

/// A file attached to an agreement.
@freezed
abstract class LeaseDocumentModel with _$LeaseDocumentModel {
  const LeaseDocumentModel._();

  const factory LeaseDocumentModel({
    required String id,
    String? kind,
    String? title,
    String? fileName,
    String? contentType,
    @JsonKey(fromJson: parseIntOrZero) @Default(0) int byteSize,

    /// Replaced by a later version. Kept, because an agreement's history is the point of keeping
    /// documents at all — shown, but marked.
    @Default(false) bool superseded,
    String? uploadedOn,
    String? uploadedBy,
  }) = _LeaseDocumentModel;

  factory LeaseDocumentModel.fromJson(Map<String, dynamic> json) =>
      _$LeaseDocumentModelFromJson(json);

  String get label {
    final t = title;
    if (t != null && t.isNotEmpty) return t;
    final f = fileName;
    if (f != null && f.isNotEmpty) return f;
    return kind ?? 'Document';
  }

  /// Rounded to the unit somebody reads, because an exact byte count is not information here.
  String get size {
    if (byteSize <= 0) return '';
    if (byteSize < 1024) return '$byteSize B';
    if (byteSize < 1024 * 1024) return '${(byteSize / 1024).round()} KB';
    return '${(byteSize / (1024 * 1024)).toStringAsFixed(1)} MB';
  }
}

/// A change made to the agreed terms — the server's `TermChangeRow`.
///
/// Before and after for each thing that can move, rather than one "what changed" string: a rent
/// review and a new end date are different facts, and a tenancy can have both on one date.
@freezed
abstract class LeaseTermChangeModel with _$LeaseTermChangeModel {
  const LeaseTermChangeModel._();

  const factory LeaseTermChangeModel({
    required String id,
    String? changeType,
    String? effectiveOn,
    @JsonKey(fromJson: parseDoubleNullable) double? rentBefore,
    @JsonKey(fromJson: parseDoubleNullable) double? rentAfter,
    int? dueDayBefore,
    int? dueDayAfter,
    String? expiresBefore,
    String? expiresAfter,
    String? reason,
    String? recordedOn,
    String? recordedBy,
  }) = _LeaseTermChangeModel;

  factory LeaseTermChangeModel.fromJson(Map<String, dynamic> json) =>
      _$LeaseTermChangeModelFromJson(json);

  bool get rentMoved => rentBefore != null && rentAfter != null;
  bool get expiryMoved => expiresBefore != null || expiresAfter != null;
  bool get dueDayMoved => dueDayBefore != null && dueDayAfter != null;
}
