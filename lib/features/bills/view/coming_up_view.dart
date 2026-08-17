import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/di/injection.dart';
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
import '../../../core/widgets/mia_charts.dart';
import '../../../core/widgets/mia_inputs.dart';
import '../../../core/widgets/mia_list_row.dart';
import '../../../core/widgets/mia_scaffold.dart';
import '../../../core/widgets/mia_states.dart';
import '../../../core/widgets/reveal.dart';
import '../../../core/widgets/status_pill.dart';
import '../../../core/widgets/value_ticker.dart';
import '../../../data/models/admin_models.dart';
import '../bloc/bills_bloc.dart';
import '../../../data/models/core_models.dart';

@RoutePage()
class ComingUpView extends StatelessWidget {
  const ComingUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<BillsBloc>(
      create: (BuildContext context) =>
          getIt<BillsBloc>()..add(const BillsEvent.load()),
      child: const ComingUpScaffold(),
    );
  }
}

class ComingUpScaffold extends StatelessWidget {
  const ComingUpScaffold({super.key});

  static const List<int> horizons = <int>[7, 14, 30];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BillsBloc, BillsState>(
      builder: (BuildContext context, BillsState state) {
        final BillsBloc bloc = context.read<BillsBloc>();
        final List<TimelineItem> items = state.horizonItems;

        return MiaScaffold(
          title: 'Coming up',
          overline: 'No surprises',
          mood: AuroraMood.glacier,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Reveal(
                child: MiaSegmentedControl(
                  segments: horizons.map((int d) => '$d days').toList(),
                  selectedIndex: horizons.indexOf(state.horizonDays),
                  accent: AppColors.glacier,
                  onChanged: (int i) =>
                      bloc.add(BillsEvent.horizonChanged(horizons[i])),
                ),
              ),
              verticalSpace(16),
              Reveal(
                index: 1,
                withScale: true,
                child: GlassPanel(
                  tone: GlassTone.raised,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      BaseText(
                        'Confirmed obligations',
                        fontSize: 10,
                        textStyle: AppTypography.overline,
                      ),
                      verticalSpace(10),
                      ValueTicker(value: state.horizonOutflow, fontSize: 38),
                      verticalSpace(14),
                      StackedFlowBar(
                        segments: <FlowSegment>[
                          FlowSegment(
                            label:
                                'Income ${formatCurrencyCompact(state.horizonInflow)}',
                            value: state.horizonInflow,
                            color: AppColors.positive,
                          ),
                          FlowSegment(
                            label:
                                'Obligations ${formatCurrencyCompact(state.horizonOutflow)}',
                            value: state.horizonOutflow,
                            color: AppColors.ember,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              verticalSpace(20),
              if (!state.isReady)
                const SkeletonTileList(count: 6, tileHeight: 78)
              else if (items.isEmpty)
                const MiaStateView(kind: MiaStateKind.empty)
              else
                ...List<Widget>.generate(items.length, (int i) {
                  return Padding(
                    padding: EdgeInsets.only(bottom: getSize(8)),
                    child: Reveal(
                      index: i.clamp(0, 8),
                      child: TimelineCard(item: items[i]),
                    ),
                  );
                }),
              verticalSpace(20),
              Reveal(
                index: 9,
                child: GlassPanel(
                  tone: GlassTone.soft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      BaseText(
                        'Irregular commitments',
                        fontSize: 10,
                        textStyle: AppTypography.overline,
                      ),
                      verticalSpace(10),
                      ...state.irregularCommitments.map((Bill bill) {
                        return EvidenceRow(
                          label: '${bill.provider} · ${bill.frequency.label}',
                          value:
                              '${formatCurrency(bill.monthlyEquivalent)} / mo',
                          icon: bill.kind.icon,
                        );
                      }),
                      verticalSpace(8),
                      BaseText(
                        'Shown as an equivalent only. No money has been set aside.',
                        fontSize: 11,
                        textColor: AppColors.faint,
                        height: 1.45,
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

class TimelineCard extends StatelessWidget {
  const TimelineCard({super.key, required this.item});

  final TimelineItem item;

  @override
  Widget build(BuildContext context) {
    return GlassPanel(
      tone: GlassTone.soft,
      padding: EdgeInsets.symmetric(
        horizontal: getSize(14),
        vertical: getSize(12),
      ),
      child: Row(
        children: <Widget>[
          Container(
            width: getSize(46),
            padding: EdgeInsets.symmetric(vertical: getSize(6)),
            decoration: BoxDecoration(
              color: withCustomOpacity(
                item.isIncome ? AppColors.positive : AppColors.ember,
                0.12,
              ),
              borderRadius: AppRadii.rSm,
            ),
            child: Column(
              children: <Widget>[
                BaseText(
                  formatDayMonth(item.date).split(' ').first,
                  fontSize: 16,
                  textStyle: AppTypography.figureMedium,
                ),
                BaseText(
                  formatDayMonth(item.date).split(' ').last,
                  fontSize: 9,
                  textStyle: AppTypography.overline,
                ),
              ],
            ),
          ),
          horizontalSpace(12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                BaseText(
                  item.title,
                  fontSize: 14,
                  textStyle: AppTypography.titleSmall,
                  maxLines: 1,
                ),
                verticalSpace(6),
                Wrap(
                  spacing: getSize(5),
                  runSpacing: getSize(5),
                  children: <Widget>[
                    StatusPill(
                      label: item.isConfirmed ? 'Confirmed' : 'Predicted',
                      color: item.isConfirmed
                          ? AppColors.positive
                          : AppColors.caution,
                      dense: true,
                    ),
                    StatusPill(
                      label: item.source.label,
                      color: item.source.color,
                      icon: item.source.icon,
                      dense: true,
                    ),
                    if (item.frequency != null)
                      StatusPill(
                        label: item.frequency!.label,
                        color: AppColors.glacier,
                        dense: true,
                      ),
                  ],
                ),
                if (item.note != null) ...<Widget>[
                  verticalSpace(6),
                  BaseText(
                    item.note!,
                    fontSize: 11,
                    textColor: AppColors.faint,
                  ),
                ],
              ],
            ),
          ),
          horizontalSpace(8),
          MoneyLabel(
            text: formatCurrency(item.amount, showSign: true),
            isCredit: item.isIncome,
            fontSize: 15,
          ),
        ],
      ),
    );
  }
}
