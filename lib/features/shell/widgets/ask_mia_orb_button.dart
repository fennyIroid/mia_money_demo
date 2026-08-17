import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../core/router/app_router.gr.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_shapes.dart';
import '../../../core/utils/color_utils.dart';
import '../../../core/utils/math_utils.dart';
import '../../../core/widgets/mia_orb.dart';
import '../../../core/widgets/pressable.dart';
import '../../../core/widgets/reveal.dart';

/// Mia's presence, reachable from every tab. It is the same orb as the splash,
/// shrunk and dimmed until you call on it.
class AskMiaOrbButton extends StatelessWidget {
  const AskMiaOrbButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Pressable(
      onTap: () => context.router.push(const AskMiaRoute()),
      pressedScale: 0.88,
      semanticLabel: 'Ask Mia',
      child: Floating(
        amplitude: 3,
        child: Container(
          width: getSize(62),
          height: getSize(62),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: withCustomOpacity(AppColors.ink, 0.62),
            border: Border.all(
              color: withCustomOpacity(AppColors.emberBright, 0.42),
            ),
            boxShadow: AppShadows.glow(AppColors.ember, strength: 1.0),
          ),
          child: const ClipOval(
            child: MiaOrb(size: 62, speed: 0.8, energy: 0.9),
          ),
        ),
      ),
    );
  }
}
