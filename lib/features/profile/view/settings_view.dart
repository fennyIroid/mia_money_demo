import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/constants/app_constants.dart';
import '../../../core/di/injection.dart';
import '../../../core/router/app_router.gr.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/utils/currency_utils.dart';
import '../../../core/utils/date_utils.dart';
import '../../../core/utils/spacing_utils.dart';
import '../../../core/widgets/aurora_background.dart';
import '../../../core/widgets/mia_inputs.dart';
import '../../../core/widgets/mia_list_row.dart';
import '../../../core/widgets/mia_scaffold.dart';
import '../../../core/widgets/mia_sheet.dart';
import '../../../core/widgets/mia_states.dart';
import '../../../core/widgets/reveal.dart';
import '../../../data/models/user_models.dart';
import '../bloc/profile_bloc.dart';

@RoutePage()
class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProfileBloc>(
      create: (BuildContext context) =>
          getIt<ProfileBloc>()..add(const ProfileEvent.load()),
      child: const SettingsScaffold(),
    );
  }
}

class SettingsScaffold extends StatelessWidget {
  const SettingsScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (BuildContext context, ProfileState state) {
        final ProfileBloc bloc = context.read<ProfileBloc>();
        final UserPreferences prefs =
            state.preferences ?? const UserPreferences();

        return MiaScaffold(
          title: 'Settings',
          overline: 'Account, security and privacy',
          mood: AuroraMood.calm,
          child: !state.isReady
              ? const SkeletonTileList(count: 6, tileHeight: 80)
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Reveal(
                      child: MiaGroupedCard(
                        title: 'Subscription',
                        children: <Widget>[
                          MiaSettingsRow(
                            title:
                                '${state.subscription?.plan.title ?? 'Household'} · ${state.subscription?.plan.term == PlanTerm.annual ? 'annual' : 'monthly'}',
                            subtitle:
                                'Renews ${state.subscription == null ? '' : formatFullDate(state.subscription!.renewsOn)} · ${formatCurrency(state.subscription?.plan.priceAud ?? 0)}',
                            icon: Icons.workspace_premium_rounded,
                            accent: AppColors.ember,
                            onTap: () =>
                                context.router.push(const PaywallRoute()),
                          ),
                          MiaSettingsRow(
                            title: 'Server-validated entitlement',
                            value: state.subscription?.serverValidated == true
                                ? 'Verified'
                                : 'Pending',
                            icon: Icons.verified_user_rounded,
                          ),
                          MiaSettingsRow(
                            title: 'Restore purchase',
                            subtitle:
                                'Checks the entitlement with the server, not the device',
                            icon: Icons.restore_rounded,
                            onTap: () {
                              bloc.add(const ProfileEvent.load());
                              showMiaToast(
                                context,
                                message:
                                    state.subscription?.serverValidated == true
                                    ? 'Your ${state.subscription!.plan.title} plan is active and server validated.'
                                    : 'No active entitlement was found for this account.',
                                icon: Icons.restore_rounded,
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                    verticalSpace(14),
                    Reveal(
                      index: 1,
                      child: MiaGroupedCard(
                        title: 'Security',
                        footnote:
                            'Sensitive changes ask you to verify again before they apply.',
                        children: <Widget>[
                          MiaSwitchRow(
                            title: 'Biometric unlock',
                            description:
                                'Face ID or fingerprint on this device',
                            value: state.user?.biometricEnabled ?? true,
                            icon: Icons.fingerprint_rounded,
                            onChanged: (bool _) {},
                          ),
                          MiaSwitchRow(
                            title: 'Multi-factor authentication',
                            description:
                                'Recommended while banking evidence is connected',
                            value: state.user?.mfaEnabled ?? false,
                            icon: Icons.shield_rounded,
                            onChanged: (bool _) {},
                          ),
                          MiaSettingsRow(
                            title: 'Devices & sessions',
                            subtitle:
                                '${state.sessions.length} active${state.hasSuspiciousSession ? ' · 1 unusual' : ''}',
                            icon: Icons.devices_rounded,
                            accent: state.hasSuspiciousSession
                                ? AppColors.negative
                                : AppColors.glacier,
                            onTap: () => showMiaSheet<void>(
                              context: context,
                              title: 'Devices & sessions',
                              child: Column(
                                children: <Widget>[
                                  ...state.sessions.map(
                                    (DeviceSession session) => MiaSettingsRow(
                                      title: session.deviceName,
                                      subtitle:
                                          '${session.platform} · ${session.location} · ${relativeLabel(session.lastActive)}',
                                      icon: session.isCurrent
                                          ? Icons.smartphone_rounded
                                          : Icons.devices_other_rounded,
                                      accent: session.isSuspicious
                                          ? AppColors.negative
                                          : AppColors.glacier,
                                      value: session.isCurrent
                                          ? 'This device'
                                          : null,
                                      onTap: session.isCurrent
                                          ? null
                                          : () => bloc.add(
                                              ProfileEvent.sessionRevoked(
                                                session.id,
                                              ),
                                            ),
                                    ),
                                  ),
                                  MiaSettingsRow(
                                    title: 'Sign out everywhere',
                                    icon: Icons.logout_rounded,
                                    isDestructive: true,
                                    onTap: () {
                                      bloc.add(
                                        const ProfileEvent.signOutEverywhere(),
                                      );
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    verticalSpace(14),
                    Reveal(
                      index: 2,
                      child: MiaGroupedCard(
                        title: 'Preferences',
                        children: <Widget>[
                          MiaSettingsRow(
                            title: 'Currency',
                            value: prefs.currency,
                            icon: Icons.payments_rounded,
                          ),
                          MiaSettingsRow(
                            title: 'Timezone',
                            value: prefs.timezone,
                            icon: Icons.public_rounded,
                          ),
                          MiaSettingsRow(
                            title: 'Financial year',
                            value: financialYearLabel(DateTime.now()),
                            icon: Icons.calendar_month_rounded,
                          ),
                          MiaSettingsRow(
                            title: 'Pay cycle',
                            value: prefs.payFrequency.label,
                            icon: Icons.event_repeat_rounded,
                          ),
                          MiaSettingsRow(
                            title: 'Review cadence',
                            value: prefs.reviewCadence.label,
                            icon: Icons.restart_alt_rounded,
                          ),
                        ],
                      ),
                    ),
                    verticalSpace(14),
                    Reveal(
                      index: 3,
                      child: MiaGroupedCard(
                        title: 'Accessibility',
                        children: <Widget>[
                          MiaSwitchRow(
                            title: 'Reduced motion',
                            description:
                                'Stops the aurora and ambient animation loops',
                            value: prefs.reducedMotion,
                            icon: Icons.motion_photos_off_rounded,
                            onChanged: (bool value) => bloc.add(
                              ProfileEvent.preferencesChanged(
                                prefs.copyWith(reducedMotion: value),
                              ),
                            ),
                          ),
                          MiaSwitchRow(
                            title: 'Larger text',
                            value: prefs.largerText,
                            icon: Icons.format_size_rounded,
                            onChanged: (bool value) => bloc.add(
                              ProfileEvent.preferencesChanged(
                                prefs.copyWith(largerText: value),
                              ),
                            ),
                          ),
                          MiaSwitchRow(
                            title: 'Always show status words',
                            description:
                                'Status is never carried by colour alone',
                            value: prefs.alwaysShowStatusWords,
                            icon: Icons.abc_rounded,
                            onChanged: (bool value) => bloc.add(
                              ProfileEvent.preferencesChanged(
                                prefs.copyWith(alwaysShowStatusWords: value),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    verticalSpace(14),
                    Reveal(
                      index: 4,
                      child: MiaGroupedCard(
                        title: 'Privacy & consent',
                        footnote:
                            'Customer financial data is stored in ${AppConstants.dataResidency}. Any offshore AI or document processing is disclosed here before it happens.',
                        children: <Widget>[
                          ...state.consents.map(
                            (ConsentToggle consent) => MiaSwitchRow(
                              title: consent.title,
                              description: consent.description,
                              value: consent.granted,
                              enabled: !consent.required_,
                              icon: Icons.privacy_tip_rounded,
                              onChanged: (bool _) {},
                            ),
                          ),
                        ],
                      ),
                    ),
                    verticalSpace(14),
                    Reveal(
                      index: 5,
                      child: MiaGroupedCard(
                        title: 'Diagnostics',
                        children: <Widget>[
                          MiaSettingsRow(
                            title: 'Calculation version',
                            value: AppConstants.calculationEngineVersion,
                            icon: Icons.functions_rounded,
                          ),
                          MiaSettingsRow(
                            title: 'Taxonomy mapping',
                            value: AppConstants.taxonomyMappingVersion,
                            icon: Icons.account_tree_rounded,
                          ),
                          MiaSettingsRow(
                            title: 'AI version',
                            value: AppConstants.aiModelVersion,
                            icon: Icons.auto_awesome_rounded,
                          ),
                        ],
                      ),
                    ),
                    verticalSpace(14),
                    Reveal(
                      index: 6,
                      child: MiaGroupedCard(
                        title: 'Data',
                        children: <Widget>[
                          MiaSettingsRow(
                            title: 'Export or delete my data',
                            icon: Icons.download_rounded,
                            onTap: () =>
                                context.router.push(const DataControlsRoute()),
                          ),
                          MiaSettingsRow(
                            title: 'Sign out',
                            icon: Icons.logout_rounded,
                            isDestructive: true,
                            onTap: () => context.router.replaceAll(
                              <PageRouteInfo<dynamic>>[const SignInRoute()],
                            ),
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
