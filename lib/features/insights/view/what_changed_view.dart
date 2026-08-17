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
import '../../../core/widgets/mia_scaffold.dart';
import '../../../core/widgets/mia_states.dart';
import '../../../core/widgets/reveal.dart';
import '../../../core/widgets/status_pill.dart';
import '../../../data/models/insight_models.dart';
import '../bloc/insights_bloc.dart';

@RoutePage()
class WhatChangedView extends StatelessWidget {
  const WhatChangedView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<InsightsBloc>(
      create: (BuildContext context) =>
          getIt<InsightsBloc>()..add(const InsightsEvent.load()),
      child: const WhatChangedScaffold(),
    );
  }
}

class WhatChangedScaffold extends StatelessWidget {
  const WhatChangedScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InsightsBloc, InsightsState>(
      builder: (BuildContext context, InsightsState state) {
        return MiaScaffold(
          title: 'What changed',
          overline: 'Against the prior period',
          mood: AuroraMood.balanced,
          child: !state.isReady
              ? const SkeletonTileList(count: 5, tileHeight: 110)
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    ...List<Widget>.generate(state.whatChanged.length, (int i) {
                      final WhatChangedItem item = state.whatChanged[i];
                      return Padding(
                        padding: EdgeInsets.only(bottom: getSize(10)),
                        child: Reveal(
                          index: i,
                          child: GlassPanel(
                            tone: GlassTone.soft,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Container(
                                      width: getSize(38),
                                      height: getSize(38),
                                      decoration: BoxDecoration(
                                        color: withCustomOpacity(
                                          item.accent,
                                          0.14,
                                        ),
                                        borderRadius: AppRadii.rSm,
                                      ),
                                      child: Icon(
                                        item.icon,
                                        size: getFontSize(17),
                                        color: item.accent,
                                      ),
                                    ),
                                    horizontalSpace(12),
                                    Expanded(
                                      child: BaseText(
                                        item.title,
                                        fontSize: 15,
                                        textStyle: AppTypography.titleSmall,
                                        maxLines: 2,
                                      ),
                                    ),
                                    DeltaBadge(
                                      value: item.percent,
                                      invertColours:
                                          item.direction ==
                                          ChangeDirection.down,
                                      fontSize: 12,
                                    ),
                                  ],
                                ),
                                verticalSpace(10),
                                BaseText(
                                  item.detail,
                                  fontSize: 12.5,
                                  textColor: AppColors.muted,
                                  height: 1.45,
                                ),
                                verticalSpace(10),
                                Row(
                                  children: <Widget>[
                                    StatusPill(
                                      label: formatCurrency(
                                        item.amount,
                                        showSign: true,
                                      ),
                                      color: item.accent,
                                      dense: true,
                                    ),
                                    horizontalSpace(6),
                                    if (item.evidence.isNotEmpty)
                                      StatusPill(
                                        label:
                                            '${item.evidence.length} evidence links',
                                        color: AppColors.glacier,
                                        icon: Icons.link_rounded,
                                        dense: true,
                                      ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
                    verticalSpace(10),
                    Reveal(
                      index: 6,
                      child: MiaNoticeStrip(
                        message:
                            'When a prior period is zero, Mia shows a "new" state rather than an invalid percentage.',
                        icon: Icons.functions_rounded,
                        accent: AppColors.lagoon,
                      ),
                    ),
                  ],
                ),
        );
      },
    );
  }
}
