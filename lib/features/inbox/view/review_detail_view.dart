import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../core/di/injection.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_shapes.dart';
import '../../../core/theme/app_typography.dart';
import '../../../core/utils/color_utils.dart';
import '../../../core/utils/currency_utils.dart';
import '../../../core/utils/date_utils.dart';
import '../../../core/utils/math_utils.dart';
import '../../../core/utils/spacing_utils.dart';
import '../../../core/widgets/aurora_background.dart';
import '../../../core/widgets/base_text.dart';
import '../../../core/widgets/glass_panel.dart';
import '../../../core/widgets/mia_button.dart';
import '../../../core/widgets/mia_charts.dart';
import '../../../core/widgets/mia_list_row.dart';
import '../../../core/widgets/mia_scaffold.dart';
import '../../../core/widgets/mia_sheet.dart';
import '../../../core/widgets/reveal.dart';
import '../../../core/widgets/status_pill.dart';
import '../../../data/models/admin_models.dart';
import '../../../data/models/core_models.dart';
import '../../../data/repositories/admin_repository.dart';
import '../widgets/review_actions.dart';
import '../widgets/review_detail_sections.dart';

@RoutePage()
class ReviewDetailView extends StatelessWidget {
  const ReviewDetailView({super.key, required this.item});

  final ReviewItem item;

  @override
  Widget build(BuildContext context) {
    return MiaScaffold(
      title: item.kind.label,
      overline: item.stage.label,
      mood: AuroraMood.ember,
      actions: <Widget>[
        GlassIconButton(
          icon: Icons.more_horiz_rounded,
          diameter: 40,
          iconSize: 18,
          onTap: () => showReviewMoreActions(
            context,
            item,
            onLeaveScreen: () => context.router.maybePop(true),
          ),
        ),
      ],
      bottomBar: MiaBottomBar(
        child: Row(
          children: <Widget>[
            Expanded(
              child: MiaButton(
                label: item.suggestedAction ?? 'Approve',
                onTap: () async {
                  await getIt<ReviewRepository>().approve(item.id);
                  if (!context.mounted) return;
                  showMiaToast(
                    context,
                    message: 'Applied. Every affected figure was recalculated.',
                  );
                  await context.router.maybePop(true);
                },
              ),
            ),
            horizontalSpace(10),
            MiaButton(
              label: 'Not this',
              variant: MiaButtonVariant.outline,
              expanded: false,
              onTap: () async {
                // Rejecting the suggestion takes the item out of the inbox
                // without touching the record underneath it.
                await getIt<ReviewRepository>().dismiss(item.id);
                if (!context.mounted) return;
                showMiaToast(
                  context,
                  message: 'Left as it was. Nothing underneath was changed.',
                  icon: Icons.close_rounded,
                  accent: AppColors.caution,
                );
                await context.router.maybePop(true);
              },
            ),
          ],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Reveal(
            withScale: true,
            child: GlassPanel(
              tone: GlassTone.raised,
              borderRadius: AppRadii.rXxl,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Container(
                        width: getSize(44),
                        height: getSize(44),
                        decoration: BoxDecoration(
                          color: withCustomOpacity(item.stage.color, 0.16),
                          borderRadius: AppRadii.rMd,
                          border: Border.all(
                            color: withCustomOpacity(item.stage.color, 0.34),
                          ),
                        ),
                        child: Icon(
                          item.kind.icon,
                          color: item.stage.color,
                          size: getFontSize(20),
                        ),
                      ),
                      horizontalSpace(12),
                      Expanded(
                        child: BaseText(
                          item.title,
                          fontSize: 20,
                          textStyle: AppTypography.titleMedium,
                        ),
                      ),
                    ],
                  ),
                  verticalSpace(14),
                  BaseText(
                    item.detail,
                    fontSize: 13,
                    textColor: AppColors.mist,
                    height: 1.5,
                  ),
                  if (item.amount != null) ...<Widget>[
                    verticalSpace(16),
                    MoneyLabel(
                      text: formatCurrency(item.amount!),
                      isCredit: item.amount! > 0,
                      fontSize: 32,
                    ),
                  ],
                  verticalSpace(16),
                  Wrap(
                    spacing: getSize(6),
                    runSpacing: getSize(6),
                    children: <Widget>[
                      StatusPill(
                        label: item.stage.label,
                        color: item.stage.color,
                        dense: true,
                      ),
                      StatusPill(
                        label: 'Owner ${item.owner}',
                        color: AppColors.glacier,
                        icon: Icons.person_rounded,
                        dense: true,
                      ),
                      StatusPill(
                        label: item.visibility.label,
                        color: AppColors.violetHaze,
                        icon: item.visibility.icon,
                        dense: true,
                      ),
                      StatusPill(
                        label: relativeLabel(item.createdOn),
                        color: AppColors.muted,
                        icon: Icons.schedule_rounded,
                        dense: true,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          verticalSpace(16),
          Reveal(index: 1, child: ReviewReasonPanel(item: item)),
          verticalSpace(16),
          if (item.evidence.isNotEmpty) ...<Widget>[
            Reveal(
              index: 2,
              child: ReviewEvidencePanel(evidence: item.evidence),
            ),
            verticalSpace(16),
          ],
          Reveal(index: 3, child: ReviewAuditPanel(events: item.audit)),
          verticalSpace(16),
          Reveal(
            index: 4,
            child: GlassPanel(
              tone: GlassTone.soft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  BaseText(
                    'Confidence',
                    fontSize: 10,
                    textStyle: AppTypography.overline,
                  ),
                  verticalSpace(12),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: ProportionBar(
                          value: item.confidence,
                          color: item.confidence > 0.85
                              ? AppColors.positive
                              : AppColors.caution,
                          height: 8,
                        ),
                      ),
                      horizontalSpace(12),
                      BaseText(
                        '${(item.confidence * 100).round()}%',
                        fontSize: 14,
                        textStyle: AppTypography.figureMedium,
                      ),
                    ],
                  ),
                  verticalSpace(10),
                  BaseText(
                    'Mia asks when the consequence of being wrong is large, not just when confidence is low.',
                    fontSize: 11.5,
                    textColor: AppColors.faint,
                    height: 1.45,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
