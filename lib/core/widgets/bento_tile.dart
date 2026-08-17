import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../theme/app_shapes.dart';
import '../theme/app_typography.dart';
import '../utils/color_utils.dart';
import '../utils/math_utils.dart';
import '../utils/spacing_utils.dart';
import 'aurora_background.dart';
import 'base_text.dart';
import 'glass_panel.dart';

/// The signature card of the product: a glass tile with a haloed glyph, a small
/// label, a headline figure and an optional visual in the lower-right corner.
/// Home, the Lenses and every summary surface are assembled from these.
class BentoTile extends StatelessWidget {
  const BentoTile({
    super.key,
    required this.label,
    this.icon,
    this.figure,
    this.caption,
    this.visual,
    this.onTap,
    this.tone = GlassTone.standard,
    this.accent = AppColors.ember,
    this.height,
    this.showArrow = false,
    this.trailing,
    this.wash = true,
    this.labelMaxLines = 2,
    this.padding,
  });

  final String label;
  final IconData? icon;

  /// Big number/short string. Pass a [Widget] via [figure] for tickers.
  final Widget? figure;
  final String? caption;
  final Widget? visual;
  final VoidCallback? onTap;
  final GlassTone tone;
  final Color accent;
  final double? height;
  final bool showArrow;
  final Widget? trailing;
  final bool wash;
  final int labelMaxLines;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return GlassPanel(
      tone: tone,
      onTap: onTap,
      height: height,
      borderRadius: AppRadii.rXl,
      padding: EdgeInsets.zero,
      child: Stack(
        children: <Widget>[
          if (wash)
            Positioned.fill(
              child: ClipRRect(
                borderRadius: AppRadii.rXl,
                child: AuroraWash(color: accent, scale: 0.9),
              ),
            ),
          Padding(
            padding: padding ?? EdgeInsets.all(getSize(16)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    if (icon != null) ...<Widget>[
                      _GlyphHalo(icon: icon!, accent: accent),
                      horizontalSpace(10),
                    ],
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(
                          top: getSize(icon != null ? 4 : 0),
                        ),
                        child: BaseText(
                          label,
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          textColor: AppColors.mist,
                          maxLines: labelMaxLines,
                          height: 1.25,
                        ),
                      ),
                    ),
                    ?trailing,
                    if (showArrow && trailing == null)
                      Container(
                        width: getSize(30),
                        height: getSize(30),
                        decoration: BoxDecoration(
                          color: withCustomOpacity(AppColors.white, 0.9),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.arrow_outward_rounded,
                          size: getFontSize(15),
                          color: AppColors.ink,
                        ),
                      ),
                  ],
                ),
                const Spacer(),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          ?figure,
                          if (caption != null) ...<Widget>[
                            verticalSpace(4),
                            BaseText(
                              caption!,
                              fontSize: 11,
                              textColor: AppColors.muted,
                              maxLines: 2,
                            ),
                          ],
                        ],
                      ),
                    ),
                    ?visual,
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _GlyphHalo extends StatelessWidget {
  const _GlyphHalo({required this.icon, required this.accent});

  final IconData icon;
  final Color accent;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: getSize(34),
      height: getSize(34),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: withCustomOpacity(AppColors.white, 0.08),
        border: Border.all(color: withCustomOpacity(accent, 0.4)),
      ),
      child: Icon(icon, size: getFontSize(16), color: accent),
    );
  }
}

/// Hero variant used at the top of Home and each Lens: taller, gradient-tinted,
/// with a large figure and an inline action.
class BentoHeroTile extends StatelessWidget {
  const BentoHeroTile({
    super.key,
    required this.label,
    required this.figure,
    this.icon,
    this.caption,
    this.footer,
    this.onTap,
    this.accent = AppColors.ember,
    this.trailing,
    this.height,
  });

  final String label;
  final Widget figure;
  final IconData? icon;
  final String? caption;
  final Widget? footer;
  final VoidCallback? onTap;
  final Color accent;
  final Widget? trailing;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return GlassPanel(
      tone: GlassTone.raised,
      onTap: onTap,
      height: height,
      blur: AppBlur.heavy,
      borderRadius: AppRadii.rXxl,
      padding: EdgeInsets.zero,
      shadows: AppShadows.raised,
      child: Stack(
        children: <Widget>[
          Positioned.fill(
            child: ClipRRect(
              borderRadius: AppRadii.rXxl,
              child: Stack(
                children: <Widget>[
                  AuroraWash(color: accent, alignment: Alignment.topLeft),
                  AuroraWash(
                    color: AppColors.glacier,
                    alignment: Alignment.bottomRight,
                    scale: 0.8,
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(getSize(20)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    if (icon != null) ...<Widget>[
                      _GlyphHalo(icon: icon!, accent: accent),
                      horizontalSpace(10),
                    ],
                    Expanded(
                      child: BaseText(
                        label,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        textColor: AppColors.mist,
                      ),
                    ),
                    ?trailing,
                  ],
                ),
                verticalSpace(18),
                figure,
                if (caption != null) ...<Widget>[
                  verticalSpace(6),
                  BaseText(
                    caption!,
                    fontSize: 12,
                    textColor: AppColors.muted,
                    textStyle: AppTypography.bodySmall,
                  ),
                ],
                if (footer != null) ...<Widget>[verticalSpace(16), footer!],
              ],
            ),
          ),
        ],
      ),
    );
  }
}
