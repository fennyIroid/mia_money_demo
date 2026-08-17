import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../core/router/app_router.gr.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_shapes.dart';
import '../../../core/theme/app_typography.dart';
import '../../../core/utils/color_utils.dart';
import '../../../core/utils/currency_utils.dart';
import '../../../core/utils/date_utils.dart';
import '../../../core/utils/math_utils.dart';
import '../../../core/utils/spacing_utils.dart';
import '../../../core/widgets/base_text.dart';
import '../../../core/widgets/bento_tile.dart';
import '../../../core/widgets/glass_panel.dart';
import '../../../core/widgets/mia_button.dart';
import '../../../core/widgets/mia_charts.dart';
import '../../../core/widgets/mia_list_row.dart';
import '../../../core/widgets/pressable.dart';
import '../../../core/widgets/status_pill.dart';
import '../../../core/widgets/value_ticker.dart';
import '../../../data/models/admin_models.dart';
import '../../../data/models/insight_models.dart';

/// A single item Mia has held back for a human decision, with the reason and the
/// calculation consequence stated up front.
class HomePriorityCard extends StatelessWidget {
  const HomePriorityCard({
    super.key,
    required this.item,
    required this.onApprove,
    required this.onOpen,
  });

  final ReviewItem item;
  final VoidCallback onApprove;
  final VoidCallback onOpen;

