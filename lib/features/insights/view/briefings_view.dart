import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/di/injection.dart';
import '../../../core/router/app_router.gr.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_shapes.dart';
import '../../../core/theme/app_typography.dart';
import '../../../core/utils/color_utils.dart';
import '../../../core/utils/math_utils.dart';
import '../../../core/utils/spacing_utils.dart';
import '../../../core/widgets/aurora_background.dart';
import '../../../core/widgets/base_text.dart';
import '../../../core/widgets/glass_panel.dart';
import '../../../core/widgets/mia_scaffold.dart';
import '../../../core/widgets/mia_states.dart';
import '../../../core/widgets/reveal.dart';
import '../../../data/models/insight_models.dart';
import '../bloc/insights_bloc.dart';

@RoutePage()
class BriefingsView extends StatelessWidget {
  const BriefingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<InsightsBloc>(
      create: (BuildContext context) =>
          getIt<InsightsBloc>()..add(const InsightsEvent.load()),
      child: const BriefingsScaffold(),
    );
  }
}

class BriefingsScaffold extends StatelessWidget {
  const BriefingsScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InsightsBloc, InsightsState>(
      builder: (BuildContext context, InsightsState state) {
        return MiaScaffold(
          title: 'Briefings',
          overline: 'Short, structured, permission aware',
          mood: AuroraMood.calm,
          child: !state.isReady
              ? const SkeletonTileList(count: 5, tileHeight: 110)
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: List<Widget>.generate(state.briefings.length, (
                    int i,
                  ) {
                    final BriefingCard card = state.briefings[i];
                    return Padding(
                      padding: EdgeInsets.only(bottom: getSize(10)),
                      child: Reveal(
                        index: i,
                        child: GlassPanel(
                          tone: GlassTone.soft,
                          onTap: card.id == 'br-1'
                              ? () => context.router.push(
                                  const WeeklyResetRoute(),
                                )
                              : null,
                          child: Row(
                            children: <Widget>[
                              Container(
                                width: getSize(40),
                                height: getSize(40),
                                decoration: BoxDecoration(
                                  color: withCustomOpacity(card.accent, 0.14),
                                  borderRadius: AppRadii.rSm,
                                ),
                                child: Icon(
                                  card.icon,
                                  size: getFontSize(18),
                                  color: card.accent,
                                ),
                              ),
                              horizontalSpace(12),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    BaseText(
                                      card.title,
                                      fontSize: 15,
                                      textStyle: AppTypography.titleSmall,
                                    ),
                                    verticalSpace(4),
                                    BaseText(
                                      card.body,
                                      fontSize: 12,
                                      textColor: AppColors.muted,
                                      height: 1.45,
                                    ),
                                  ],
                                ),
                              ),
                              horizontalSpace(8),
                              Icon(
                                Icons.chevron_right_rounded,
                                size: getFontSize(18),
                                color: AppColors.faint,
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
                ),
        );
      },
    );
  }
}
