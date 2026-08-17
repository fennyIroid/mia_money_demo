import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../theme/app_shapes.dart';
import '../theme/app_typography.dart';
import '../utils/color_utils.dart';
import '../utils/math_utils.dart';
import '../utils/spacing_utils.dart';
import 'base_text.dart';
import 'glass_panel.dart';
import 'pressable.dart';

/// Generic glass row: glyph, title, subtitle, trailing value and an optional
/// footer strip for provenance. Transactions, bills, documents, warranties,
/// sessions and lens results all render through this.
class MiaListRow extends StatelessWidget {
  const MiaListRow({
    super.key,
    required this.title,
    this.subtitle,
    this.icon,
    this.iconColor = AppColors.ember,
    this.leading,
    this.trailingTop,
    this.trailingBottom,
    this.onTap,
    this.footer,
    this.badges,
    this.showChevron = false,
    this.tone = GlassTone.standard,
    this.dense = false,
    this.emphasise = false,
  });

  final String title;
  final String? subtitle;
  final IconData? icon;
  final Color iconColor;
  final Widget? leading;
  final Widget? trailingTop;
  final Widget? trailingBottom;
  final VoidCallback? onTap;
  final Widget? footer;
  final List<Widget>? badges;
  final bool showChevron;
  final GlassTone tone;
  final bool dense;
  final bool emphasise;

  @override
  Widget build(BuildContext context) {
    return GlassPanel(
      tone: tone,
      onTap: onTap,
      borderRadius: AppRadii.rLg,
      padding: EdgeInsets.symmetric(
        horizontal: getSize(14),
        vertical: getSize(dense ? 11 : 14),
      ),
      shadows: emphasise ? AppShadows.panel : AppShadows.none,
      borderColor: emphasise
          ? withCustomOpacity(iconColor, 0.34)
          : AppColors.glassBorderSoft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              if (leading != null)
                leading!
              else if (icon != null)
                Container(
                  width: getSize(dense ? 34 : 40),
                  height: getSize(dense ? 34 : 40),
                  decoration: BoxDecoration(
                    color: withCustomOpacity(iconColor, 0.14),
                    borderRadius: AppRadii.rSm,
                    border: Border.all(
                      color: withCustomOpacity(iconColor, 0.26),
                    ),
                  ),
                  child: Icon(
                    icon,
                    size: getFontSize(dense ? 16 : 18),
                    color: iconColor,
                  ),
                ),
              if (leading != null || icon != null) horizontalSpace(12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    BaseText(
                      title,
                      fontSize: dense ? 14 : 15,
                      textStyle: AppTypography.titleSmall,
                      maxLines: 1,
                    ),
                    if (subtitle != null) ...<Widget>[
                      verticalSpace(3),
                      BaseText(
                        subtitle!,
                        fontSize: 12,
                        textColor: AppColors.muted,
                        maxLines: 2,
                        height: 1.35,
                      ),
                    ],
                  ],
                ),
              ),
              horizontalSpace(10),
              if (trailingTop != null || trailingBottom != null)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ?trailingTop,
                    if (trailingBottom != null) ...<Widget>[
                      verticalSpace(4),
                      trailingBottom!,
                    ],
                  ],
                ),
              if (showChevron) ...<Widget>[
                horizontalSpace(6),
                Icon(
                  Icons.chevron_right_rounded,
                  size: getFontSize(18),
                  color: AppColors.faint,
                ),
              ],
            ],
          ),
          if (badges != null && badges!.isNotEmpty) ...<Widget>[
            verticalSpace(10),
            Wrap(
              spacing: getSize(6),
              runSpacing: getSize(6),
              children: badges!,
            ),
          ],
          if (footer != null) ...<Widget>[
            verticalSpace(12),
            Container(height: 1, color: AppColors.glassBorderSoft),
            verticalSpace(10),
            footer!,
          ],
        ],
      ),
    );
  }
}

/// Money amount rendered with the display family, sign colouring and optional
/// struck-through original value (used for corrections).
class MoneyLabel extends StatelessWidget {
  const MoneyLabel({
    super.key,
    required this.text,
    this.fontSize = 16,
    this.color,
    this.isCredit = false,
    this.strikeThrough = false,
    this.fontWeight,
  });

  final String text;
  final double fontSize;
  final Color? color;
  final bool isCredit;
  final bool strikeThrough;
  final FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) {
    return BaseText(
      text,
      fontSize: fontSize,
      fontWeight: fontWeight ?? FontWeight.w600,
      textStyle: AppTypography.figureMedium,
      textColor: color ?? (isCredit ? AppColors.positive : AppColors.frost),
      decoration: strikeThrough ? TextDecoration.lineThrough : null,
    );
  }
}

