import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/di/injection.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_typography.dart';
import '../../../core/utils/date_utils.dart';
import '../../../core/utils/math_utils.dart';
import '../../../core/utils/spacing_utils.dart';
import '../../../core/widgets/aurora_background.dart';
import '../../../core/widgets/base_text.dart';
import '../../../core/widgets/glass_panel.dart';
import '../../../core/widgets/mia_avatar.dart';
import '../../../core/widgets/mia_button.dart';
import '../../../core/widgets/mia_inputs.dart';
import '../../../core/widgets/mia_list_row.dart';
import '../../../core/widgets/mia_scaffold.dart';
import '../../../core/widgets/mia_sheet.dart';
import '../../../core/widgets/mia_states.dart';
import '../../../core/widgets/reveal.dart';
import '../../../core/widgets/status_pill.dart';
import '../../../data/models/user_models.dart';
import '../bloc/profile_bloc.dart';

@RoutePage()
class HouseholdView extends StatelessWidget {
  const HouseholdView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProfileBloc>(
      create: (BuildContext context) =>
          getIt<ProfileBloc>()..add(const ProfileEvent.load()),
      child: const HouseholdScaffold(),
    );
  }
}

class HouseholdScaffold extends StatelessWidget {
  const HouseholdScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (BuildContext context, ProfileState state) {
        final ProfileBloc bloc = context.read<ProfileBloc>();

        return MiaScaffold(
          title: 'Household',
          overline: 'Private by default',
          mood: AuroraMood.calm,
          bottomBar: MiaBottomBar(
            child: MiaButton(
              label: 'Invite a member',
              leadingIcon: Icons.person_add_rounded,
              onTap: () async {
                final HouseholdInvite? invite =
                    await showMiaSheet<HouseholdInvite>(
                      context: context,
                      title: 'Invite a member',
                      overline: 'They keep their own login and consents',
                      child: const InviteMemberSheet(),
                    );
                if (invite == null || !context.mounted) return;

                bloc.add(
                  ProfileEvent.memberInvited(
                    email: invite.email,
                    role: invite.role,
                  ),
                );
                showMiaToast(
                  context,
                  message:
                      '${invite.email} invited as ${invite.role.label.toLowerCase()}. The invite shows as pending until they accept.',
                  icon: Icons.person_add_rounded,
                );
              },
            ),
          ),
          child: !state.isReady
              ? const SkeletonTileList(count: 4, tileHeight: 110)
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Reveal(
                      child: MiaNoticeStrip(
                        message:
                            'Membership grants nothing on its own. Each record stays private until its owner shares it.',
                        icon: Icons.lock_rounded,
                        accent: AppColors.violetHaze,
                      ),
                    ),
                    verticalSpace(16),
                    ...List<Widget>.generate(state.members.length, (int i) {
                      final HouseholdMember member = state.members[i];
                      return Padding(
                        padding: EdgeInsets.only(bottom: getSize(10)),
                        child: Reveal(
                          index: i,
                          child: MemberCard(
                            member: member,
                            onRemove: () async {
                              final bool confirmed = await confirmDestructive(
                                context: context,
                                title: 'Remove ${member.name}?',
                                message:
                                    'Their access ends immediately and their sessions are invalidated.',
                                confirmLabel: 'Remove',
                                consequences: <String>[
                                  'Shared records they own stop being visible to the household',
                                  'Their own CDR consents are unaffected',
                                  'An audit record is kept',
                                ],
                              );
                              if (confirmed) {
                                bloc.add(ProfileEvent.memberRemoved(member.id));
                              }
                            },
                          ),
                        ),
                      );
                    }),
                    verticalSpace(16),
                    Reveal(
                      index: 5,
                      child: GlassPanel(
                        tone: GlassTone.soft,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            BaseText(
                              'How permissions work here',
                              fontSize: 10,
                              textStyle: AppTypography.overline,
                            ),
                            verticalSpace(8),
                            const EvidenceRow(
                              label: 'CDR consent',
                              value: 'Belongs to whoever gave it',
                            ),
                            const EvidenceRow(
                              label: 'Household owner',
                              value: 'Manages membership and billing only',
                            ),
                            const EvidenceRow(
                              label: 'Totals',
                              value: 'Never reveal a private record indirectly',
                            ),
                            const EvidenceRow(
                              label: 'Search, exports, Ask Mia',
                              value: 'Same server-side permissions',
                            ),
                            const EvidenceRow(
                              label: 'Removing sharing',
                              value: 'Does not cancel that person\'s consent',
                            ),
                          ],
                        ),
                      ),
                    ),
                    verticalSpace(14),
                    Reveal(
                      index: 6,
                      child: MiaGroupedCard(
                        title: 'Household actions',
                        children: <Widget>[
                          MiaSettingsRow(
                            title: 'Transfer ownership',
                            subtitle:
                                'The new owner manages membership and billing',
                            icon: Icons.swap_horiz_rounded,
                            onTap: () async {
                              final HouseholdMember?
                              member = await showMiaSheet<HouseholdMember>(
                                context: context,
                                title: 'Transfer ownership to',
                                overline: 'Ownership covers membership only',
                                child: OwnerPickerSheet(members: state.members),
                              );
                              if (member == null || !context.mounted) return;
                              bloc.add(
                                ProfileEvent.ownershipTransferred(member.id),
                              );
                              showMiaToast(
                                context,
                                message:
                                    '${member.name} is now the household owner.',
                                icon: Icons.swap_horiz_rounded,
                              );
                            },
                          ),
                          MiaSettingsRow(
                            title: 'Leave household',
                            icon: Icons.logout_rounded,
                            onTap: () async {
                              final bool confirmed = await confirmDestructive(
                                context: context,
                                title: 'Leave this household?',
                                message:
                                    'You stop seeing shared records. Your own records and consents are unaffected.',
                                confirmLabel: 'Leave',
                                consequences: <String>[
                                  'Records you shared stop being visible to others',
                                  'Your own connections stay exactly as they are',
                                ],
                              );
                              if (!confirmed || !context.mounted) return;
                              bloc.add(const ProfileEvent.householdLeft());
                              showMiaToast(
                                context,
                                message:
                                    'You left the household. Your own records are untouched.',
                                icon: Icons.logout_rounded,
                                accent: AppColors.caution,
                              );
                            },
                          ),
                          MiaSettingsRow(
                            title: 'Delete household',
                            subtitle:
                                'Members keep their own records and consents',
                            icon: Icons.delete_forever_rounded,
                            isDestructive: true,
                            onTap: () async {
                              final bool confirmed = await confirmDestructive(
                                context: context,
                                title: 'Delete the household?',
                                message:
                                    'Everyone is removed from it. Each person keeps their own records, connections and consents.',
                                confirmLabel: 'Delete household',
                                consequences: <String>[
                                  'Shared visibility ends for every member',
                                  'No personal record is deleted',
                                  'An audit record is kept',
                                ],
                              );
                              if (!confirmed || !context.mounted) return;
                              bloc.add(const ProfileEvent.householdDeleted());
                              showMiaToast(
                                context,
                                message:
                                    'Household deleted. Everyone keeps their own records.',
                                icon: Icons.delete_forever_rounded,
                                accent: AppColors.negative,
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
        );
      },
    );
  }
}

class MemberCard extends StatelessWidget {
  const MemberCard({super.key, required this.member, required this.onRemove});

  final HouseholdMember member;
  final VoidCallback onRemove;

  @override
  Widget build(BuildContext context) {
    return GlassPanel(
      tone: GlassTone.soft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              MiaAvatar(name: member.name, size: 44),
              horizontalSpace(12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Flexible(
                          child: BaseText(
                            member.name,
                            fontSize: 15,
                            textStyle: AppTypography.titleSmall,
                            maxLines: 1,
                          ),
                        ),
                        if (member.isYou) ...<Widget>[
                          horizontalSpace(6),
                          const StatusPill(
                            label: 'You',
                            color: AppColors.ember,
                            dense: true,
                          ),
                        ],
                      ],
                    ),
                    verticalSpace(3),
                    BaseText(
                      member.email,
                      fontSize: 11.5,
                      textColor: AppColors.muted,
                    ),
                  ],
                ),
              ),
              if (!member.isYou)
                MiaTextAction(
                  label: 'Remove',
                  onTap: onRemove,
                  color: AppColors.negative,
                  fontSize: 12,
                ),
            ],
          ),
          verticalSpace(10),
          Wrap(
            spacing: getSize(6),
            runSpacing: getSize(6),
            children: <Widget>[
              StatusPill(
                label: member.role.label,
                color: member.role.color,
                dense: true,
              ),
              if (member.pendingInvite)
                const StatusPill(
                  label: 'Invite pending',
                  color: AppColors.caution,
                  icon: Icons.mail_rounded,
                  dense: true,
                ),
              StatusPill(
                label: '${member.connectedSources} sources',
                color: AppColors.glacier,
                icon: Icons.link_rounded,
                dense: true,
              ),
              StatusPill(
                label: '${member.openReviews} open reviews',
                color: AppColors.lagoon,
                icon: Icons.rate_review_rounded,
                dense: true,
              ),
              StatusPill(
                label: 'joined ${relativeLabel(member.joinedOn)}',
                color: AppColors.muted,
                dense: true,
              ),
            ],
          ),
          if (member.sharesWithYou.isNotEmpty) ...<Widget>[
            verticalSpace(10),
            BaseText(
              'Shares with you: ${member.sharesWithYou.join(', ')}',
              fontSize: 11.5,
              textColor: AppColors.faint,
              height: 1.4,
            ),
          ],
        ],
      ),
    );
  }
}

