import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../theme/app_shapes.dart';
import '../theme/app_typography.dart';
import '../utils/color_utils.dart';
import '../utils/math_utils.dart';
import 'base_text.dart';

/// Initial-based avatar with a per-person hue so household members are
/// recognisable at a glance without photos.
class MiaAvatar extends StatelessWidget {
  const MiaAvatar({
    super.key,
    required this.name,
    this.size = 36,
    this.accent,
    this.showRing = false,
    this.badge,
  });

  final String name;
  final double size;
  final Color? accent;
  final bool showRing;
  final Widget? badge;

  String get initials {
    final List<String> parts = name.trim().split(RegExp(r'\s+'));
    if (parts.isEmpty || parts.first.isEmpty) return '?';
    if (parts.length == 1) return parts.first.substring(0, 1).toUpperCase();
    return '${parts.first[0]}${parts.last[0]}'.toUpperCase();
  }

  Color get hue {
    if (accent != null) return accent!;
    final int seed = name.codeUnits.fold<int>(0, (int a, int b) => a + b);
    return AppColors.dataSpectrum[seed % AppColors.dataSpectrum.length];
  }

  @override
  Widget build(BuildContext context) {
    final Widget circle = Container(
      width: getSize(size),
      height: getSize(size),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: <Color>[
            withCustomOpacity(hue, 0.42),
            withCustomOpacity(hue, 0.14),
          ],
        ),
        border: Border.all(
          color: showRing
              ? withCustomOpacity(hue, 0.8)
              : withCustomOpacity(AppColors.white, 0.18),
          width: showRing ? 1.6 : 1,
        ),
      ),
      child: Center(
        child: BaseText(
          initials,
          fontSize: size * 0.36,
          fontWeight: FontWeight.w700,
          textColor: AppColors.frost,
          textStyle: AppTypography.titleSmall,
        ),
      ),
    );

    if (badge == null) return circle;

    return Stack(
      clipBehavior: Clip.none,
      children: <Widget>[
        circle,
        Positioned(bottom: -getSize(2), right: -getSize(2), child: badge!),
      ],
    );
  }
}

/// Overlapping avatar stack for household rows and shared records.
class MiaAvatarStack extends StatelessWidget {
  const MiaAvatarStack({
    super.key,
    required this.names,
    this.size = 28,
    this.maxVisible = 3,
  });

  final List<String> names;
  final double size;
  final int maxVisible;

  @override
  Widget build(BuildContext context) {
    final List<String> visible = names.take(maxVisible).toList();
    final int overflow = names.length - visible.length;
    final double overlap = getSize(size * 0.62);

    final int slots = visible.length + (overflow > 0 ? 1 : 0);

    return SizedBox(
      height: getSize(size) + 3.2,
      width: overlap * (slots - 1) + getSize(size) + 3.2,
      child: Stack(
        children: <Widget>[
          ...List<Widget>.generate(visible.length, (int i) {
            return Positioned(
              left: overlap * i,
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColors.ink, width: 1.6),
                ),
                child: MiaAvatar(name: visible[i], size: size),
              ),
            );
          }),
          if (overflow > 0)
            Positioned(
              left: overlap * visible.length,
              child: Container(
                width: getSize(size),
                height: getSize(size),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.steel,
                  border: Border.all(color: AppColors.ink, width: 1.6),
                ),
                child: Center(
                  child: BaseText(
                    '+$overflow',
                    fontSize: size * 0.32,
                    fontWeight: FontWeight.w700,
                    textColor: AppColors.mist,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

/// Small provenance marker: where a displayed value came from.
class SourceBadge extends StatelessWidget {
  const SourceBadge({
    super.key,
    required this.label,
    required this.icon,
    this.color = AppColors.glacier,
  });

  final String label;
  final IconData icon;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: getSize(7),
        vertical: getSize(3),
      ),
      decoration: BoxDecoration(
        color: withCustomOpacity(color, 0.12),
        borderRadius: AppRadii.rXs,
        border: Border.all(color: withCustomOpacity(color, 0.24)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Icon(icon, size: getFontSize(10), color: color),
          SizedBox(width: getSize(4)),
          BaseText(
            label,
            fontSize: 9.5,
            fontWeight: FontWeight.w600,
            textColor: color,
            letterSpacing: 0.4,
          ),
        ],
      ),
    );
  }
}
