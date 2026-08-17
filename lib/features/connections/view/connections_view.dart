import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/constants/app_constants.dart';
import '../../../core/di/injection.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_shapes.dart';
import '../../../core/theme/app_typography.dart';
import '../../../core/utils/color_utils.dart';
import '../../../core/utils/date_utils.dart';
import '../../../core/utils/math_utils.dart';
import '../../../core/utils/spacing_utils.dart';
import '../../../core/widgets/aurora_background.dart';
import '../../../core/widgets/base_text.dart';
import '../../../core/widgets/glass_panel.dart';
import '../../../core/widgets/mia_button.dart';
import '../../../core/widgets/mia_inputs.dart';
import '../../../core/widgets/mia_list_row.dart';
import '../../../core/widgets/mia_scaffold.dart';
import '../../../core/widgets/mia_sheet.dart';
import '../../../core/widgets/mia_states.dart';
import '../../../core/widgets/reveal.dart';
import '../../../core/widgets/section_header.dart';
import '../../../core/widgets/status_pill.dart';
import '../../../data/models/assistant_models.dart';
import '../../../data/models/core_models.dart';
import '../bloc/connections_bloc.dart';
import '../widgets/consent_history_sheet.dart';

@RoutePage()
class ConnectionsView extends StatelessWidget {
  const ConnectionsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ConnectionsBloc>(
      create: (BuildContext context) =>
          getIt<ConnectionsBloc>()..add(const ConnectionsEvent.load()),
      child: const ConnectionsScaffold(),
    );
  }
}

class ConnectionsScaffold extends StatelessWidget {
  const ConnectionsScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ConnectionsBloc, ConnectionsState>(
      builder: (BuildContext context, ConnectionsState state) {
        final ConnectionsBloc bloc = context.read<ConnectionsBloc>();

        return MiaScaffold(
          title: 'Connections',
          overline: 'Consent dashboard',
          mood: AuroraMood.glacier,
          bottomBar: MiaBottomBar(
            child: MiaButton(
              label: 'Connect a new source',
              leadingIcon: Icons.add_link_rounded,
              onTap: () async {
                final ConnectionKind? kind = await showMiaSheet<ConnectionKind>(
                  context: context,
                  title: 'Connect a source',
                  overline: 'Consumer Data Right',
                  child: Column(
                    children: <Widget>[
                      MiaSettingsRow(
                        title: 'Bank or credit union',
                        subtitle:
                            'Up to ${AppConstants.maxInstitutionsPerMember} institutions and ${AppConstants.maxAccountsPerMember} accounts per member',
                        icon: Icons.account_balance_rounded,
                        onTap: () =>
                            Navigator.of(context).pop(ConnectionKind.banking),
                      ),
                      MiaSettingsRow(
                        title: 'Energy retailer',
                        subtitle:
                            'Up to ${AppConstants.maxEnergyConnectionsPerHousehold} accounts and ${AppConstants.maxServicePointsPerHousehold} properties per household',
                        icon: Icons.bolt_rounded,
                        onTap: () =>
                            Navigator.of(context).pop(ConnectionKind.energy),
                      ),
                      MiaSettingsRow(
                        title: 'Bill email',
                        subtitle: 'Forwarding address, Gmail or Outlook',
                        icon: Icons.alternate_email_rounded,
                        onTap: () =>
                            Navigator.of(context).pop(ConnectionKind.email),
                      ),
                    ],
                  ),
                );
                if (kind == null || !context.mounted) return;

                final String? institution = await showMiaSheet<String>(
                  context: context,
                  title: 'Which one',
                  overline: 'You are giving consent to this provider',
                  child: ProviderNameSheet(kind: kind),
                );
                if (institution == null || !context.mounted) return;

                bloc.add(
                  ConnectionsEvent.connectionStarted(
                    kind: kind,
                    institution: institution,
                  ),
                );
                showMiaToast(
                  context,
                  message:
                      '$institution added as pending. Nothing is read until the provider confirms your consent.',
                  icon: Icons.add_link_rounded,
                  accent: AppColors.glacier,
                );
              },
            ),
          ),
          child: !state.isReady
              ? const SkeletonTileList(count: 5, tileHeight: 140)
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Reveal(
                      child: MiaNoticeStrip(
                        message:
                            'Mia syncs twice daily, morning and afternoon. Manual refresh is not available under the current CDR arrangement.',
                        icon: Icons.sync_rounded,
                        accent: AppColors.glacier,
                      ),
                    ),
                    verticalSpace(16),
                    Reveal(
                      index: 1,
                      child: const SectionHeader(
                        overline: 'Open banking',
                        title: 'Banking',
                      ),
                    ),
                    ...state.banking.map(
                      (ConnectionRecord c) => Padding(
                        padding: EdgeInsets.only(bottom: getSize(10)),
                        child: ConnectionCard(
                          connection: c,
                          onReconnect: () =>
                              bloc.add(ConnectionsEvent.reconnect(c.id)),
                          onRevoke: () async {
                            final bool confirmed = await confirmDestructive(
                              context: context,
                              title: 'Revoke this consent?',
                              message:
                                  'Mia stops collecting from ${c.institution} immediately.',
                              confirmLabel: 'Revoke',
                              consequences: <String>[
                                'Existing records stay until you delete them',
                                'Figures using this source are marked stale',
                                'Reconnecting requires a new consent',
                              ],
                            );
                            if (confirmed) {
                              bloc.add(ConnectionsEvent.revoke(c.id));
                            }
                          },
                        ),
                      ),
                    ),
                    verticalSpace(12),
                    Reveal(
                      index: 2,
                      child: const SectionHeader(
                        overline: 'CDR energy',
                        title: 'Energy',
                      ),
                    ),
                    ...state.energy.map(
                      (ConnectionRecord c) => Padding(
                        padding: EdgeInsets.only(bottom: getSize(10)),
                        child: ConnectionCard(
                          connection: c,
                          onReconnect: () =>
                              bloc.add(ConnectionsEvent.reconnect(c.id)),
                          onRevoke: () {},
                        ),
                      ),
                    ),
                    verticalSpace(12),
                    Reveal(
                      index: 3,
                      child: const SectionHeader(
                        overline: 'Controlled intake',
                        title: 'Bill email',
                      ),
                    ),
                    ...state.emails.map(
                      (EmailIntakeConnection e) => Padding(
                        padding: EdgeInsets.only(bottom: getSize(10)),
                        child: EmailConnectionCard(connection: e),
                      ),
                    ),
                  ],
                ),
        );
      },
    );
  }
}

