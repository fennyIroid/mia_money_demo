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
import '../../../core/widgets/glass_panel.dart';
import '../../../core/widgets/mia_button.dart';
import '../../../core/widgets/mia_charts.dart';
import '../../../core/widgets/mia_inputs.dart';
import '../../../core/widgets/mia_scaffold.dart';
import '../../../core/widgets/mia_sheet.dart';
import '../../../core/widgets/pressable.dart';
import '../../../core/widgets/reveal.dart';
import '../../../data/dummy/dummy_money.dart';
import '../../../data/models/money_models.dart';
import '../bloc/split_bloc.dart';

@RoutePage()
class TransactionSplitView extends StatelessWidget {
  const TransactionSplitView({super.key, required this.transaction});

  final MiaTransaction transaction;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SplitBloc>(
      create: (BuildContext context) =>
          getIt<SplitBloc>()..add(SplitEvent.started(transaction)),
      child: SplitScaffold(transaction: transaction),
    );
  }
}

class SplitScaffold extends StatelessWidget {
  const SplitScaffold({super.key, required this.transaction});

  final MiaTransaction transaction;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SplitBloc, SplitState>(
      listenWhen: (SplitState p, SplitState c) => p.isSaved != c.isSaved,
      listener: (BuildContext context, SplitState state) {
        if (state.isSaved) {
          showMiaToast(
            context,
            message: 'Split saved. The parent is no longer counted separately.',
          );
          context.router.maybePop(true);
        }
      },
      builder: (BuildContext context, SplitState state) {
        final SplitBloc bloc = context.read<SplitBloc>();

        return MiaScaffold(
          title: 'Split transaction',
          overline: transaction.merchantDisplay,
          mood: AuroraMood.calm,
          bottomBar: MiaBottomBar(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Expanded(
                      child: BaseText(
                        state.balances
                            ? 'Splits balance to the cent'
                            : 'Remaining to allocate',
                        fontSize: 12,
                        textColor: state.balances
                            ? AppColors.positive
                            : AppColors.caution,
                      ),
                    ),
                    BaseText(
                      formatCurrency(state.remaining),
                      fontSize: 16,
                      textStyle: AppTypography.figureMedium,
                      textColor: state.balances
                          ? AppColors.positive
                          : AppColors.caution,
                    ),
                  ],
                ),
                verticalSpace(12),
                MiaButton(
                  label: 'Save split',
                  isEnabled: state.balances,
                  onTap: () => bloc.add(const SplitEvent.saved()),
                ),
              ],
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Reveal(
                child: GlassPanel(
                  tone: GlassTone.raised,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      BaseText(
                        'Parent transaction',
                        fontSize: 10,
                        textStyle: AppTypography.overline,
                      ),
                      verticalSpace(10),
                      BaseText(
                        formatCurrency(state.parentAmount),
                        fontSize: 32,
                        textStyle: AppTypography.figureLarge,
                      ),
                      verticalSpace(14),
                      ProportionBar(
                        value: state.parentAmount == 0
                            ? 0
                            : (state.allocated / state.parentAmount).abs(),
                        color: state.balances
                            ? AppColors.positive
                            : AppColors.ember,
                        height: 8,
                      ),
                    ],
                  ),
                ),
              ),
              verticalSpace(16),
              Reveal(
                index: 1,
                child: MiaSegmentedControl(
                  segments: SplitMethod.values
                      .map((SplitMethod m) => m.label)
                      .toList(),
                  selectedIndex: SplitMethod.values.indexOf(state.method),
                  onChanged: (int i) =>
                      bloc.add(SplitEvent.methodChanged(SplitMethod.values[i])),
                ),
              ),
              verticalSpace(16),
              ...List<Widget>.generate(state.lines.length, (int i) {
                final TransactionSplit line = state.lines[i];
                final MiaCategory category = DummyMoney.categoryById(
                  line.categoryId,
                );
                return Padding(
                  padding: EdgeInsets.only(bottom: getSize(10)),
                  child: Reveal(
                    index: 2 + i,
                    child: GlassPanel(
                      tone: GlassTone.soft,
                      child: Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Container(
                                width: getSize(34),
                                height: getSize(34),
                                decoration: BoxDecoration(
                                  color: withCustomOpacity(
                                    category.color,
                                    0.16,
                                  ),
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
                              if (state.lines.length > 1)
                                Pressable(
                                  onTap: () =>
                                      bloc.add(SplitEvent.lineRemoved(line.id)),
                                  pressedScale: 0.88,
                                  child: Icon(
                                    Icons.remove_circle_outline_rounded,
                                    size: getFontSize(18),
                                    color: AppColors.negative,
                                  ),
                                ),
                            ],
                          ),
                          verticalSpace(12),
                          MiaFormField(
                            initialValue: line.amount.toStringAsFixed(2),
                            keyboardType: const TextInputType.numberWithOptions(
                              decimal: true,
                              signed: true,
                            ),
                            fontSize: 18,
                            prefixIcon: Icons.attach_money_rounded,
                            onChanged: (String value) => bloc.add(
                              SplitEvent.lineAmountChanged(
                                lineId: line.id,
                                amount: double.tryParse(value) ?? 0,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }),
              verticalSpace(4),
              Reveal(
                index: 6,
                child: MiaButton(
                  label: 'Add another line',
                  variant: MiaButtonVariant.ghost,
                  size: MiaButtonSize.medium,
                  leadingIcon: Icons.add_rounded,
                  onTap: () =>
                      bloc.add(const SplitEvent.lineAdded('cat-shopping')),
                ),
              ),
              verticalSpace(16),
              Reveal(
                index: 7,
                child: GlassPanel(
                  tone: GlassTone.soft,
                  child: BaseText(
                    'Once saved, the parent transaction stops being counted on its own — only these lines flow into categories, budgets and reports.',
                    fontSize: 12,
                    textColor: AppColors.muted,
                    height: 1.5,
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
