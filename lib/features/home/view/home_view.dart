import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/di/injection.dart';
import '../../../core/router/app_router.gr.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/utils/math_utils.dart';
import '../../../core/utils/spacing_utils.dart';
import '../../../core/widgets/aurora_background.dart';
import '../../../core/widgets/mia_states.dart';
import '../../../core/widgets/reveal.dart';
import '../../../core/widgets/section_header.dart';
import '../../../data/models/admin_models.dart';
import '../bloc/home_bloc.dart';
import '../widgets/home_header.dart';
import '../widgets/home_hero.dart';
import '../widgets/home_sections.dart';
import '../../../data/models/insight_models.dart';

@RoutePage()
class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeBloc>(
      create: (BuildContext context) =>
          getIt<HomeBloc>()..add(const HomeEvent.load()),
      child: const HomeScaffold(),
    );
  }
}

class HomeScaffold extends StatelessWidget {
  const HomeScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (BuildContext context, HomeState state) {
        final HomeBloc bloc = context.read<HomeBloc>();

        return Scaffold(
          backgroundColor: AppColors.ink,
          extendBody: true,
          body: AuroraBackground(
            mood: state.standing == FinancialStanding.needsAttention
                ? AuroraMood.ember
                : AuroraMood.balanced,
            child: SafeArea(
              bottom: false,
              child: !state.isReady
                  ? const HomeLoadingBody()
                  : RefreshIndicator(
                      color: AppColors.ember,
                      backgroundColor: AppColors.graphite,
                      onRefresh: () async =>
                          bloc.add(const HomeEvent.refresh()),
                      child: ListView(
                        physics: const BouncingScrollPhysics(
                          parent: AlwaysScrollableScrollPhysics(),
                        ),
                        padding: EdgeInsets.zero,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: getSize(20),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: <Widget>[
                                verticalSpace(8),
                                Reveal(
                                  child: HomeHeader(
                                    name: state.user?.fullName ?? 'Amara',
                                    standing: state.standing,
                                    unreadNotifications: 4,
                                  ),
                                ),
                                verticalSpace(22),
                                if (state.available != null)
                                  Reveal(
                                    index: 1,
                                    withScale: true,
                                    child: HomeHero(
                                      available: state.available!,
                                    ),
                                  ),
                                verticalSpace(24),
                                if (state.isCaughtUp)
                                  Reveal(
                                    index: 2,
                                    child: const MiaStateView(
                                      kind: MiaStateKind.caughtUp,
                                    ),
                                  )
                                else ...<Widget>[
                                  Reveal(
                                    index: 2,
                                    child: SectionHeader(
                                      overline: 'Only you can decide',
                                      title: 'Worth your attention',
                                      actionLabel:
                                          'All ${state.openReviewCount}',
                                      onActionTap: () => context.router.push(
                                        const InboxRoute(),
                                      ),
                                    ),
                                  ),
                                  ...List<Widget>.generate(
                                    state.priorityItems.length,
                                    (int i) {
                                      final ReviewItem item =
                                          state.priorityItems[i];
                                      return Padding(
                                        padding: EdgeInsets.only(
                                          bottom: getSize(10),
                                        ),
                                        child: Reveal(
                                          index: 3 + i,
                                          child: HomePriorityCard(
                                            item: item,
                                            onApprove: () => bloc.add(
                                              HomeEvent.approveItem(item.id),
                                            ),
                                            onOpen: () => context.router.push(
                                              ReviewDetailRoute(item: item),
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ],
                                verticalSpace(14),
                                if (state.trueCost != null)
                                  Reveal(
                                    index: 4,
                                    child: HomeBentoGrid(
                                      trueCost: state.trueCost!,
                                      comingUpTotal: state.comingUpTotal,
                                      reviewCount: state.openReviewCount,
                                      expectedMoneyTotal: 1485.39,
                                    ),
                                  ),
                                verticalSpace(28),
                                Reveal(
                                  index: 5,
                                  child: SectionHeader(
                                    overline: 'Since your last visit',
                                    title: 'What changed',
                                    actionLabel: 'Details',
                                    onActionTap: () => context.router.push(
                                      const WhatChangedRoute(),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Reveal(
                            index: 6,
                            child: Padding(
                              padding: EdgeInsets.only(left: getSize(20)),
                              child: WhatChangedStrip(items: state.whatChanged),
                            ),
                          ),
                          verticalSpace(28),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: getSize(20),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: <Widget>[
                                Reveal(
                                  index: 7,
                                  child: SectionHeader(
                                    overline: 'No surprises',
                                    title: 'Coming up',
                                    actionLabel: 'Timeline',
                                    onActionTap: () => context.router.push(
                                      const ComingUpRoute(),
                                    ),
                                  ),
                                ),
                                Reveal(
                                  index: 8,
                                  child: ComingUpPreview(items: state.comingUp),
                                ),
                                verticalSpace(28),
                                Reveal(index: 9, child: const WeeklyResetCta()),
                                verticalSpace(28),
                                Reveal(
                                  index: 10,
                                  child: const SectionHeader(
                                    overline: 'While you were away',
                                    title: 'Mia handled this',
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Reveal(
                            index: 11,
                            child: Padding(
                              padding: EdgeInsets.only(left: getSize(20)),
                              child: MiaHandledStrip(items: state.handled),
                            ),
                          ),
                          verticalSpace(160),
                        ],
                      ),
                    ),
            ),
          ),
        );
      },
    );
  }
}

class HomeLoadingBody extends StatelessWidget {
  const HomeLoadingBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: getSize(20)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          verticalSpace(16),
          Row(
            children: <Widget>[
              SkeletonBlock(
                height: 44,
                width: getSize(44),
                radius: getSize(22),
              ),
              horizontalSpace(12),
              Expanded(child: SkeletonBlock(height: 20)),
            ],
          ),
          verticalSpace(24),
          SkeletonBlock(height: 210, radius: getSize(34)),
          verticalSpace(18),
          const SkeletonTileList(count: 3, tileHeight: 120),
        ],
      ),
    );
  }
}
