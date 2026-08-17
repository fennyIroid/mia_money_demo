import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/di/injection.dart';
import '../../../core/router/app_router.gr.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/utils/currency_utils.dart';
import '../../../core/utils/math_utils.dart';
import '../../../core/utils/spacing_utils.dart';
import '../../../core/widgets/aurora_background.dart';
import '../../../core/widgets/bento_tile.dart';
import '../../../core/widgets/mia_button.dart';
import '../../../core/widgets/mia_inputs.dart';
import '../../../core/widgets/mia_scaffold.dart';
import '../../../core/widgets/mia_sheet.dart';
import '../../../core/widgets/mia_states.dart';
import '../../../core/widgets/reveal.dart';
import '../../../core/widgets/value_ticker.dart';
import '../../../data/models/admin_models.dart';
import '../bloc/bills_bloc.dart';
import '../widgets/bill_card.dart';

@RoutePage()
class BillsView extends StatelessWidget {
  const BillsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<BillsBloc>(
      create: (BuildContext context) =>
          getIt<BillsBloc>()..add(const BillsEvent.load()),
      child: const BillsScaffold(),
    );
  }
}

class BillsScaffold extends StatelessWidget {
  const BillsScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BillsBloc, BillsState>(
      builder: (BuildContext context, BillsState state) {
        final BillsBloc bloc = context.read<BillsBloc>();

        return MiaScaffold(
          title: 'Bills & obligations',
          overline: 'Recurring commitments',
          mood: AuroraMood.ember,
          actions: <Widget>[
            GlassIconButton(
              icon: Icons.add_rounded,
              diameter: 40,
              iconSize: 18,
              semanticLabel: 'Add a bill',
              onTap: () async {
                final Bill? created = await context.router.push<Bill>(
                  const BillEditorRoute(),
                );
                if (created == null || !context.mounted) return;
                bloc.add(const BillsEvent.load());
                showMiaToast(
                  context,
                  message:
                      '${created.provider} added at ${formatCurrency(created.amount)} ${created.frequency.label.toLowerCase()}.',
                  icon: Icons.receipt_long_rounded,
                );
              },
            ),
          ],
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Reveal(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: BentoTile(
                        label: 'Monthly commitment',
                        icon: Icons.repeat_rounded,
                        accent: AppColors.ember,
                        height: getSize(140),
                        figure: ValueTicker(
                          value: state.monthlyCommitment,
                          format: TickerFormat.currencyCompact,
                          fontSize: 28,
                        ),
                        caption: 'annualised across every frequency',
                      ),
                    ),
                    horizontalSpace(10),
                    Expanded(
                      child: BentoTile(
                        label: 'Irregular commitments',
                        icon: Icons.event_repeat_rounded,
                        accent: AppColors.violetHaze,
                        height: getSize(140),
                        figure: ValueTicker(
                          value: state.irregularCommitments.length.toDouble(),
                          format: TickerFormat.integer,
                          fontSize: 28,
                        ),
                        caption: 'quarterly, half-yearly and annual',
                      ),
                    ),
                  ],
                ),
              ),
              verticalSpace(16),
              Reveal(
                index: 1,
                child: MiaChipRow(
                  padding: EdgeInsets.zero,
                  labels: BillFilter.values
                      .map((BillFilter f) => f.label)
                      .toList(),
                  selectedIndex: BillFilter.values.indexOf(state.filter),
                  onChanged: (int i) =>
                      bloc.add(BillsEvent.filterChanged(BillFilter.values[i])),
                ),
              ),
              verticalSpace(16),
              if (!state.isReady)
                const SkeletonTileList(count: 6, tileHeight: 110)
              else if (state.visibleBills.isEmpty)
                const MiaStateView(kind: MiaStateKind.empty)
              else
                ...List<Widget>.generate(state.visibleBills.length, (int i) {
                  final Bill bill = state.visibleBills[i];
                  return Padding(
                    padding: EdgeInsets.only(bottom: getSize(8)),
                    child: Reveal(
                      index: i.clamp(0, 8),
                      child: BillCard(
                        bill: bill,
                        onTap: () async {
                          await context.router.push(
                            BillDetailRoute(bill: bill),
                          );
                          bloc.add(const BillsEvent.load());
                        },
                      ),
                    ),
                  );
                }),
            ],
          ),
        );
      },
    );
  }
}
