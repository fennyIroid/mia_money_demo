import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_typography.dart';
import '../../../core/utils/color_utils.dart';
import '../../../core/utils/date_utils.dart';
import '../../../core/utils/math_utils.dart';
import '../../../core/utils/spacing_utils.dart';
import '../../../core/widgets/base_text.dart';
import '../../../core/widgets/glass_panel.dart';
import '../../../core/widgets/mia_list_row.dart';
import '../../../data/models/assistant_models.dart';
import '../../../data/models/core_models.dart';

/// Everything that has happened to one consent, in the order it happened.
/// Grant and expiry always appear, so the sheet still says something useful for
/// a connection with no amendments behind it.
class ConsentHistorySheet extends StatelessWidget {
  const ConsentHistorySheet({super.key, required this.connection});

  final ConnectionRecord connection;

  @override
  Widget build(BuildContext context) {
    final List<AuditEvent> events = <AuditEvent>[
      AuditEvent(
        id: '${connection.id}-granted',
        actor: connection.owner,
        action: 'Consent granted',
        timestamp: connection.consentGrantedOn,
        reason: connection.purpose,
      ),
      ...connection.consentHistory,
    ]..sort((AuditEvent a, AuditEvent b) => a.timestamp.compareTo(b.timestamp));

    final bool expired = connection.daysUntilExpiry < 0;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        MiaGroupedCard(
          title: connection.institution,
          footnote:
              'CDR consent belongs to whoever gave it. Revoking stops collection, it does not delete what is already held.',
          children: <Widget>[
            EvidenceRow(
              label: 'Granted',
              value: formatFullDate(connection.consentGrantedOn),
            ),
            EvidenceRow(
              label: expired ? 'Expired' : 'Expires',
              value: formatFullDate(connection.consentExpiresOn),
              valueColor: expired ? AppColors.negative : null,
            ),
            EvidenceRow(label: 'Given by', value: connection.owner),
            EvidenceRow(label: 'Scope', value: connection.scopes.join(', ')),
          ],
        ),
        verticalSpace(16),
        GlassPanel(
          tone: GlassTone.soft,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              BaseText(
                'What has happened',
                fontSize: 10,
                textStyle: AppTypography.overline,
              ),
              verticalSpace(14),
              ...List<Widget>.generate(events.length, (int i) {
                return ConsentHistoryEntry(
                  event: events[i],
                  accent: connection.accent,
                  isLast: i == events.length - 1,
                );
              }),
            ],
          ),
        ),
      ],
    );
  }
}

/// One dot on the consent timeline.
class ConsentHistoryEntry extends StatelessWidget {
  const ConsentHistoryEntry({
    super.key,
    required this.event,
    required this.accent,
    required this.isLast,
  });

  final AuditEvent event;
  final Color accent;
  final bool isLast;

  @override
  Widget build(BuildContext context) {
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
                  color: accent,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: withCustomOpacity(accent, 0.3),
                    width: 3,
                  ),
                ),
              ),
              if (!isLast)
                Expanded(
                  child: Container(
                    width: 1,
                    margin: EdgeInsets.symmetric(vertical: getSize(4)),
                    color: AppColors.glassBorderSoft,
                  ),
                ),
            ],
          ),
          horizontalSpace(12),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(bottom: isLast ? 0 : getSize(14)),
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
  }
}
