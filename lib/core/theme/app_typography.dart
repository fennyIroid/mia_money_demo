import 'package:flutter/material.dart';

import '../utils/math_utils.dart';
import 'app_colors.dart';

/// Three bundled families, each with one job.
abstract class AppFonts {
  /// Bricolage Grotesque — headings, currency figures, anything structural.
  static const String display = 'Bricolage';

  /// Epilogue — body copy, labels, dense financial lists.
  static const String body = 'Epilogue';

  /// Instrument Serif — editorial accents and Mia's own voice, italic.
  static const String editorial = 'InstrumentSerif';
}

abstract class AppTypography {
  static TextStyle get heroFigure => TextStyle(
    fontFamily: AppFonts.display,
    fontSize: getFontSize(64),
    fontWeight: FontWeight.w700,
    height: 0.94,
    letterSpacing: -2.4,
    color: AppColors.frost,
  );

  static TextStyle get figureLarge => TextStyle(
    fontFamily: AppFonts.display,
    fontSize: getFontSize(40),
    fontWeight: FontWeight.w700,
    height: 1.0,
    letterSpacing: -1.4,
    color: AppColors.frost,
  );

  static TextStyle get figureMedium => TextStyle(
    fontFamily: AppFonts.display,
    fontSize: getFontSize(28),
    fontWeight: FontWeight.w600,
    height: 1.05,
    letterSpacing: -0.8,
    color: AppColors.frost,
  );

  static TextStyle get titleLarge => TextStyle(
    fontFamily: AppFonts.display,
    fontSize: getFontSize(30),
    fontWeight: FontWeight.w600,
    height: 1.12,
    letterSpacing: -1.0,
    color: AppColors.frost,
  );

  static TextStyle get titleMedium => TextStyle(
    fontFamily: AppFonts.display,
    fontSize: getFontSize(20),
    fontWeight: FontWeight.w600,
    height: 1.2,
    letterSpacing: -0.5,
    color: AppColors.frost,
  );

  static TextStyle get titleSmall => TextStyle(
    fontFamily: AppFonts.display,
    fontSize: getFontSize(16),
    fontWeight: FontWeight.w600,
    height: 1.25,
    letterSpacing: -0.2,
    color: AppColors.frost,
  );

  static TextStyle get bodyLarge => TextStyle(
    fontFamily: AppFonts.body,
    fontSize: getFontSize(16),
    fontWeight: FontWeight.w400,
    height: 1.5,
    color: AppColors.mist,
  );

  static TextStyle get bodyMedium => TextStyle(
    fontFamily: AppFonts.body,
    fontSize: getFontSize(14),
    fontWeight: FontWeight.w400,
    height: 1.5,
    color: AppColors.mist,
  );

  static TextStyle get bodySmall => TextStyle(
    fontFamily: AppFonts.body,
    fontSize: getFontSize(12),
    fontWeight: FontWeight.w400,
    height: 1.45,
    color: AppColors.muted,
  );

  static TextStyle get label => TextStyle(
    fontFamily: AppFonts.body,
    fontSize: getFontSize(13),
    fontWeight: FontWeight.w600,
    height: 1.2,
    letterSpacing: 0.1,
    color: AppColors.frost,
  );

  /// Small all-caps tracking label used above sections and on status pills.
  static TextStyle get overline => TextStyle(
    fontFamily: AppFonts.body,
    fontSize: getFontSize(10),
    fontWeight: FontWeight.w700,
    height: 1.1,
    letterSpacing: 1.6,
    color: AppColors.muted,
  );

  static TextStyle get quote => TextStyle(
    fontFamily: AppFonts.editorial,
    fontSize: getFontSize(22),
    fontStyle: FontStyle.italic,
    fontWeight: FontWeight.w400,
    height: 1.28,
    letterSpacing: -0.2,
    color: AppColors.frost,
  );

  static TextStyle get editorialDisplay => TextStyle(
    fontFamily: AppFonts.editorial,
    fontSize: getFontSize(44),
    fontWeight: FontWeight.w400,
    height: 1.02,
    letterSpacing: -1.0,
    color: AppColors.frost,
  );

  static TextTheme get textTheme => TextTheme(
    displayLarge: heroFigure,
    displayMedium: figureLarge,
    displaySmall: figureMedium,
    headlineLarge: titleLarge,
    headlineMedium: titleMedium,
    headlineSmall: titleSmall,
    titleLarge: titleMedium,
    titleMedium: titleSmall,
    titleSmall: label,
    bodyLarge: bodyLarge,
    bodyMedium: bodyMedium,
    bodySmall: bodySmall,
    labelLarge: label,
    labelMedium: bodySmall,
    labelSmall: overline,
  );
}
