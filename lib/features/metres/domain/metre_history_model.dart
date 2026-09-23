import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/utils/json_parsers.dart';

part 'metre_history_model.freezed.dart';
part 'metre_history_model.g.dart';

/// One reading — `ReadingRow` on the server.
///
/// ## What it says, and what it does not carry
///
/// [hasPhoto] is a flag, not a URL and certainly not the image. Legacy's `imageStatus` had this
/// right and the reason is worth keeping: the viewer opens only where there is something to look at,
/// and nothing is fetched until somebody asks. Twenty readings on screen must not drag twenty
/// photographs along with them.
///
/// The photograph itself is at `GET /meters/readings/{id}/photo`, which returns bytes rather than
/// base64 in an envelope — that costs a third of the size for nothing and gives up HTTP caching, on
/// an image that can never change.
@freezed
abstract class MetreHistoryModel with _$MetreHistoryModel {
  const MetreHistoryModel._();

  const factory MetreHistoryModel({
    String? id,
    String? meterId,
    String? meterNo,

    /// What is being metered — "Water", "Electricity".
    String? chargeName,

    /// What a unit of it is called, for the figures below.
    String? unitLabel,
    @JsonKey(fromJson: parseDouble) @Default(0) double previousReading,
    @JsonKey(fromJson: parseDouble) @Default(0) double currentReading,
    @JsonKey(fromJson: parseDouble) @Default(0) double consumedUnits,

    /// Per unit, at the time this was read — not the meter's rate today.
    @JsonKey(fromJson: parseDouble) @Default(0) double rate,
    @JsonKey(fromJson: parseDouble) @Default(0) double amount,
    String? periodLabel,
    String? readOn,
    String? note,

    /// The invoice this reading was billed on, or null while it is still billable.
    String? invoiceRrn,
    @Default(false) bool billed,

    /// Whether a photograph of the dial was taken. See the note above.
    @Default(false) bool hasPhoto,
  }) = _MetreHistoryModel;

  factory MetreHistoryModel.fromJson(Map<String, dynamic> json) =>
      _$MetreHistoryModelFromJson(json);

  /// "42 m³ × KES 120" — the working, so a tenant can check the charge rather than take it on trust.
  String get working {
    if (consumedUnits <= 0 || rate <= 0) return '';
    final units = unitLabel == null ? '' : ' $unitLabel';
    return '${consumedUnits.toStringAsFixed(consumedUnits % 1 == 0 ? 0 : 2)}$units'
        ' × ${rate.toStringAsFixed(2)}';
  }
}

/// One year of a meter's readings, and the years there are to choose from.
///
/// ## Why this exists
///
/// The screen parsed the reply as a `PagedResponse`, looking for `content`, `number` and
/// `totalElements`. The server sends none of those: `GET /meters/{id}/readings` answers a
/// `ReadingHistory` — a year, the years available, and the rows. So the parse found no `content`,
/// produced an empty list, and the history screen showed nothing at all while the readings were
/// sitting in the reply.
///
/// The two are together in one response deliberately, and the server's own note says why: fetched
/// separately, a year can be offered that the rows call empty, or held back while rows for it are
/// already on screen.
@freezed
abstract class MetreHistoryPage with _$MetreHistoryPage {
  const MetreHistoryPage._();

  const factory MetreHistoryPage({
    /// The year these readings are for — the one asked for, or the current one.
    @Default(0) int year,

    /// Every year this meter has a reading in, newest first. May not contain [year], which is why
    /// the picker shows the current year whether or not anything was read in it.
    @Default(<int>[]) List<int> years,
    @Default(<MetreHistoryModel>[]) List<MetreHistoryModel> readings,
  }) = _MetreHistoryPage;

  factory MetreHistoryPage.fromJson(Map<String, dynamic> json) =>
      _$MetreHistoryPageFromJson(json);
}
