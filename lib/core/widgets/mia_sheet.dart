import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../theme/app_colors.dart';
import '../theme/app_gradients.dart';
import '../theme/app_motion.dart';
import '../theme/app_shapes.dart';
import '../theme/app_typography.dart';
import '../utils/color_utils.dart';
import '../utils/math_utils.dart';
import '../utils/spacing_utils.dart';
import 'base_text.dart';
import 'mia_button.dart';
import 'reveal.dart';

/// Frosted modal sheet. Content rises with an iOS spring and the page behind it
/// stays visible through the glass.
Future<T?> showMiaSheet<T>({
  required BuildContext context,
  required Widget child,
  String? title,
  String? overline,
  bool isDismissible = true,
  bool expand = false,
}) {
  return showModalBottomSheet<T>(
    context: context,
    isScrollControlled: true,
    isDismissible: isDismissible,
    enableDrag: isDismissible,
    backgroundColor: AppColors.transparent,
    barrierColor: withCustomOpacity(AppColors.black, 0.55),
    transitionAnimationController: null,
    builder: (BuildContext context) {
      return MiaSheetShell(
        title: title,
        overline: overline,
        expand: expand,
        child: child,
      );
    },
  );
}

class MiaSheetShell extends StatelessWidget {
  const MiaSheetShell({
    super.key,
    required this.child,
    this.title,
    this.overline,
    this.expand = false,
  });

  final Widget child;
  final String? title;
  final String? overline;
  final bool expand;

