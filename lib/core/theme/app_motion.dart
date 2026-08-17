import 'package:flutter/animation.dart';

/// Motion vocabulary for the whole product.
///
/// Curves are tuned to feel like iOS: everything decelerates into place, nothing
/// eases linearly, and interactive feedback is faster than scenery.
abstract class AppMotion {
  // ── Durations ─────────────────────────────────────────────────────────────
  static const Duration instant = Duration(milliseconds: 90);
  static const Duration tap = Duration(milliseconds: 140);
  static const Duration quick = Duration(milliseconds: 220);
  static const Duration normal = Duration(milliseconds: 340);
  static const Duration slow = Duration(milliseconds: 520);
  static const Duration cinematic = Duration(milliseconds: 900);
  static const Duration ambient = Duration(seconds: 14);
  static const Duration breathe = Duration(seconds: 6);

  /// Delay between siblings in a staggered reveal.
  static const Duration stagger = Duration(milliseconds: 70);

  // ── Curves ────────────────────────────────────────────────────────────────
  /// Apple's default UI easing. First choice for anything that moves.
  static const Cubic standard = Cubic(0.32, 0.72, 0.0, 1.0);

  /// Entering content: no initial hesitation, long settle.
  static const Cubic enter = Cubic(0.16, 1.0, 0.3, 1.0);

  /// Leaving content: pulls away quickly.
  static const Cubic exit = Cubic(0.4, 0.0, 1.0, 1.0);

  /// Slight overshoot for confirmations, badges and value changes.
  static const Cubic spring = Cubic(0.34, 1.56, 0.64, 1.0);

  /// Symmetric ease for ambient loops that must not read as pulsing.
  static const Cubic drift = Cubic(0.45, 0.05, 0.55, 0.95);

  static Duration staggerAt(int index, {Duration? step}) =>
      (step ?? stagger) * index;
}
