import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../core/router/app_router.gr.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_typography.dart';
import '../../../core/utils/color_utils.dart';
import '../../../core/utils/date_utils.dart';
import '../../../core/utils/spacing_utils.dart';
import '../../../core/widgets/base_text.dart';
import '../../../core/widgets/mia_avatar.dart';
import '../../../core/widgets/mia_button.dart';
import '../../../core/widgets/status_pill.dart';
import '../../../data/models/insight_models.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    super.key,
    required this.name,
    required this.standing,
    required this.unreadNotifications,
  });

  final String name;
  final FinancialStanding standing;
  final int unreadNotifications;

  String get _greeting {
    final int hour = DateTime.now().hour;
    if (hour < 12) return 'Good morning';
    if (hour < 18) return 'Good afternoon';
    return 'Good evening';
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        MiaAvatar(name: name, size: 44, showRing: true),
        horizontalSpace(12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              BaseText(
                '$_greeting, ${name.split(' ').first}',
                fontSize: 19,
                textStyle: AppTypography.titleMedium,
                maxLines: 1,
              ),
              verticalSpace(6),
              Row(
                children: <Widget>[
                  Flexible(
                    child: StatusPill(
                      label: standing.label,
                      color: standing.color,
                      icon: standing == FinancialStanding.broadlyOkay
                          ? Icons.check_circle_rounded
                          : standing == FinancialStanding.needsAttention
                          ? Icons.priority_high_rounded
                          : Icons.donut_large_rounded,
                      dense: true,
                    ),
                  ),
                  horizontalSpace(8),
                  Flexible(
                    child: BaseText(
                      formatFullDate(DateTime.now()),
                      fontSize: 11,
                      textColor: withCustomOpacity(AppColors.mist, 0.6),
                      maxLines: 1,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        GlassIconButton(
          icon: Icons.search_rounded,
          diameter: 40,
          iconSize: 17,
          semanticLabel: 'Search',
          onTap: () => context.router.push(const SearchRoute()),
        ),
        horizontalSpace(8),
        GlassIconButton(
          icon: Icons.notifications_none_rounded,
          diameter: 40,
          iconSize: 17,
          badgeCount: unreadNotifications,
          semanticLabel: 'Notifications',
          onTap: () => context.router.push(const NotificationsRoute()),
        ),
      ],
    );
  }
}