  @override
  Widget build(BuildContext context) {
    final double maxHeight =
        MediaQuery.sizeOf(context).height * (expand ? 0.92 : 0.82);

    return Padding(
      padding: EdgeInsets.only(top: MediaQuery.paddingOf(context).top),
      child: ClipRRect(
        borderRadius: AppRadii.sheet,
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: AppBlur.sheet,
            sigmaY: AppBlur.sheet,
          ),
          child: Container(
            width: double.infinity,
            constraints: BoxConstraints(maxHeight: maxHeight),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: <Color>[
                  withCustomOpacity(AppColors.slate, 0.92),
                  withCustomOpacity(AppColors.abyss, 0.96),
                ],
              ),
              borderRadius: AppRadii.sheet,
              border: Border.all(color: AppColors.glassBorder),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                verticalSpace(10),
                Container(
                  width: getSize(38),
                  height: getSize(4),
                  decoration: BoxDecoration(
                    color: AppColors.glassFillStrong,
                    borderRadius: AppRadii.rPill,
                  ),
                ),
                if (title != null) ...<Widget>[
                  verticalSpace(16),
                  if (overline != null)
                    BaseText(
                      overline!,
                      fontSize: 10,
                      textStyle: AppTypography.overline,
                      textColor: AppColors.ember,
                    ),
                  verticalSpace(4),
                  BaseText(
                    title!,
                    fontSize: 20,
                    textStyle: AppTypography.titleMedium,
                  ),
                ],
                Flexible(
                  child: Padding(
                    padding: EdgeInsets.only(
                      top: getSize(18),
                      bottom:
                          MediaQuery.paddingOf(context).bottom + getSize(20),
                      left: getSize(20),
                      right: getSize(20),
                    ),
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: child,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// Confirmation used before anything irreversible. The brief requires the
/// consequence to be stated, not implied.
Future<bool> confirmDestructive({
  required BuildContext context,
  required String title,
  required String message,
  String confirmLabel = 'Delete',
  String cancelLabel = 'Keep it',
  List<String> consequences = const <String>[],
}) async {
  final bool? result = await showDialog<bool>(
    context: context,
    barrierColor: withCustomOpacity(AppColors.black, 0.62),
    builder: (BuildContext context) {
      return Center(
        child: Reveal(
          withScale: true,
          duration: AppMotion.normal,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: getSize(28)),
            child: ClipRRect(
              borderRadius: AppRadii.rXl,
              child: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: AppBlur.heavy,
                  sigmaY: AppBlur.heavy,
                ),
                child: Container(
                  padding: EdgeInsets.all(getSize(22)),
                  decoration: BoxDecoration(
                    gradient: AppGradients.glassPanelRaised,
                    borderRadius: AppRadii.rXl,
                    border: Border.all(color: AppColors.glassBorder),
                    boxShadow: AppShadows.raised,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Container(
                        width: getSize(48),
                        height: getSize(48),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: withCustomOpacity(AppColors.negative, 0.16),
                          border: Border.all(
                            color: withCustomOpacity(AppColors.negative, 0.4),
                          ),
                        ),
                        child: Icon(
                          Icons.priority_high_rounded,
                          color: AppColors.negative,
                          size: getFontSize(24),
                        ),
                      ),
                      verticalSpace(16),
                      BaseText(
                        title,
                        fontSize: 19,
                        textStyle: AppTypography.titleMedium,
                      ),
                      verticalSpace(8),
                      BaseText(
                        message,
                        fontSize: 13,
                        textColor: AppColors.mist,
                        height: 1.5,
                      ),
                      if (consequences.isNotEmpty) ...<Widget>[
                        verticalSpace(14),
                        ...consequences.map((String line) {
                          return Padding(
                            padding: EdgeInsets.only(bottom: getSize(6)),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.only(top: getSize(5)),
                                  child: Container(
                                    width: getSize(4),
                                    height: getSize(4),
                                    decoration: const BoxDecoration(
                                      color: AppColors.negative,
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                ),
                                horizontalSpace(8),
                                Expanded(
                                  child: BaseText(
                                    line,
                                    fontSize: 12,
                                    textColor: AppColors.muted,
                                  ),
                                ),
                              ],
                            ),
                          );
                        }),
                      ],
                      verticalSpace(20),
                      MiaButton(
                        label: confirmLabel,
                        variant: MiaButtonVariant.danger,
                        size: MiaButtonSize.medium,
                        onTap: () => Navigator.of(context).pop(true),
                      ),
                      verticalSpace(4),
                      Center(
                        child: MiaTextAction(
                          label: cancelLabel,
                          onTap: () => Navigator.of(context).pop(false),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    },
  );
  return result ?? false;
}

/// The live toast, so a new one replaces the old instead of stacking.
OverlayEntry? _activeToast;
VoidCallback? _dismissActiveToast;

/// Lightweight frosted toast used for undo affordances.
///
/// Rendered through the root [Overlay] rather than a [SnackBar]: a floating
/// snack bar is laid out by every registered [Scaffold], and the shell's Ask Mia
/// orb pushes it far up the screen. The overlay is pinned to the bottom above
/// the tab bar, which is where a confirmation belongs.
void showMiaToast(
  BuildContext context, {
  required String message,
  String? actionLabel,
  VoidCallback? onAction,
  IconData icon = Icons.check_circle_rounded,
  Color accent = AppColors.positive,
  double bottomOffset = 100,
  Duration duration = const Duration(seconds: 4),
}) {
  final OverlayState? overlay = Overlay.maybeOf(context, rootOverlay: true);
  if (overlay == null) {
    return;
  }

  _dismissActiveToast?.call();

  bool leaving = false;
  late final OverlayEntry entry;

  void dismiss() {
    if (_activeToast != entry || leaving) {
      return;
    }
    leaving = true;
    _activeToast = null;
    _dismissActiveToast = null;
    entry.markNeedsBuild();
    Future<void>.delayed(AppMotion.quick, () {
      entry.remove();
      entry.dispose();
    });
  }

  entry = OverlayEntry(
    builder: (BuildContext overlayContext) => MiaToastOverlay(
      message: message,
      icon: icon,
      accent: accent,
      actionLabel: actionLabel,
      bottomOffset: bottomOffset,
      leaving: leaving,
      onAction: onAction == null
          ? null
          : () {
              onAction();
              dismiss();
            },
    ),
  );

  _activeToast = entry;
  _dismissActiveToast = dismiss;
  overlay.insert(entry);
  Future<void>.delayed(duration, dismiss);
}

/// Bottom-pinned frosted confirmation strip shown by [showMiaToast].
class MiaToastOverlay extends StatelessWidget {
  const MiaToastOverlay({
    super.key,
    required this.message,
    required this.icon,
    required this.accent,
    required this.bottomOffset,
    required this.leaving,
    this.actionLabel,
    this.onAction,
  });

  final String message;
  final IconData icon;
  final Color accent;
  final double bottomOffset;
  final bool leaving;
  final String? actionLabel;
  final VoidCallback? onAction;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: getSize(20),
      right: getSize(20),
      bottom: MediaQuery.paddingOf(context).bottom + getSize(bottomOffset),
      child:
          Material(
                type: MaterialType.transparency,
                child: ClipRRect(
                  borderRadius: AppRadii.rMd,
                  child: BackdropFilter(
                    filter: ImageFilter.blur(
                      sigmaX: AppBlur.panel,
                      sigmaY: AppBlur.panel,
                    ),
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: getSize(16),
                        vertical: getSize(14),
                      ),
                      decoration: BoxDecoration(
                        gradient: AppGradients.glassPanelRaised,
                        borderRadius: AppRadii.rMd,
                        border: Border.all(color: AppColors.glassBorder),
                      ),
                      child: Row(
                        children: <Widget>[
                          Icon(icon, color: accent, size: getFontSize(18)),
                          horizontalSpace(10),
                          Expanded(
                            child: BaseText(
                              message,
                              fontSize: 13,
                              textColor: AppColors.frost,
                            ),
                          ),
                          if (actionLabel != null)
                            MiaTextAction(
                              label: actionLabel!,
                              onTap: onAction,
                              color: AppColors.ember,
                              fontSize: 13,
                            ),
                        ],
                      ),
                    ),
                  ),
                ),
              )
              .animate(target: leaving ? 0 : 1)
              .fadeIn(duration: AppMotion.quick, curve: AppMotion.enter)
              .slideY(
                begin: 0.4,
                end: 0,
                duration: AppMotion.normal,
                curve: AppMotion.enter,
              ),
    );
  }
}
