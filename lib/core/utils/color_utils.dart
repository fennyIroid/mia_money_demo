import 'dart:ui';

/// Opacity helper used everywhere instead of the deprecated `withOpacity`.
Color withCustomOpacity(Color color, double opacity) =>
    color.withValues(alpha: opacity.clamp(0.0, 1.0));

Color mixColors(Color a, Color b, double t) =>
    Color.lerp(a, b, t.clamp(0.0, 1.0)) ?? a;
