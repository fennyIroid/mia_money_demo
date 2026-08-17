import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/di/injection.dart';
import '../../../core/router/app_router.gr.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_shapes.dart';
import '../../../core/theme/app_typography.dart';
import '../../../core/utils/color_utils.dart';
import '../../../core/utils/currency_utils.dart';
import '../../../core/utils/date_utils.dart';
import '../../../core/utils/math_utils.dart';
import '../../../core/utils/spacing_utils.dart';
import '../../../core/widgets/aurora_background.dart';
import '../../../core/widgets/base_text.dart';
import '../../../core/widgets/glass_panel.dart';
import '../../../core/widgets/mia_button.dart';
import '../../../core/widgets/mia_charts.dart';
import '../../../core/widgets/mia_list_row.dart';
import '../../../core/widgets/mia_scaffold.dart';
import '../../../core/widgets/mia_sheet.dart';
import '../../../core/widgets/mia_states.dart';
import '../../../core/widgets/reveal.dart';
import '../../../core/widgets/section_header.dart';
import '../../../core/widgets/status_pill.dart';
import '../../../data/models/core_models.dart';
import '../../../data/models/money_models.dart';
import '../bloc/money_bloc.dart';

@RoutePage()
class AccountsView extends StatelessWidget {
  const AccountsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<MoneyBloc>(
      create: (BuildContext context) =>
          getIt<MoneyBloc>()..add(const MoneyEvent.load()),
      child: const AccountsScaffold(),
    );
  }
}

class AccountsScaffold extends StatelessWidget {
  const AccountsScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoneyBloc, MoneyState>(
      builder: (BuildContext context, MoneyState state) {
        final MoneyBloc bloc = context.read<MoneyBloc>();

        return MiaScaffold(
          title: 'Accounts',
          overline: 'Assets and liabilities',
          mood: AuroraMood.glacier,
          actions: <Widget>[
            GlassIconButton(
              icon: Icons.add_rounded,
              diameter: 40,
              iconSize: 18,
              semanticLabel: 'Add an account',
              onTap: () async {
                final FinancialAccount? created = await context.router
                    .push<FinancialAccount>(const AccountEditorRoute());
                if (created == null || !context.mounted) return;
                bloc.add(const MoneyEvent.load());
                showMiaToast(
                  context,
                  message:
                      '${created.name} added at ${formatCurrency(created.balance)}. You keep this balance up to date.',
                  icon: Icons.add_card_rounded,
                );
              },
            ),
          ],
          child: !state.isReady
              ? const SkeletonTileList(count: 6, tileHeight: 96)
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Reveal(
                      child: const SectionHeader(
                        overline: 'What you own',
                        title: 'Assets',
                      ),
                    ),
                    ...state.assets.map(
                      (FinancialAccount a) => Padding(
                        padding: EdgeInsets.only(bottom: getSize(8)),
                        child: AccountCard(
                          account: a,
                          onArchive: () => _archiveAccount(context, bloc, a),
                        ),
                      ),
                    ),
                    verticalSpace(20),
                    Reveal(
                      index: 1,
                      child: const SectionHeader(
                        overline: 'What you owe',
                        title: 'Liabilities',
                      ),
                    ),
                    ...state.liabilities.map(
                      (FinancialAccount a) => Padding(
                        padding: EdgeInsets.only(bottom: getSize(8)),
                        child: AccountCard(
                          account: a,
                          onArchive: () => _archiveAccount(context, bloc, a),
                        ),
                      ),
                    ),
                  ],
                ),
        );
      },
    );
  }
}

/// Archiving keeps the account's history but stops it counting towards net
/// worth, which is the only honest way to remove one.
Future<void> _archiveAccount(
  BuildContext context,
  MoneyBloc bloc,
  FinancialAccount account,
) async {
  final bool confirmed = await confirmDestructive(
    context: context,
    title: 'Archive ${account.name}?',
    message:
        'It stops counting towards net worth. Transactions already recorded against it stay exactly as they are.',
    confirmLabel: 'Archive',
    consequences: <String>[
      'It leaves the accounts list and net worth',
      'Its transactions and history are kept',
      'You can show archived accounts again from Money',
    ],
  );
  if (!confirmed || !context.mounted) return;

  bloc.add(MoneyEvent.accountArchived(account.id));
  showMiaToast(
    context,
    message: '${account.name} archived. Its history is untouched.',
    icon: Icons.inventory_rounded,
    accent: AppColors.caution,
  );
}

