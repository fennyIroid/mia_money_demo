import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/di/injection.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_typography.dart';
import '../../../core/utils/currency_utils.dart';
import '../../../core/utils/math_utils.dart';
import '../../../core/utils/spacing_utils.dart';
import '../../../core/widgets/aurora_background.dart';
import '../../../core/widgets/base_text.dart';
import '../../../core/widgets/bento_tile.dart';
import '../../../core/widgets/glass_panel.dart';
import '../../../core/widgets/mia_list_row.dart';
import '../../../core/widgets/mia_scaffold.dart';
import '../../../core/widgets/mia_states.dart';
import '../../../core/widgets/reveal.dart';
import '../../../core/widgets/value_ticker.dart';
import '../../../data/models/insight_models.dart';
import '../../money/widgets/calculation_meta_panel.dart';
import '../bloc/insights_bloc.dart';

@RoutePage()
class AvailableAfterObligationsView extends StatelessWidget {
  const AvailableAfterObligationsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<InsightsBloc>(
      create: (BuildContext context) =>
          getIt<InsightsBloc>()..add(const InsightsEvent.load()),
      child: const AvailableAfterObligationsScaffold(),
    );
  }
}

class AvailableAfterObligationsScaffold extends StatelessWidget {
  const AvailableAfterObligationsScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InsightsBloc, InsightsState>(
      builder: (BuildContext context, InsightsState state) {
        final AvailableAfterObligations? available = state.available;

        return MiaScaffold(
          title: 'Available after obligations',
          overline: available?.horizonLabel ?? 'This period',
          mood: AuroraMood.ember,
          child: available == null
              ? const SkeletonTileList(count: 4, tileHeight: 120)
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Reveal(
                      withScale: true,
                      child: BentoHeroTile(
                        label: 'Genuinely spendable',
                        icon: Icons.savings_rounded,
                        accent: AppColors.ember,
                        figure: ValueTicker(
                          value: available.available,
                          fontSize: 46,
                        ),
                        caption:
                            'Starting from ${formatCurrency(available.openingBalance)} in live balances',
                      ),
                    ),
                    verticalSpace(18),
                    Reveal(
                      index: 1,
                      child: GlassPanel(
                        tone: GlassTone.soft,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            BaseText(
                              'The working',
                              fontSize: 10,
                              textStyle: AppTypography.overline,
                            ),
                            verticalSpace(10),
                            ...available.lines.map(
                              (ObligationLine line) => Padding(
                                padding: EdgeInsets.symmetric(
                                  vertical: getSize(8),
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Icon(
                                      line.isDeduction
                                          ? Icons.remove_circle_outline_rounded
                                          : Icons.add_circle_outline_rounded,
                                      size: getFontSize(15),
                                      color: line.isDeduction
                                          ? AppColors.negative
                                          : AppColors.positive,
                                    ),
                                    horizontalSpace(10),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          BaseText(
                                            line.label,
                                            fontSize: 13.5,
                                            fontWeight: FontWeight.w600,
                                          ),
                                          if (line.detail != null) ...<Widget>[
                                            verticalSpace(3),
                                            BaseText(
                                              line.detail!,
                                              fontSize: 11.5,
                                              textColor: AppColors.muted,
                                              height: 1.4,
                                            ),
                                          ],
                                        ],
                                      ),
                                    ),
                                    horizontalSpace(8),
                                    MoneyLabel(
                                      text: formatCurrency(line.amount),
                                      fontSize: 14,
                                      color: line.isDeduction
                                          ? AppColors.negative
                                          : AppColors.positive,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    verticalSpace(16),
                    Reveal(
                      index: 2,
                      child: CalculationMetaPanel(meta: available.meta),
                    ),
                  ],
                ),
        );
      },
    );
  }
}