class ConnectionCard extends StatelessWidget {
  const ConnectionCard({
    super.key,
    required this.connection,
    required this.onReconnect,
    required this.onRevoke,
  });

  final ConnectionRecord connection;
  final VoidCallback onReconnect;
  final VoidCallback onRevoke;

  @override
  Widget build(BuildContext context) {
    return GlassPanel(
      tone: GlassTone.soft,
      borderColor: connection.status == ConsentStatus.reconnectRequired
          ? withCustomOpacity(AppColors.negative, 0.4)
          : AppColors.glassBorderSoft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                width: getSize(40),
                height: getSize(40),
                decoration: BoxDecoration(
                  color: withCustomOpacity(connection.accent, 0.14),
                  borderRadius: AppRadii.rSm,
                ),
                child: Icon(
                  connection.logoGlyph,
                  size: getFontSize(18),
                  color: connection.accent,
                ),
              ),
              horizontalSpace(12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    BaseText(
                      connection.institution,
                      fontSize: 15,
                      textStyle: AppTypography.titleSmall,
                    ),
                    verticalSpace(3),
                    BaseText(
                      '${connection.accountCount} accounts · ${connection.owner}',
                      fontSize: 11.5,
                      textColor: AppColors.muted,
                    ),
                  ],
                ),
              ),
              StatusPill(
                label: connection.status.label,
                color: connection.status.color,
                dense: true,
              ),
            ],
          ),
          verticalSpace(12),
          EvidenceRow(label: 'Purpose', value: connection.purpose),
          EvidenceRow(label: 'Scope', value: connection.scopes.join(', ')),
          EvidenceRow(
            label: 'Expires',
            value:
                '${formatFullDate(connection.consentExpiresOn)} (${connection.daysUntilExpiry} days)',
            valueColor: connection.daysUntilExpiry < 30
                ? AppColors.caution
                : null,
          ),
          if (connection.lastRefreshed != null)
            EvidenceRow(
              label: 'Last refreshed',
              value: relativeLabel(connection.lastRefreshed!),
            ),
          if (connection.dataCurrentTo != null)
            EvidenceRow(
              label: 'Data current to',
              value: relativeLabel(connection.dataCurrentTo!),
              valueColor: connection.freshness.color,
            ),
          if (connection.historyProcessingMonthsRemaining > 0)
            EvidenceRow(
              label: 'History still processing',
              value:
                  '${connection.historyProcessingMonthsRemaining} months remaining',
              valueColor: AppColors.caution,
            ),
          verticalSpace(12),
          Row(
            children: <Widget>[
              if (connection.status == ConsentStatus.reconnectRequired ||
                  connection.status == ConsentStatus.expiringSoon)
                Expanded(
                  child: MiaButton(
                    label: 'Reconnect',
                    size: MiaButtonSize.small,
                    variant: MiaButtonVariant.frost,
                    onTap: onReconnect,
                  ),
                ),
              if (connection.status == ConsentStatus.active) ...<Widget>[
                Expanded(
                  child: MiaButton(
                    label: 'Consent history',
                    size: MiaButtonSize.small,
                    variant: MiaButtonVariant.ghost,
                    onTap: () => showMiaSheet<void>(
                      context: context,
                      title: 'Consent history',
                      overline: connection.institution,
                      child: ConsentHistorySheet(connection: connection),
                    ),
                  ),
                ),
              ],
              horizontalSpace(8),
              MiaButton(
                label: 'Revoke',
                size: MiaButtonSize.small,
                variant: MiaButtonVariant.outline,
                expanded: false,
                onTap: onRevoke,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class EmailConnectionCard extends StatelessWidget {
  const EmailConnectionCard({super.key, required this.connection});

  final EmailIntakeConnection connection;

  @override
  Widget build(BuildContext context) {
    return GlassPanel(
      tone: GlassTone.soft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Icon(
                Icons.alternate_email_rounded,
                size: getFontSize(18),
                color: AppColors.violetHaze,
              ),
              horizontalSpace(12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    BaseText(
                      connection.provider,
                      fontSize: 14.5,
                      textStyle: AppTypography.titleSmall,
                    ),
                    verticalSpace(3),
                    BaseText(
                      connection.address,
                      fontSize: 11.5,
                      textColor: AppColors.muted,
                    ),
                  ],
                ),
              ),
              StatusPill(
                label: connection.isConnected ? 'Connected' : 'Not connected',
                color: connection.isConnected
                    ? AppColors.positive
                    : AppColors.muted,
                dense: true,
              ),
            ],
          ),
          if (connection.selectedLabels.isNotEmpty) ...<Widget>[
            verticalSpace(10),
            EvidenceRow(
              label: 'Selected labels',
              value: connection.selectedLabels.join(', '),
            ),
          ],
          if (connection.lastSync != null)
            EvidenceRow(
              label: 'Last sync',
              value: relativeLabel(connection.lastSync!),
            ),
          if (connection.pendingItems > 0)
            EvidenceRow(
              label: 'Waiting in review',
              value: '${connection.pendingItems} items',
              valueColor: AppColors.caution,
            ),
          verticalSpace(8),
          BaseText(
            'Read-only access to the labels you nominate. Mia never scans your whole mailbox and never stores your password.',
            fontSize: 11,
            textColor: AppColors.faint,
            height: 1.45,
          ),
        ],
      ),
    );
  }
}

/// Names the provider a consent is being given to. Mia will not invent one.
class ProviderNameSheet extends StatelessWidget {
  const ProviderNameSheet({super.key, required this.kind});

  final ConnectionKind kind;

  @override
  Widget build(BuildContext context) {
    String name = '';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        MiaFormField(
          label: kind == ConnectionKind.energy ? 'Retailer' : 'Provider',
          hint: kind == ConnectionKind.energy
              ? 'Origin Energy'
              : kind == ConnectionKind.email
              ? 'Gmail'
              : 'Great Southern Bank',
          autofocus: true,
          prefixIcon: Icons.business_rounded,
          onChanged: (String value) => name = value,
        ),
        verticalSpace(16),
        MiaButton(
          label: 'Start the consent',
          leadingIcon: Icons.verified_user_rounded,
          onTap: () {
            if (name.trim().isEmpty) return;
            Navigator.of(context).pop(name.trim());
          },
        ),
        verticalSpace(10),
        BaseText(
          'It stays pending until the provider confirms. Mia reads nothing before that.',
          fontSize: 11.5,
          textColor: AppColors.faint,
          height: 1.45,
        ),
      ],
    );
  }
}
