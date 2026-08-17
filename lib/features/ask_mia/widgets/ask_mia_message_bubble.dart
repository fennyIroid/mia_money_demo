import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_shapes.dart';
import '../../../core/theme/app_typography.dart';
import '../../../core/utils/color_utils.dart';
import '../../../core/utils/math_utils.dart';
import '../../../core/utils/spacing_utils.dart';
import '../../../core/widgets/base_text.dart';
import '../../../core/widgets/glass_panel.dart';
import '../../../core/widgets/mia_list_row.dart';
import '../../../core/widgets/pressable.dart';
import '../../../core/widgets/reveal.dart';
import '../../../core/widgets/status_pill.dart';
import '../../../data/models/assistant_models.dart';
import '../../../data/models/core_models.dart';

class AskMiaMessageBubble extends StatelessWidget {
  const AskMiaMessageBubble({
    super.key,
    required this.message,
    required this.onFollowUp,
  });

  final AskMiaMessage message;
  final ValueChanged<String> onFollowUp;

  @override
  Widget build(BuildContext context) {
    if (message.isFromUser) {
      return Reveal(
        direction: RevealDirection.left,
        distance: 14,
        child: Align(
          alignment: Alignment.centerRight,
          child: Container(
            constraints: BoxConstraints(
              maxWidth: MediaQuery.sizeOf(context).width * 0.78,
            ),
            padding: EdgeInsets.symmetric(
              horizontal: getSize(16),
              vertical: getSize(12),
            ),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: <Color>[AppColors.amberGlow, AppColors.ember],
              ),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(getSize(20)),
                topRight: Radius.circular(getSize(20)),
                bottomLeft: Radius.circular(getSize(20)),
                bottomRight: Radius.circular(getSize(6)),
              ),
            ),
            child: BaseText(
              message.body,
              fontSize: 13.5,
              fontWeight: FontWeight.w500,
              textColor: AppColors.ink,
              height: 1.45,
            ),
          ),
        ),
      );
    }

    return Reveal(
      direction: RevealDirection.right,
      distance: 14,
      child: GlassPanel(
        tone: GlassTone.standard,
        borderRadius: AppRadii.rXl,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            if (message.nature != null)
              Row(
                children: <Widget>[
                  StatusPill(
                    label: message.nature!.label,
                    color: message.nature!.color,
                    dense: true,
                  ),
                  if (message.freshness != null) ...<Widget>[
                    horizontalSpace(6),
                    StatusPill(
                      label: message.freshness!.label,
                      color: message.freshness!.color,
                      icon: Icons.bolt_rounded,
                      dense: true,
                    ),
                  ],
                ],
              ),
            if (message.figure != null) ...<Widget>[
              verticalSpace(12),
              BaseText(
                message.figure!,
                fontSize: 32,
                textStyle: AppTypography.figureLarge,
              ),
            ],
            verticalSpace(10),
            BaseText(
              message.body,
              fontSize: 13.5,
              textColor: AppColors.mist,
              height: 1.55,
            ),
            if (message.coveredDates != null ||
                message.includedAccounts.isNotEmpty) ...<Widget>[
              verticalSpace(12),
              Container(
                padding: EdgeInsets.all(getSize(12)),
                decoration: BoxDecoration(
                  color: AppColors.glassFillSoft,
                  borderRadius: AppRadii.rSm,
                ),
                child: Column(
                  children: <Widget>[
                    if (message.coveredDates != null)
                      EvidenceRow(
                        label: 'Covered dates',
                        value: message.coveredDates!,
                      ),
                    if (message.includedAccounts.isNotEmpty)
                      EvidenceRow(
                        label: 'Included accounts',
                        value: message.includedAccounts.join(', '),
                      ),
                    if (message.calculationVersion != null)
                      EvidenceRow(
                        label: 'Calculation',
                        value: message.calculationVersion!,
                      ),
                  ],
                ),
              ),
            ],
            if (message.evidence.isNotEmpty) ...<Widget>[
              verticalSpace(12),
              BaseText(
                'Evidence',
                fontSize: 9.5,
                textStyle: AppTypography.overline,
              ),
              verticalSpace(8),
              Wrap(
                spacing: getSize(6),
                runSpacing: getSize(6),
                children: message.evidence
                    .map(
                      (EvidenceLink link) => StatusPill(
                        label: link.label,
                        color: AppColors.glacier,
                        icon: link.kind.icon,
                        dense: true,
                      ),
                    )
                    .toList(),
              ),
            ],
            if (message.missingInformation.isNotEmpty) ...<Widget>[
              verticalSpace(12),
              ...message.missingInformation.map(
                (String line) => Padding(
                  padding: EdgeInsets.only(bottom: getSize(4)),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Icon(
                        Icons.report_gmailerrorred_rounded,
                        size: getFontSize(13),
                        color: AppColors.caution,
                      ),
                      horizontalSpace(8),
                      Expanded(
                        child: BaseText(
                          line,
                          fontSize: 11.5,
                          textColor: AppColors.caution,
                          height: 1.4,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
            if (message.clarificationOptions.isNotEmpty) ...<Widget>[
              verticalSpace(12),
              Wrap(
                spacing: getSize(8),
                runSpacing: getSize(8),
                children: message.clarificationOptions
                    .map(
                      (String option) => Pressable(
                        onTap: () => onFollowUp(option),
                        pressedScale: 0.94,
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: getSize(12),
                            vertical: getSize(8),
                          ),
                          decoration: BoxDecoration(
                            color: withCustomOpacity(AppColors.ember, 0.16),
                            borderRadius: AppRadii.rPill,
                            border: Border.all(
                              color: withCustomOpacity(AppColors.ember, 0.4),
                            ),
                          ),
                          child: BaseText(
                            option,
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ],
            if (message.followUps.isNotEmpty) ...<Widget>[
              verticalSpace(14),
              Container(height: 1, color: AppColors.glassBorderSoft),
              verticalSpace(10),
              ...message.followUps.map(
                (String followUp) => Pressable(
                  onTap: () => onFollowUp(followUp),
                  pressedScale: 0.98,
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: getSize(6)),
                    child: Row(
                      children: <Widget>[
                        Icon(
                          Icons.subdirectory_arrow_right_rounded,
                          size: getFontSize(14),
                          color: AppColors.glacier,
                        ),
                        horizontalSpace(8),
                        Expanded(
                          child: BaseText(
                            followUp,
                            fontSize: 12.5,
                            textColor: AppColors.glacier,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
            verticalSpace(10),
            Row(
              children: <Widget>[
                Icon(
                  Icons.thumb_up_alt_outlined,
                  size: getFontSize(14),
                  color: AppColors.faint,
                ),
                horizontalSpace(14),
                Icon(
                  Icons.thumb_down_alt_outlined,
                  size: getFontSize(14),
                  color: AppColors.faint,
                ),
                const Spacer(),
                BaseText(
                  'Numbers verified against backend results',
                  fontSize: 9.5,
                  textColor: AppColors.faint,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
