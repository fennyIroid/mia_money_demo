import 'package:intl/intl.dart';

/// Australia/Sydney is the product's canonical boundary for every period
/// calculation. The demo keeps a fixed offset; a real build would resolve the
/// user's configured IANA zone.
const Duration australianEasternOffset = Duration(hours: 10);

DateTime get nowAest => DateTime.now();

String formatDayMonth(DateTime date) => DateFormat('d MMM').format(date);

String formatFullDate(DateTime date) => DateFormat('d MMMM yyyy').format(date);

String formatShortDate(DateTime date) => DateFormat('d/MM/yy').format(date);

String formatWeekdayShort(DateTime date) => DateFormat('EEE').format(date);

String formatMonthYear(DateTime date) => DateFormat('MMMM yyyy').format(date);

String formatTime(DateTime date) =>
    DateFormat('h:mma').format(date).toLowerCase();

String formatDateTimeStamp(DateTime date) =>
    '${formatDayMonth(date)} · ${formatTime(date)}';

/// Human relative label used by freshness chips and ageing rows.
String relativeLabel(DateTime date, {DateTime? from}) {
  final DateTime base = from ?? nowAest;
  final Duration diff = base.difference(date);
  final int days = diff.inDays;

  if (diff.isNegative) {
    final Duration ahead = date.difference(base);
    if (ahead.inMinutes < 60) return 'in ${ahead.inMinutes}m';
    if (ahead.inHours < 24) return 'in ${ahead.inHours}h';
    if (ahead.inDays == 1) return 'tomorrow';
    if (ahead.inDays < 7) return 'in ${ahead.inDays} days';
    return formatDayMonth(date);
  }

  if (diff.inMinutes < 1) return 'just now';
  if (diff.inMinutes < 60) return '${diff.inMinutes}m ago';
  if (diff.inHours < 24) return '${diff.inHours}h ago';
  if (days == 1) return 'yesterday';
  if (days < 7) return '$days days ago';
  if (days < 30) return '${(days / 7).floor()}w ago';
  return formatDayMonth(date);
}

int daysUntil(DateTime date, {DateTime? from}) {
  final DateTime base = from ?? nowAest;
  final DateTime a = DateTime(base.year, base.month, base.day);
  final DateTime b = DateTime(date.year, date.month, date.day);
  return b.difference(a).inDays;
}

String dueLabel(DateTime date, {DateTime? from}) {
  final int days = daysUntil(date, from: from);
  if (days < 0) return '${days.abs()}d overdue';
  if (days == 0) return 'due today';
  if (days == 1) return 'due tomorrow';
  return 'due in ${days}d';
}

/// Australian financial year label for the period containing [date].
String financialYearLabel(DateTime date) {
  final int startYear = date.month >= 7 ? date.year : date.year - 1;
  return 'FY${(startYear + 1).toString().substring(2)}';
}

MiaDateRange financialYearRange(DateTime date) {
  final int startYear = date.month >= 7 ? date.year : date.year - 1;
  return MiaDateRange(
    start: DateTime(startYear, 7),
    end: DateTime(startYear + 1, 6, 30),
  );
}

MiaDateRange monthRange(DateTime date) => MiaDateRange(
  start: DateTime(date.year, date.month),
  end: DateTime(date.year, date.month + 1, 0),
);

String rangeLabel(MiaDateRange range) =>
    '${formatDayMonth(range.start)} – ${formatDayMonth(range.end)}';

/// Minimal stand-in for Flutter's `DateTimeRange` so the utils layer stays free
/// of widget imports.
class MiaDateRange {
  const MiaDateRange({required this.start, required this.end});

  final DateTime start;
  final DateTime end;

  int get days => end.difference(start).inDays + 1;
}
