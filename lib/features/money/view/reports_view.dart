import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/di/injection.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_shapes.dart';
import '../../../core/theme/app_typography.dart';
import '../../../core/utils/color_utils.dart';
import '../../../core/utils/currency_utils.dart';
import '../../../core/utils/math_utils.dart';
import '../../../core/utils/spacing_utils.dart';
import '../../../core/widgets/aurora_background.dart';
import '../../../core/widgets/base_text.dart';
import '../../../core/widgets/bento_tile.dart';
import '../../../core/widgets/glass_panel.dart';
import '../../../core/widgets/mia_button.dart';
import '../../../core/widgets/mia_charts.dart';
import '../../../core/widgets/mia_inputs.dart';
import '../../../core/widgets/mia_list_row.dart';
import '../../../core/widgets/mia_scaffold.dart';
import '../../../core/widgets/mia_sheet.dart';
import '../../../core/widgets/mia_states.dart';
import '../../../core/widgets/reveal.dart';
import '../../../core/widgets/section_header.dart';
import '../../../core/widgets/status_pill.dart';
import '../../../core/widgets/value_ticker.dart';
import '../../../data/models/admin_models.dart';
import '../../../data/models/insight_models.dart';
import '../bloc/money_bloc.dart';
import '../widgets/calculation_meta_panel.dart';

@RoutePage()
class ReportsView extends StatelessWidget {
  const ReportsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<MoneyBloc>(
      create: (BuildContext context) =>
          getIt<MoneyBloc>()..add(const MoneyEvent.load()),
      child: const ReportsScaffold(),
    );
  }
}

