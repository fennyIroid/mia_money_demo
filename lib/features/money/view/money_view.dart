import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/di/injection.dart';
import '../../../core/router/app_router.gr.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_typography.dart';
import '../../../core/utils/math_utils.dart';
import '../../../core/utils/spacing_utils.dart';
import '../../../core/widgets/aurora_background.dart';
import '../../../core/widgets/base_text.dart';
import '../../../core/widgets/bento_tile.dart';
import '../../../core/widgets/mia_charts.dart';
import '../../../core/widgets/mia_states.dart';
import '../../../core/widgets/reveal.dart';
import '../../../core/widgets/section_header.dart';
import '../../../core/widgets/value_ticker.dart';
import '../bloc/money_bloc.dart';
import '../widgets/money_shortcuts.dart';

@RoutePage()
class MoneyView extends StatelessWidget {
  const MoneyView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<MoneyBloc>(
      create: (BuildContext context) =>
          getIt<MoneyBloc>()..add(const MoneyEvent.load()),
      child: const MoneyScaffold(),
    );
  }
}

class MoneyScaffold extends StatelessWidget {
  const MoneyScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoneyBloc, MoneyState>(
      builder: (BuildContext context, MoneyState state) {
        return Scaffold(
          backgroundColor: AppColors.ink,
          extendBody: true,
          body: AuroraBackground(
            mood: AuroraMood.glacier,
            child: SafeArea(
              bottom: false,
              child: !state.isReady
                  ? Padding(
                      padding: EdgeInsets.symmetric(horizontal: getSize(20)),
                      child: const SkeletonTileList(count: 5, tileHeight: 130),
                    )
                  : ListView(
                      physics: const BouncingScrollPhysics(),
                      padding: EdgeInsets.only(
                        left: getSize(20),
                        right: getSize(20),
                        bottom: getSize(160),
                      ),
                      children: <Widget>[
                        verticalSpace(10),
                        Reveal(
                          child: BaseText(
                            'Money',
                            fontSize: 30,
                            textStyle: AppTypography.titleLarge,
                          ),
                        ),
                        verticalSpace(4),
                        Reveal(
                          index: 1,
                          child: BaseText(
                            'Balances, planning and results — all from the same evidence.',
                            fontSize: 13,
                            textColor: AppColors.muted,
                            height: 1.45,
                          ),
                        ),
                        verticalSpace(20),
                        Reveal(
                          index: 2,
                          withScale: true,
                          child: BentoHeroTile(
                            label: 'Net worth',
                            icon: Icons.stacked_line_chart_rounded,
                            accent: AppColors.glacier,
                            onTap: () =>
                                context.router.push(const NetWorthRoute()),
                            figure: ValueTicker(
                              value: state.netWorth?.netWorth ?? 0,
                              fontSize: 44,
                            ),
                            caption:
                                'Assets minus liabilities, using the latest eligible value on or before today.',
                            footer: Sparkline(
                              values:
                                  state.netWorth?.history ??
                                  const <double>[1, 2, 3],
                              color: AppColors.glacier,
                              width: 300,
                              height: 56,
                            ),
                          ),
                        ),
                        verticalSpace(12),
                        Reveal(
                          index: 3,
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                child: BentoTile(
                                  label: 'Cash on hand',
                                  icon: Icons.account_balance_wallet_rounded,
                                  accent: AppColors.positive,
                                  height: getSize(140),
                                  onTap: () => context.router.push(
                                    const AccountsRoute(),
                                  ),
                                  figure: ValueTicker(
                                    value: state.cashOnHand,
                                    format: TickerFormat.currencyCompact,
                                    fontSize: 28,
                                  ),
                                  caption:
                                      '${state.assets.length} accounts connected',
                                ),
                              ),
                              horizontalSpace(10),
                              Expanded(
                                child: BentoTile(
                                  label: 'Goals saved',
                                  icon: Icons.flag_rounded,
                                  accent: AppColors.ember,
                                  height: getSize(140),
                                  onTap: () =>
                                      context.router.push(const GoalsRoute()),
                                  figure: ValueTicker(
                                    value: state.goalsTotal,
                                    format: TickerFormat.currencyCompact,
                                    fontSize: 28,
                                  ),
                                  caption:
                                      'of ${state.goalsTarget.toStringAsFixed(0)} targeted',
                                ),
                              ),
                            ],
                          ),
                        ),
                        verticalSpace(28),
                        Reveal(
                          index: 4,
                          child: const SectionHeader(
                            overline: 'Everything money',
                            title: 'Go deeper',
                          ),
                        ),
                        Reveal(index: 5, child: const MoneyShortcuts()),
                      ],
                    ),
            ),
          ),
        );
      },
    );
  }
}