  @override
  Widget build(BuildContext context) {
    return GlassPanel(
      onTap: onOpen,
      borderRadius: AppRadii.rXl,
      borderColor: withCustomOpacity(item.stage.color, 0.32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                width: getSize(38),
                height: getSize(38),
                decoration: BoxDecoration(
                  color: withCustomOpacity(item.stage.color, 0.14),
                  borderRadius: AppRadii.rSm,
                  border: Border.all(
                    color: withCustomOpacity(item.stage.color, 0.3),
                  ),
                ),
                child: Icon(
                  item.kind.icon,
                  size: getFontSize(17),
                  color: item.stage.color,
                ),
              ),
              horizontalSpace(12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    BaseText(
                      item.title,
                      fontSize: 15,
                      textStyle: AppTypography.titleSmall,
                      maxLines: 2,
                    ),
                    verticalSpace(4),
                    BaseText(
                      item.detail,
                      fontSize: 12,
                      textColor: AppColors.muted,
                      maxLines: 2,
                    ),
                  ],
                ),
              ),
              if (item.amount != null) ...<Widget>[
                horizontalSpace(8),
                MoneyLabel(
                  text: formatCurrency(item.amount!),
                  isCredit: item.amount! > 0,
                  fontSize: 15,
                ),
              ],
            ],
          ),
          verticalSpace(12),
          Container(
            padding: EdgeInsets.all(getSize(12)),
            decoration: BoxDecoration(
              color: AppColors.glassFillSoft,
              borderRadius: AppRadii.rSm,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.info_outline_rounded,
                      size: getFontSize(12),
                      color: AppColors.faint,
                    ),
                    horizontalSpace(6),
                    Expanded(
                      child: BaseText(
                        'Why Mia flagged this',
                        fontSize: 9.5,
                        textStyle: AppTypography.overline,
                        maxLines: 1,
                      ),
                    ),
                    horizontalSpace(8),
                    BaseText(
                      '${(item.confidence * 100).round()}% confident',
                      fontSize: 10,
                      textColor: AppColors.faint,
                      maxLines: 1,
                    ),
                  ],
                ),
                verticalSpace(8),
                BaseText(
                  item.reason,
                  fontSize: 12,
                  textColor: AppColors.mist,
                  height: 1.45,
                ),
                if (item.calculationImpact != null) ...<Widget>[
                  verticalSpace(8),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Icon(
                        Icons.functions_rounded,
                        size: getFontSize(12),
                        color: AppColors.lagoon,
                      ),
                      horizontalSpace(6),
                      Expanded(
                        child: BaseText(
                          item.calculationImpact!,
                          fontSize: 11.5,
                          textColor: AppColors.lagoon,
                          height: 1.4,
                        ),
                      ),
                    ],
                  ),
                ],
              ],
            ),
          ),
          verticalSpace(12),
          Row(
            children: <Widget>[
              Expanded(
                child: MiaButton(
                  label: item.suggestedAction ?? 'Approve',
                  size: MiaButtonSize.small,
                  variant: MiaButtonVariant.frost,
                  onTap: onApprove,
                ),
              ),
              horizontalSpace(8),
              MiaButton(
                label: 'Open',
                size: MiaButtonSize.small,
                variant: MiaButtonVariant.outline,
                expanded: false,
                onTap: onOpen,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

/// Two-by-two bento block: the recurring shape of the product.
class HomeBentoGrid extends StatelessWidget {
  const HomeBentoGrid({
    super.key,
    required this.trueCost,
    required this.comingUpTotal,
    required this.reviewCount,
    required this.expectedMoneyTotal,
  });

  final TrueCostOfLife trueCost;
  final double comingUpTotal;
  final int reviewCount;
  final double expectedMoneyTotal;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: BentoTile(
                label: 'True cost of life',
                icon: Icons.public_rounded,
                accent: AppColors.violetHaze,
                height: getSize(150),
                onTap: () => context.router.push(const TrueCostOfLifeRoute()),
                showArrow: true,
                figure: ValueTicker(
                  value: trueCost.monthlyTotal,
                  format: TickerFormat.currencyCompact,
                  fontSize: 30,
                ),
                caption: 'a month, all in',
              ),
            ),
            horizontalSpace(10),
            Expanded(
              child: BentoTile(
                label: 'Coming up · 14 days',
                icon: Icons.event_rounded,
                accent: AppColors.amberGlow,
                height: getSize(150),
                onTap: () => context.router.push(const ComingUpRoute()),
                showArrow: true,
                figure: ValueTicker(
                  value: comingUpTotal,
                  format: TickerFormat.currencyCompact,
                  fontSize: 30,
                ),
                caption: 'confirmed obligations',
              ),
            ),
          ],
        ),
        verticalSpace(10),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: BentoTile(
                label: 'Needs review',
                icon: Icons.rate_review_rounded,
                accent: AppColors.ember,
                height: getSize(136),
                onTap: () => context.router.push(const InboxRoute()),
                figure: ValueTicker(
                  value: reviewCount.toDouble(),
                  format: TickerFormat.integer,
                  fontSize: 30,
                ),
                caption: 'decisions only you can make',
                visual: const BarSpark(
                  values: <double>[3, 5, 2, 6, 4, 6],
                  color: AppColors.ember,
                  width: 44,
                  height: 24,
                ),
              ),
            ),
            horizontalSpace(10),
            Expanded(
              child: BentoTile(
                label: 'Expected money',
                icon: Icons.hourglass_bottom_rounded,
                accent: AppColors.lagoon,
                height: getSize(136),
                onTap: () => context.router.push(const ExpectedMoneyRoute()),
                figure: ValueTicker(
                  value: expectedMoneyTotal,
                  format: TickerFormat.currencyCompact,
                  fontSize: 30,
                ),
                caption: 'owed to you, not counted yet',
                visual: const Sparkline(
                  values: <double>[2, 3, 3, 5, 4, 6, 7],
                  color: AppColors.lagoon,
                  width: 46,
                  height: 24,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class WhatChangedStrip extends StatelessWidget {
  const WhatChangedStrip({super.key, required this.items});

  final List<WhatChangedItem> items;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: getSize(148),
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.only(right: getSize(20)),
        itemCount: items.length,
        separatorBuilder: (BuildContext context, int i) => horizontalSpace(10),
        itemBuilder: (BuildContext context, int i) {
          final WhatChangedItem item = items[i];
          return SizedBox(
            width: getSize(216),
            child: GlassPanel(
              tone: GlassTone.standard,
              onTap: () => context.router.push(const WhatChangedRoute()),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Icon(
                        item.icon,
                        size: getFontSize(16),
                        color: item.accent,
                      ),
                      const Spacer(),
                      DeltaBadge(
                        value: item.percent,
                        invertColours: item.direction == ChangeDirection.down,
                      ),
                    ],
                  ),
                  BaseText(
                    item.title,
                    fontSize: 14,
                    textStyle: AppTypography.titleSmall,
                    maxLines: 2,
                  ),
                  BaseText(
                    item.detail,
                    fontSize: 11.5,
                    textColor: AppColors.muted,
                    maxLines: 2,
                    height: 1.4,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class ComingUpPreview extends StatelessWidget {
  const ComingUpPreview({super.key, required this.items});

  final List<TimelineItem> items;

  @override
  Widget build(BuildContext context) {
    return GlassPanel(
      tone: GlassTone.soft,
      padding: EdgeInsets.symmetric(
        horizontal: getSize(14),
        vertical: getSize(6),
      ),
      child: Column(
        children: List<Widget>.generate(items.length * 2 - 1, (int i) {
          if (i.isOdd) {
            return Container(height: 1, color: AppColors.glassBorderSoft);
          }
          final TimelineItem item = items[i ~/ 2];
          return Pressable(
            onTap: () => context.router.push(const ComingUpRoute()),
            pressedScale: 0.99,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: getSize(11)),
              child: Row(
                children: <Widget>[
                  Container(
                    width: getSize(42),
                    padding: EdgeInsets.symmetric(vertical: getSize(4)),
                    decoration: BoxDecoration(
                      color: AppColors.glassFillSoft,
                      borderRadius: AppRadii.rXs,
                    ),
                    child: Column(
                      children: <Widget>[
                        BaseText(
                          formatDayMonth(item.date).split(' ').first,
                          fontSize: 15,
                          textStyle: AppTypography.figureMedium,
                        ),
                        BaseText(
                          formatDayMonth(item.date).split(' ').last,
                          fontSize: 9,
                          textStyle: AppTypography.overline,
                        ),
                      ],
                    ),
                  ),
                  horizontalSpace(12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        BaseText(
                          item.title,
                          fontSize: 13.5,
                          fontWeight: FontWeight.w600,
                          maxLines: 1,
                        ),
                        verticalSpace(3),
                        Row(
                          children: <Widget>[
                            BaseText(
                              item.isConfirmed ? 'Confirmed' : 'Predicted',
                              fontSize: 10.5,
                              textColor: item.isConfirmed
                                  ? AppColors.positive
                                  : AppColors.caution,
                            ),
                            horizontalSpace(6),
                            BaseText(
                              '· ${item.kind.label}',
                              fontSize: 10.5,
                              textColor: AppColors.faint,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  MoneyLabel(
                    text: formatCurrency(item.amount, showSign: true),
                    isCredit: item.isIncome,
                    fontSize: 14,
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}

class MiaHandledStrip extends StatelessWidget {
  const MiaHandledStrip({super.key, required this.items});

  final List<HandledItem> items;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: getSize(96),
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.only(right: getSize(20)),
        itemCount: items.length,
        separatorBuilder: (BuildContext context, int i) => horizontalSpace(10),
        itemBuilder: (BuildContext context, int i) {
          final HandledItem item = items[i];
          return SizedBox(
            width: getSize(196),
            child: GlassPanel(
              tone: GlassTone.soft,
              padding: EdgeInsets.all(getSize(13)),
              child: Row(
                children: <Widget>[
                  Icon(item.icon, size: getFontSize(16), color: item.accent),
                  horizontalSpace(10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        BaseText(
                          item.title,
                          fontSize: 12.5,
                          fontWeight: FontWeight.w600,
                          maxLines: 2,
                          height: 1.3,
                        ),
                        verticalSpace(4),
                        BaseText(
                          relativeLabel(item.handledOn),
                          fontSize: 10,
                          textColor: AppColors.faint,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class WeeklyResetCta extends StatelessWidget {
  const WeeklyResetCta({super.key});

  @override
  Widget build(BuildContext context) {
    return GlassPanel(
      tone: GlassTone.ember,
      onTap: () => context.router.push(const WeeklyResetRoute()),
      borderRadius: AppRadii.rXl,
      child: Row(
        children: <Widget>[
          Container(
            width: getSize(46),
            height: getSize(46),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: withCustomOpacity(AppColors.amberGlow, 0.18),
              border: Border.all(
                color: withCustomOpacity(AppColors.amberGlow, 0.4),
              ),
            ),
            child: Icon(
              Icons.restart_alt_rounded,
              color: AppColors.amberGlow,
              size: getFontSize(21),
            ),
          ),
          horizontalSpace(14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                BaseText(
                  'Weekly financial reset',
                  fontSize: 15,
                  textStyle: AppTypography.titleSmall,
                ),
                verticalSpace(4),
                BaseText(
                  'Five cards. Two to five minutes. Then you are done for the week.',
                  fontSize: 12,
                  textColor: AppColors.mist,
                  height: 1.4,
                ),
              ],
            ),
          ),
          horizontalSpace(8),
          Icon(
            Icons.arrow_forward_rounded,
            size: getFontSize(18),
            color: AppColors.amberGlow,
          ),
        ],
      ),
    );
  }
}