class AccountCard extends StatelessWidget {
  const AccountCard({
    super.key,
    required this.account,
    required this.onArchive,
  });

  final FinancialAccount account;
  final VoidCallback onArchive;

  @override
  Widget build(BuildContext context) {
    return GlassPanel(
      tone: GlassTone.soft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                width: getSize(40),
                height: getSize(40),
                decoration: BoxDecoration(
                  color: withCustomOpacity(
                    account.isLiability
                        ? AppColors.negative
                        : AppColors.glacier,
                    0.14,
                  ),
                  borderRadius: AppRadii.rSm,
                ),
                child: Icon(
                  account.type.icon,
                  size: getFontSize(18),
                  color: account.isLiability
                      ? AppColors.negative
                      : AppColors.glacier,
                ),
              ),
              horizontalSpace(12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    BaseText(
                      account.name,
                      fontSize: 14.5,
                      textStyle: AppTypography.titleSmall,
                    ),
                    verticalSpace(3),
                    BaseText(
                      '${account.institution}${account.accountNumberMasked == null ? '' : ' · ${account.accountNumberMasked}'}',
                      fontSize: 11.5,
                      textColor: AppColors.muted,
                    ),
                  ],
                ),
              ),
              MoneyLabel(
                text: formatCurrency(account.balance),
                isCredit: !account.isLiability && account.balance > 0,
                fontSize: 16,
              ),
            ],
          ),
          verticalSpace(10),
          Wrap(
            spacing: getSize(6),
            runSpacing: getSize(6),
            children: <Widget>[
              StatusPill(
                label: account.freshness.label,
                color: account.freshness.color,
                icon: account.freshness == DataFreshness.live
                    ? Icons.bolt_rounded
                    : Icons.schedule_rounded,
                dense: true,
              ),
              StatusPill(
                label: account.source.label,
                color: account.source.color,
                icon: account.source.icon,
                dense: true,
              ),
              StatusPill(
                label: account.owner,
                color: AppColors.violetHaze,
                icon: Icons.person_rounded,
                dense: true,
              ),
              if (account.balanceAsOf != null)
                StatusPill(
                  label: 'as of ${relativeLabel(account.balanceAsOf!)}',
                  color: AppColors.muted,
                  dense: true,
                ),
            ],
          ),
          if (account.coverageNote != null) ...<Widget>[
            verticalSpace(10),
            BaseText(
              account.coverageNote!,
              fontSize: 11,
              textColor: AppColors.faint,
              height: 1.4,
            ),
          ],
          if (account.history.isNotEmpty) ...<Widget>[
            verticalSpace(12),
            Sparkline(
              values: account.history
                  .map((BalanceSnapshot s) => s.amount)
                  .toList(),
              color: AppColors.glacier,
              width: 300,
              height: 40,
            ),
          ],
          if (account.creditLimit != null) ...<Widget>[
            verticalSpace(10),
            EvidenceRow(
              label: 'Available',
              value: formatCurrency(account.availableBalance ?? 0),
            ),
            EvidenceRow(
              label: 'Limit',
              value: formatCurrency(account.creditLimit!),
            ),
          ],
          if (account.interestRate != null)
            EvidenceRow(
              label: 'Rate',
              value: '${account.interestRate!.toStringAsFixed(2)}% p.a.',
            ),
          if (!account.isArchived) ...<Widget>[
            verticalSpace(6),
            Align(
              alignment: Alignment.centerRight,
              child: MiaTextAction(
                label: 'Archive',
                icon: Icons.inventory_rounded,
                color: AppColors.muted,
                fontSize: 12.5,
                onTap: onArchive,
              ),
            ),
          ],
        ],
      ),
    );
  }
}
