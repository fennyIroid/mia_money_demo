import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../theme/app_colors.dart';
import '../theme/app_gradients.dart';
import '../theme/app_motion.dart';
import '../theme/app_shapes.dart';
import '../theme/app_typography.dart';
import '../utils/color_utils.dart';
import '../utils/date_utils.dart';
import '../utils/math_utils.dart';
import '../utils/spacing_utils.dart';
import 'base_text.dart';
import 'glass_panel.dart';
import 'pressable.dart';

/// Sliding segmented control. The selected pill glides rather than cutting, so
/// switching views reads as one continuous motion.
class MiaSegmentedControl extends StatelessWidget {
  const MiaSegmentedControl({
    super.key,
    required this.segments,
    required this.selectedIndex,
    required this.onChanged,
    this.height = 42,
    this.accent = AppColors.ember,
    this.compact = false,
  });

  final List<String> segments;
  final int selectedIndex;
  final ValueChanged<int> onChanged;
  final double height;
  final Color accent;
  final bool compact;

  @override
  Widget build(BuildContext context) {
    // The pill is aligned and sized as a fraction of the track's own inner box,
    // so padding and border widths can never push it past the right edge.
    final double alignmentX = segments.length > 1
        ? -1 + (2 * selectedIndex / (segments.length - 1))
        : 0;

    return Container(
      height: getSize(height),
      padding: EdgeInsets.all(getSize(3)),
      decoration: BoxDecoration(
        color: AppColors.glassFillSoft,
        borderRadius: AppRadii.rPill,
        border: Border.all(color: AppColors.glassBorderSoft),
      ),
      child: Stack(
        children: <Widget>[
          AnimatedAlign(
            duration: AppMotion.quick,
            curve: AppMotion.standard,
            alignment: Alignment(alignmentX, 0),
            child: FractionallySizedBox(
              widthFactor: 1 / segments.length,
              heightFactor: 1,
              child: Container(
                decoration: BoxDecoration(
                  gradient: AppGradients.tint(accent),
                  borderRadius: AppRadii.rPill,
                  border: Border.all(color: withCustomOpacity(accent, 0.42)),
                ),
              ),
            ),
          ),
          Row(
            children: List<Widget>.generate(segments.length, (int i) {
              final bool selected = i == selectedIndex;
              return Expanded(
                child: Pressable(
                  onTap: () => onChanged(i),
                  pressedScale: 0.96,
                  child: Center(
                    child: AnimatedDefaultTextStyle(
                      duration: AppMotion.quick,
                      style: AppTypography.label.copyWith(
                        fontSize: getFontSize(compact ? 12 : 13),
                        color: selected ? AppColors.frost : AppColors.muted,
                        fontWeight: selected
                            ? FontWeight.w700
                            : FontWeight.w500,
                      ),
                      child: Text(segments[i]),
                    ),
                  ),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}

/// Horizontally scrolling filter chips used across transactions, reports and
/// the Lenses.
class MiaChipRow extends StatelessWidget {
  const MiaChipRow({
    super.key,
    required this.labels,
    required this.selectedIndex,
    required this.onChanged,
    this.accent = AppColors.ember,
    this.icons,
    this.padding,
  });

  final List<String> labels;
  final int selectedIndex;
  final ValueChanged<int> onChanged;
  final Color accent;
  final List<IconData>? icons;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      padding: padding ?? EdgeInsets.symmetric(horizontal: getSize(20)),
      child: Row(
        children: List<Widget>.generate(labels.length, (int i) {
          final bool selected = i == selectedIndex;
          return Padding(
            padding: EdgeInsets.only(right: getSize(8)),
            child: Pressable(
              onTap: () => onChanged(i),
              pressedScale: 0.94,
              child: AnimatedContainer(
                duration: AppMotion.quick,
                curve: AppMotion.standard,
                padding: EdgeInsets.symmetric(
                  horizontal: getSize(14),
                  vertical: getSize(9),
                ),
                decoration: BoxDecoration(
                  color: selected
                      ? withCustomOpacity(accent, 0.2)
                      : AppColors.glassFillSoft,
                  borderRadius: AppRadii.rPill,
                  border: Border.all(
                    color: selected
                        ? withCustomOpacity(accent, 0.5)
                        : AppColors.glassBorderSoft,
                  ),
                ),
                child: Row(
                  children: <Widget>[
                    if (icons != null && i < icons!.length) ...<Widget>[
                      Icon(
                        icons![i],
                        size: getFontSize(14),
                        color: selected ? accent : AppColors.muted,
                      ),
                      horizontalSpace(6),
                    ],
                    BaseText(
                      labels[i],
                      fontSize: 12.5,
                      fontWeight: selected ? FontWeight.w700 : FontWeight.w500,
                      textColor: selected ? AppColors.frost : AppColors.muted,
                    ),
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}

/// Multi-select variant used by filters, lender universes and notification
/// event pickers.
class MiaToggleChips extends StatelessWidget {
  const MiaToggleChips({
    super.key,
    required this.labels,
    required this.selected,
    required this.onToggle,
    this.accent = AppColors.glacier,
  });

  final List<String> labels;
  final Set<String> selected;
  final ValueChanged<String> onToggle;
  final Color accent;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: getSize(8),
      runSpacing: getSize(8),
      children: labels.map((String label) {
        final bool isOn = selected.contains(label);
        return Pressable(
          onTap: () => onToggle(label),
          pressedScale: 0.94,
          child: AnimatedContainer(
            duration: AppMotion.quick,
            padding: EdgeInsets.symmetric(
              horizontal: getSize(13),
              vertical: getSize(9),
            ),
            decoration: BoxDecoration(
              color: isOn
                  ? withCustomOpacity(accent, 0.2)
                  : AppColors.glassFillSoft,
              borderRadius: AppRadii.rPill,
              border: Border.all(
                color: isOn
                    ? withCustomOpacity(accent, 0.5)
                    : AppColors.glassBorderSoft,
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Icon(
                  isOn ? Icons.check_rounded : Icons.add_rounded,
                  size: getFontSize(13),
                  color: isOn ? accent : AppColors.faint,
                ),
                horizontalSpace(6),
                BaseText(
                  label,
                  fontSize: 12.5,
                  fontWeight: isOn ? FontWeight.w600 : FontWeight.w500,
                  textColor: isOn ? AppColors.frost : AppColors.muted,
                ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }
}

class MiaTextField extends StatelessWidget {
  const MiaTextField({
    super.key,
    required this.controller,
    this.hint,
    this.label,
    this.keyboardType,
    this.obscureText = false,
    this.prefixIcon,
    this.suffix,
    this.onChanged,
    this.onSubmitted,
    this.maxLines = 1,
    this.errorText,
    this.autofocus = false,
    this.inputFormatters,
    this.textCapitalization = TextCapitalization.none,
    this.readOnly = false,
    this.onTap,
  });

  final TextEditingController controller;
  final String? hint;
  final String? label;
  final TextInputType? keyboardType;
  final bool obscureText;
  final IconData? prefixIcon;
  final Widget? suffix;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final int maxLines;
  final String? errorText;
  final bool autofocus;
  final List<TextInputFormatter>? inputFormatters;
  final TextCapitalization textCapitalization;
  final bool readOnly;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        if (label != null) ...<Widget>[
          BaseText(
            label!,
            fontSize: 10,
            textStyle: AppTypography.overline,
            textColor: AppColors.muted,
          ),
          verticalSpace(8),
        ],
        TextField(
          controller: controller,
          keyboardType: keyboardType,
          obscureText: obscureText,
          maxLines: obscureText ? 1 : maxLines,
          autofocus: autofocus,
          readOnly: readOnly,
          onTap: onTap,
          inputFormatters: inputFormatters,
          textCapitalization: textCapitalization,
          onChanged: onChanged,
          onSubmitted: onSubmitted,
          cursorColor: AppColors.ember,
          cursorRadius: Radius.circular(getSize(4)),
          style: AppTypography.bodyLarge.copyWith(color: AppColors.frost),
          decoration: InputDecoration(
            hintText: hint,
            errorText: errorText,
            prefixIcon: prefixIcon == null
                ? null
                : Padding(
                    padding: EdgeInsets.only(
                      left: getSize(16),
                      right: getSize(10),
                    ),
                    child: Icon(
                      prefixIcon,
                      size: getFontSize(18),
                      color: AppColors.muted,
                    ),
                  ),
            prefixIconConstraints: BoxConstraints(minWidth: getSize(44)),
            suffixIcon: suffix == null
                ? null
                : Padding(
                    padding: EdgeInsets.only(right: getSize(12)),
                    child: suffix,
                  ),
          ),
        ),
      ],
    );
  }
}

/// Search field with its own glass treatment, used by Global Search and every
/// list filter row.
class MiaSearchField extends StatelessWidget {
  const MiaSearchField({
    super.key,
    this.initialValue,
    this.hint = 'Search',
    this.onChanged,
    this.onSubmitted,
    this.autofocus = false,
    this.trailing,
  });

  final String? initialValue;
  final String hint;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final bool autofocus;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return GlassPanel(
      tone: GlassTone.soft,
      borderRadius: AppRadii.rPill,
      padding: EdgeInsets.symmetric(horizontal: getSize(16)),
      showRim: false,
      shadows: AppShadows.none,
      child: Row(
        children: <Widget>[
          Icon(
            Icons.search_rounded,
            size: getFontSize(18),
            color: AppColors.muted,
          ),
          horizontalSpace(10),
          Expanded(
            child: TextFormField(
              initialValue: initialValue,
              autofocus: autofocus,
              onChanged: onChanged,
              onFieldSubmitted: onSubmitted,
              cursorColor: AppColors.ember,
              style: AppTypography.bodyMedium.copyWith(color: AppColors.frost),
              decoration: InputDecoration(
                hintText: hint,
                filled: false,
                isDense: true,
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(vertical: getSize(14)),
              ),
            ),
          ),
          ?trailing,
        ],
      ),
    );
  }
}

/// Row with a title, optional description and a trailing switch.
class MiaSwitchRow extends StatelessWidget {
  const MiaSwitchRow({
    super.key,
    required this.title,
    required this.value,
    required this.onChanged,
    this.description,
    this.icon,
    this.accent = AppColors.ember,
    this.enabled = true,
  });

  final String title;
  final bool value;
  final ValueChanged<bool> onChanged;
  final String? description;
  final IconData? icon;
  final Color accent;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: enabled ? 1 : 0.45,
      child: Pressable(
        onTap: enabled ? () => onChanged(!value) : null,
        pressedScale: 0.99,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: getSize(12)),
          child: Row(
            children: <Widget>[
              if (icon != null) ...<Widget>[
                Icon(icon, size: getFontSize(18), color: accent),
                horizontalSpace(12),
              ],
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    BaseText(
                      title,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      textColor: AppColors.frost,
                    ),
                    if (description != null) ...<Widget>[
                      verticalSpace(3),
                      BaseText(
                        description!,
                        fontSize: 12,
                        textColor: AppColors.muted,
                        height: 1.4,
                      ),
                    ],
                  ],
                ),
              ),
              horizontalSpace(12),
              Switch.adaptive(
                value: value,
                onChanged: enabled ? onChanged : null,
                activeTrackColor: accent,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Radio-style selectable card used by plan pickers, budget modes and ranking
/// objectives.
class MiaChoiceCard extends StatelessWidget {
  const MiaChoiceCard({
    super.key,
    required this.title,
    required this.selected,
    required this.onTap,
    this.description,
    this.icon,
    this.trailing,
    this.accent = AppColors.ember,
    this.badge,
  });

  final String title;
  final bool selected;
  final VoidCallback onTap;
  final String? description;
  final IconData? icon;
  final Widget? trailing;
  final Color accent;
  final String? badge;

  @override
  Widget build(BuildContext context) {
    return Pressable(
      onTap: onTap,
      pressedScale: 0.98,
      child: AnimatedContainer(
        duration: AppMotion.quick,
        curve: AppMotion.standard,
        padding: EdgeInsets.all(getSize(16)),
        decoration: BoxDecoration(
          gradient: selected
              ? AppGradients.tint(accent)
              : AppGradients.glassPanel,
          borderRadius: AppRadii.rLg,
          border: Border.all(
            color: selected
                ? withCustomOpacity(accent, 0.6)
                : AppColors.glassBorderSoft,
            width: selected ? 1.4 : 1,
          ),
          boxShadow: selected
              ? AppShadows.glow(accent, strength: 0.4)
              : AppShadows.none,
        ),
        child: Row(
          children: <Widget>[
            AnimatedContainer(
              duration: AppMotion.quick,
              width: getSize(22),
              height: getSize(22),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: selected ? accent : AppColors.transparent,
                border: Border.all(
                  color: selected ? accent : AppColors.glassBorder,
                  width: 1.6,
                ),
              ),
              child: selected
                  ? Icon(
                      Icons.check_rounded,
                      size: getFontSize(14),
                      color: AppColors.ink,
                    )
                  : null,
            ),
            horizontalSpace(14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      if (icon != null) ...<Widget>[
                        Icon(icon, size: getFontSize(15), color: accent),
                        horizontalSpace(8),
                      ],
                      Expanded(
                        child: BaseText(
                          title,
                          fontSize: 15,
                          textStyle: AppTypography.titleSmall,
                        ),
                      ),
                      if (badge != null)
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: getSize(8),
                            vertical: getSize(3),
                          ),
                          decoration: BoxDecoration(
                            color: withCustomOpacity(accent, 0.2),
                            borderRadius: AppRadii.rPill,
                          ),
                          child: BaseText(
                            badge!,
                            fontSize: 10,
                            fontWeight: FontWeight.w700,
                            textColor: accent,
                          ),
                        ),
                    ],
                  ),
                  if (description != null) ...<Widget>[
                    verticalSpace(5),
                    BaseText(
                      description!,
                      fontSize: 12.5,
                      textColor: AppColors.muted,
                      height: 1.45,
                    ),
                  ],
                ],
              ),
            ),
            if (trailing != null) ...<Widget>[horizontalSpace(10), trailing!],
          ],
        ),
      ),
    );
  }
}

/// Stepper for amounts, member counts and horizons.
class MiaStepper extends StatelessWidget {
  const MiaStepper({
    super.key,
    required this.value,
    required this.onChanged,
    this.min = 0,
    this.max = 100,
    this.step = 1,
    this.formatter,
  });

  final double value;
  final ValueChanged<double> onChanged;
  final double min;
  final double max;
  final double step;
  final String Function(double)? formatter;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        _StepButton(
          icon: Icons.remove_rounded,
          onTap: value - step >= min ? () => onChanged(value - step) : null,
        ),
        Expanded(
          child: Center(
            child: BaseText(
              formatter?.call(value) ?? value.toStringAsFixed(0),
              fontSize: 18,
              textStyle: AppTypography.figureMedium,
            ),
          ),
        ),
        _StepButton(
          icon: Icons.add_rounded,
          onTap: value + step <= max ? () => onChanged(value + step) : null,
        ),
      ],
    );
  }
}

class _StepButton extends StatelessWidget {
  const _StepButton({required this.icon, this.onTap});

  final IconData icon;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: onTap == null ? 0.35 : 1,
      child: Pressable(
        onTap: onTap,
        pressedScale: 0.88,
        child: Container(
          width: getSize(40),
          height: getSize(40),
          decoration: BoxDecoration(
            color: AppColors.glassFill,
            shape: BoxShape.circle,
            border: Border.all(color: AppColors.glassBorderSoft),
          ),
          child: Icon(icon, size: getFontSize(18), color: AppColors.frost),
        ),
      ),
    );
  }
}

/// Controller-free text input. Uses [TextFormField]'s own internal state so
/// feature views can stay stateless while still keeping the caret stable across
/// BLoC-driven rebuilds.
class MiaFormField extends StatelessWidget {
  const MiaFormField({
    super.key,
    required this.onChanged,
    this.initialValue,
    this.hint,
    this.label,
    this.keyboardType,
    this.obscureText = false,
    this.prefixIcon,
    this.suffix,
    this.maxLines = 1,
    this.errorText,
    this.autofocus = false,
    this.textCapitalization = TextCapitalization.sentences,
    this.textAlign = TextAlign.start,
    this.fontSize = 16,
    this.onSubmitted,
    this.inputFormatters,
  });

  final ValueChanged<String> onChanged;
  final String? initialValue;
  final String? hint;
  final String? label;
  final TextInputType? keyboardType;
  final bool obscureText;
  final IconData? prefixIcon;
  final Widget? suffix;
  final int maxLines;
  final String? errorText;
  final bool autofocus;
  final TextCapitalization textCapitalization;
  final TextAlign textAlign;
  final double fontSize;
  final ValueChanged<String>? onSubmitted;
  final List<TextInputFormatter>? inputFormatters;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        if (label != null) ...<Widget>[
          BaseText(
            label!,
            fontSize: 10,
            textStyle: AppTypography.overline,
            textColor: AppColors.muted,
          ),
          verticalSpace(8),
        ],
        TextFormField(
          initialValue: initialValue,
          onChanged: onChanged,
          onFieldSubmitted: onSubmitted,
          keyboardType: keyboardType,
          obscureText: obscureText,
          maxLines: obscureText ? 1 : maxLines,
          autofocus: autofocus,
          textAlign: textAlign,
          textCapitalization: textCapitalization,
          inputFormatters: inputFormatters,
          cursorColor: AppColors.ember,
          cursorRadius: Radius.circular(getSize(4)),
          style: AppTypography.titleMedium.copyWith(
            fontSize: getFontSize(fontSize),
            color: AppColors.frost,
          ),
          decoration: InputDecoration(
            hintText: hint,
            errorText: errorText,
            hintStyle: AppTypography.titleMedium.copyWith(
              fontSize: getFontSize(fontSize),
              color: withCustomOpacity(AppColors.faint, 0.8),
            ),
            prefixIcon: prefixIcon == null
                ? null
                : Padding(
                    padding: EdgeInsets.only(
                      left: getSize(16),
                      right: getSize(10),
                    ),
                    child: Icon(
                      prefixIcon,
                      size: getFontSize(18),
                      color: AppColors.muted,
                    ),
                  ),
            prefixIconConstraints: BoxConstraints(minWidth: getSize(44)),
            suffixIcon: suffix == null
                ? null
                : Padding(
                    padding: EdgeInsets.only(right: getSize(12)),
                    child: suffix,
                  ),
          ),
        ),
      ],
    );
  }
}

/// A field whose value is chosen rather than typed: a date, an account, a
/// category. Reads like [MiaFormField] so a form built from both does not look
/// assembled from two different products.
class MiaPickerField extends StatelessWidget {
  const MiaPickerField({
    super.key,
    required this.label,
    required this.value,
    required this.onTap,
    this.icon,
    this.helper,
    this.accent = AppColors.ember,
  });

  final String label;
  final String value;
  final VoidCallback onTap;
  final IconData? icon;
  final String? helper;
  final Color accent;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        BaseText(
          label,
          fontSize: 10,
          textStyle: AppTypography.overline,
          textColor: AppColors.muted,
        ),
        verticalSpace(8),
        Pressable(
          onTap: onTap,
          pressedScale: 0.98,
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: getSize(16),
              vertical: getSize(14),
            ),
            decoration: BoxDecoration(
              gradient: AppGradients.glassPanel,
              borderRadius: AppRadii.rMd,
              border: Border.all(color: AppColors.glassBorderSoft),
            ),
            child: Row(
              children: <Widget>[
                if (icon != null) ...<Widget>[
                  Icon(icon, size: getFontSize(18), color: accent),
                  horizontalSpace(12),
                ],
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      BaseText(
                        value,
                        fontSize: 15,
                        textStyle: AppTypography.titleSmall,
                      ),
                      if (helper != null) ...<Widget>[
                        verticalSpace(3),
                        BaseText(
                          helper!,
                          fontSize: 11.5,
                          textColor: AppColors.muted,
                        ),
                      ],
                    ],
                  ),
                ),
                Icon(
                  Icons.expand_more_rounded,
                  size: getFontSize(18),
                  color: AppColors.faint,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

/// Date field. The picker inherits the product's dark palette from
/// `AppTheme.dark`, so it does not arrive as a bright Material dialog.
class MiaDateField extends StatelessWidget {
  const MiaDateField({
    super.key,
    required this.label,
    required this.value,
    required this.onChanged,
    this.firstDate,
    this.lastDate,
    this.helper,
    this.icon = Icons.event_rounded,
  });

  final String label;
  final DateTime value;
  final ValueChanged<DateTime> onChanged;
  final DateTime? firstDate;
  final DateTime? lastDate;
  final String? helper;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    final DateTime now = DateTime.now();

    return MiaPickerField(
      label: label,
      value: formatFullDate(value),
      helper: helper ?? relativeLabel(value),
      icon: icon,
      onTap: () async {
        final DateTime? picked = await showDatePicker(
          context: context,
          initialDate: value,
          firstDate: firstDate ?? DateTime(now.year - 5),
          lastDate: lastDate ?? DateTime(now.year + 5),
        );
        if (picked != null) {
          onChanged(picked);
        }
      },
    );
  }
}