/// Settings-style row inside a grouped glass card.
class MiaSettingsRow extends StatelessWidget {
  const MiaSettingsRow({
    super.key,
    required this.title,
    this.subtitle,
    this.icon,
    this.value,
    this.onTap,
    this.accent = AppColors.glacier,
    this.trailing,
    this.isDestructive = false,
  });

  final String title;
  final String? subtitle;
  final IconData? icon;
  final String? value;
  final VoidCallback? onTap;
  final Color accent;
  final Widget? trailing;
  final bool isDestructive;

  @override
  Widget build(BuildContext context) {
    final Color titleColor = isDestructive
        ? AppColors.negative
        : AppColors.frost;

    return Pressable(
      onTap: onTap,
      pressedScale: 0.99,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: getSize(13)),
        child: Row(
          children: <Widget>[
            if (icon != null) ...<Widget>[
              Container(
                width: getSize(32),
                height: getSize(32),
                decoration: BoxDecoration(
                  color: withCustomOpacity(
                    isDestructive ? AppColors.negative : accent,
                    0.14,
                  ),
                  borderRadius: AppRadii.rXs,
                ),
                child: Icon(
                  icon,
                  size: getFontSize(15),
                  color: isDestructive ? AppColors.negative : accent,
                ),
              ),
              horizontalSpace(12),
            ],
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  BaseText(
                    title,
                    fontSize: 14.5,
                    fontWeight: FontWeight.w600,
                    textColor: titleColor,
                  ),
                  if (subtitle != null) ...<Widget>[
                    verticalSpace(3),
                    BaseText(
                      subtitle!,
                      fontSize: 12,
                      textColor: AppColors.muted,
                      height: 1.4,
                    ),
                  ],
                ],
              ),
            ),
            if (value != null) ...<Widget>[
              horizontalSpace(10),
              BaseText(value!, fontSize: 13, textColor: AppColors.mist),
            ],
            ?trailing,
            if (onTap != null && trailing == null) ...<Widget>[
              horizontalSpace(6),
              Icon(
                Icons.chevron_right_rounded,
                size: getFontSize(18),
                color: AppColors.faint,
              ),
            ],
          ],
        ),
      ),
    );
  }
}

/// Grouped container for settings rows with hairline separators.
class MiaGroupedCard extends StatelessWidget {
  const MiaGroupedCard({
    super.key,
    required this.children,
    this.title,
    this.footnote,
  });

  final List<Widget> children;
  final String? title;
  final String? footnote;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        if (title != null) ...<Widget>[
          Padding(
            padding: EdgeInsets.only(left: getSize(4), bottom: getSize(8)),
            child: BaseText(
              title!,
              fontSize: 10,
              textStyle: AppTypography.overline,
            ),
          ),
        ],
        GlassPanel(
          tone: GlassTone.soft,
          padding: EdgeInsets.symmetric(horizontal: getSize(14)),
          child: Column(
            children: List<Widget>.generate(children.length * 2 - 1, (int i) {
              if (i.isOdd) {
                return Container(height: 1, color: AppColors.glassBorderSoft);
              }
              return children[i ~/ 2];
            }),
          ),
        ),
        if (footnote != null) ...<Widget>[
          verticalSpace(8),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: getSize(6)),
            child: BaseText(
              footnote!,
              fontSize: 11.5,
              textColor: AppColors.faint,
              height: 1.45,
            ),
          ),
        ],
      ],
    );
  }
}

/// Key/value pair used inside evidence and calculation drawers.
class EvidenceRow extends StatelessWidget {
  const EvidenceRow({
    super.key,
    required this.label,
    required this.value,
    this.valueColor,
    this.icon,
    this.monospaceValue = false,
  });

  final String label;
  final String value;
  final Color? valueColor;
  final IconData? icon;
  final bool monospaceValue;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: getSize(6)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          if (icon != null) ...<Widget>[
            Icon(icon, size: getFontSize(13), color: AppColors.faint),
            horizontalSpace(8),
          ],
          Expanded(
            flex: 5,
            child: BaseText(label, fontSize: 12.5, textColor: AppColors.muted),
          ),
          horizontalSpace(10),
          Expanded(
            flex: 6,
            child: BaseText(
              value,
              fontSize: 12.5,
              fontWeight: FontWeight.w600,
              textColor: valueColor ?? AppColors.frost,
              textAlign: TextAlign.right,
              textStyle: monospaceValue ? AppTypography.figureMedium : null,
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }
}
