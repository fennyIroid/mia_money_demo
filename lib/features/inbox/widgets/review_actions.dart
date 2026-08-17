import 'package:flutter/material.dart';

import '../../../core/di/injection.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/utils/date_utils.dart';
import '../../../core/utils/spacing_utils.dart';
import '../../../core/widgets/base_text.dart';
import '../../../core/widgets/mia_list_row.dart';
import '../../../core/widgets/mia_sheet.dart';
import '../../../core/widgets/mia_states.dart';
import '../../../data/models/admin_models.dart';
import '../../../data/models/user_models.dart';
import '../../../data/repositories/admin_repository.dart';
import '../../../data/repositories/user_repository.dart';

/// The secondary actions a review item carries beyond approve and reject.
enum ReviewAction { assign, ask, defer, dismiss }

/// Contents of the "More actions" sheet. Each row pops the sheet with the
/// action it stands for, so the caller owns the follow-up flow and the sheet
/// itself stays free of navigation logic.
class ReviewMoreActionsSheet extends StatelessWidget {
  const ReviewMoreActionsSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        MiaSettingsRow(
          title: 'Assign to a household member',
          subtitle: 'They own the decision, you keep the visibility',
          icon: Icons.person_add_rounded,
          onTap: () => Navigator.of(context).pop(ReviewAction.assign),
        ),
        MiaSettingsRow(
          title: 'Ask someone about this',
          subtitle: 'Shares only this item, never the account',
          icon: Icons.forum_rounded,
          onTap: () => Navigator.of(context).pop(ReviewAction.ask),
        ),
        MiaSettingsRow(
          title: 'Defer for 7 days',
          subtitle: 'It returns to your inbox, nothing is decided',
          icon: Icons.snooze_rounded,
          onTap: () => Navigator.of(context).pop(ReviewAction.defer),
        ),
        MiaSettingsRow(
          title: 'Dismiss',
          subtitle: 'The item leaves your inbox, the record stays',
          icon: Icons.close_rounded,
          isDestructive: true,
          onTap: () => Navigator.of(context).pop(ReviewAction.dismiss),
        ),
      ],
    );
  }
}

/// Household picker used by both the assign and the ask flows. Members load
/// from the repository, so the sheet carries its own skeleton state.
class ReviewMemberPickerSheet extends StatelessWidget {
  const ReviewMemberPickerSheet({super.key, required this.footnote});

  final String footnote;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<HouseholdMember>>(
      future: getIt<HouseholdRepository>().fetchMembers(),
      builder:
          (
            BuildContext context,
            AsyncSnapshot<List<HouseholdMember>> snapshot,
          ) {
            final List<HouseholdMember>? members = snapshot.data;
            if (members == null) {
              return const SkeletonTileList(count: 3, tileHeight: 58);
            }

            final List<HouseholdMember> selectable = members
                .where((HouseholdMember m) => !m.isYou && !m.pendingInvite)
                .toList();

            if (selectable.isEmpty) {
              return const MiaStateView(
                kind: MiaStateKind.empty,
                compact: true,
                title: 'No one else to hand this to',
                message:
                    'Invite a household member first. Nothing is shared until you choose them.',
              );
            }

            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                ...selectable.map(
                  (HouseholdMember member) => MiaSettingsRow(
                    title: member.name,
                    subtitle: member.role.label,
                    icon: Icons.person_rounded,
                    onTap: () => Navigator.of(context).pop(member),
                  ),
                ),
                verticalSpace(10),
                BaseText(
                  footnote,
                  fontSize: 12,
                  textColor: AppColors.muted,
                  maxLines: 3,
                ),
              ],
            );
          },
    );
  }
}

/// Opens the more-actions sheet and runs whichever flow the user picked. Each
/// branch writes through the repository before it confirms anything, so the
/// item's stage, owner and audit trail really do change.
Future<void> showReviewMoreActions(
  BuildContext context,
  ReviewItem item, {
  required VoidCallback onLeaveScreen,
  VoidCallback? onChanged,
}) async {
  final ReviewRepository repository = getIt<ReviewRepository>();

  final ReviewAction? action = await showMiaSheet<ReviewAction>(
    context: context,
    title: 'More actions',
    overline: item.kind.label,
    child: const ReviewMoreActionsSheet(),
  );
  if (!context.mounted || action == null) {
    return;
  }

  switch (action) {
    case ReviewAction.assign:
      final HouseholdMember? member = await _pickMember(
        context,
        title: 'Assign to',
        footnote:
            'They see this item and its evidence. Your other records stay private.',
      );
      if (!context.mounted || member == null) {
        return;
      }
      await repository.assign(item.id, member.name);
      onChanged?.call();
      if (!context.mounted) return;
      showMiaToast(
        context,
        message: '${item.title} is now ${member.name}\'s to decide.',
        icon: Icons.person_add_rounded,
      );
      onLeaveScreen();
    case ReviewAction.ask:
      final HouseholdMember? member = await _pickMember(
        context,
        title: 'Ask someone',
        footnote: 'Shares only this item, never the account behind it.',
      );
      if (!context.mounted || member == null) {
        return;
      }
      await repository.comment(
        item.id,
        'Asked ${member.name} about this item.',
      );
      onChanged?.call();
      if (!context.mounted) return;
      showMiaToast(
        context,
        message: 'Asked ${member.name}. Only this item was shared.',
        icon: Icons.forum_rounded,
        accent: AppColors.glacier,
      );
    case ReviewAction.defer:
      final DateTime returnsOn = DateTime.now().add(const Duration(days: 7));
      await repository.defer(item.id, returnsOn);
      onChanged?.call();
      if (!context.mounted) return;
      showMiaToast(
        context,
        message: 'Deferred. It returns ${formatDayMonth(returnsOn)}.',
        icon: Icons.snooze_rounded,
        accent: AppColors.caution,
      );
      onLeaveScreen();
    case ReviewAction.dismiss:
      final bool confirmed = await confirmDestructive(
        context: context,
        title: 'Dismiss this item?',
        message:
            'It leaves your inbox without a decision being recorded against it.',
        confirmLabel: 'Dismiss',
        consequences: <String>[
          'The transaction and its evidence are untouched',
          'No figure is recalculated',
          'An audit record is kept',
        ],
      );
      if (!context.mounted || !confirmed) {
        return;
      }
      await repository.dismiss(item.id);
      onChanged?.call();
      if (!context.mounted) return;
      showMiaToast(
        context,
        message: 'Dismissed. Nothing was changed underneath it.',
        icon: Icons.close_rounded,
        accent: AppColors.caution,
      );
      onLeaveScreen();
  }
}

Future<HouseholdMember?> _pickMember(
  BuildContext context, {
  required String title,
  required String footnote,
}) {
  return showMiaSheet<HouseholdMember>(
    context: context,
    title: title,
    child: ReviewMemberPickerSheet(footnote: footnote),
  );
}
