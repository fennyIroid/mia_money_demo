import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_motion.dart';
import '../../../core/theme/app_shapes.dart';
import '../../../core/theme/app_typography.dart';
import '../../../core/utils/color_utils.dart';
import '../../../core/utils/math_utils.dart';
import '../../../core/utils/spacing_utils.dart';
import '../../../core/widgets/base_text.dart';
import '../../../core/widgets/mia_button.dart';
import '../bloc/onboarding_bloc.dart';

/// One tick per step. Completed ticks glow; the active tick is wider so your
/// position is readable at a glance without counting.
class OnboardingProgress extends StatelessWidget {
  const OnboardingProgress({
    super.key,
    required this.step,
    this.onBack,
    this.onSkip,
  });

  final OnboardingStep step;
  final VoidCallback? onBack;
  final VoidCallback? onSkip;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Opacity(
          opacity: step.index == 0 ? 0 : 1,
          child: GlassIconButton(
            icon: Icons.arrow_back_ios_new_rounded,
            iconSize: 14,
            diameter: 38,
            semanticLabel: 'Back',
            onTap: step.index == 0 ? null : onBack,
          ),
        ),
        horizontalSpace(14),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: List<Widget>.generate(OnboardingStep.values.length, (
                  int i,
                ) {
                  final bool done = i <= step.index;
                  final bool active = i == step.index;
                  return Expanded(
                    flex: active ? 3 : 1,
                    child: AnimatedContainer(
                      duration: AppMotion.normal,
                      curve: AppMotion.standard,
                      height: getSize(3),
                      margin: EdgeInsets.only(right: getSize(3)),
                      decoration: BoxDecoration(
                        color: done
                            ? AppColors.amberGlow
                            : withCustomOpacity(AppColors.white, 0.14),
                        borderRadius: AppRadii.rPill,
                        boxShadow: active
                            ? AppShadows.glow(AppColors.ember, strength: 0.55)
                            : AppShadows.none,
                      ),
                    ),
                  );
                }),
              ),
              verticalSpace(8),
              BaseText(
                'Step ${step.number} of ${OnboardingStep.values.length}',
                fontSize: 9,
                textStyle: AppTypography.overline,
                textColor: withCustomOpacity(AppColors.mist, 0.6),
              ),
            ],
          ),
        ),
        horizontalSpace(10),
        if (onSkip != null)
          MiaTextAction(label: 'Skip', onTap: onSkip, fontSize: 13),
      ],
    );
  }
}
