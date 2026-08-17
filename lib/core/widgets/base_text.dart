import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../theme/app_typography.dart';
import '../utils/math_utils.dart';

/// The only text widget used in the product. Wraps [getFontSize] internally, so
/// callers pass raw design values (e.g. `fontSize: 16`).
class BaseText extends StatelessWidget {
  const BaseText(
    this.text, {
    super.key,
    this.fontSize,
    this.fontWeight,
    this.textColor,
    this.fontFamily,
    this.height,
    this.letterSpacing,
    this.textAlign,
    this.maxLines,
    this.overflow,
    this.fontStyle,
    this.decoration,
    this.softWrap,
    this.textStyle,
    this.semanticsLabel,
    this.excludeSemantics = false,
  });

  final String text;

  /// Raw design value. Left null, the size comes from [textStyle] (or the
  /// body preset), so a preset's own size is never overridden by accident.
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? textColor;
  final String? fontFamily;
  final double? height;
  final double? letterSpacing;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? overflow;
  final FontStyle? fontStyle;
  final TextDecoration? decoration;
  final bool? softWrap;

  /// Optional preset from [AppTypography]. Explicit properties still win.
  final TextStyle? textStyle;
  final String? semanticsLabel;
  final bool excludeSemantics;

  @override
  Widget build(BuildContext context) {
    final TextStyle base = textStyle ?? AppTypography.bodyMedium;
    final Widget child = Text(
      text,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow ?? (maxLines != null ? TextOverflow.ellipsis : null),
      softWrap: softWrap,
      semanticsLabel: semanticsLabel,
      style: base.copyWith(
        fontFamily: fontFamily ?? base.fontFamily,
        fontSize: fontSize == null ? base.fontSize : getFontSize(fontSize!),
        fontWeight: fontWeight ?? base.fontWeight,
        color: textColor ?? base.color ?? AppColors.frost,
        height: height ?? base.height,
        letterSpacing: letterSpacing ?? base.letterSpacing,
        fontStyle: fontStyle ?? base.fontStyle,
        decoration: decoration,
        decorationColor: textColor ?? base.color,
      ),
    );

    if (excludeSemantics) {
      return ExcludeSemantics(child: child);
    }
    return child;
  }
}
