import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/di/injection.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/utils/currency_utils.dart';
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
import '../../money/widgets/calculation_meta_panel.dart';
import '../bloc/insights_bloc.dart';

@RoutePage()
class TrueCostOfLifeView extends StatelessWidget {
  const TrueCostOfLifeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<InsightsBloc>(
      create: (BuildContext context) =>
          getIt<InsightsBloc>()..add(const InsightsEvent.load()),
      child: const TrueCostOfLifeScaffold(),
    );
  }
}

class TrueCostOfLifeScaffold extends StatelessWidget {
  const TrueCostOfLifeScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InsightsBloc, InsightsState>(
      builder: (BuildContext context, InsightsState state) {
        final TrueCostOfLife? cost = state.trueCost;

        return MiaScaffold(
          title: 'True cost of life',
          overline: 'Recurring plus annualised irregular',
          mood: AuroraMood.balanced,
          child: cost == null
              ? const SkeletonTileList(count: 4, tileHeight: 120)
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Reveal(
                      withScale: true,
                      child: BentoHeroTile(
                        label: 'What life actually costs',
                        icon: Icons.public_rounded,
                        accent: AppColors.violetHaze,
                        figure: ValueTicker(
                          value: cost.monthlyTotal,
                          fontSize: 44,
                        ),
                        caption:
                            'a month · ${formatCurrency(cost.annualTotal, decimals: 0)} a year',
                        footer: StackedFlowBar(
                          segments: cost.components
                              .map(
                                (TrueCostComponent c) => FlowSegment(
                                  label: c.label,
                                  value: c.monthlyAmount,
                                  color: c.color,
                                ),
                              )
                              .toList(),
                        ),
                      ),
                    ),
                    verticalSpace(18),
                    ...List<Widget>.generate(cost.components.length, (int i) {
                      final TrueCostComponent component = cost.components[i];
                      return Padding(
                        padding: EdgeInsets.only(bottom: getSize(8)),
                        child: Reveal(
                          index: i,
                          child: GlassPanel(
                            tone: GlassTone.soft,
                            padding: EdgeInsets.symmetric(
                              horizontal: getSize(14),
                              vertical: getSize(13),
                            ),
                            child: Row(
                              children: <Widget>[
                                Container(
                                  width: getSize(10),
                                  height: getSize(10),
                                  decoration: BoxDecoration(
                                    color: component.color,
                                    shape: BoxShape.circle,
                                  ),
                                ),
                                horizontalSpace(12),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      BaseText(
                                        component.label,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                      ),
                                      verticalSpace(3),
                                      BaseText(
                                        '${component.itemCount} items',
                                        fontSize: 11,
                                        textColor: AppColors.faint,
                                      ),
                                    ],
                                  ),
                                ),
                                if (component.isIrregular)
                                  const StatusPill(
                                    label: 'Annualised',
                                    color: AppColors.caution,
                                    dense: true,
                                  ),
                                horizontalSpace(8),
                                MoneyLabel(
                                  text: formatCurrency(
                                    component.monthlyAmount,
                                    decimals: 0,
                                  ),
                                  fontSize: 15,
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
                    verticalSpace(12),
                    Reveal(
                      index: 7,
                      child: CalculationMetaPanel(meta: cost.meta),
                    ),
                  ],
                ),
        );
      },
    );
  }
}
