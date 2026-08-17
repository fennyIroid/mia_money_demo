import 'package:flutter/material.dart';

import '../utils/color_utils.dart';
import '../utils/math_utils.dart';
import 'app_colors.dart';

/// Corner language: generous, continuous, never sharp. Bento tiles are the
/// default container shape of the product.
abstract class AppRadii {
  static double get pill => getSize(999);
  static double get xs => getSize(10);
  static double get sm => getSize(16);
  static double get md => getSize(22);
  static double get lg => getSize(28);
  static double get xl => getSize(34);
  static double get xxl => getSize(42);

  static BorderRadius get rXs => BorderRadius.circular(xs);
  static BorderRadius get rSm => BorderRadius.circular(sm);
  static BorderRadius get rMd => BorderRadius.circular(md);
  static BorderRadius get rLg => BorderRadius.circular(lg);
  static BorderRadius get rXl => BorderRadius.circular(xl);
  static BorderRadius get rXxl => BorderRadius.circular(xxl);
  static BorderRadius get rPill => BorderRadius.circular(pill);

  static BorderRadius get sheet =>
      BorderRadius.vertical(top: Radius.circular(getSize(34)));
}

abstract class AppShadows {
  static List<BoxShadow> get panel => <BoxShadow>[
    BoxShadow(
      color: withCustomOpacity(AppColors.black, 0.42),
      blurRadius: getSize(30),
      offset: Offset(0, getSize(14)),
    ),
  ];

  static List<BoxShadow> get raised => <BoxShadow>[
    BoxShadow(
      color: withCustomOpacity(AppColors.black, 0.5),
      blurRadius: getSize(44),
      offset: Offset(0, getSize(20)),
    ),
  ];

  static List<BoxShadow> glow(Color color, {double strength = 0.5}) =>
      <BoxShadow>[
        BoxShadow(
          color: withCustomOpacity(color, 0.42 * strength),
          blurRadius: getSize(38),
          spreadRadius: getSize(-6),
          offset: Offset(0, getSize(10)),
        ),
      ];

  static List<BoxShadow> get none => const <BoxShadow>[];
}

abstract class AppBlur {
  static const double subtle = 12;
  static const double panel = 26;
  static const double heavy = 46;
  static const double sheet = 60;
}

abstract class AppSpacing {
  static double get gutter => getSize(20);
  static double get tileGap => getSize(12);
  static double get sectionGap => getSize(28);
  static EdgeInsets get screenPadding =>
      EdgeInsets.symmetric(horizontal: getSize(20));
  static EdgeInsets get tilePadding => EdgeInsets.all(getSize(18));
}
