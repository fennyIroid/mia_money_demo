import 'package:flutter/painting.dart';

import '../utils/color_utils.dart';
import 'app_colors.dart';

/// Every gradient in the product lives here so surfaces stay in one family.
abstract class AppGradients {
  static const LinearGradient emberFlare = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: <Color>[AppColors.amberGlow, AppColors.ember, AppColors.rust],
    stops: <double>[0.0, 0.52, 1.0],
  );

  static const LinearGradient glacierFlare = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: <Color>[
      AppColors.glacier,
      AppColors.glacierMid,
      AppColors.glacierDeep,
    ],
  );

  static const LinearGradient duskCanvas = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: <Color>[AppColors.abyss, AppColors.ink],
  );

  static LinearGradient get glassPanel => LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: <Color>[
      withCustomOpacity(AppColors.white, 0.16),
      withCustomOpacity(AppColors.white, 0.06),
      withCustomOpacity(AppColors.white, 0.03),
    ],
    stops: const <double>[0.0, 0.55, 1.0],
  );

  static LinearGradient get glassPanelRaised => LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: <Color>[
      withCustomOpacity(AppColors.white, 0.24),
      withCustomOpacity(AppColors.white, 0.09),
      withCustomOpacity(AppColors.glacier, 0.05),
    ],
  );

  /// Thin bright line drawn across the top edge of a glass panel so the panel
  /// reads as a lit pane of glass rather than a flat translucent rectangle.
  static LinearGradient get glassRim => LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: <Color>[
      AppColors.transparent,
      withCustomOpacity(AppColors.white, 0.55),
      withCustomOpacity(AppColors.white, 0.12),
      AppColors.transparent,
    ],
    stops: const <double>[0.0, 0.28, 0.7, 1.0],
  );

  static LinearGradient get sheenSweep => LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: <Color>[
      AppColors.transparent,
      withCustomOpacity(AppColors.white, 0.22),
      AppColors.transparent,
    ],
    stops: const <double>[0.35, 0.5, 0.65],
  );

  static RadialGradient auroraEmber({double intensity = 1.0}) => RadialGradient(
    colors: <Color>[
      withCustomOpacity(AppColors.amberGlow, 0.72 * intensity),
      withCustomOpacity(AppColors.ember, 0.34 * intensity),
      AppColors.transparent,
    ],
    stops: const <double>[0.0, 0.45, 1.0],
  );

  static RadialGradient auroraGlacier({double intensity = 1.0}) =>
      RadialGradient(
        colors: <Color>[
          withCustomOpacity(AppColors.glacier, 0.60 * intensity),
          withCustomOpacity(AppColors.glacierDeep, 0.30 * intensity),
          AppColors.transparent,
        ],
        stops: const <double>[0.0, 0.48, 1.0],
      );

  static RadialGradient auroraViolet({double intensity = 1.0}) =>
      RadialGradient(
        colors: <Color>[
          withCustomOpacity(AppColors.violetHaze, 0.46 * intensity),
          withCustomOpacity(AppColors.violetHaze, 0.16 * intensity),
          AppColors.transparent,
        ],
      );

  static LinearGradient get fadeToInk => LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: <Color>[AppColors.transparent, AppColors.ink],
  );

  static LinearGradient get fadeFromInk => LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: <Color>[AppColors.ink, AppColors.transparent],
  );

  static LinearGradient tint(Color color) => LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: <Color>[
      withCustomOpacity(color, 0.34),
      withCustomOpacity(color, 0.10),
    ],
  );
}
