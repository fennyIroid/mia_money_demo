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
import '../../../core/widgets/mia_inputs.dart';
import '../../../core/widgets/mia_list_row.dart';
import '../../../core/widgets/mia_scaffold.dart';
import '../../../core/widgets/mia_sheet.dart';
import '../../../core/widgets/mia_states.dart';
import '../../../core/widgets/reveal.dart';
import '../../../core/widgets/section_header.dart';
import '../../../core/widgets/status_pill.dart';
import '../../../core/widgets/value_ticker.dart';
import '../../../data/models/loan_models.dart';
import '../../money/widgets/calculation_meta_panel.dart';
import '../bloc/loan_lens_bloc.dart';

@RoutePage()
class LoanLensView extends StatelessWidget {
  const LoanLensView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoanLensBloc>(
      create: (BuildContext context) =>
          getIt<LoanLensBloc>()..add(const LoanLensEvent.load()),
      child: const LoanLensScaffold(),
    );
  }
}

class LoanLensScaffold extends StatelessWidget {
  const LoanLensScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoanLensBloc, LoanLensState>(
      builder: (BuildContext context, LoanLensState state) {
        final LoanLensBloc bloc = context.read<LoanLensBloc>();
        final LoanLensResult? result = state.result;

        return MiaScaffold(
          title: 'Loan Lens',
          overline: 'Factual product comparison',
          mood: AuroraMood.glacier,
          child: !state.isReady || result == null
              ? const SkeletonTileList(count: 4, tileHeight: 150)
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Reveal(
                      child: MiaSegmentedControl(
                        segments: const <String>['Home loan', 'Personal loan'],
                        selectedIndex:
                            state.filters.productType ==
                                LoanProductType.homeLoan
                            ? 0
                            : 1,
                        accent: AppColors.glacier,
                        onChanged: (int i) => bloc.add(
                          LoanLensEvent.productTypeChanged(
                            i == 0
                                ? LoanProductType.homeLoan
                                : LoanProductType.personalLoan,
                          ),
                        ),
                      ),
                    ),
                    verticalSpace(16),
                    Reveal(
                      index: 1,
                      withScale: true,
                      child: BentoHeroTile(
                        label: state.filters.objective.label,
                        icon: Icons.balance_rounded,
                        accent: AppColors.glacier,
                        figure: ValueTicker(
                          value: result.matches.isEmpty
                              ? 0
                              : result.matches.first.product.advertisedRate,
                          format: TickerFormat.percent,
                          decimals: 2,
                          fontSize: 42,
                        ),
                        caption: result.matches.isEmpty
                            ? 'No products match your filters'
                            : 'Lowest among the products compared · your current rate is ${result.currentLoanRate.toStringAsFixed(2)}%',
                        footer: Row(
                          children: <Widget>[
                            Expanded(
                              child: LoanStat(
                                label: 'Repayment',
                                value: result.matches.isEmpty
                                    ? '—'
                                    : formatCurrency(
                                        result.matches.first.monthlyRepayment,
                                        decimals: 0,
                                      ),
                              ),
                            ),
                            Expanded(
                              child: LoanStat(
                                label: 'Now',
                                value: formatCurrency(
                                  result.currentLoanRepayment,
                                  decimals: 0,
                                ),
                              ),
                            ),
                            Expanded(
                              child: LoanStat(
                                label: 'LVR',
                                value:
                                    '${state.filters.lvr.toStringAsFixed(1)}%',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    verticalSpace(16),
                    Reveal(
                      index: 2,
                      child: GlassPanel(
                        tone: GlassTone.soft,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            BaseText(
                              'Ranking objective',
                              fontSize: 10,
                              textStyle: AppTypography.overline,
                            ),
                            verticalSpace(10),
                            ...LoanRankingObjective.values.map(
                              (LoanRankingObjective objective) => Padding(
                                padding: EdgeInsets.only(bottom: getSize(8)),
                                child: MiaChoiceCard(
                                  title: objective.label,
                                  selected:
                                      state.filters.objective == objective,
                                  accent: AppColors.glacier,
                                  onTap: () => bloc.add(
                                    LoanLensEvent.objectiveChanged(objective),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    verticalSpace(16),
                    Reveal(
                      index: 3,
                      child: GlassPanel(
                        tone: GlassTone.soft,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            BaseText(
                              'Lender universe',
                              fontSize: 10,
                              textStyle: AppTypography.overline,
                            ),
                            verticalSpace(10),
                            MiaToggleChips(
                              labels: LenderGroup.values
                                  .map((LenderGroup g) => g.label)
                                  .toList(),
                              selected: state.filters.groups
                                  .map((LenderGroup g) => g.label)
                                  .toSet(),
                              onToggle: (String label) {
                                final LenderGroup group = LenderGroup.values
                                    .firstWhere(
                                      (LenderGroup g) => g.label == label,
                                    );
                                bloc.add(LoanLensEvent.groupToggled(group));
                              },
                            ),
                            verticalSpace(14),
                            BaseText(
                              'Required features',
                              fontSize: 10,
                              textStyle: AppTypography.overline,
                            ),
                            verticalSpace(10),
                            MiaToggleChips(
                              labels: LoanLensStateX.selectableFeatures,
                              selected: state.filters.requiredFeatures,
                              accent: AppColors.lagoon,
                              onToggle: (String feature) => bloc.add(
                                LoanLensEvent.featureToggled(feature),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    verticalSpace(20),
                    Reveal(
                      index: 4,
                      child: SectionHeader(
                        overline: 'Ranked mathematically',
                        title: 'Matching products',
                        actionLabel: 'Market view',
                        onActionTap: () => showMiaSheet<void>(
                          context: context,
                          title: 'Market view',
                          overline: 'Lowest in each lender group',
                          child: Column(
                            children: result.marketViewLowestByGroup.entries
                                .map(
                                  (
                                    MapEntry<LenderGroup, LoanLensMatch> entry,
                                  ) => EvidenceRow(
                                    label: entry.key.label,
                                    value:
                                        '${entry.value.product.lenderBrand} ${entry.value.product.advertisedRate.toStringAsFixed(2)}%',
                                  ),
                                )
                                .toList(),
                          ),
                        ),
                      ),
                    ),
                    if (result.matches.isEmpty)
                      const MiaStateView(
                        kind: MiaStateKind.empty,
                        title: 'Nothing matches those filters',
                        message:
                            'Broaden your lender universe or relax a required feature.',
                      )
                    else
                      ...List<Widget>.generate(
                        result.matches.length,
                        (int i) => Padding(
                          padding: EdgeInsets.only(bottom: getSize(8)),
                          child: Reveal(
                            index: 5 + i,
                            child: LoanMatchCard(match: result.matches[i]),
                          ),
                        ),
                      ),
                    verticalSpace(12),
                    if (result.broaderMarketNotice != null)
                      Reveal(
                        index: 10,
                        child: MiaNoticeStrip(
                          message: result.broaderMarketNotice!,
                          icon: Icons.travel_explore_rounded,
                          accent: AppColors.caution,
                        ),
                      ),
                    verticalSpace(12),
                    Reveal(
                      index: 11,
                      child: MiaNoticeStrip(
                        message: result.coverageNote,
                        icon: Icons.inventory_rounded,
                        accent: AppColors.glacier,
                      ),
                    ),
                    verticalSpace(16),
                    Reveal(
                      index: 12,
                      child: CalculationMetaPanel(meta: result.meta),
                    ),
                    verticalSpace(16),
                    Reveal(
                      index: 13,
                      child: GlassPanel(
                        tone: GlassTone.soft,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            BaseText(
                              'Boundaries',
                              fontSize: 10,
                              textStyle: AppTypography.overline,
                            ),
                            verticalSpace(8),
                            BaseText(
                              'These are the lowest-cost products matching your selected filters, among the products compared and within your selected lender groups. Mia does not assess serviceability, predict approval, recommend a lender, assist with an application or transmit your details.',
                              fontSize: 12,
                              textColor: AppColors.mist,
                              height: 1.55,
                            ),
                            verticalSpace(10),
                            const EvidenceRow(
                              label: 'Commercial neutrality',
                              value: 'No paid placement affects order',
                              valueColor: AppColors.positive,
                            ),
                            const EvidenceRow(
                              label: 'Comparison rate',
                              value: 'Lender published only',
                            ),
                            const EvidenceRow(
                              label: 'Your transactions',
                              value: 'Not used to judge suitability',
                            ),
                          ],
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

class LoanStat extends StatelessWidget {
  const LoanStat({super.key, required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        BaseText(
          label.toUpperCase(),
          fontSize: 8.5,
          textStyle: AppTypography.overline,
          textColor: AppColors.glacier,
        ),
        verticalSpace(4),
        BaseText(value, fontSize: 14, textStyle: AppTypography.figureMedium),
      ],
    );
  }
}

class LoanMatchCard extends StatelessWidget {
  const LoanMatchCard({super.key, required this.match});

  final LoanLensMatch match;

  @override
  Widget build(BuildContext context) {
    final LoanProduct product = match.product;

    return GlassPanel(
      tone: GlassTone.soft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                width: getSize(30),
                height: getSize(30),
                decoration: BoxDecoration(
                  color: withCustomOpacity(product.lenderGroup.color, 0.16),
                  borderRadius: AppRadii.rXs,
                ),
                alignment: Alignment.center,
                child: BaseText(
                  '${match.rank}',
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  textAlign: TextAlign.center,
                  textColor: product.lenderGroup.color,
                ),
              ),
              horizontalSpace(10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    BaseText(
                      product.productName,
                      fontSize: 14,
                      textStyle: AppTypography.titleSmall,
                      maxLines: 2,
                    ),
                    verticalSpace(3),
                    BaseText(
                      '${product.lenderBrand} · ${product.lenderGroup.label}',
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
                    '${product.advertisedRate.toStringAsFixed(2)}%',
                    fontSize: 17,
                    textStyle: AppTypography.figureMedium,
                  ),
                  BaseText(
                    '${product.comparisonRate.toStringAsFixed(2)}% comparison',
                    fontSize: 10,
                    textColor: AppColors.faint,
                  ),
                ],
              ),
            ],
          ),
          verticalSpace(12),
          EvidenceRow(
            label: 'Repayment estimate',
            value: '${formatCurrency(match.monthlyRepayment)} a month',
          ),
          EvidenceRow(
            label: 'Known fees',
            value: formatCurrency(match.knownFees),
          ),
          EvidenceRow(
            label: 'Estimated total cost',
            value: formatCurrency(match.estimatedTotalCost, decimals: 0),
          ),
          if (match.monthlyDifferenceVsCurrent != null)
            EvidenceRow(
              label: 'Versus your current loan',
              value:
                  '${formatCurrency(match.monthlyDifferenceVsCurrent!, showSign: true)} a month',
              valueColor: match.monthlyDifferenceVsCurrent! < 0
                  ? AppColors.positive
                  : AppColors.negative,
            ),
          if (match.breakEvenMonths != null)
            EvidenceRow(
              label: 'Break even',
              value: '${match.breakEvenMonths} months',
            ),
          verticalSpace(10),
          Wrap(
            spacing: getSize(6),
            runSpacing: getSize(6),
            children: <Widget>[
              const StatusPill(
                label: 'Eligibility not assessed',
                color: AppColors.caution,
                icon: Icons.help_outline_rounded,
                dense: true,
              ),
              ...product.features
                  .take(3)
                  .map(
                    (String f) => StatusPill(
                      label: f,
                      color: AppColors.lagoon,
                      dense: true,
                    ),
                  ),
            ],
          ),
          verticalSpace(10),
          BaseText(
            'Why it matched: ${match.matchReasons.join(' · ')}',
            fontSize: 11,
            textColor: AppColors.faint,
            height: 1.45,
          ),
        ],
      ),
    );
  }
}
