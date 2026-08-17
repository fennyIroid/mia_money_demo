import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Single entry point for every width, height, radius, padding and icon size in
/// the app. Design baseline is the iPhone 15 Pro frame (393 x 852).
double getSize(num value) => value.toDouble().w;

/// Vertical-axis variant for the rare case where a value must scale with the
/// screen height instead of the width (full-bleed hero art, sheet heights).
double getVerticalSize(num value) => value.toDouble().h;

/// Single entry point for every font size in the app.
double getFontSize(num value) => value.toDouble().sp;

double clampDouble(double value, double min, double max) =>
    value < min ? min : (value > max ? max : value);

/// Maps [value] from the range [inMin]..[inMax] onto [outMin]..[outMax] and
/// clamps the result. Used by the aurora background and gauge painters.
double remap(
  double value,
  double inMin,
  double inMax,
  double outMin,
  double outMax,
) {
  if (inMax - inMin == 0) return outMin;
  final double t = (value - inMin) / (inMax - inMin);
  return clampDouble(outMin + (outMax - outMin) * t, outMin, outMax);
}
