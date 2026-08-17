import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/utils/color_utils.dart';
import '../../../core/utils/spacing_utils.dart';
import '../../../core/widgets/base_text.dart';
import '../../../core/widgets/mia_button.dart';
import '../bloc/onboarding_bloc.dart';

class OnboardingFooter extends StatelessWidget {
  const OnboardingFooter({
    super.key,
    required this.step,
    required this.canAdvance,
    required this.onAdvance,
    required this.onFinish,
  });

  final OnboardingStep step;
  final bool canAdvance;
  final VoidCallback onAdvance;
  final VoidCallback onFinish;

  String get _label {
    switch (step) {
      case OnboardingStep.welcome:
        return 'Show me how';
      case OnboardingStep.recap:
        return 'Looks right';
      case OnboardingStep.ready:
        return 'Choose a plan';
      default:
        return 'Continue';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        MiaButton(
          label: _label,
          variant: step == OnboardingStep.ready
              ? MiaButtonVariant.primary
              : MiaButtonVariant.frost,
          trailingIcon: step == OnboardingStep.ready
              ? Icons.arrow_forward_rounded
              : null,
          isEnabled: canAdvance,
          onTap: step == OnboardingStep.ready ? onFinish : onAdvance,
        ),
        verticalSpace(10),
        BaseText(
          step.isAnswerStep
              ? 'You can change this later in Settings'
              : 'Swipe to move between steps',
          fontSize: 11,
          textColor: withCustomOpacity(AppColors.mist, 0.5),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
