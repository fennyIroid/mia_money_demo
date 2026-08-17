import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../core/router/app_router.gr.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_motion.dart';
import '../../../core/utils/math_utils.dart';
import '../../../core/widgets/reveal.dart';
import '../../logging/widgets/quick_add_button.dart';
import '../widgets/ask_mia_orb_button.dart';
import '../widgets/mia_tab_bar.dart';

@RoutePage()
class ShellView extends StatelessWidget {
  const ShellView({super.key});

  static const List<MiaTabItem> tabs = <MiaTabItem>[
    MiaTabItem(
      label: 'Home',
      icon: Icons.auto_awesome_outlined,
      activeIcon: Icons.auto_awesome_rounded,
    ),
    MiaTabItem(
      label: 'Inbox',
      icon: Icons.inbox_outlined,
      activeIcon: Icons.inbox_rounded,
      badge: 6,
    ),
    MiaTabItem(
      label: 'Money',
      icon: Icons.account_balance_wallet_outlined,
      activeIcon: Icons.account_balance_wallet_rounded,
    ),
    MiaTabItem(
      label: 'Lenses',
      icon: Icons.travel_explore_outlined,
      activeIcon: Icons.travel_explore_rounded,
    ),
    MiaTabItem(
      label: 'More',
      icon: Icons.grid_view_outlined,
      activeIcon: Icons.grid_view_rounded,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      routes: const <PageRouteInfo<dynamic>>[
        HomeRoute(),
        InboxRoute(),
        MoneyRoute(),
        LensesRoute(),
        MoreRoute(),
      ],
      transitionBuilder:
          (BuildContext context, Widget child, Animation<double> animation) {
            return FadeTransition(
              opacity: CurvedAnimation(
                parent: animation,
                curve: AppMotion.enter,
              ),
              child: SlideTransition(
                position:
                    Tween<Offset>(
                      begin: const Offset(0, 0.014),
                      end: Offset.zero,
                    ).animate(
                      CurvedAnimation(
                        parent: animation,
                        curve: AppMotion.enter,
                      ),
                    ),
                child: child,
              ),
            );
          },
      builder: (BuildContext context, Widget child) {
        final TabsRouter router = AutoTabsRouter.of(context);

        // The tab bar floats: its own height plus the safe area is what any
        // button sitting above it has to clear.
        final double barHeight =
            MediaQuery.paddingOf(context).bottom + getSize(76);

        return Scaffold(
          backgroundColor: AppColors.ink,
          extendBody: true,
          body: Stack(
            children: <Widget>[
              Positioned.fill(child: child),
              Positioned(
                right: getSize(20),
                bottom: barHeight + getSize(14),
                child: Reveal(
                  index: 3,
                  withScale: true,
                  child: const AskMiaOrbButton(),
                ),
              ),
            ],
          ),
          bottomNavigationBar: MiaTabBar(
            items: tabs,
            activeIndex: router.activeIndex,
            onSelected: (int index) => router.setActiveIndex(index),
            action: const Reveal(
              index: 2,
              withScale: true,
              child: QuickAddButton(diameter: 62),
            ),
          ),
        );
      },
    );
  }
}