/// Who to invite and what they are allowed to see.
class HouseholdInvite {
  const HouseholdInvite({required this.email, required this.role});

  final String email;
  final HouseholdRole role;
}

class InviteMemberSheet extends StatelessWidget {
  const InviteMemberSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final List<HouseholdRole> roles = HouseholdRole.values
        .where((HouseholdRole r) => r != HouseholdRole.owner)
        .toList();
    final ValueNotifier<HouseholdRole> role = ValueNotifier<HouseholdRole>(
      roles.first,
    );
    String email = '';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        MiaFormField(
          label: 'Their email',
          hint: 'name@example.com.au',
          autofocus: true,
          keyboardType: TextInputType.emailAddress,
          textCapitalization: TextCapitalization.none,
          prefixIcon: Icons.alternate_email_rounded,
          onChanged: (String value) => email = value,
        ),
        verticalSpace(16),
        ValueListenableBuilder<HouseholdRole>(
          valueListenable: role,
          builder: (BuildContext context, HouseholdRole selected, Widget? _) {
            return Column(
              children: roles
                  .map(
                    (HouseholdRole r) => Padding(
                      padding: EdgeInsets.only(bottom: getSize(8)),
                      child: MiaChoiceCard(
                        title: r.label,
                        description: r.description,
                        icon: Icons.person_rounded,
                        accent: r.color,
                        selected: r == selected,
                        onTap: () => role.value = r,
                      ),
                    ),
                  )
                  .toList(),
            );
          },
        ),
        verticalSpace(8),
        MiaButton(
          label: 'Send the invite',
          leadingIcon: Icons.send_rounded,
          onTap: () {
            final String trimmed = email.trim();
            if (!trimmed.contains('@')) return;
            Navigator.of(
              context,
            ).pop(HouseholdInvite(email: trimmed, role: role.value));
          },
        ),
      ],
    );
  }
}

/// Members ownership can be handed to. You cannot hand it to yourself.
class OwnerPickerSheet extends StatelessWidget {
  const OwnerPickerSheet({super.key, required this.members});

  final List<HouseholdMember> members;

  @override
  Widget build(BuildContext context) {
    final List<HouseholdMember> selectable = members
        .where((HouseholdMember m) => !m.isYou && !m.pendingInvite)
        .toList();

    if (selectable.isEmpty) {
      return const MiaStateView(
        kind: MiaStateKind.empty,
        compact: true,
        title: 'No one to hand it to',
        message: 'Invite a member and wait for them to accept first.',
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: selectable
          .map(
            (HouseholdMember member) => MiaSettingsRow(
              title: member.name,
              subtitle: member.role.label,
              icon: Icons.person_rounded,
              onTap: () => Navigator.of(context).pop(member),
            ),
          )
          .toList(),
    );
  }
}
