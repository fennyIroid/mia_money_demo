import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/di/injection.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_typography.dart';
import '../../../core/utils/currency_utils.dart';
import '../../../core/utils/date_utils.dart';
import '../../../core/utils/math_utils.dart';
import '../../../core/utils/spacing_utils.dart';
import '../../../core/widgets/aurora_background.dart';
import '../../../core/widgets/base_text.dart';
import '../../../core/widgets/bento_tile.dart';
import '../../../core/widgets/glass_panel.dart';
import '../../../core/widgets/mia_charts.dart';
import '../../../core/widgets/mia_list_row.dart';
import '../../../core/widgets/mia_scaffold.dart';
import '../../../core/widgets/mia_states.dart';
import '../../../core/widgets/reveal.dart';
import '../../../core/widgets/status_pill.dart';
import '../../../core/widgets/value_ticker.dart';
import '../../../data/models/insight_models.dart';
import '../bloc/money_bloc.dart';
import '../widgets/calculation_meta_panel.dart';
import '../../../data/models/core_models.dart';

@RoutePage()
class NetWorthView extends StatelessWidget {
  const NetWorthView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<MoneyBloc>(
      create: (BuildContext context) =>
          getIt<MoneyBloc>()..add(const MoneyEvent.load()),
      child: const NetWorthScaffold(),
    );
  }
}

class NetWorthScaffold extends StatelessWidget {
  const NetWorthScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoneyBloc, MoneyState>(
      builder: (BuildContext context, MoneyState state) {
        final NetWorthSnapshot? snapshot = state.netWorth;

        return MiaScaffold(
          title: 'Net worth',
          overline: 'Dated and source aware',
          mood: AuroraMood.glacier,
          child: snapshot == null
              ? const SkeletonTileList(count: 4, tileHeight: 130)
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Reveal(
                      withScale: true,
                      child: BentoHeroTile(
                        label: 'As at ${formatFullDate(snapshot.asAt)}',
                        icon: Icons.stacked_line_chart_rounded,
                        accent: AppColors.glacier,
                        figure: ValueTicker(
                          value: snapshot.netWorth,
                          fontSize: 42,
                        ),
                        footer: Sparkline(
                          values: snapshot.history,
                          color: AppColors.glacier,
                          width: 300,
                          height: 60,
                        ),
                      ),
                    ),
                    verticalSpace(12),
                    Reveal(
                      index: 1,
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: BentoTile(
                              label: 'Assets',
                              icon: Icons.trending_up_rounded,
                              accent: AppColors.positive,
                              height: getSize(120),
                              figure: ValueTicker(
                                value: snapshot.totalAssets,
                                format: TickerFormat.currencyCompact,
                                fontSize: 26,
                              ),
                              caption: '${snapshot.assets.length} items',
                            ),
                          ),
                          horizontalSpace(10),
                          Expanded(
                            child: BentoTile(
                              label: 'Liabilities',
                              icon: Icons.trending_down_rounded,
                              accent: AppColors.negative,
                              height: getSize(120),
                              figure: ValueTicker(
                                value: snapshot.totalLiabilities,
                                format: TickerFormat.currencyCompact,
                                fontSize: 26,
                              ),
                              caption: '${snapshot.liabilities.length} items',
                            ),
                          ),
                        ],
                      ),
                    ),
                    verticalSpace(16),
                    Reveal(
                      index: 2,
                      child: NetWorthGroup(
                        title: 'Assets',
                        entries: snapshot.assets,
                      ),
                    ),
                    verticalSpace(12),
                    Reveal(
                      index: 3,
                      child: NetWorthGroup(
                        title: 'Liabilities',
                        entries: snapshot.liabilities,
                      ),
                    ),
                    verticalSpace(16),
                    Reveal(
                      index: 4,
                      child: CalculationMetaPanel(meta: snapshot.meta),
                    ),
                    verticalSpace(12),
                    Reveal(
                      index: 5,
                      child: MiaNoticeStrip(
                        message:
                            'Phase 1 shows dated values only — no portfolio benchmarking, trading or retirement simulation.',
                        icon: Icons.info_outline_rounded,
                        accent: AppColors.glacier,
                      ),
                    ),
                  ],
                ),
        );
      },
    );
  }
}

class NetWorthGroup extends StatelessWidget {
  const NetWorthGroup({super.key, required this.title, required this.entries});

  final String title;
  final List<NetWorthEntry> entries;

  @override
  Widget build(BuildContext context) {
    return GlassPanel(
      tone: GlassTone.soft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          BaseText(title, fontSize: 10, textStyle: AppTypography.overline),
          verticalSpace(10),
          ...entries.map((NetWorthEntry entry) {
            return Padding(
              padding: EdgeInsets.symmetric(vertical: getSize(8)),
              child: Row(
                children: <Widget>[
                  Icon(
                    entry.icon,
                    size: getFontSize(16),
                    color: entry.isLiability
                        ? AppColors.negative
                        : AppColors.glacier,
                  ),
                  horizontalSpace(10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        BaseText(
                          entry.label,
                          fontSize: 13.5,
                          fontWeight: FontWeight.w600,
                          maxLines: 1,
                        ),
                        verticalSpace(4),
                        Row(
                          children: <Widget>[
                            Flexible(
                              child: StatusPill(
                                label: entry.freshness.label,
                                color: entry.freshness.color,
                                dense: true,
                                fontSize: 9,
                              ),
                            ),
                            horizontalSpace(6),
                            Flexible(
                              child: BaseText(
                                'as of ${relativeLabel(entry.asOf)}',
                                fontSize: 10,
                                textColor: AppColors.faint,
                                maxLines: 1,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  MoneyLabel(
                    text: formatCurrency(entry.amount, decimals: 0),
                    fontSize: 14,
                    color: entry.isLiability ? AppColors.negative : null,
                  ),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }
}
