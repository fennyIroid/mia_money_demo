import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/di/injection.dart';
import '../../../core/router/app_router.gr.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/utils/math_utils.dart';
import '../../../core/utils/spacing_utils.dart';
import '../../../core/widgets/aurora_background.dart';
import '../../../core/widgets/base_text.dart';
import '../../../core/widgets/mia_button.dart';
import '../../../core/widgets/mia_inputs.dart';
import '../../../core/widgets/mia_scaffold.dart';
import '../../../core/widgets/mia_sheet.dart';
import '../../../core/widgets/mia_states.dart';
import '../../../core/widgets/reveal.dart';
import '../../../data/models/admin_models.dart';
import '../bloc/inbox_bloc.dart';
import '../widgets/review_item_card.dart';

@RoutePage()
class InboxView extends StatelessWidget {
  const InboxView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<InboxBloc>(
      create: (BuildContext context) =>
          getIt<InboxBloc>()..add(const InboxEvent.load()),
      child: const InboxScaffold(),
    );
  }
}

class InboxScaffold extends StatelessWidget {
  const InboxScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InboxBloc, InboxState>(
      builder: (BuildContext context, InboxState state) {
        final InboxBloc bloc = context.read<InboxBloc>();
        final List<ReviewItem> items = state.filtered;

        return Scaffold(
          backgroundColor: AppColors.ink,
          extendBody: true,
          body: AuroraBackground(
            mood: AuroraMood.ember,
            child: SafeArea(
              bottom: false,
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: getSize(20)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        verticalSpace(10),
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  BaseText(
                                    'Financial admin',
                                    fontSize: 26,
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: -0.8,
                                  ),
                                  verticalSpace(4),
                                  BaseText(
                                    '${state.countFor(InboxStage.needsReview)} decisions waiting on a human',
                                    fontSize: 12.5,
                                    textColor: AppColors.muted,
                                  ),
                                ],
                              ),
                            ),
                            GlassIconButton(
                              icon: Icons.tune_rounded,
                              diameter: 40,
                              iconSize: 17,
                              onTap: () => showMiaSheet<void>(
                                context: context,
                                title: 'Scope',
                                overline: 'Permission aware',
                                child: Column(
                                  children: InboxScope.values.map((
                                    InboxScope scope,
                                  ) {
                                    return Padding(
                                      padding: EdgeInsets.only(
                                        bottom: getSize(10),
                                      ),
                                      child: MiaChoiceCard(
                                        title: scope.label,
                                        selected: state.scope == scope,
                                        description: scope == InboxScope.mine
                                            ? 'Only items you own'
                                            : scope == InboxScope.household
                                            ? 'Shared items only — private records never appear'
                                            : 'Everything you are permitted to see',
                                        onTap: () {
                                          bloc.add(
                                            InboxEvent.scopeSelected(scope),
                                          );
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                    );
                                  }).toList(),
                                ),
                              ),
                            ),
                          ],
                        ),
                        verticalSpace(16),
                      ],
                    ),
                  ),
                  MiaChipRow(
                    labels: InboxStateX.visibleStages
                        .map(
                          (InboxStage s) => '${s.label} ${state.countFor(s)}',
                        )
                        .toList(),
                    selectedIndex: InboxStateX.visibleStages.indexOf(
                      state.stage,
                    ),
                    onChanged: (int i) => bloc.add(
                      InboxEvent.stageSelected(InboxStateX.visibleStages[i]),
                    ),
                  ),
                  verticalSpace(16),
                  Expanded(
                    child: !state.isReady
                        ? Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: getSize(20),
                            ),
                            child: const SkeletonTileList(
                              count: 4,
                              tileHeight: 140,
                            ),
                          )
                        : items.isEmpty
                        ? Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: getSize(20),
                            ),
                            child: MiaStateView(
                              kind: state.stage == InboxStage.needsReview
                                  ? MiaStateKind.caughtUp
                                  : MiaStateKind.empty,
                            ),
                          )
                        : ListView.separated(
                            physics: const BouncingScrollPhysics(),
                            padding: EdgeInsets.only(
                              left: getSize(20),
                              right: getSize(20),
                              bottom: getSize(180),
                            ),
                            itemCount: items.length,
                            separatorBuilder: (BuildContext context, int i) =>
                                verticalSpace(10),
                            itemBuilder: (BuildContext context, int i) {
                              final ReviewItem item = items[i];
                              return Reveal(
                                index: i,
                                child: ReviewItemCard(
                                  item: item,
                                  isSelected: state.selectedIds.contains(
                                    item.id,
                                  ),
                                  onSelectToggle: item.oneTapApproval
                                      ? () => bloc.add(
                                          InboxEvent.selectionToggled(item.id),
                                        )
                                      : null,
                                  onApprove: () {
                                    bloc.add(InboxEvent.approve(item.id));
                                    showMiaToast(
                                      context,
                                      message:
                                          'Approved. Figures recalculated.',
                                      actionLabel: 'Undo',
                                      onAction: () => bloc.add(
                                        InboxEvent.undoApproval(item.id),
                                      ),
                                    );
                                  },
                                  onOpen: () async {
                                    await context.router.push(
                                      ReviewDetailRoute(item: item),
                                    );
                                    bloc.add(const InboxEvent.load());
                                  },
                                ),
                              );
                            },
                          ),
                  ),
                ],
              ),
            ),
          ),
          bottomSheet: state.hasSelection
              ? MiaBottomBar(
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: MiaButton(
                          label:
                              'Approve ${state.selectedIds.length} item${state.selectedIds.length == 1 ? '' : 's'}',
                          size: MiaButtonSize.medium,
                          onTap: () {
                            bloc.add(const InboxEvent.approveSelected());
                            showMiaToast(
                              context,
                              message: 'Bulk approval applied.',
                            );
                          },
                        ),
                      ),
                      horizontalSpace(10),
                      MiaButton(
                        label: 'Clear',
                        variant: MiaButtonVariant.outline,
                        size: MiaButtonSize.medium,
                        expanded: false,
                        onTap: () =>
                            bloc.add(const InboxEvent.selectionCleared()),
                      ),
                    ],
                  ),
                )
              : null,
        );
      },
    );
  }
}
