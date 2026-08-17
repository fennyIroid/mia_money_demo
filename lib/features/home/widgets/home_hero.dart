import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../core/router/app_router.gr.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_typography.dart';
import '../../../core/utils/currency_utils.dart';
import '../../../core/utils/date_utils.dart';
import '../../../core/utils/math_utils.dart';
import '../../../core/utils/spacing_utils.dart';
import '../../../core/widgets/base_text.dart';
import '../../../core/widgets/bento_tile.dart';
import '../../../core/widgets/mia_charts.dart';
import '../../../core/widgets/status_pill.dart';
import '../../../core/widgets/value_ticker.dart';
import '../../../data/models/insight_models.dart';
import '../../../data/models/core_models.dart';

/// The single most important figure on Home: what is genuinely spendable once
/// every confirmed obligation is accounted for.
class HomeHero extends StatelessWidget {
  const HomeHero({super.key, required this.available});

  final AvailableAfterObligations available;

  @override
  Widget build(BuildContext context) {
    final double committed = available.lines
        .where((ObligationLine l) => l.isDeduction)
        .fold<double>(0, (double s, ObligationLine l) => s + l.amount);
    final double inflow = available.lines
        .where((ObligationLine l) => !l.isDeduction)
        .fold<double>(0, (double s, ObligationLine l) => s + l.amount);

    return BentoHeroTile(
      label: 'Available after obligations',
      icon: Icons.savings_rounded,
      accent: AppColors.ember,
      onTap: () => context.router.push(const AvailableAfterObligationsRoute()),
      trailing: FreshnessChip(
        label: relativeLabel(available.meta.asOf),
        color: AppColors.positive,
        pulse: true,
      ),
      figure: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Flexible(
            child: ValueTicker(value: available.available, fontSize: 46),
          ),
          horizontalSpace(10),
          Flexible(
            child: Padding(
              padding: EdgeInsets.only(bottom: getSize(9)),
              child: BaseText(
                available.horizonLabel,
                fontSize: 12,
                textColor: AppColors.muted,
                maxLines: 1,
              ),
            ),
          ),
        ],
      ),
      caption:
          '${available.meta.recordCount} records · ${available.meta.completeness.label.toLowerCase()}',
      footer: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          StackedFlowBar(
            height: 10,
            segments: <FlowSegment>[
              FlowSegment(
                label:
                    'Available ${formatCurrencyCompact(available.available)}',
                value: available.available,
                color: AppColors.positive,
              ),
              FlowSegment(
                label: 'Committed ${formatCurrencyCompact(committed)}',
                value: committed,
                color: AppColors.ember,
              ),
            ],
          ),
          verticalSpace(12),
          Row(
            children: <Widget>[
              Expanded(
                child: HomeHeroStat(
                  label: 'In',
                  value: formatCurrency(inflow),
                  color: AppColors.positive,
                ),
              ),
              Expanded(
                child: HomeHeroStat(
                  label: 'Committed',
                  value: formatCurrency(committed),
                  color: AppColors.ember,
                ),
              ),
              Expanded(
                child: HomeHeroStat(
                  label: 'Held back',
                  value: formatCurrency(398.10),
                  color: AppColors.caution,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class HomeHeroStat extends StatelessWidget {
  const HomeHeroStat({
    super.key,
    required this.label,
    required this.value,
    required this.color,
  });

  final String label;
  final String value;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        BaseText(
          label.toUpperCase(),
          fontSize: 9,
          textStyle: AppTypography.overline,
          textColor: color,
        ),
        verticalSpace(4),
        BaseText(value, fontSize: 14, textStyle: AppTypography.figureMedium),
      ],
    );
  }
}
