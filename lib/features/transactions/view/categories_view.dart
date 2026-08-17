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
import '../../../core/widgets/mia_list_row.dart';
import '../../../core/widgets/mia_scaffold.dart';
import '../../../core/widgets/mia_states.dart';
import '../../../core/widgets/reveal.dart';
import '../../../data/models/money_models.dart';
import '../bloc/transactions_bloc.dart';
import '../widgets/category_actions.dart';

@RoutePage()
class CategoriesView extends StatelessWidget {
  const CategoriesView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<TransactionsBloc>(
      create: (BuildContext context) =>
          getIt<TransactionsBloc>()..add(const TransactionsEvent.load()),
      child: const CategoriesScaffold(),
    );
  }
}

class CategoriesScaffold extends StatelessWidget {
  const CategoriesScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TransactionsBloc, TransactionsState>(
      builder: (BuildContext context, TransactionsState state) {
        final List<MiaCategory> parents = state.categories
            .where((MiaCategory c) => !c.isSubcategory)
            .toList();

        return MiaScaffold(
          title: 'Categories',
          overline: '${parents.length} customer-facing categories',
          mood: AuroraMood.calm,
          bottomBar: MiaBottomBar(
            child: MiaButton(
              label: 'New category',
              leadingIcon: Icons.add_rounded,
              onTap: () => showCategoryActions(
                context,
                context.read<TransactionsBloc>(),
              ),
            ),
          ),
          child: !state.isReady
              ? const SkeletonTileList(count: 8, tileHeight: 62)
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Reveal(
                      child: MiaNoticeStrip(
                        message:
                            'Fiskil supplies 16 primary groups and 92 secondary codes. Mia maps them onto these customer-facing categories.',
                        icon: Icons.account_tree_rounded,
                        accent: AppColors.violetHaze,
                      ),
                    ),
                    verticalSpace(16),
                    ...List<Widget>.generate(parents.length, (int i) {
                      final MiaCategory category = parents[i];
                      final List<MiaCategory> children = state.categories
                          .where((MiaCategory c) => c.parentId == category.id)
                          .toList();

                      return Padding(
                        padding: EdgeInsets.only(bottom: getSize(8)),
                        child: Reveal(
                          index: i.clamp(0, 8),
                          child: GlassPanel(
                            tone: GlassTone.soft,
                            child: Column(
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Container(
                                      width: getSize(36),
                                      height: getSize(36),
                                      decoration: BoxDecoration(
                                        color: withCustomOpacity(
                                          category.color,
                                          0.16,
                                        ),
                                        borderRadius: AppRadii.rSm,
                                      ),
                                      child: Icon(
                                        category.icon,
                                        size: getFontSize(16),
                                        color: category.color,
                                      ),
                                    ),
                                    horizontalSpace(12),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          BaseText(
                                            category.name,
                                            fontSize: 14.5,
                                            textStyle: AppTypography.titleSmall,
                                          ),
                                          verticalSpace(2),
                                          BaseText(
                                            '${category.transactionCount} transactions this month',
                                            fontSize: 11,
                                            textColor: AppColors.faint,
                                          ),
                                        ],
                                      ),
                                    ),
                                    MoneyLabel(
                                      text: formatCurrency(
                                        category.monthTotal,
                                        decimals: 0,
                                      ),
                                      fontSize: 14,
                                    ),
                                  ],
                                ),
                                if (children.isNotEmpty) ...<Widget>[
                                  verticalSpace(10),
                                  Row(
                                    children: <Widget>[
                                      horizontalSpace(48),
                                      Expanded(
                                        child: Wrap(
                                          spacing: getSize(6),
                                          runSpacing: getSize(6),
                                          children: children.map((
                                            MiaCategory child,
                                          ) {
                                            return Container(
                                              padding: EdgeInsets.symmetric(
                                                horizontal: getSize(9),
                                                vertical: getSize(5),
                                              ),
                                              decoration: BoxDecoration(
                                                color: AppColors.glassFillSoft,
                                                borderRadius: AppRadii.rPill,
                                              ),
                                              child: BaseText(
                                                child.name,
                                                fontSize: 11,
                                                textColor: AppColors.mist,
                                              ),
                                            );
                                          }).toList(),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ],
                            ),
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
