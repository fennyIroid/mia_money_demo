import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_shapes.dart';
import '../../../core/theme/app_typography.dart';
import '../../../core/utils/color_utils.dart';
import '../../../core/utils/date_utils.dart';
import '../../../core/utils/math_utils.dart';
import '../../../core/utils/spacing_utils.dart';
import '../../../core/widgets/base_text.dart';
import '../../../core/widgets/glass_panel.dart';
import '../../../core/widgets/mia_list_row.dart';
import '../../../data/models/admin_models.dart';
import '../../../data/models/core_models.dart';

class ReviewReasonPanel extends StatelessWidget {
  const ReviewReasonPanel({super.key, required this.item});

  final ReviewItem item;

  @override
  Widget build(BuildContext context) {
    return GlassPanel(
      tone: GlassTone.soft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Icon(
                Icons.psychology_rounded,
                size: getFontSize(15),
                color: AppColors.ember,
              ),
              horizontalSpace(8),
              BaseText(
                'Why Mia flagged this',
                fontSize: 10,
                textStyle: AppTypography.overline,
              ),
            ],
          ),
          verticalSpace(12),
          BaseText(
            item.reason,
            fontSize: 13.5,
            textColor: AppColors.mist,
            height: 1.55,
          ),
          if (item.calculationImpact != null) ...<Widget>[
            verticalSpace(14),
            Container(
              padding: EdgeInsets.all(getSize(12)),
              decoration: BoxDecoration(
                color: withCustomOpacity(AppColors.lagoon, 0.1),
                borderRadius: AppRadii.rSm,
                border: Border.all(
                  color: withCustomOpacity(AppColors.lagoon, 0.24),
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Icon(
                    Icons.functions_rounded,
                    size: getFontSize(14),
                    color: AppColors.lagoon,
                  ),
                  horizontalSpace(10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        BaseText(
                          'If you approve',
                          fontSize: 10,
                          textStyle: AppTypography.overline,
                          textColor: AppColors.lagoon,
                        ),
                        verticalSpace(6),
                        BaseText(
                          item.calculationImpact!,
                          fontSize: 12.5,
                          textColor: AppColors.mist,
                          height: 1.45,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class ReviewEvidencePanel extends StatelessWidget {
  const ReviewEvidencePanel({super.key, required this.evidence});

  final List<EvidenceLink> evidence;

  @override
  Widget build(BuildContext context) {
    return GlassPanel(
      tone: GlassTone.soft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          BaseText('Evidence', fontSize: 10, textStyle: AppTypography.overline),
          verticalSpace(10),
          ...evidence.map((EvidenceLink link) {
            return Padding(
              padding: EdgeInsets.symmetric(vertical: getSize(7)),
              child: Row(
                children: <Widget>[
                  Container(
                    width: getSize(30),
                    height: getSize(30),
                    decoration: BoxDecoration(
                      color: AppColors.glassFillSoft,
                      borderRadius: AppRadii.rXs,
                    ),
                    child: Icon(
                      link.kind.icon,
                      size: getFontSize(14),
                      color: AppColors.glacier,
                    ),
                  ),
                  horizontalSpace(10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        BaseText(
                          link.label,
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                        ),
                        if (link.detail != null) ...<Widget>[
                          verticalSpace(2),
                          BaseText(
                            link.detail!,
                            fontSize: 11,
                            textColor: AppColors.faint,
                          ),
                        ],
                      ],
                    ),
                  ),
                  Icon(
                    Icons.chevron_right_rounded,
                    size: getFontSize(16),
                    color: AppColors.faint,
                  ),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }
}

class ReviewAuditPanel extends StatelessWidget {
  const ReviewAuditPanel({super.key, required this.events});

  final List<AuditEvent> events;

  @override
  Widget build(BuildContext context) {
    return GlassPanel(
      tone: GlassTone.soft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          BaseText(
            'Audit trail',
            fontSize: 10,
            textStyle: AppTypography.overline,
          ),
          verticalSpace(12),
          if (events.isEmpty)
            BaseText(
              'Nothing has happened to this item yet. Every action from here is recorded with actor, time and reason.',
              fontSize: 12,
              textColor: AppColors.faint,
              height: 1.5,
            )
          else
            ...List<Widget>.generate(events.length, (int i) {
              final AuditEvent event = events[i];
              final bool isLast = i == events.length - 1;
              return IntrinsicHeight(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Container(
                          width: getSize(9),
                          height: getSize(9),
                          margin: EdgeInsets.only(top: getSize(4)),
                          decoration: BoxDecoration(
                            color: AppColors.ember,
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: withCustomOpacity(AppColors.ember, 0.3),
                              width: 3,
                            ),
                          ),
                        ),
                        if (!isLast)
                          Expanded(
                            child: Container(
                              width: 1,
                              margin: EdgeInsets.symmetric(
                                vertical: getSize(4),
                              ),
                              color: AppColors.glassBorderSoft,
                            ),
                          ),
                      ],
                    ),
                    horizontalSpace(12),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(bottom: getSize(14)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            BaseText(
                              event.action,
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                            ),
                            verticalSpace(3),
                            BaseText(
                              '${event.actor} · ${formatDateTimeStamp(event.timestamp)}',
                              fontSize: 11,
                              textColor: AppColors.faint,
                            ),
                            if (event.reason != null) ...<Widget>[
                              verticalSpace(4),
                              BaseText(
                                event.reason!,
                                fontSize: 11.5,
                                textColor: AppColors.muted,
                                height: 1.4,
                              ),
                            ],
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }),
          verticalSpace(4),
          const EvidenceRow(
            label: 'Reprocessing',
            value: 'Never erases what already happened',
          ),
        ],
      ),
    );
  }
}
