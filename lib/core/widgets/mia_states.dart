import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../theme/app_shapes.dart';
import '../theme/app_typography.dart';
import '../utils/color_utils.dart';
import '../utils/math_utils.dart';
import '../utils/spacing_utils.dart';
import 'base_text.dart';
import 'glass_panel.dart';
import 'mia_button.dart';
import 'reveal.dart';

/// The brief requires every surface to have a designed state for each of these.
/// They all render through one component so the language never drifts.
enum MiaStateKind {
  loading,
  skeleton,
  empty,
  caughtUp,
  queued,
  partialData,
  offline,
  timeout,
  permissionDenied,
  duplicate,
  staleData,
  reconnect,
  cancelled,
  failure,
  recovering,
}

class MiaStateSpec {
  const MiaStateSpec({
    required this.icon,
    required this.title,
    required this.message,
    required this.accent,
  });

  final IconData icon;
  final String title;
  final String message;
  final Color accent;
}

MiaStateSpec specFor(MiaStateKind kind) {
  switch (kind) {
    case MiaStateKind.loading:
      return const MiaStateSpec(
        icon: Icons.auto_awesome_rounded,
        title: 'Working on it',
        message: 'Mia is reading the latest evidence.',
        accent: AppColors.ember,
      );
    case MiaStateKind.skeleton:
      return const MiaStateSpec(
        icon: Icons.auto_awesome_rounded,
        title: 'Loading',
        message: 'Preparing your figures.',
        accent: AppColors.ember,
      );
    case MiaStateKind.empty:
      return const MiaStateSpec(
        icon: Icons.inbox_rounded,
        title: 'Nothing here yet',
        message: 'Once evidence arrives this list fills itself in.',
        accent: AppColors.glacier,
      );
    case MiaStateKind.caughtUp:
      return const MiaStateSpec(
        icon: Icons.check_circle_rounded,
        title: 'You are caught up',
        message:
            'Everything else is handled. Mia will speak up when it matters.',
        accent: AppColors.positive,
      );
    case MiaStateKind.queued:
      return const MiaStateSpec(
        icon: Icons.hourglass_top_rounded,
        title: 'Queued',
        message: 'This is waiting its turn in the processing queue.',
        accent: AppColors.caution,
      );
    case MiaStateKind.partialData:
      return const MiaStateSpec(
        icon: Icons.donut_large_rounded,
        title: 'Partial data',
        message: 'Some periods are still loading, so figures may move.',
        accent: AppColors.caution,
      );
    case MiaStateKind.offline:
      return const MiaStateSpec(
        icon: Icons.wifi_off_rounded,
        title: 'You are offline',
        message: 'Showing the last figures Mia calculated on this device.',
        accent: AppColors.muted,
      );
    case MiaStateKind.timeout:
      return const MiaStateSpec(
        icon: Icons.timer_off_rounded,
        title: 'That took too long',
        message: 'Mia stopped waiting rather than show a half answer.',
        accent: AppColors.caution,
      );
    case MiaStateKind.permissionDenied:
      return const MiaStateSpec(
        icon: Icons.lock_rounded,
        title: 'Private to its owner',
        message: 'Household membership does not open someone else\'s records.',
        accent: AppColors.violetHaze,
      );
    case MiaStateKind.duplicate:
      return const MiaStateSpec(
        icon: Icons.copy_all_rounded,
        title: 'Looks like a duplicate',
        message: 'Mia found an existing record that matches this one.',
        accent: AppColors.caution,
      );
    case MiaStateKind.staleData:
      return const MiaStateSpec(
        icon: Icons.history_rounded,
        title: 'Data is stale',
        message:
            'The source has not refreshed recently. Figures are as-of the timestamp shown.',
        accent: AppColors.caution,
      );
    case MiaStateKind.reconnect:
      return const MiaStateSpec(
        icon: Icons.link_off_rounded,
        title: 'Reconnect needed',
        message: 'Consent lapsed. Reconnect to resume collecting evidence.',
        accent: AppColors.negative,
      );
    case MiaStateKind.cancelled:
      return const MiaStateSpec(
        icon: Icons.do_not_disturb_on_rounded,
        title: 'Cancelled',
        message: 'Nothing was changed.',
        accent: AppColors.muted,
      );
    case MiaStateKind.failure:
      return const MiaStateSpec(
        icon: Icons.error_outline_rounded,
        title: 'Something broke',
        message: 'Mia kept your data untouched. Try again when you are ready.',
        accent: AppColors.negative,
      );
    case MiaStateKind.recovering:
      return const MiaStateSpec(
        icon: Icons.restart_alt_rounded,
        title: 'Recovering',
        message: 'Picking up exactly where processing stopped.',
        accent: AppColors.glacier,
      );
  }
}

