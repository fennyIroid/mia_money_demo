import 'package:decimal/decimal.dart';
import 'package:intl/intl.dart';

/// All display money in the product flows through here. Amounts are stored as
/// [Decimal] in the data layer and only converted to double for painting, never
/// for arithmetic — mirroring the deterministic-engine rule in the brief.
String formatCurrency(
  num amount, {
  int decimals = 2,
  bool showSign = false,
  bool showSymbol = true,
}) {
  final NumberFormat formatter = NumberFormat.currency(
    locale: 'en_AU',
    symbol: showSymbol ? r'$' : '',
    decimalDigits: decimals,
  );
  final String formatted = formatter.format(amount.abs());
  if (showSign) {
    final String sign = amount < 0 ? '−' : '+';
    return '$sign$formatted';
  }
  return amount < 0 ? '−$formatted' : formatted;
}

/// Compact form for tiles: $1.2k, $18.4k, $1.1m.
String formatCurrencyCompact(num amount) {
  final double abs = amount.abs().toDouble();
  final String sign = amount < 0 ? '−' : '';
  if (abs >= 1000000) {
    return '$sign\$${(abs / 1000000).toStringAsFixed(abs >= 10000000 ? 0 : 1)}m';
  }
  if (abs >= 1000) {
    return '$sign\$${(abs / 1000).toStringAsFixed(abs >= 10000 ? 0 : 1)}k';
  }
  return '$sign\$${abs.toStringAsFixed(0)}';
}

String formatPercent(num value, {int decimals = 1, bool showSign = false}) {
  final String body = '${value.abs().toStringAsFixed(decimals)}%';
  if (showSign) {
    return '${value < 0 ? '−' : '+'}$body';
  }
  return value < 0 ? '−$body' : body;
}

String formatNumber(num value, {int decimals = 0}) =>
    NumberFormat.decimalPatternDigits(
      locale: 'en_AU',
      decimalDigits: decimals,
    ).format(value);

/// Cent-safe addition used by the dummy calculation engine.
Decimal sumAmounts(Iterable<Decimal> amounts) =>
    amounts.fold(Decimal.zero, (Decimal a, Decimal b) => a + b);

Decimal toDecimal(num value) => Decimal.parse(value.toString());

double asDouble(Decimal value) => value.toDouble();

/// Percentage difference with the brief's "no infinite percentage" rule: when
/// the base period is zero the caller gets null and must show a "new" state.
double? percentChange({required num current, required num previous}) {
  if (previous == 0) return null;
  return ((current - previous) / previous.abs()) * 100;
}
