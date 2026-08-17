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
import '../../../core/widgets/mia_button.dart';
import '../../../core/widgets/mia_inputs.dart';
import '../../../core/widgets/mia_scaffold.dart';
import '../../../core/widgets/mia_sheet.dart';
import '../../../core/widgets/mia_states.dart';
import '../../../core/widgets/reveal.dart';
import '../../../core/widgets/status_pill.dart';
import '../../../data/models/assistant_models.dart';
import '../bloc/discovery_bloc.dart';

@RoutePage()
class NotificationsView extends StatelessWidget {
  const NotificationsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<DiscoveryBloc>(
      create: (BuildContext context) =>
          getIt<DiscoveryBloc>()..add(const DiscoveryEvent.load()),
      child: const NotificationsScaffold(),
    );
  }
}

class NotificationsScaffold extends StatelessWidget {
  const NotificationsScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DiscoveryBloc, DiscoveryState>(
      builder: (BuildContext context, DiscoveryState state) {
        final DiscoveryBloc bloc = context.read<DiscoveryBloc>();

        return MiaScaffold(
          title: 'Notifications',
          overline: '${state.unreadCount} unread',
          mood: AuroraMood.calm,
          actions: <Widget>[
            GlassIconButton(
              icon: Icons.tune_rounded,
              diameter: 40,
              iconSize: 17,
              onTap: () => showMiaSheet<void>(
                context: context,
                title: 'Notification settings',
                overline: 'You choose what earns an interruption',
                child: Column(
                  children: <Widget>[
                    MiaSwitchRow(
                      title: 'Detailed previews',
                      description:
                          'Show merchant names and amounts on your lock screen',
                      value: false,
                      icon: Icons.visibility_rounded,
                      onChanged: (bool _) {},
                    ),
                    MiaSwitchRow(
                      title: 'Quiet hours',
                      description: '9pm to 7am, security alerts still arrive',
                      value: true,
                      icon: Icons.bedtime_rounded,
                      onChanged: (bool _) {},
                    ),
                    verticalSpace(10),
                    BaseText(
                      'Events',
                      fontSize: 10,
                      textStyle: AppTypography.overline,
                    ),
                    verticalSpace(10),
                    ...NotificationCategory.values.map(
                      (NotificationCategory c) => MiaSwitchRow(
                        title: c.label,
                        value: true,
                        icon: c.icon,
                        accent: c.color,
                        onChanged: (bool _) {},
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
          bottomBar: MiaBottomBar(
            child: MiaButton(
              label: 'Mark all as read',
              variant: MiaButtonVariant.ghost,
              onTap: () => bloc.add(const DiscoveryEvent.notificationsRead()),
            ),
          ),
          child: !state.isReady
              ? const SkeletonTileList(count: 6, tileHeight: 84)
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Reveal(
                      child: MiaNoticeStrip(
                        message:
                            'Mia never sends a notification purely to pull you back in. Every one of these is a configured event or a security alert.',
                        icon: Icons.notifications_active_rounded,
                        accent: AppColors.lagoon,
                      ),
                    ),
                    verticalSpace(16),
                    ...List<Widget>.generate(state.notifications.length, (
                      int i,
                    ) {
                      final MiaNotification n = state.notifications[i];
                      return Padding(
                        padding: EdgeInsets.only(bottom: getSize(8)),
                        child: Reveal(
                          index: i.clamp(0, 8),
                          child: GlassPanel(
                            tone: n.isRead
                                ? GlassTone.soft
                                : GlassTone.standard,
                            borderColor: n.isCritical
                                ? withCustomOpacity(AppColors.negative, 0.4)
                                : AppColors.glassBorderSoft,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  width: getSize(34),
                                  height: getSize(34),
                                  decoration: BoxDecoration(
                                    color: withCustomOpacity(
                                      n.category.color,
                                      0.14,
                                    ),
                                    borderRadius: AppRadii.rXs,
                                  ),
                                  child: Icon(
                                    n.category.icon,
                                    size: getFontSize(15),
                                    color: n.category.color,
                                  ),
                                ),
                                horizontalSpace(12),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Row(
                                        children: <Widget>[
                                          Expanded(
                                            child: BaseText(
                                              n.title,
                                              fontSize: 14,
                                              fontWeight: n.isRead
                                                  ? FontWeight.w500
                                                  : FontWeight.w700,
                                              maxLines: 2,
                                            ),
                                          ),
                                          if (!n.isRead)
                                            Container(
                                              width: getSize(7),
                                              height: getSize(7),
                                              decoration: const BoxDecoration(
                                                color: AppColors.ember,
                                                shape: BoxShape.circle,
                                              ),
                                            ),
                                        ],
                                      ),
                                      verticalSpace(4),
                                      BaseText(
                                        n.body,
                                        fontSize: 12,
                                        textColor: AppColors.muted,
                                        height: 1.4,
                                      ),
                                      verticalSpace(8),
                                      Row(
                                        children: <Widget>[
                                          Flexible(
                                            child: StatusPill(
                                              label: n.category.label,
                                              color: n.category.color,
                                              dense: true,
                                            ),
                                          ),
                                          horizontalSpace(8),
                                          Flexible(
                                            child: BaseText(
                                              relativeLabel(n.timestamp),
                                              fontSize: 10.5,
                                              textColor: AppColors.faint,
                                              maxLines: 1,
                                            ),
                                          ),
                                          const Spacer(),
                                          if (n.deepLinkLabel != null)
                                            Flexible(
                                              child: BaseText(
                                                n.deepLinkLabel!,
                                                fontSize: 11,
                                                fontWeight: FontWeight.w600,
                                                textColor: AppColors.glacier,
                                                maxLines: 1,
                                              ),
                                            ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
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
