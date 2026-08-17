import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_motion.dart';
import '../../../core/theme/app_shapes.dart';
import '../../../core/utils/color_utils.dart';
import '../../../core/utils/math_utils.dart';
import '../../../core/widgets/pressable.dart';
import 'quick_add_sheet.dart';

/// The product's one permanent way in to adding something. It is docked to the
/// trailing edge of the tab bar so it is reachable from every tab without
/// taking a tab's place or covering the content behind it.
class QuickAddButton extends StatelessWidget {
  const QuickAddButton({super.key, this.diameter = 58});

  final double diameter;

  @override
  Widget build(BuildContext context) {
    return Pressable(
          onTap: () => showQuickAddSheet(context),
          pressedScale: 0.92,
          semanticLabel: 'Add or log something',
          child: Container(
            width: getSize(diameter),
            height: getSize(diameter),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: <Color>[AppColors.amberGlow, AppColors.rust],
              ),
              border: Border.all(
                color: withCustomOpacity(AppColors.frost, 0.28),
                width: 1.2,
              ),
              boxShadow: AppShadows.glow(AppColors.ember, strength: 0.8),
            ),
            child: Icon(
              Icons.add_rounded,
              size: getFontSize(28),
              color: AppColors.ink,
            ),
          ),
        )
        .animate(onPlay: (AnimationController c) => c.repeat(reverse: true))
        .scale(
          duration: AppMotion.breathe,
          curve: AppMotion.drift,
          begin: const Offset(1, 1),
          end: const Offset(1.04, 1.04),
        );
  }
}
