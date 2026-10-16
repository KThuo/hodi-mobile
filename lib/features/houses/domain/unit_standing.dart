import '../../../core/utils/date_formatter.dart';
import '../../../core/widgets/hodi_status_badge.dart';

/// Where a unit stands for letting, in the words the web uses.
///
/// In order, because the first that applies is the one that matters:
/// - **Suspended** (status other than 1): out of service; "Vacant" would say it can be let.
/// - **Vacant · confirm**: back on the market by itself on its expected-back date, waiting on the
///   office to say it really is ready.
/// - **Unavailable**: a vacant unit held back — repairs, renovation, reserved — until a date.
/// - **Occupied**, or **Vacant**, with the day it comes free where that is still ahead.
class UnitStanding {
  final String label;

  /// A second line where there is more to say: "Repairs · back 30 Nov 2026".
  final String? detail;
  final BadgeType type;

  const UnitStanding(this.label, this.type, [this.detail]);

  static const reasons = {
    'REPAIRS': 'Repairs',
    'RENOVATION': 'Renovation',
    'RESERVED': 'Reserved',
    'OTHER': 'Held back',
  };

  factory UnitStanding.of({
    required int status,
    required bool occupied,
    String availability = 'AVAILABLE',
    String? reason,
    String? note,
    String? availableFrom,
    String? reviewSince,
    DateTime? today,
  }) {
    final now = today ?? DateTime.now();
    final from = DateTime.tryParse(availableFrom ?? '');
    final ahead = from != null && from.isAfter(DateTime(now.year, now.month, now.day))
        ? DateFormatter.formatDate(from)
        : null;
    final why = reasons[reason] ?? 'Held back';

    if (status != 1) return const UnitStanding('Suspended', BadgeType.error);
    final since = DateTime.tryParse(reviewSince ?? '');
    if (since != null && availability == 'AVAILABLE') {
      return UnitStanding('Vacant · confirm', BadgeType.warning,
          'Back from ${why.toLowerCase()} on ${DateFormatter.formatDate(since)}');
    }
    if (availability == 'UNAVAILABLE') {
      final parts = [why, if (ahead != null) 'back $ahead', if (note != null && note.isNotEmpty) note];
      return UnitStanding('Unavailable', BadgeType.error, parts.join(' · '));
    }
    if (occupied) {
      return ahead == null
          ? const UnitStanding('Occupied', BadgeType.success)
          : UnitStanding('Occupied', BadgeType.success, 'Free from $ahead');
    }
    return ahead == null
        ? const UnitStanding('Vacant', BadgeType.warning)
        : UnitStanding('Vacant', BadgeType.warning, 'Can be let from $ahead');
  }
}
