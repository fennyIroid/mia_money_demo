import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_motion.dart';
import '../../../core/theme/app_typography.dart';
import '../../../core/utils/color_utils.dart';
import '../../../core/utils/math_utils.dart';
import '../../../core/utils/spacing_utils.dart';
import '../../../core/widgets/base_text.dart';

/// Wordmark reveal: each glyph of "mia" rises out of focus and lands, then the
/// serif "money" fades in behind a hairline, then the tracked descriptor.
class SplashWordmark extends StatelessWidget {
  const SplashWordmark({
    super.key,
    this.delay = const Duration(milliseconds: 620),
  });

  final Duration delay;

  static const List<String> _glyphs = <String>['m', 'i', 'a'];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            ...List<Widget>.generate(_glyphs.length, (int i) {
              return BaseText(
                    _glyphs[i],
                    fontSize: 64,
                    fontWeight: FontWeight.w800,
                    textStyle: AppTypography.heroFigure,
                    letterSpacing: -3.6,
                    textColor: AppColors.frost,
                  )
                  .animate(delay: delay + AppMotion.stagger * i * 1.4)
                  .fadeIn(duration: AppMotion.slow, curve: AppMotion.enter)
                  .moveY(
                    begin: 34,
                    end: 0,
                    duration: AppMotion.slow,
                    curve: AppMotion.enter,
                  )
                  .blurX(begin: 12, end: 0, duration: AppMotion.slow)
                  .scaleXY(
                    begin: 0.86,
                    end: 1,
                    duration: AppMotion.slow,
                    curve: AppMotion.spring,
                  );
            }),
            horizontalSpace(10),
            Padding(
              padding: EdgeInsets.only(bottom: getSize(12)),
              child:
                  Container(
                        width: 1,
                        height: getSize(38),
                        color: withCustomOpacity(AppColors.amberGlow, 0.6),
                      )
                      .animate(delay: delay + const Duration(milliseconds: 320))
                      .fadeIn(duration: AppMotion.normal)
                      .scaleY(
                        begin: 0,
                        end: 1,
                        alignment: Alignment.bottomCenter,
                        curve: AppMotion.enter,
                      ),
            ),
            horizontalSpace(10),
            Padding(
              padding: EdgeInsets.only(bottom: getSize(9)),
              child:
                  BaseText(
                        'money',
                        fontSize: 34,
                        textStyle: AppTypography.editorialDisplay,
                        fontStyle: FontStyle.italic,
                        textColor: AppColors.amberGlow,
                        letterSpacing: -0.8,
                      )
                      .animate(delay: delay + const Duration(milliseconds: 420))
                      .fadeIn(duration: AppMotion.slow, curve: AppMotion.enter)
                      .moveX(
                        begin: -16,
                        end: 0,
                        duration: AppMotion.slow,
                        curve: AppMotion.enter,
                      ),
            ),
          ],
        ),
        verticalSpace(14),
        BaseText(
              'Australian finance assistant',
              fontSize: 10,
              textStyle: AppTypography.overline,
              textColor: withCustomOpacity(AppColors.mist, 0.7),
              letterSpacing: 3.4,
            )
            .animate(delay: delay + const Duration(milliseconds: 720))
            .fadeIn(duration: AppMotion.slow)
            .moveY(
              begin: 10,
              end: 0,
              duration: AppMotion.slow,
              curve: AppMotion.enter,
            ),
      ],
    );
  }
}
