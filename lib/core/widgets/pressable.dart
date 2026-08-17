import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../theme/app_motion.dart';

/// iOS-style press feedback: the target dips in scale and dims slightly while
/// held, then springs back. Used by every tappable surface in the product so
/// touch response feels identical everywhere.
class Pressable extends StatelessWidget {
  const Pressable({
    super.key,
    required this.child,
    this.onTap,
    this.onLongPress,
    this.pressedScale = 0.965,
    this.pressedOpacity = 0.9,
    this.haptic = true,
    this.behavior = HitTestBehavior.opaque,
    this.semanticLabel,
    this.isButton = true,
  });

  final Widget child;
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;
  final double pressedScale;
  final double pressedOpacity;
  final bool haptic;
  final HitTestBehavior behavior;
  final String? semanticLabel;
  final bool isButton;

  @override
  Widget build(BuildContext context) {
    if (onTap == null && onLongPress == null) {
      return child;
    }

    return Semantics(
      button: isButton,
      label: semanticLabel,
      child: _PressFeedback(
        pressedScale: pressedScale,
        pressedOpacity: pressedOpacity,
        haptic: haptic,
        behavior: behavior,
        onTap: onTap,
        onLongPress: onLongPress,
        child: child,
      ),
    );
  }
}

/// Uses [StatefulBuilder]-free implicit animation driven by a
/// [ValueNotifier] so no feature code ever needs a `StatefulWidget`.
class _PressFeedback extends StatelessWidget {
  const _PressFeedback({
    required this.child,
    required this.pressedScale,
    required this.pressedOpacity,
    required this.haptic,
    required this.behavior,
    this.onTap,
    this.onLongPress,
  });

  final Widget child;
  final double pressedScale;
  final double pressedOpacity;
  final bool haptic;
  final HitTestBehavior behavior;
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<bool> pressed = ValueNotifier<bool>(false);

    return ValueListenableBuilder<bool>(
      valueListenable: pressed,
      builder: (BuildContext context, bool isPressed, Widget? _) {
        return GestureDetector(
          behavior: behavior,
          onTapDown: (_) => pressed.value = true,
          onTapCancel: () => pressed.value = false,
          onTapUp: (_) => pressed.value = false,
          onTap: () {
            if (haptic) {
              HapticFeedback.lightImpact();
            }
            onTap?.call();
          },
          onLongPress: onLongPress == null
              ? null
              : () {
                  if (haptic) {
                    HapticFeedback.mediumImpact();
                  }
                  onLongPress?.call();
                },
          child: AnimatedScale(
            scale: isPressed ? pressedScale : 1.0,
            duration: AppMotion.tap,
            curve: isPressed ? AppMotion.exit : AppMotion.spring,
            child: AnimatedOpacity(
              opacity: isPressed ? pressedOpacity : 1.0,
              duration: AppMotion.tap,
              child: child,
            ),
          ),
        );
      },
    );
  }
}