class ReportsScaffold extends StatelessWidget {
  const ReportsScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoneyBloc, MoneyState>(
      builder: (BuildContext context, MoneyState state) {
        final MoneyBloc bloc = context.read<MoneyBloc>();
        final ReportSnapshot? report = state.report;

        return MiaScaffold(
          title: 'Reports',
          overline: report?.periodLabel ?? 'This month',
          mood: AuroraMood.balanced,
          bottomBar: MiaBottomBar(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: MiaButton(
                    label: 'Export CSV',
                    variant: MiaButtonVariant.frost,
                    size: MiaButtonSize.medium,
                    onTap: () {
                      bloc.add(
                        MoneyEvent.exportRequested(
                          label:
                              '${report?.periodLabel ?? 'This month'} report',
                          format: 'CSV',
                        ),
                      );
                      showMiaToast(
                        context,
                        message:
                            'CSV built. It is in Your exports below with the period it covers.',
                        icon: Icons.table_chart_rounded,
                      );
                    },
                  ),
                ),
                horizontalSpace(10),
                Expanded(
                  child: MiaButton(
                    label: 'Export PDF',
                    variant: MiaButtonVariant.outline,
                    size: MiaButtonSize.medium,
                    onTap: () {
                      bloc.add(
                        MoneyEvent.exportRequested(
                          label:
                              '${report?.periodLabel ?? 'This month'} report',
                          format: 'PDF',
                        ),
                      );
                      showMiaToast(
                        context,
                        message:
                            'PDF built. It is in Your exports below with the period it covers.',
                        icon: Icons.picture_as_pdf_rounded,
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          child: report == null
              ? const SkeletonTileList(count: 5, tileHeight: 120)
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Reveal(
                      child: MiaSegmentedControl(
                        segments: ReportPeriod.values
                            .map((ReportPeriod p) => p.label)
                            .toList(),
                        selectedIndex: ReportPeriod.values.indexOf(
                          state.period,
                        ),
                        onChanged: (int i) => bloc.add(
                          MoneyEvent.periodChanged(ReportPeriod.values[i]),
                        ),
                      ),
                    ),
                    verticalSpace(16),
                    Reveal(
                      index: 1,
                      withScale: true,
                      child: BentoHeroTile(
                        label: 'Cash flow',
                        icon: Icons.waterfall_chart_rounded,
                        accent: AppColors.lagoon,
                        figure: ValueTicker(
                          value: report.net,
                          fontSize: 40,
                          showSign: true,
                        ),
                        caption:
                            '${formatCurrency(report.genuineIncome)} genuine income − ${formatCurrency(report.eligibleSpending)} eligible spending',
                        footer: CashFlowChart(points: report.cashFlow),
                      ),
                    ),
                    verticalSpace(12),
                    Reveal(
                      index: 2,
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: BentoTile(
                              label: 'Eligible spending',
                              icon: Icons.south_west_rounded,
                              accent: AppColors.ember,
                              height: getSize(140),
                              figure: ValueTicker(
                                value: report.eligibleSpending,
                                format: TickerFormat.currencyCompact,
                                fontSize: 26,
                              ),
                              caption: 'transfers and duplicates excluded',
                            ),
                          ),
                          horizontalSpace(10),
                          Expanded(
                            child: BentoTile(
                              label: 'Genuine income',
                              icon: Icons.north_east_rounded,
                              accent: AppColors.positive,
                              height: getSize(140),
                              figure: ValueTicker(
                                value: report.genuineIncome,
                                format: TickerFormat.currencyCompact,
                                fontSize: 26,
                              ),
                              caption: 'refunds and proceeds excluded',
                            ),
                          ),
                        ],
                      ),
                    ),
                    verticalSpace(24),
                    Reveal(
                      index: 3,
                      child: SectionHeader(
                        overline: 'Where it went',
                        title: 'Categories',
                        actionLabel: state.groupSmallerSpending
                            ? 'Show all'
                            : 'Group small',
                        onActionTap: () =>
                            bloc.add(const MoneyEvent.smallerSpendingToggled()),
                      ),
                    ),
                    ...List<Widget>.generate(state.displayedCategories.length, (
                      int i,
                    ) {
                      final CategoryTotal category =
                          state.displayedCategories[i];
                      return Padding(
                        padding: EdgeInsets.only(bottom: getSize(8)),
                        child: Reveal(
                          index: i.clamp(0, 8),
                          child: CategoryTotalRow(
                            category: category,
                            share: report.eligibleSpending == 0
                                ? 0
                                : category.amount / report.eligibleSpending,
                          ),
                        ),
                      );
                    }),
                    if (state.groupSmallerSpending &&
                        report.smallerSpending.isNotEmpty) ...<Widget>[
                      Reveal(
                        index: 9,
                        child: GlassPanel(
                          tone: GlassTone.soft,
                          onTap: () => showMiaSheet<void>(
                            context: context,
                            title: 'Smaller spending',
                            overline: 'Grouped for display only',
                            child: Column(
                              children: <Widget>[
                                ...report.smallerSpending.map(
                                  (CategoryTotal c) => EvidenceRow(
                                    label: c.name,
                                    value: formatCurrency(c.amount),
                                    icon: c.icon,
                                  ),
                                ),
                                verticalSpace(12),
                                BaseText(
                                  'These categories each contribute under 0.5% of eligible spending. The underlying records keep their real categories, and exports are not grouped unless you ask.',
                                  fontSize: 11.5,
                                  textColor: AppColors.faint,
                                  height: 1.5,
                                ),
                              ],
                            ),
                          ),
                          child: Row(
                            children: <Widget>[
                              Icon(
                                Icons.workspaces_rounded,
                                size: getFontSize(16),
                                color: AppColors.muted,
                              ),
                              horizontalSpace(12),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    BaseText(
                                      'Smaller spending',
                                      fontSize: 14,
                                      textStyle: AppTypography.titleSmall,
                                    ),
                                    verticalSpace(3),
                                    BaseText(
                                      '${report.smallerSpending.length} categories under 0.5%',
                                      fontSize: 11,
                                      textColor: AppColors.faint,
                                    ),
                                  ],
                                ),
                              ),
                              MoneyLabel(
                                text: formatCurrency(
                                  state.smallerSpendingTotal,
                                ),
                                fontSize: 14,
                              ),
                            ],
                          ),
                        ),
                      ),
                      verticalSpace(8),
                    ],
                    verticalSpace(16),
                    Reveal(
                      index: 10,
                      child: const SectionHeader(
                        overline: 'Who you paid',
                        title: 'Merchants',
                      ),
                    ),
                    Reveal(
                      index: 11,
                      child: GlassPanel(
                        tone: GlassTone.soft,
                        child: Column(
                          children: report.merchants.take(8).map((
                            MerchantTotal m,
                          ) {
                            return EvidenceRow(
                              label: '${m.name} · ${m.count}x',
                              value: formatCurrency(m.amount),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                    verticalSpace(16),
                    Reveal(
                      index: 12,
                      child: CalculationMetaPanel(meta: report.meta),
                    ),
                    if (state.exports.isNotEmpty) ...<Widget>[
                      verticalSpace(20),
                      Reveal(
                        index: 13,
                        child: const SectionHeader(
                          overline: 'Files you asked for',
                          title: 'Your exports',
                        ),
                      ),
                      Reveal(
                        index: 14,
                        child: MiaGroupedCard(
                          title: 'Ready to download',
                          footnote:
                              'Each export carries the period it was built from, so a figure in a file can always be traced back.',
                          children: state.exports
                              .map<Widget>(
                                (ExportJob job) => EvidenceRow(
                                  label: '${job.format} · ${job.label}',
                                  value: job.coveragePeriod,
                                ),
                              )
                              .toList(),
                        ),
                      ),
                    ],
                  ],
                ),
        );
      },
    );
  }
}

class CategoryTotalRow extends StatelessWidget {
  const CategoryTotalRow({
    super.key,
    required this.category,
    required this.share,
  });

