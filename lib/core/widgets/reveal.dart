import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../theme/app_motion.dart';

enum RevealDirection { up, down, left, right, none }

/// Entrance animation used for page loads. A screen's content is wrapped in a
/// [RevealGroup]; each child then rises and fades in one after another, which is
/// what gives the app its orchestrated "curtain up" feel.
class Reveal extends StatelessWidget {
  const Reveal({
    super.key,
    required this.child,
    this.index = 0,
    this.direction = RevealDirection.up,
    this.distance = 26,
    this.duration,
    this.delay,
    this.step,
    this.withBlur = false,
    this.withScale = false,
  });

  final Widget child;
  final int index;
  final RevealDirection direction;
  final double distance;
  final Duration? duration;
  final Duration? delay;
  final Duration? step;
  final bool withBlur;
  final bool withScale;

  Offset get _begin {
    switch (direction) {
      case RevealDirection.up:
        return Offset(0, distance);
      case RevealDirection.down:
        return Offset(0, -distance);
      case RevealDirection.left:
        return Offset(distance, 0);
      case RevealDirection.right:
        return Offset(-distance, 0);
      case RevealDirection.none:
        return Offset.zero;
    }
  }

  @override
  Widget build(BuildContext context) {
    final Duration resolvedDelay =
        (delay ?? Duration.zero) + AppMotion.staggerAt(index, step: step);

    Animate animated = child
        .animate(delay: resolvedDelay)
        .fadeIn(duration: duration ?? AppMotion.slow, curve: AppMotion.enter);

    if (direction != RevealDirection.none) {
      animated = animated.moveY(
        begin: _begin.dy,
        end: 0,
        duration: duration ?? AppMotion.slow,
        curve: AppMotion.enter,
      );
      if (_begin.dx != 0) {
        animated = animated.moveX(
          begin: _begin.dx,
          end: 0,
          duration: duration ?? AppMotion.slow,
          curve: AppMotion.enter,
        );
      }
    }

    if (withScale) {
      animated = animated.scaleXY(
        begin: 0.94,
        end: 1,
        duration: duration ?? AppMotion.slow,
        curve: AppMotion.enter,
      );
    }

    if (withBlur) {
      animated = animated.blurXY(
        begin: 10,
        end: 0,
        duration: duration ?? AppMotion.slow,
        curve: AppMotion.enter,
      );
    }

    return animated;
  }
}

/// Wraps a list of children so each one reveals in sequence.
class RevealGroup extends StatelessWidget {
  const RevealGroup({
    super.key,
    required this.children,
    this.startIndex = 0,
    this.direction = RevealDirection.up,
    this.step,
    this.withScale = false,
  });

  final List<Widget> children;
  final int startIndex;
  final RevealDirection direction;
  final Duration? step;
  final bool withScale;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: List<Widget>.generate(children.length, (int i) {
        return Reveal(
          index: startIndex + i,
          direction: direction,
          step: step,
          withScale: withScale,
          child: children[i],
        );
      }),
    );
  }
}

/// Slow continuous float. Applied to hero art and the Ask Mia orb so nothing on
/// screen is ever perfectly static.
class Floating extends StatelessWidget {
  const Floating({
    super.key,
    required this.child,
    this.amplitude = 8,
    this.duration,
    this.rotate = 0,
  });

  final Widget child;
  final double amplitude;
  final Duration? duration;
  final double rotate;

  @override
  Widget build(BuildContext context) {
    Animate animated = child
        .animate(onPlay: (AnimationController c) => c.repeat(reverse: true))
        .moveY(
          begin: -amplitude,
          end: amplitude,
          duration: duration ?? AppMotion.breathe,
          curve: AppMotion.drift,
        );

    if (rotate != 0) {
      animated = animated.rotate(
        begin: -rotate,
        end: rotate,
        duration: (duration ?? AppMotion.breathe) * 1.4,
        curve: AppMotion.drift,
      );
    }

    return animated;
  }
}

/// Light sweep across a surface, used on the paywall hero and premium tiles.
class Shimmering extends StatelessWidget {
  const Shimmering({super.key, required this.child, this.delay});

  final Widget child;
  final Duration? delay;

  @override
  Widget build(BuildContext context) {
    return child
        .animate(
          onPlay: (AnimationController c) => c.repeat(),
          delay: delay ?? Duration.zero,
        )
        .shimmer(
          duration: const Duration(milliseconds: 2600),
          color: const Color(0x55FFFFFF),
        );
  }
}
