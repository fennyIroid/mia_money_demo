import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_typography.dart';
import '../../../core/utils/color_utils.dart';
import '../../../core/utils/spacing_utils.dart';
import '../../../core/widgets/base_text.dart';
import '../../../core/widgets/reveal.dart';

/// Shared skeleton for every onboarding step: a hero area on top, then an
/// overline, headline, supporting line and the step's own content. Each part
/// reveals in sequence so a step change feels choreographed rather than swapped.
class OnboardingStepFrame extends StatelessWidget {
  const OnboardingStepFrame({
    super.key,
    required this.overline,
    required this.title,
    this.body,
    this.hero,
    this.content,
    this.heroFlex = 5,
    this.contentFlex = 6,
    this.titleFontSize = 30,
    this.useEditorialTitle = false,
  });

  final String overline;
  final String title;
  final String? body;
  final Widget? hero;
  final Widget? content;
  final int heroFlex;
  final int contentFlex;
  final double titleFontSize;
  final bool useEditorialTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        if (hero != null)
          Expanded(
            flex: heroFlex,
            child: Reveal(
              withScale: true,
              withBlur: true,
              distance: 18,
              child: Center(child: hero!),
            ),
          ),
        verticalSpace(8),
        Reveal(
          index: 1,
          child: BaseText(
            overline,
            fontSize: 10,
            textStyle: AppTypography.overline,
            textColor: AppColors.amberGlow,
          ),
        ),
        verticalSpace(10),
        Reveal(
          index: 2,
          child: BaseText(
            title,
            fontSize: titleFontSize,
            textStyle: useEditorialTitle
                ? AppTypography.editorialDisplay
                : AppTypography.titleLarge,
            height: useEditorialTitle ? 1.04 : 1.1,
          ),
        ),
        if (body != null) ...<Widget>[
          verticalSpace(12),
          Reveal(
            index: 3,
            child: BaseText(
              body!,
              fontSize: 15,
              textColor: withCustomOpacity(AppColors.mist, 0.86),
              height: 1.55,
            ),
          ),
        ],
        if (content != null) ...<Widget>[
          verticalSpace(22),
          Expanded(
            flex: contentFlex,
            child: Reveal(
              index: 4,
              // Short devices give the content pane less room than the copy
              // needs; it scrolls rather than being cut off.
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: content!,
              ),
            ),
          ),
        ] else
          const Spacer(),
      ],
    );
  }
}
