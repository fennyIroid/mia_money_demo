import 'dart:ui';

import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_motion.dart';
import '../../../core/theme/app_shapes.dart';
import '../../../core/utils/color_utils.dart';
import '../../../core/utils/math_utils.dart';
import '../../../core/utils/spacing_utils.dart';
import '../../../core/widgets/base_text.dart';
import '../../../core/widgets/pressable.dart';

class MiaTabItem {
  const MiaTabItem({
    required this.label,
    required this.icon,
    required this.activeIcon,
    this.badge = 0,
  });

  final String label;
  final IconData icon;
  final IconData activeIcon;
  final int badge;
}

/// Floating frosted tab bar. The selected tab carries a travelling glow pill
/// that slides between positions rather than blinking on.
///
/// [action] is docked to the trailing edge as a sibling of the bar, not floated
/// over the page, so the one permanent action reads as navigation chrome and
/// never covers the content scrolling beneath it.
class MiaTabBar extends StatelessWidget {
  const MiaTabBar({
    super.key,
    required this.items,
    required this.activeIndex,
    required this.onSelected,
    this.action,
  });

  final List<MiaTabItem> items;
  final int activeIndex;
  final ValueChanged<int> onSelected;
  final Widget? action;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: getSize(16),
        right: getSize(16),
        bottom: MediaQuery.paddingOf(context).bottom + getSize(10),
      ),
      child: Row(
        children: <Widget>[
          Expanded(
            child: ClipRRect(
              borderRadius: AppRadii.rXxl,
              child: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: AppBlur.heavy,
                  sigmaY: AppBlur.heavy,
                ),
                child: Container(
                  height: getSize(66),
                  padding: EdgeInsets.symmetric(horizontal: getSize(6)),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: <Color>[
                        withCustomOpacity(AppColors.white, 0.14),
                        withCustomOpacity(AppColors.white, 0.05),
                      ],
                    ),
                    borderRadius: AppRadii.rXxl,
                    border: Border.all(color: AppColors.glassBorder),
                    boxShadow: AppShadows.raised,
                  ),
                  child: LayoutBuilder(
                    builder:
                        (BuildContext context, BoxConstraints constraints) {
                          final double itemWidth =
                              constraints.maxWidth / items.length;
                          return Stack(
                            children: <Widget>[
                              AnimatedPositioned(
                                duration: AppMotion.normal,
                                curve: AppMotion.spring,
                                left: itemWidth * activeIndex + getSize(6),
                                width: itemWidth - getSize(12),
                                top: getSize(8),
                                bottom: getSize(8),
                                child: Container(
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: <Color>[
                                        withCustomOpacity(
                                          AppColors.ember,
                                          0.34,
                                        ),
                                        withCustomOpacity(AppColors.rust, 0.16),
                                      ],
                                    ),
                                    borderRadius: AppRadii.rLg,
                                    border: Border.all(
                                      color: withCustomOpacity(
                                        AppColors.emberBright,
                                        0.38,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Row(
                                children: List<Widget>.generate(items.length, (
                                  int i,
                                ) {
                                  return Expanded(
                                    child: MiaTabButton(
                                      item: items[i],
                                      isActive: i == activeIndex,
                                      onTap: () => onSelected(i),
                                    ),
                                  );
                                }),
                              ),
                            ],
                          );
                        },
                  ),
                ),
              ),
            ),
          ),
          if (action != null) ...<Widget>[horizontalSpace(10), action!],
        ],
      ),
    );
  }
}

class MiaTabButton extends StatelessWidget {
  const MiaTabButton({
    super.key,
    required this.item,
    required this.isActive,
    required this.onTap,
  });

  final MiaTabItem item;
  final bool isActive;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Pressable(
      onTap: onTap,
      pressedScale: 0.9,
      semanticLabel: item.label,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Stack(
            clipBehavior: Clip.none,
            children: <Widget>[
              AnimatedScale(
                scale: isActive ? 1.08 : 1.0,
                duration: AppMotion.normal,
                curve: AppMotion.spring,
                child: Icon(
                  isActive ? item.activeIcon : item.icon,
                  size: getFontSize(21),
                  color: isActive ? AppColors.frost : AppColors.muted,
                ),
              ),
              if (item.badge > 0)
                Positioned(
                  right: -getSize(7),
                  top: -getSize(4),
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: getSize(4),
                      vertical: getSize(1),
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.negative,
                      borderRadius: AppRadii.rPill,
                      border: Border.all(color: AppColors.ink, width: 1.2),
                    ),
                    child: BaseText(
                      '${item.badge}',
                      fontSize: 8.5,
                      fontWeight: FontWeight.w700,
                      textColor: AppColors.frost,
                    ),
                  ),
                ),
            ],
          ),
          SizedBox(height: getSize(4)),
          AnimatedDefaultTextStyle(
            duration: AppMotion.quick,
            style: TextStyle(
              fontFamily: 'Epilogue',
              fontSize: getFontSize(10),
              fontWeight: isActive ? FontWeight.w700 : FontWeight.w500,
              color: isActive ? AppColors.frost : AppColors.muted,
            ),
            child: Text(item.label),
          ),
        ],
      ),
    );
  }
}
