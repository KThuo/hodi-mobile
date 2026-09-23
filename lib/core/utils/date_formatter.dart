import 'package:intl/intl.dart';

abstract class DateFormatter {
  static final _dateFormat = DateFormat('dd MMM yyyy');
  static final _dateTimeFormat = DateFormat('dd MMM yyyy, HH:mm');
  static final _shortDateFormat = DateFormat('dd/MM/yyyy');
  static final _monthYearFormat = DateFormat('MMMM yyyy');
  static final _apiDateFormat = DateFormat('yyyy-MM-dd');
  static final _timeFormat = DateFormat('HH:mm');
  static final _stampFormat = DateFormat('yyyy-MM-dd HH:mm');

  static String formatDate(DateTime date) => _dateFormat.format(date);
  static String formatDateTime(DateTime date) => _dateTimeFormat.format(date);
  static String formatShortDate(DateTime date) => _shortDateFormat.format(date);
  static String formatMonthYear(DateTime date) => _monthYearFormat.format(date);
  static String formatForApi(DateTime date) => _apiDateFormat.format(date);

  /// Just the clock time. Needs no BuildContext, unlike `TimeOfDay.format`, which is what makes
  /// it usable from a static helper on a widget.
  static String formatTime(DateTime date) => _timeFormat.format(date);

  /// `2026-09-23 13:01` — a timestamp read as a fact rather than as prose.
  ///
  /// For the moment a thing was recorded, where the point is precision and sorting by eye, not
  /// reading it aloud. The server sends a full ISO instant; printing that raw put
  /// `2026-09-23T13:01:22.481937Z` on the screen.
  static String formatStamp(DateTime date) => _stampFormat.format(date);

  /// The time for something today, the date and time for anything older.
  ///
  /// A gate reads arrivals all day and the date on every one of them is noise; a week-old visit
  /// read as "09:14" with no date would be worse than noise.
  static String formatTimeOrDate(DateTime date) {
    final now = DateTime.now();
    final sameDay =
        date.year == now.year && date.month == now.month && date.day == now.day;
    return sameDay ? formatTime(date) : formatDateTime(date);
  }

  static DateTime? parseApiDate(String? dateString) {
    if (dateString == null || dateString.isEmpty) return null;
    try {
      return DateTime.parse(dateString);
    } catch (_) {
      return null;
    }
  }

  static String timeAgo(DateTime date) {
    final diff = DateTime.now().difference(date);
    if (diff.inDays > 365) return '${diff.inDays ~/ 365}y ago';
    if (diff.inDays > 30) return '${diff.inDays ~/ 30}mo ago';
    if (diff.inDays > 0) return '${diff.inDays}d ago';
    if (diff.inHours > 0) return '${diff.inHours}h ago';
    if (diff.inMinutes > 0) return '${diff.inMinutes}m ago';
    return 'just now';
  }
}
