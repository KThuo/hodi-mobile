import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/utils/date_formatter.dart';
import '../../../core/utils/json_parsers.dart';

part 'metre_model.freezed.dart';
part 'metre_model.g.dart';

/// One meter — `MeterRow` on the server.
///
/// ## Why this was mostly dashes
///
/// Every field here but the two readings used to carry its legacy name — `metreNo`, `billName`,
/// `houseName`, `property`, `charge`, `amount`, `updatedOn`. The rebuilt server sends `meterNo`,
/// `chargeName`, `houseLabel`, `propertyName`, `rate`, `lastAmount`, `lastReadOn`, and a name that
/// does not arrive is not an error in `json_serializable` — it is a default. So the screen drew a
/// row of "-" against a response that had every one of those values in it.
///
/// `previousReading` and `currentReading` were the two that happened to be spelled the same, which
/// is exactly why the list looked half-loaded rather than broken.
///
/// ## Two rates, deliberately
///
/// [rate] is what the charge costs today and prices the *next* reading — it is what the update sheet
/// must show. [lastRate] is what the last reading was actually priced at, and the two differ the
/// moment a tariff changes. Showing today's rate beside a historical amount would be arithmetic that
/// does not add up.
@freezed
abstract class MetreModel with _$MetreModel {
  const MetreModel._();

  const factory MetreModel({
    /// Hashed and salted per user. Opaque.
    String? id,
    String? meterNo,
    String? utilityChargeId,

    /// What is being metered — "Water", "Electricity".
    String? chargeName,

    /// What a unit of it is called — "m³", "kWh".
    String? unitLabel,

    /// Today's rate per unit, for the next reading. See the note above.
    @JsonKey(fromJson: parseDouble) @Default(0) double rate,

    String? houseId,
    String? houseCode,
    String? houseNumber,

    /// "WA03 (2nd Floor)" — the unit as somebody says it out loud.
    String? houseLabel,
    String? propertyName,
    String? estateName,

    @JsonKey(fromJson: parseDouble) @Default(0) double currentReading,
    @JsonKey(fromJson: parseDouble) @Default(0) double previousReading,
    @JsonKey(fromJson: parseDouble) @Default(0) double consumedUnits,

    /// What the last reading was priced at, which is not always [rate].
    @JsonKey(fromJson: parseDouble) @Default(0) double lastRate,
    @JsonKey(fromJson: parseDouble) @Default(0) double lastAmount,

    /// "September 2026" — the billing month the last reading belongs to.
    String? lastReadPeriod,
    String? lastReadOn,

    /// No reading yet for the current billing month.
    ///
    /// Which is the same thing as "a reading may be taken now": the server refuses a second reading
    /// in a period it has already been read for, so a screen that offered the button anyway would be
    /// offering a rejection.
    @Default(false) bool readingDue,

    @Default(1) int status,
    String? deactivationReason,
  }) = _MetreModel;

  factory MetreModel.fromJson(Map<String, dynamic> json) =>
      _$MetreModelFromJson(json);

  bool get isActive => status == 1;

  /// The unit as somebody would say it, falling back to the code.
  String get unit => houseLabel ?? houseCode ?? '-';

  /// "42 m³" — the consumption with the name of what was consumed.
  String get consumption {
    final units = consumedUnits % 1 == 0
        ? consumedUnits.toStringAsFixed(0)
        : consumedUnits.toStringAsFixed(2);
    return '$units ${unitLabel ?? 'units'}';
  }

  /// When it was last read, as a date rather than as an instant off the wire.
  String? get lastReadOnLabel {
    if (lastReadOn == null) return null;
    final when = DateTime.tryParse(lastReadOn!);
    return when == null ? lastReadOn : DateFormatter.formatDate(when.toLocal());
  }
}
