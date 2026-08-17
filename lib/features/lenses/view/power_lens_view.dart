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
import '../../../core/widgets/mia_charts.dart';
import '../../../core/widgets/mia_inputs.dart';
import '../../../core/widgets/mia_list_row.dart';
import '../../../core/widgets/mia_scaffold.dart';
import '../../../core/widgets/mia_states.dart';
import '../../../core/widgets/reveal.dart';
import '../../../core/widgets/section_header.dart';
import '../../../core/widgets/status_pill.dart';
import '../../../core/widgets/value_ticker.dart';
import '../../../data/models/energy_models.dart';
import '../../money/widgets/calculation_meta_panel.dart';
import '../bloc/power_lens_bloc.dart';

@RoutePage()
class PowerLensView extends StatelessWidget {
  const PowerLensView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PowerLensBloc>(
      create: (BuildContext context) =>
          getIt<PowerLensBloc>()..add(const PowerLensEvent.load()),
      child: const PowerLensScaffold(),
    );
  }
}

class PowerLensScaffold extends StatelessWidget {
  const PowerLensScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PowerLensBloc, PowerLensState>(
      builder: (BuildContext context, PowerLensState state) {
        final PowerLensBloc bloc = context.read<PowerLensBloc>();
        final PowerLensResult? result = state.result;

        return MiaScaffold(
          title: 'Power Lens',
          overline: 'Electricity plan comparison',
          mood: AuroraMood.ember,
          child: !state.isReady || result == null
              ? const SkeletonTileList(count: 4, tileHeight: 150)
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Reveal(
                      child: MiaChipRow(
                        padding: EdgeInsets.zero,
                        labels: state.servicePoints
                            .map((ServicePoint p) => p.address.split(',').first)
                            .toList(),
                        selectedIndex: state.servicePoints.indexWhere(
                          (ServicePoint p) =>
                              p.id == state.selectedServicePointId,
                        ),
                        onChanged: (int i) => bloc.add(
                          PowerLensEvent.propertySelected(
                            state.servicePoints[i].id,
                          ),
                        ),
                      ),
                    ),
                    verticalSpace(16),
                    Reveal(
                      index: 1,
                      withScale: true,
                      child: BentoHeroTile(
                        label: 'Estimated difference a year',
                        icon: Icons.bolt_rounded,
                        accent: AppColors.amberGlow,
                        figure: ValueTicker(
                          value: result.bestSaving,
                          fontSize: 42,
                          showSign: true,
                        ),
                        caption:
                            'Current plan ${formatCurrency(result.currentPlanCost.estimatedAnnualCost)} vs lowest eligible ${formatCurrency(result.candidates.first.estimatedAnnualCost)}',
                        footer: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Flexible(
                                  child: StatusPill(
                                    label:
                                        '${result.coveragePercent.toStringAsFixed(1)}% usage coverage',
                                    color: AppColors.positive,
                                    icon: Icons.data_usage_rounded,
                                    dense: true,
                                  ),
                                ),
                                horizontalSpace(6),
                                Flexible(
                                  child: StatusPill(
                                    label: result.usageWindowLabel,
                                    color: AppColors.glacier,
                                    icon: Icons.date_range_rounded,
                                    dense: true,
                                  ),
                                ),
                              ],
                            ),
                            verticalSpace(12),
                            BarSpark(
                              values: result.usageMonths
                                  .map((UsageMonth m) => m.kwh)
                                  .toList(),
                              color: AppColors.amberGlow,
                              width: 300,
                              height: 44,
                              highlightLast: false,
                            ),
                          ],
                        ),
                      ),
                    ),
                    verticalSpace(20),
                    Reveal(
                      index: 2,
                      child: const SectionHeader(
                        overline: 'Ranked by estimated annual cost',
                        title: 'Lowest cost plans',
                      ),
                    ),
                    ...List<Widget>.generate(
                      result.lowestThree.length,
                      (int i) => Padding(
                        padding: EdgeInsets.only(bottom: getSize(8)),
                        child: Reveal(
                          index: 3 + i,
                          child: PlanResultCard(
                            candidate: result.lowestThree[i],
                            currentCost:
                                result.currentPlanCost.estimatedAnnualCost,
                          ),
                        ),
                      ),
                    ),
                    verticalSpace(8),
                    Reveal(
                      index: 6,
                      child: PlanResultCard(
                        candidate: result.currentPlanCost,
                        currentCost: result.currentPlanCost.estimatedAnnualCost,
                        isCurrent: true,
                      ),
                    ),
                    verticalSpace(16),
                    Reveal(
                      index: 7,
                      child: GlassPanel(
                        tone: GlassTone.soft,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            BaseText(
                              'Excluded and uncertain',
                              fontSize: 10,
                              textStyle: AppTypography.overline,
                            ),
                            verticalSpace(8),
                            ...result.candidates
                                .where(
                                  (PowerLensCandidate c) =>
                                      c.eligibility != PlanEligibility.eligible,
                                )
                                .map(
                                  (PowerLensCandidate c) => EvidenceRow(
                                    label:
                                        '${c.plan.retailer} · ${c.plan.planName}',
                                    value: c.eligibility.label,
                                    valueColor: c.eligibility.color,
                                  ),
                                ),
                          ],
                        ),
                      ),
                    ),
                    verticalSpace(16),
                    Reveal(
                      index: 8,
                      child: MiaNoticeStrip(
                        message: result.marketCoverageNote,
                        icon: Icons.travel_explore_rounded,
                        accent: AppColors.glacier,
                      ),
                    ),
                    verticalSpace(16),
                    Reveal(
                      index: 9,
                      child: CalculationMetaPanel(
                        meta: result.meta,
                        title: 'Calculation evidence',
                      ),
                    ),
                    verticalSpace(16),
                    Reveal(
                      index: 10,
                      child: MiaNoticeStrip(
                        message:
                            'Power Lens compares and discovers. It does not switch retailers or submit applications.',
                        icon: Icons.gavel_rounded,
                        accent: AppColors.violetHaze,
                      ),
                    ),
                  ],
                ),
        );
      },
    );
  }
}

