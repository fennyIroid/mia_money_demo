import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../utils/color_utils.dart';
import '../utils/math_utils.dart';
import 'app_colors.dart';
import 'app_shapes.dart';
import 'app_typography.dart';

abstract class AppTheme {
  static const SystemUiOverlayStyle overlayStyle = SystemUiOverlayStyle(
    statusBarColor: AppColors.transparent,
    statusBarIconBrightness: Brightness.light,
    statusBarBrightness: Brightness.dark,
    systemNavigationBarColor: AppColors.ink,
    systemNavigationBarIconBrightness: Brightness.light,
  );

  static ThemeData get dark {
    final ColorScheme scheme = const ColorScheme.dark(
      primary: AppColors.ember,
      onPrimary: AppColors.ink,
      secondary: AppColors.glacier,
      onSecondary: AppColors.ink,
      surface: AppColors.abyss,
      onSurface: AppColors.frost,
      error: AppColors.negative,
      onError: AppColors.ink,
    );

    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      colorScheme: scheme,
      scaffoldBackgroundColor: AppColors.ink,
      canvasColor: AppColors.ink,
      fontFamily: AppFonts.body,
      textTheme: AppTypography.textTheme,
      splashFactory: NoSplash.splashFactory,
      highlightColor: AppColors.transparent,
      splashColor: AppColors.transparent,
      hoverColor: AppColors.transparent,
      dividerTheme: DividerThemeData(
        color: AppColors.glassBorderSoft,
        thickness: 1,
        space: getSize(1),
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.transparent,
        surfaceTintColor: AppColors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: true,
        systemOverlayStyle: overlayStyle,
        titleTextStyle: AppTypography.titleSmall,
        iconTheme: IconThemeData(color: AppColors.frost, size: getFontSize(20)),
      ),
      pageTransitionsTheme: const PageTransitionsTheme(
        builders: <TargetPlatform, PageTransitionsBuilder>{
          TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
          TargetPlatform.android: CupertinoPageTransitionsBuilder(),
          TargetPlatform.macOS: CupertinoPageTransitionsBuilder(),
        },
      ),
      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: AppColors.transparent,
        surfaceTintColor: AppColors.transparent,
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: AppRadii.sheet),
        modalBarrierColor: AppColors.scrim,
      ),
      dialogTheme: DialogThemeData(
        backgroundColor: AppColors.graphite,
        surfaceTintColor: AppColors.transparent,
        shape: RoundedRectangleBorder(borderRadius: AppRadii.rLg),
      ),
      datePickerTheme: DatePickerThemeData(
        backgroundColor: AppColors.graphite,
        surfaceTintColor: AppColors.transparent,
        headerBackgroundColor: AppColors.abyss,
        headerForegroundColor: AppColors.frost,
        shape: RoundedRectangleBorder(borderRadius: AppRadii.rLg),
        todayForegroundColor: const WidgetStatePropertyAll<Color>(
          AppColors.ember,
        ),
        dayForegroundColor: const WidgetStatePropertyAll<Color>(
          AppColors.frost,
        ),
      ),
      snackBarTheme: SnackBarThemeData(
        backgroundColor: AppColors.slate,
        contentTextStyle: AppTypography.bodyMedium,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: AppRadii.rSm),
      ),
      sliderTheme: SliderThemeData(
        activeTrackColor: AppColors.ember,
        inactiveTrackColor: AppColors.glassFill,
        thumbColor: AppColors.frost,
        overlayColor: withCustomOpacity(AppColors.ember, 0.14),
        trackHeight: getSize(4),
      ),
      switchTheme: SwitchThemeData(
        thumbColor: const WidgetStatePropertyAll<Color>(AppColors.frost),
        trackColor: WidgetStateProperty.resolveWith<Color>(
          (Set<WidgetState> states) => states.contains(WidgetState.selected)
              ? AppColors.ember
              : AppColors.steel,
        ),
        trackOutlineColor: const WidgetStatePropertyAll<Color>(
          AppColors.transparent,
        ),
      ),
      checkboxTheme: CheckboxThemeData(
        fillColor: WidgetStateProperty.resolveWith<Color>(
          (Set<WidgetState> states) => states.contains(WidgetState.selected)
              ? AppColors.ember
              : AppColors.transparent,
        ),
        checkColor: const WidgetStatePropertyAll<Color>(AppColors.ink),
        side: const BorderSide(color: AppColors.glassBorder, width: 1.4),
        shape: RoundedRectangleBorder(borderRadius: AppRadii.rXs),
      ),
      radioTheme: RadioThemeData(
        fillColor: const WidgetStatePropertyAll<Color>(AppColors.ember),
      ),
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: AppColors.ember,
        linearTrackColor: AppColors.glassFill,
        circularTrackColor: AppColors.glassFill,
      ),
      tabBarTheme: TabBarThemeData(
        labelColor: AppColors.frost,
        unselectedLabelColor: AppColors.muted,
        indicatorColor: AppColors.ember,
        labelStyle: AppTypography.label,
        unselectedLabelStyle: AppTypography.bodyMedium,
        dividerColor: AppColors.transparent,
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.glassFillSoft,
        contentPadding: EdgeInsets.symmetric(
          horizontal: getSize(18),
          vertical: getSize(18),
        ),
        hintStyle: AppTypography.bodyMedium.copyWith(color: AppColors.faint),
        labelStyle: AppTypography.bodyMedium,
        errorStyle: AppTypography.bodySmall.copyWith(color: AppColors.negative),
        border: OutlineInputBorder(
          borderRadius: AppRadii.rMd,
          borderSide: const BorderSide(color: AppColors.glassBorderSoft),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: AppRadii.rMd,
          borderSide: const BorderSide(color: AppColors.glassBorderSoft),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: AppRadii.rMd,
          borderSide: const BorderSide(color: AppColors.ember, width: 1.4),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: AppRadii.rMd,
          borderSide: const BorderSide(color: AppColors.negative),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: AppRadii.rMd,
          borderSide: const BorderSide(color: AppColors.negative, width: 1.4),
        ),
      ),
      cupertinoOverrideTheme: const CupertinoThemeData(
        brightness: Brightness.dark,
        primaryColor: AppColors.ember,
      ),
      visualDensity: VisualDensity.standard,
    );
  }
}