  final CategoryTotal category;
  final double share;

  @override
  Widget build(BuildContext context) {
    return GlassPanel(
      tone: GlassTone.soft,
      padding: EdgeInsets.symmetric(
        horizontal: getSize(14),
        vertical: getSize(12),
      ),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                width: getSize(32),
                height: getSize(32),
                decoration: BoxDecoration(
                  color: withCustomOpacity(category.color, 0.16),
                  borderRadius: AppRadii.rXs,
                ),
                child: Icon(
                  category.icon,
                  size: getFontSize(15),
                  color: category.color,
                ),
              ),
              horizontalSpace(10),
              Expanded(
                child: BaseText(
                  category.name,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
              DeltaBadge(value: category.percentChange),
              horizontalSpace(10),
              MoneyLabel(
                text: formatCurrency(category.amount, decimals: 0),
                fontSize: 14,
              ),
            ],
          ),
          verticalSpace(10),
          ProportionBar(value: share, color: category.color, height: 5),
        ],
      ),
    );
  }
}

class CashFlowChart extends StatelessWidget {
  const CashFlowChart({super.key, required this.points});

  final List<CashFlowPoint> points;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: getSize(96),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: points.map((CashFlowPoint point) {
          final double maxValue = points
              .map(
                (CashFlowPoint p) =>
                    p.income > p.spending ? p.income : p.spending,
              )
              .reduce((double a, double b) => a > b ? a : b);
          return Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  CashFlowBar(
                    fraction: point.income / maxValue,
                    color: AppColors.positive,
                  ),
                  SizedBox(width: getSize(3)),
                  CashFlowBar(
                    fraction: point.spending / maxValue,
                    color: AppColors.ember,
                  ),
                ],
              ),
              verticalSpace(6),
              BaseText(point.label, fontSize: 9, textColor: AppColors.faint),
            ],
          );
        }).toList(),
      ),
    );
  }
}

class CashFlowBar extends StatelessWidget {
  const CashFlowBar({super.key, required this.fraction, required this.color});

  final double fraction;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween<double>(begin: 0, end: fraction.clamp(0.05, 1.0)),
      duration: const Duration(milliseconds: 900),
      curve: Curves.easeOutCubic,
      builder: (BuildContext context, double t, Widget? _) {
        return Container(
          width: getSize(9),
          height: getSize(66) * t,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: <Color>[withCustomOpacity(color, 0.4), color],
            ),
            borderRadius: AppRadii.rPill,
          ),
        );
      },
    );
  }
}
