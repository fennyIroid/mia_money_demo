import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/constants/app_constants.dart';
import '../../../core/di/injection.dart';
import '../../../core/router/app_router.gr.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_typography.dart';
import '../../../core/utils/math_utils.dart';
import '../../../core/utils/spacing_utils.dart';
import '../../../core/widgets/aurora_background.dart';
import '../../../core/widgets/base_text.dart';
import '../../../core/widgets/glass_panel.dart';
import '../../../core/widgets/mia_avatar.dart';
import '../../../core/widgets/mia_list_row.dart';
import '../../../core/widgets/reveal.dart';
import '../../../core/widgets/status_pill.dart';
import '../../profile/bloc/profile_bloc.dart';
import '../../../data/models/user_models.dart';

@RoutePage()
class MoreView extends StatelessWidget {
  const MoreView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProfileBloc>(
      create: (BuildContext context) =>
          getIt<ProfileBloc>()..add(const ProfileEvent.load()),
      child: const MoreScaffold(),
    );
  }
}

class MoreScaffold extends StatelessWidget {
  const MoreScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (BuildContext context, ProfileState state) {
        return Scaffold(
          backgroundColor: AppColors.ink,
          extendBody: true,
          body: AuroraBackground(
            mood: AuroraMood.calm,
            child: SafeArea(
              bottom: false,
              child: ListView(
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.only(
                  left: getSize(20),
                  right: getSize(20),
                  bottom: getSize(160),
                ),
                children: <Widget>[
                  verticalSpace(10),
                  Reveal(
                    child: GlassPanel(
                      tone: GlassTone.raised,
                      onTap: () => context.router.push(const SettingsRoute()),
                      child: Row(
                        children: <Widget>[
                          MiaAvatar(
                            name: state.user?.fullName ?? 'Amara Whitfield',
                            size: 52,
                            showRing: true,
                          ),
                          horizontalSpace(14),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                BaseText(
                                  state.user?.fullName ?? 'Amara Whitfield',
                                  fontSize: 18,
                                  textStyle: AppTypography.titleMedium,
                                  maxLines: 1,
                                ),
                                verticalSpace(4),
                                BaseText(
                                  state.user?.email ?? '',
                                  fontSize: 12,
                                  textColor: AppColors.muted,
                                  maxLines: 1,
                                ),
                                verticalSpace(8),
                                Row(
                                  children: <Widget>[
                                    Flexible(
                                      child: StatusPill(
                                        label:
                                            state.subscription?.plan.title ??
                                            'Household',
                                        color: AppColors.ember,
                                        icon: Icons.workspace_premium_rounded,
                                        dense: true,
                                      ),
                                    ),
                                    horizontalSpace(6),
                                    Flexible(
                                      child: StatusPill(
                                        label:
                                            state.user?.role.label ?? 'Owner',
                                        color: AppColors.violetHaze,
                                        dense: true,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Icon(
                            Icons.chevron_right_rounded,
                            color: AppColors.faint,
                            size: getFontSize(20),
                          ),
                        ],
                      ),
                    ),
                  ),
                  verticalSpace(18),
                  Reveal(
                    index: 1,
                    child: MiaGroupedCard(
                      title: 'People & sources',
                      children: <Widget>[
                        MiaSettingsRow(
                          title: 'Household',
                          subtitle:
                              '${state.activeMemberCount} members · ${state.pendingInviteCount} invited',
                          icon: Icons.groups_rounded,
                          accent: AppColors.positive,
                          onTap: () =>
                              context.router.push(const HouseholdRoute()),
                        ),
                        MiaSettingsRow(
                          title: 'Connections & consents',
                          subtitle: 'Banking, energy and bill email',
                          icon: Icons.link_rounded,
                          accent: AppColors.glacier,
                          onTap: () =>
                              context.router.push(const ConnectionsRoute()),
                        ),
                        MiaSettingsRow(
                          title: 'Documents',
                          subtitle:
                              'Statements, bills, policies and warranties',
                          icon: Icons.folder_rounded,
                          accent: AppColors.lagoon,
                          onTap: () =>
                              context.router.push(const DocumentsRoute()),
                        ),
                        MiaSettingsRow(
                          title: 'Receipts',
                          subtitle: 'Receipt-level extraction and matching',
                          icon: Icons.receipt_rounded,
                          accent: AppColors.amberGlow,
                          onTap: () =>
                              context.router.push(const ReceiptsRoute()),
                        ),
                        MiaSettingsRow(
                          title: 'Purchases & warranty vault',
                          subtitle: 'Serial numbers, cover and reminders',
                          icon: Icons.inventory_2_rounded,
                          accent: AppColors.violetHaze,
                          onTap: () => context.router.push(const VaultRoute()),
                        ),
                        MiaSettingsRow(
                          title: 'Imports',
                          subtitle: 'CSV, PDF statements and manual records',
                          icon: Icons.upload_file_rounded,
                          onTap: () =>
                              context.router.push(const ImportsRoute()),
                        ),
                      ],
                    ),
                  ),
                  verticalSpace(14),
                  Reveal(
                    index: 2,
                    child: MiaGroupedCard(
                      title: 'Intelligence',
                      children: <Widget>[
                        MiaSettingsRow(
                          title: 'Weekly financial reset',
                          subtitle: 'Two to five minutes, five cards',
                          icon: Icons.restart_alt_rounded,
                          accent: AppColors.ember,
                          onTap: () =>
                              context.router.push(const WeeklyResetRoute()),
                        ),
                        MiaSettingsRow(
                          title: 'Briefings',
                          subtitle:
                              'Weekly, monthly, bills, renewals, warranty',
                          icon: Icons.article_rounded,
                          accent: AppColors.glacier,
                          onTap: () =>
                              context.router.push(const BriefingsRoute()),
                        ),
                        MiaSettingsRow(
                          title: 'What changed',
                          subtitle: 'Movements against the prior period',
                          icon: Icons.swap_vert_rounded,
                          accent: AppColors.amberGlow,
                          onTap: () =>
                              context.router.push(const WhatChangedRoute()),
                        ),
                        MiaSettingsRow(
                          title: 'Mia handled this',
                          subtitle: 'Admin completed without you',
                          icon: Icons.done_all_rounded,
                          accent: AppColors.positive,
                          onTap: () =>
                              context.router.push(const MiaHandledRoute()),
                        ),
                      ],
                    ),
                  ),
                  verticalSpace(14),
                  Reveal(
                    index: 3,
                    child: MiaGroupedCard(
                      title: 'Account',
                      children: <Widget>[
                        MiaSettingsRow(
                          title: 'Settings & privacy',
                          subtitle: 'Security, sessions, preferences, consent',
                          icon: Icons.settings_rounded,
                          onTap: () =>
                              context.router.push(const SettingsRoute()),
                        ),
                        MiaSettingsRow(
                          title: 'Notifications',
                          subtitle: 'Channels, events and quiet hours',
                          icon: Icons.notifications_rounded,
                          accent: AppColors.caution,
                          onTap: () =>
                              context.router.push(const NotificationsRoute()),
                        ),
                        MiaSettingsRow(
                          title: 'Search everything',
                          subtitle: 'Permission-aware across the product',
                          icon: Icons.search_rounded,
                          accent: AppColors.lagoon,
                          onTap: () => context.router.push(const SearchRoute()),
                        ),
                        MiaSettingsRow(
                          title: 'Help & support',
                          subtitle: 'Articles, cases and diagnostics',
                          icon: Icons.help_rounded,
                          accent: AppColors.glacier,
                          onTap: () => context.router.push(const HelpRoute()),
                        ),
                        MiaSettingsRow(
                          title: 'Export or delete my data',
                          subtitle: 'Coverage stated, deletion proven',
                          icon: Icons.download_rounded,
                          accent: AppColors.violetHaze,
                          onTap: () =>
                              context.router.push(const DataControlsRoute()),
                        ),
                      ],
                    ),
                  ),
                  verticalSpace(20),
                  Reveal(
                    index: 4,
                    child: Center(
                      child: Column(
                        children: <Widget>[
                          BaseText(
                            'Mia Money 1.0.4 · ${AppConstants.calculationEngineVersion}',
                            fontSize: 10.5,
                            textColor: AppColors.faint,
                          ),
                          verticalSpace(4),
                          BaseText(
                            AppConstants.dataResidency,
                            fontSize: 10.5,
                            textColor: AppColors.faint,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