class PlanResultCard extends StatelessWidget {
  const PlanResultCard({
    super.key,
    required this.candidate,
    required this.currentCost,
    this.isCurrent = false,
  });

  final PowerLensCandidate candidate;
  final double currentCost;
  final bool isCurrent;

  @override
  Widget build(BuildContext context) {
    final double difference = currentCost - candidate.estimatedAnnualCost;

    return GlassPanel(
      tone: isCurrent ? GlassTone.soft : GlassTone.standard,
      borderColor: isCurrent
          ? AppColors.glassBorderSoft
          : withCustomOpacity(AppColors.amberGlow, 0.3),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                width: getSize(30),
                height: getSize(30),
                decoration: BoxDecoration(
                  color: withCustomOpacity(
                    isCurrent ? AppColors.muted : AppColors.amberGlow,
                    0.16,
                  ),
                  borderRadius: AppRadii.rXs,
                ),
                alignment: Alignment.center,
                child: BaseText(
                  isCurrent ? '–' : '${candidate.rank}',
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  textAlign: TextAlign.center,
                  textColor: isCurrent ? AppColors.muted : AppColors.amberGlow,
                ),
              ),
              horizontalSpace(10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    BaseText(
                      candidate.plan.planName,
                      fontSize: 14,
                      textStyle: AppTypography.titleSmall,
                      maxLines: 2,
                    ),
                    verticalSpace(3),
                    BaseText(
                      '${candidate.plan.retailer} · ${candidate.plan.tariffType.label}',
                      fontSize: 11.5,
                      textColor: AppColors.muted,
                    ),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  BaseText(
                    formatCurrency(candidate.estimatedAnnualCost, decimals: 0),
                    fontSize: 16,
                    textStyle: AppTypography.figureMedium,
                  ),
                  BaseText(
                    '${formatCurrency(candidate.estimatedMonthlyCost, decimals: 0)}/mo',
                    fontSize: 10.5,
                    textColor: AppColors.faint,
                  ),
                ],
              ),
            ],
          ),
          verticalSpace(10),
          Wrap(
            spacing: getSize(6),
            runSpacing: getSize(6),
            children: <Widget>[
              if (!isCurrent)
                StatusPill(
                  label: difference >= 0
                      ? '${formatCurrency(difference, decimals: 0)} less'
                      : '${formatCurrency(difference.abs(), decimals: 0)} more',
                  color: difference >= 0
                      ? AppColors.positive
                      : AppColors.negative,
                  icon: difference >= 0
                      ? Icons.trending_down_rounded
                      : Icons.trending_up_rounded,
                  dense: true,
                ),
              StatusPill(
                label: candidate.eligibility.label,
                color: candidate.eligibility.color,
                dense: true,
              ),
              if (candidate.plan.solarFeedInCents != null)
                StatusPill(
                  label:
                      '${candidate.plan.solarFeedInCents!.toStringAsFixed(1)}c feed-in',
                  color: AppColors.lagoon,
                  icon: Icons.wb_sunny_rounded,
                  dense: true,
                ),
              StatusPill(
                label:
                    '${candidate.plan.dailySupplyCents.toStringAsFixed(1)}c/day supply',
                color: AppColors.muted,
                dense: true,
              ),
            ],
          ),
          verticalSpace(10),
          ...candidate.breakdown
              .take(3)
              .map(
                (TariffComponent c) => EvidenceRow(
                  label: c.window == null
                      ? c.label
                      : '${c.label} · ${c.window}',
                  value: '${c.rate.toStringAsFixed(2)} ${c.unit}',
                ),
              ),
          if (candidate.plan.conditions.isNotEmpty) ...<Widget>[
            verticalSpace(6),
            BaseText(
              'Conditions: ${candidate.plan.conditions.join(', ')}',
              fontSize: 11,
              textColor: AppColors.faint,
              height: 1.4,
            ),
          ],
        ],
      ),
    );
  }
}
