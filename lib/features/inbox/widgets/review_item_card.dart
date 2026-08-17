import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_shapes.dart';
import '../../../core/theme/app_typography.dart';
import '../../../core/utils/color_utils.dart';
import '../../../core/utils/currency_utils.dart';
import '../../../core/utils/date_utils.dart';
import '../../../core/utils/math_utils.dart';
import '../../../core/utils/spacing_utils.dart';
import '../../../core/widgets/base_text.dart';
import '../../../core/widgets/glass_panel.dart';
import '../../../core/widgets/mia_list_row.dart';
import '../../../core/widgets/pressable.dart';
import '../../../core/widgets/status_pill.dart';
import '../../../data/models/admin_models.dart';
import '../../../data/models/core_models.dart';

class ReviewItemCard extends StatelessWidget {
  const ReviewItemCard({
    super.key,
    required this.item,
    required this.onOpen,
    required this.onApprove,
    this.isSelected = false,
    this.onSelectToggle,
  });

  final ReviewItem item;
  final VoidCallback onOpen;
  final VoidCallback onApprove;
  final bool isSelected;
  final VoidCallback? onSelectToggle;

  @override
  Widget build(BuildContext context) {
    return GlassPanel(
      onTap: onOpen,
      borderRadius: AppRadii.rLg,
      borderColor: isSelected
          ? withCustomOpacity(AppColors.ember, 0.6)
          : AppColors.glassBorderSoft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              if (onSelectToggle != null) ...<Widget>[
                Pressable(
                  onTap: onSelectToggle,
                  pressedScale: 0.86,
                  child: Container(
                    width: getSize(22),
                    height: getSize(22),
                    margin: EdgeInsets.only(top: getSize(2)),
                    decoration: BoxDecoration(
                      color: isSelected
                          ? AppColors.ember
                          : AppColors.transparent,
                      borderRadius: AppRadii.rXs,
                      border: Border.all(
                        color: isSelected
                            ? AppColors.ember
                            : AppColors.glassBorder,
                        width: 1.5,
                      ),
                    ),
                    child: isSelected
                        ? Icon(
                            Icons.check_rounded,
                            size: getFontSize(14),
                            color: AppColors.ink,
                          )
                        : null,
                  ),
                ),
                horizontalSpace(12),
              ],
              Container(
                width: getSize(36),
                height: getSize(36),
                decoration: BoxDecoration(
                  color: withCustomOpacity(item.stage.color, 0.14),
                  borderRadius: AppRadii.rSm,
                ),
                child: Icon(
                  item.kind.icon,
                  size: getFontSize(16),
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
                      fontSize: 14.5,
                      textStyle: AppTypography.titleSmall,
                      maxLines: 2,
                    ),
                    verticalSpace(4),
                    BaseText(
                      item.detail,
                      fontSize: 11.5,
                      textColor: AppColors.muted,
                      maxLines: 2,
                      height: 1.35,
                    ),
                  ],
                ),
              ),
              if (item.amount != null) ...<Widget>[
                horizontalSpace(8),
                MoneyLabel(
                  text: formatCurrency(item.amount!),
                  isCredit: item.amount! > 0,
                  fontSize: 14,
                ),
              ],
            ],
          ),
          verticalSpace(10),
          Wrap(
            spacing: getSize(6),
            runSpacing: getSize(6),
            children: <Widget>[
              StatusPill(
                label: item.kind.label,
                color: item.stage.color,
                dense: true,
              ),
              StatusPill(
                label: '${(item.confidence * 100).round()}% confident',
                color: item.confidence > 0.85
                    ? AppColors.positive
                    : item.confidence > 0.6
                    ? AppColors.caution
                    : AppColors.negative,
                icon: Icons.speed_rounded,
                dense: true,
              ),
              if (item.assignedTo != null)
                StatusPill(
                  label:
                      '${item.assignedTo} · ${item.assignmentStatus?.label ?? 'waiting'}',
                  color: AppColors.violetHaze,
                  icon: Icons.person_rounded,
                  dense: true,
                ),
              if (item.visibility != RecordVisibility.private)
                StatusPill(
                  label: item.visibility.label,
                  color: AppColors.glacier,
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
          if (item.stage != InboxStage.handled) ...<Widget>[
            verticalSpace(12),
            Row(
              children: <Widget>[
                Expanded(
                  child: Pressable(
                    onTap: onApprove,
                    pressedScale: 0.97,
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: getSize(10)),
                      decoration: BoxDecoration(
                        color: withCustomOpacity(AppColors.white, 0.9),
                        borderRadius: AppRadii.rPill,
                      ),
                      child: Center(
                        child: BaseText(
                          item.suggestedAction ?? 'Approve',
                          fontSize: 12.5,
                          fontWeight: FontWeight.w700,
                          textColor: AppColors.ink,
                        ),
                      ),
                    ),
                  ),
                ),
                horizontalSpace(8),
                Pressable(
                  onTap: onOpen,
                  pressedScale: 0.94,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: getSize(16),
                      vertical: getSize(10),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: AppRadii.rPill,
                      border: Border.all(color: AppColors.glassBorder),
                    ),
                    child: BaseText(
                      'Details',
                      fontSize: 12.5,
                      fontWeight: FontWeight.w600,
                      textColor: AppColors.frost,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }
}
