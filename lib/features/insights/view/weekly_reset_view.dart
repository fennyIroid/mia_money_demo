import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/di/injection.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_shapes.dart';
import '../../../core/theme/app_typography.dart';
import '../../../core/utils/color_utils.dart';
import '../../../core/utils/math_utils.dart';
import '../../../core/utils/spacing_utils.dart';
import '../../../core/widgets/aurora_background.dart';
import '../../../core/widgets/base_text.dart';
import '../../../core/widgets/glass_panel.dart';
import '../../../core/widgets/mia_button.dart';
import '../../../core/widgets/mia_charts.dart';
import '../../../core/widgets/mia_scaffold.dart';
import '../../../core/widgets/mia_sheet.dart';
import '../../../core/widgets/mia_states.dart';
import '../../../core/widgets/reveal.dart';
import '../../../data/models/insight_models.dart';
import '../bloc/insights_bloc.dart';

@RoutePage()
class WeeklyResetView extends StatelessWidget {
  const WeeklyResetView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<InsightsBloc>(
      create: (BuildContext context) =>
          getIt<InsightsBloc>()..add(const InsightsEvent.load()),
      child: const WeeklyResetScaffold(),
    );
  }
}

class WeeklyResetScaffold extends StatelessWidget {
  const WeeklyResetScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InsightsBloc, InsightsState>(
      builder: (BuildContext context, InsightsState state) {
        final InsightsBloc bloc = context.read<InsightsBloc>();

        if (!state.isReady || state.weeklyReset.isEmpty) {
          return const MiaScaffold(
            title: 'Weekly reset',
            child: SkeletonTileList(count: 3, tileHeight: 200),
          );
        }

        final BriefingCard card = state.weeklyReset[state.resetStep];

        return MiaScaffold(
          title: 'Weekly reset',
          overline: 'Two to five minutes',
          mood: AuroraMood.ember,
          bottomBar: MiaBottomBar(
            child: Row(
              children: <Widget>[
                if (state.resetStep > 0) ...<Widget>[
                  MiaButton(
                    label: 'Back',
                    variant: MiaButtonVariant.outline,
                    expanded: false,
                    onTap: () => bloc.add(
                      InsightsEvent.resetStepChanged(state.resetStep - 1),
                    ),
                  ),
                  horizontalSpace(10),
                ],
                Expanded(
                  child: MiaButton(
                    label: state.isLastResetStep ? 'Done for the week' : 'Next',
                    onTap: () {
                      if (state.isLastResetStep) {
                        bloc.add(const InsightsEvent.weeklyResetCompleted());
                        showMiaToast(
                          context,
                          message:
                              'Reset done for this week. Nothing underneath was changed by reviewing it.',
                        );
                        context.router.maybePop();
                      } else {
                        bloc.add(
                          InsightsEvent.resetStepChanged(state.resetStep + 1),
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              ProportionBar(
                value: state.resetProgress,
                color: AppColors.ember,
                height: 4,
              ),
              verticalSpace(20),
              KeyedSubtree(
                key: ValueKey<int>(state.resetStep),
                child: Reveal(
                  withScale: true,
                  withBlur: true,
                  child: GlassPanel(
                    tone: GlassTone.raised,
                    borderRadius: AppRadii.rXxl,
                    padding: EdgeInsets.all(getSize(22)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Container(
                              width: getSize(44),
                              height: getSize(44),
                              decoration: BoxDecoration(
                                color: withCustomOpacity(card.accent, 0.14),
                                borderRadius: AppRadii.rMd,
                                border: Border.all(
                                  color: withCustomOpacity(card.accent, 0.34),
                                ),
                              ),
                              child: Icon(
                                card.icon,
                                size: getFontSize(20),
                                color: card.accent,
                              ),
                            ),
                            horizontalSpace(12),
                            Expanded(
                              child: BaseText(
                                card.overline,
                                fontSize: 10,
                                textStyle: AppTypography.overline,
                                textColor: card.accent,
                              ),
                            ),
                          ],
                        ),
                        verticalSpace(18),
                        BaseText(
                          card.title,
                          fontSize: 26,
                          textStyle: AppTypography.titleLarge,
                          height: 1.15,
                        ),
                        if (card.figure != null) ...<Widget>[
                          verticalSpace(14),
                          BaseText(
                            card.figure!,
                            fontSize: 40,
                            textStyle: AppTypography.figureLarge,
                            textColor: card.accent,
                          ),
                        ],
                        verticalSpace(14),
                        BaseText(
                          card.body,
                          fontSize: 14,
                          textColor: AppColors.mist,
                          height: 1.55,
                        ),
                        if (card.items.isNotEmpty) ...<Widget>[
                          verticalSpace(18),
                          ...card.items.map(
                            (String item) => Padding(
                              padding: EdgeInsets.only(bottom: getSize(8)),
                              child: Row(
                                children: <Widget>[
                                  Icon(
                                    Icons.chevron_right_rounded,
                                    size: getFontSize(14),
                                    color: card.accent,
                                  ),
                                  horizontalSpace(8),
                                  Expanded(
                                    child: BaseText(
                                      item,
                                      fontSize: 13,
                                      textColor: AppColors.mist,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ],
                    ),
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
