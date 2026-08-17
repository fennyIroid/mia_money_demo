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
import '../../../core/widgets/mia_inputs.dart';
import '../../../core/widgets/mia_list_row.dart';
import '../../../core/widgets/mia_states.dart';
import '../../../core/widgets/reveal.dart';
import '../../../core/widgets/status_pill.dart';
import '../../../data/models/assistant_models.dart';
import '../bloc/discovery_bloc.dart';

@RoutePage()
class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<DiscoveryBloc>(
      create: (BuildContext context) =>
          getIt<DiscoveryBloc>()..add(const DiscoveryEvent.load()),
      child: const SearchScaffold(),
    );
  }
}

class SearchScaffold extends StatelessWidget {
  const SearchScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DiscoveryBloc, DiscoveryState>(
      builder: (BuildContext context, DiscoveryState state) {
        final DiscoveryBloc bloc = context.read<DiscoveryBloc>();

        return Scaffold(
          backgroundColor: AppColors.ink,
          body: AuroraBackground(
            mood: AuroraMood.calm,
            child: SafeArea(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(getSize(16)),
                    child: Row(
                      children: <Widget>[
                        GlassIconButton(
                          icon: Icons.arrow_back_ios_new_rounded,
                          iconSize: 14,
                          diameter: 38,
                          onTap: () => context.router.maybePop(),
                        ),
                        horizontalSpace(12),
                        Expanded(
                          child: MiaSearchField(
                            autofocus: true,
                            hint: 'Anything you are allowed to see',
                            onChanged: (String value) =>
                                bloc.add(DiscoveryEvent.searchChanged(value)),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: state.query.isEmpty
                        ? Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: getSize(20),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: <Widget>[
                                MiaNoticeStrip(
                                  message:
                                      'Search respects household and record permissions. Private records never appear, and results never let you infer that they exist.',
                                  icon: Icons.lock_rounded,
                                  accent: AppColors.violetHaze,
                                ),
                                verticalSpace(20),
                                BaseText(
                                  'Searchable',
                                  fontSize: 10,
                                  textStyle: AppTypography.overline,
                                ),
                                verticalSpace(12),
                                Wrap(
                                  spacing: getSize(8),
                                  runSpacing: getSize(8),
                                  children: SearchResultKind.values
                                      .map(
                                        (SearchResultKind k) => StatusPill(
                                          label: k.label,
                                          color: AppColors.glacier,
                                          icon: k.icon,
                                          dense: true,
                                        ),
                                      )
                                      .toList(),
                                ),
                              ],
                            ),
                          )
                        : state.results.isEmpty && !state.isSearching
                        ? Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: getSize(20),
                            ),
                            child: const MiaStateView(
                              kind: MiaStateKind.empty,
                              title: 'Nothing matched',
                              message:
                                  'Try a merchant, an amount, a serial number or a category.',
                            ),
                          )
                        : ListView.separated(
                            physics: const BouncingScrollPhysics(),
                            padding: EdgeInsets.symmetric(
                              horizontal: getSize(20),
                              vertical: getSize(8),
                            ),
                            itemCount: state.results.length,
                            separatorBuilder: (BuildContext context, int i) =>
                                verticalSpace(8),
                            itemBuilder: (BuildContext context, int i) {
                              final SearchResult result = state.results[i];
                              return Reveal(
                                index: i.clamp(0, 8),
                                child: GlassPanel(
                                  tone: GlassTone.soft,
                                  padding: EdgeInsets.symmetric(
                                    horizontal: getSize(14),
                                    vertical: getSize(12),
                                  ),
                                  child: Row(
                                    children: <Widget>[
                                      Container(
                                        width: getSize(34),
                                        height: getSize(34),
                                        decoration: BoxDecoration(
                                          color: withCustomOpacity(
                                            AppColors.glacier,
                                            0.14,
                                          ),
                                          borderRadius: AppRadii.rXs,
                                        ),
                                        child: Icon(
                                          result.kind.icon,
                                          size: getFontSize(15),
                                          color: AppColors.glacier,
                                        ),
                                      ),
                                      horizontalSpace(12),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            BaseText(
                                              result.title,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600,
                                              maxLines: 1,
                                            ),
                                            verticalSpace(3),
                                            BaseText(
                                              '${result.kind.label} · ${result.subtitle}',
                                              fontSize: 11.5,
                                              textColor: AppColors.muted,
                                              maxLines: 1,
                                            ),
                                          ],
                                        ),
                                      ),
                                      if (result.amount != null)
                                        MoneyLabel(
                                          text: formatCurrency(result.amount!),
                                          isCredit: result.amount! > 0,
                                          fontSize: 14,
                                        ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
