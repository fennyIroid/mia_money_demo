import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/di/injection.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_shapes.dart';
import '../../../core/theme/app_typography.dart';
import '../../../core/utils/color_utils.dart';
import '../../../core/utils/date_utils.dart';
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
class MiaHandledView extends StatelessWidget {
  const MiaHandledView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<InsightsBloc>(
      create: (BuildContext context) =>
          getIt<InsightsBloc>()..add(const InsightsEvent.load()),
      child: const MiaHandledScaffold(),
    );
  }
}

class MiaHandledScaffold extends StatelessWidget {
  const MiaHandledScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InsightsBloc, InsightsState>(
      builder: (BuildContext context, InsightsState state) {
        return MiaScaffold(
          title: 'Mia handled this',
          overline: 'Admin completed without you',
          mood: AuroraMood.calm,
          child: !state.isReady
              ? const SkeletonTileList(count: 6, tileHeight: 80)
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: List<Widget>.generate(state.handled.length, (
                    int i,
                  ) {
                    final HandledItem item = state.handled[i];
                    return Padding(
                      padding: EdgeInsets.only(bottom: getSize(8)),
                      child: Reveal(
                        index: i,
                        child: GlassPanel(
                          tone: GlassTone.soft,
                          child: Row(
                            children: <Widget>[
                              Container(
                                width: getSize(36),
                                height: getSize(36),
                                decoration: BoxDecoration(
                                  color: withCustomOpacity(item.accent, 0.14),
                                  borderRadius: AppRadii.rSm,
                                ),
                                child: Icon(
                                  item.icon,
                                  size: getFontSize(16),
                                  color: item.accent,
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
                                    ),
                                    verticalSpace(4),
                                    BaseText(
                                      item.detail,
                                      fontSize: 12,
                                      textColor: AppColors.muted,
                                      height: 1.4,
                                    ),
                                  ],
                                ),
                              ),
                              horizontalSpace(8),
                              BaseText(
                                relativeLabel(item.handledOn),
                                fontSize: 10.5,
                                textColor: AppColors.faint,
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
