import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_motion.dart';
import '../../../core/theme/app_shapes.dart';
import '../../../core/utils/color_utils.dart';
import '../../../core/utils/math_utils.dart';
import '../../../core/utils/spacing_utils.dart';
import '../../../core/widgets/base_text.dart';
import '../bloc/splash_bloc.dart';

/// Boot status line plus a hairline that advances one segment per phase, so the
/// wait reads as the product actually doing its loop rather than a spinner.
class SplashBootLine extends StatelessWidget {
  const SplashBootLine({super.key, required this.message, required this.phase});

  final String message;
  final SplashPhase phase;

  double get _progress {
    switch (phase) {
      case SplashPhase.igniting:
        return 0.18;
      case SplashPhase.assembling:
        return 0.52;
      case SplashPhase.revealing:
        return 0.84;
      case SplashPhase.ready:
        return 1.0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: getSize(18),
          child: SplashBootMessage(message: message),
        ),
        verticalSpace(18),
        SizedBox(
          width: getSize(148),
          child: Stack(
            children: <Widget>[
              Container(
                height: getSize(2),
                decoration: BoxDecoration(
                  color: withCustomOpacity(AppColors.white, 0.1),
                  borderRadius: AppRadii.rPill,
                ),
              ),
              TweenAnimationBuilder<double>(
                tween: Tween<double>(begin: 0, end: _progress),
                duration: AppMotion.slow,
                curve: AppMotion.standard,
                builder: (BuildContext context, double t, Widget? _) {
                  return FractionallySizedBox(
                    widthFactor: t,
                    child: Container(
                      height: getSize(2),
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: <Color>[AppColors.amberGlow, AppColors.ember],
                        ),
                        borderRadius: AppRadii.rPill,
                        boxShadow: AppShadows.glow(
                          AppColors.ember,
                          strength: 0.7,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}

/// Cross-fades the boot message so phases hand over rather than snapping.
class SplashBootMessage extends StatelessWidget {
  const SplashBootMessage({super.key, required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    return BaseText(
          message,
          key: ValueKey<String>(message),
          fontSize: 12,
          fontWeight: FontWeight.w500,
          textColor: withCustomOpacity(AppColors.mist, 0.72),
          letterSpacing: 0.4,
        )
        .animate(key: ValueKey<String>(message))
        .fadeIn(duration: AppMotion.normal)
        .moveY(
          begin: 6,
          end: 0,
          duration: AppMotion.normal,
          curve: AppMotion.enter,
        );
  }
}