class MiaStateView extends StatelessWidget {
  const MiaStateView({
    super.key,
    required this.kind,
    this.title,
    this.message,
    this.actionLabel,
    this.onAction,
    this.secondaryLabel,
    this.onSecondary,
    this.compact = false,
  });

  final MiaStateKind kind;
  final String? title;
  final String? message;
  final String? actionLabel;
  final VoidCallback? onAction;
  final String? secondaryLabel;
  final VoidCallback? onSecondary;
  final bool compact;

  @override
  Widget build(BuildContext context) {
    final MiaStateSpec spec = specFor(kind);

    return Reveal(
      withScale: true,
      child: GlassPanel(
        tone: GlassTone.soft,
        padding: EdgeInsets.symmetric(
          horizontal: getSize(22),
          vertical: getSize(compact ? 22 : 34),
        ),
        child: Column(
          children: <Widget>[
            Floating(
              amplitude: 4,
              child: Container(
                width: getSize(compact ? 48 : 62),
                height: getSize(compact ? 48 : 62),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: withCustomOpacity(spec.accent, 0.14),
                  border: Border.all(
                    color: withCustomOpacity(spec.accent, 0.36),
                  ),
                  boxShadow: AppShadows.glow(spec.accent, strength: 0.5),
                ),
                child: Icon(
                  spec.icon,
                  color: spec.accent,
                  size: getFontSize(compact ? 22 : 28),
                ),
              ),
            ),
            verticalSpace(compact ? 14 : 20),
            BaseText(
              title ?? spec.title,
              fontSize: compact ? 16 : 20,
              textStyle: AppTypography.titleMedium,
              textAlign: TextAlign.center,
            ),
            verticalSpace(8),
            BaseText(
              message ?? spec.message,
              fontSize: 13,
              textAlign: TextAlign.center,
              textColor: AppColors.muted,
              height: 1.5,
            ),
            if (actionLabel != null) ...<Widget>[
              verticalSpace(20),
              MiaButton(
                label: actionLabel!,
                onTap: onAction,
                size: MiaButtonSize.medium,
                expanded: false,
              ),
            ],
            if (secondaryLabel != null) ...<Widget>[
              verticalSpace(6),
              MiaTextAction(label: secondaryLabel!, onTap: onSecondary),
            ],
          ],
        ),
      ),
    );
  }
}

/// Shimmering placeholder block. Skeletons mirror the shape of the content they
/// replace so the layout never jumps on load.
class SkeletonBlock extends StatelessWidget {
  const SkeletonBlock({
    super.key,
    this.width,
    this.height = 16,
    this.radius,
    this.margin,
  });

  final double? width;
  final double height;
  final double? radius;
  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    return Shimmering(
      child: Container(
        width: width,
        height: getSize(height),
        margin: margin,
        decoration: BoxDecoration(
          color: AppColors.glassFill,
          borderRadius: BorderRadius.circular(radius ?? getSize(8)),
        ),
      ),
    );
  }
}

class SkeletonTileList extends StatelessWidget {
  const SkeletonTileList({super.key, this.count = 4, this.tileHeight = 74});

  final int count;
  final double tileHeight;

  @override
  Widget build(BuildContext context) {
    // A list, not a Column: the skeleton is often dropped into whatever space
    // is left over, and it must give way quietly rather than overflow while
    // the real content is still loading.
    return ListView(
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      children: List<Widget>.generate(count, (int i) {
        return Padding(
          padding: EdgeInsets.only(bottom: getSize(10)),
          child: Reveal(
            index: i,
            child: SkeletonBlock(height: tileHeight, radius: getSize(22)),
          ),
        );
      }),
    );
  }
}

/// Inline strip used above lists when the underlying source is not fully
/// trustworthy yet (stale, partial, offline).
class MiaNoticeStrip extends StatelessWidget {
  const MiaNoticeStrip({
    super.key,
    required this.message,
    this.icon = Icons.info_outline_rounded,
    this.accent = AppColors.caution,
    this.actionLabel,
    this.onAction,
  });

  final String message;
  final IconData icon;
  final Color accent;
  final String? actionLabel;
  final VoidCallback? onAction;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: getSize(14),
        vertical: getSize(12),
      ),
      decoration: BoxDecoration(
        color: withCustomOpacity(accent, 0.10),
        borderRadius: AppRadii.rMd,
        border: Border.all(color: withCustomOpacity(accent, 0.28)),
      ),
      child: Row(
        children: <Widget>[
          Icon(icon, size: getFontSize(16), color: accent),
          horizontalSpace(10),
          Expanded(
            child: BaseText(
              message,
              fontSize: 12,
              textColor: AppColors.mist,
              height: 1.4,
            ),
          ),
          if (actionLabel != null) ...<Widget>[
            horizontalSpace(8),
            MiaTextAction(
              label: actionLabel!,
              onTap: onAction,
              color: accent,
              fontSize: 12,
            ),
          ],
        ],
      ),
    );
  }
}
