import 'dart:ui';

/// "Aurora Frost" palette.
///
/// Committed dark aesthetic: a deep ink canvas lit from behind by a slow aurora
/// of ember-amber and glacier-blue, read through frosted glass panels.
/// Ember is the single dominant accent; glacier is the cool counterweight.
abstract class AppColors {
  // ── Canvas ────────────────────────────────────────────────────────────────
  static const Color ink = Color(0xFF05070E);
  static const Color abyss = Color(0xFF0A0E1A);
  static const Color graphite = Color(0xFF121927);
  static const Color slate = Color(0xFF1A2233);
  static const Color steel = Color(0xFF243044);

  // ── Type ──────────────────────────────────────────────────────────────────
  static const Color frost = Color(0xFFF4F7FC);
  static const Color mist = Color(0xFFC3CFE0);
  static const Color muted = Color(0xFF8494AE);
  static const Color faint = Color(0xFF5B6980);

  // ── Ember (primary accent) ────────────────────────────────────────────────
  static const Color ember = Color(0xFFFF8A3D);
  static const Color emberBright = Color(0xFFFFA85C);
  static const Color amberGlow = Color(0xFFFFC873);
  static const Color rust = Color(0xFFD24A18);
  static const Color emberDeep = Color(0xFF8A2F0F);

  // ── Glacier (secondary accent) ────────────────────────────────────────────
  static const Color glacier = Color(0xFF86BCEC);
  static const Color glacierMid = Color(0xFF4E8CC4);
  static const Color glacierDeep = Color(0xFF23507E);
  static const Color lagoon = Color(0xFF3FCFC0);

  // ── Semantic ──────────────────────────────────────────────────────────────
  static const Color positive = Color(0xFF62DFA1);
  static const Color negative = Color(0xFFFF6C7F);
  static const Color caution = Color(0xFFFFCA5E);
  static const Color info = Color(0xFF86BCEC);
  static const Color violetHaze = Color(0xFF9285FF);

  // ── Glass ─────────────────────────────────────────────────────────────────
  static const Color glassFill = Color(0x14FFFFFF);
  static const Color glassFillStrong = Color(0x22FFFFFF);
  static const Color glassFillSoft = Color(0x0AFFFFFF);
  static const Color glassBorder = Color(0x26FFFFFF);
  static const Color glassBorderSoft = Color(0x14FFFFFF);
  static const Color glassHighlight = Color(0x40FFFFFF);

  // ── Utility ───────────────────────────────────────────────────────────────
  static const Color shadow = Color(0xB3000000);
  static const Color scrim = Color(0xA605070E);
  static const Color transparent = Color(0x00000000);
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);

  /// Fixed hues used by category chips, charts and lens results so that the
  /// same category always reads the same colour across the product.
  static const List<Color> dataSpectrum = <Color>[
    Color(0xFFFF8A3D),
    Color(0xFF86BCEC),
    Color(0xFF62DFA1),
    Color(0xFFFFC873),
    Color(0xFF9285FF),
    Color(0xFF3FCFC0),
    Color(0xFFFF6C7F),
    Color(0xFF4E8CC4),
    Color(0xFFD9A26B),
    Color(0xFF7FE0D2),
  ];
}
