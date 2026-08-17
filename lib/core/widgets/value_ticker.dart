import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../theme/app_motion.dart';
import '../theme/app_typography.dart';
import '../utils/currency_utils.dart';
import '../utils/math_utils.dart';
import 'base_text.dart';

enum TickerFormat { currency, currencyCompact, percent, plain, integer }

/// Counts a figure up from zero on first paint and animates between values on
/// change. Every headline number in the product uses this so figures always
/// arrive with weight instead of snapping in.
class ValueTicker extends StatelessWidget {
  const ValueTicker({
    super.key,
    required this.value,
    this.format = TickerFormat.currency,
    this.fontSize = 40,
    this.fontWeight = FontWeight.w700,
    this.textColor,
    this.duration,
    this.prefix,
    this.suffix,
    this.decimals = 2,
    this.showSign = false,
    this.textStyle,
    this.suffixFontSize,
  });

  final double value;
  final TickerFormat format;
  final double fontSize;
  final FontWeight fontWeight;
  final Color? textColor;
  final Duration? duration;
  final String? prefix;
  final String? suffix;
  final int decimals;
  final bool showSign;
  final TextStyle? textStyle;
  final double? suffixFontSize;

  String _format(double v) {
    switch (format) {
      case TickerFormat.currency:
        return formatCurrency(v, decimals: decimals, showSign: showSign);
      case TickerFormat.currencyCompact:
        return formatCurrencyCompact(v);
      case TickerFormat.percent:
        return formatPercent(v, decimals: decimals);
      case TickerFormat.plain:
        return v.toStringAsFixed(decimals);
      case TickerFormat.integer:
        return v.round().toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween<double>(begin: 0, end: value),
      duration: duration ?? AppMotion.cinematic,
      curve: AppMotion.enter,
      builder: (BuildContext context, double animated, Widget? _) {
        // Figures are never truncated or wrapped — when a number outgrows the
        // space it is given, the whole group scales down together so the
        // prefix, figure and suffix keep their proportions.
        return FittedBox(
          fit: BoxFit.scaleDown,
          alignment: Alignment.centerLeft,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              if (prefix != null)
                Padding(
                  padding: EdgeInsets.only(top: getSize(fontSize * 0.12)),
                  child: BaseText(
                    prefix!,
                    fontSize: fontSize * 0.5,
                    fontWeight: FontWeight.w600,
                    textColor: textColor ?? AppColors.frost,
                    textStyle: AppTypography.figureMedium,
                  ),
                ),
              BaseText(
                _format(animated),
                fontSize: fontSize,
                fontWeight: fontWeight,
                textColor: textColor ?? AppColors.frost,
                textStyle: textStyle ?? AppTypography.figureLarge,
                letterSpacing: -fontSize * 0.035,
              ),
              if (suffix != null)
                Padding(
                  padding: EdgeInsets.only(top: getSize(fontSize * 0.16)),
                  child: BaseText(
                    suffix!,
                    fontSize: suffixFontSize ?? fontSize * 0.42,
                    fontWeight: FontWeight.w500,
                    textColor: AppColors.muted,
                    textStyle: AppTypography.figureMedium,
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}
