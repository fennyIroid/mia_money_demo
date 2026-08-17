import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_shapes.dart';
import '../../../core/theme/app_typography.dart';
import '../../../core/utils/color_utils.dart';
import '../../../core/utils/math_utils.dart';
import '../../../core/utils/spacing_utils.dart';
import '../../../core/widgets/base_text.dart';
import '../../../core/widgets/glass_panel.dart';
import '../../../data/dummy/dummy_money.dart';
import '../../../data/models/core_models.dart';
import '../../../data/models/money_models.dart';

/// The three-layer truth of a transaction, stacked so it is obvious that the
/// provider's evidence still exists underneath your correction.
class ClassificationLayersPanel extends StatelessWidget {
  const ClassificationLayersPanel({super.key, required this.transaction});

  final MiaTransaction transaction;

  @override
  Widget build(BuildContext context) {
    final ClassificationLayers layers = transaction.layers;

    return GlassPanel(
      tone: GlassTone.soft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: BaseText(
                  'Where this value came from',
                  fontSize: 10,
                  textStyle: AppTypography.overline,
                  maxLines: 1,
                ),
              ),
              horizontalSpace(8),
              BaseText(
                layers.mappingVersion,
                fontSize: 9.5,
                textColor: AppColors.faint,
                maxLines: 1,
              ),
            ],
          ),
          verticalSpace(14),
          ClassificationLayerTile(
            source: ValueSource.provider,
            title: layers.providerCategory,
            subtitle:
                '${layers.providerSubcategory} · ${layers.providerMerchant ?? transaction.description}',
            trailing: layers.providerConfidence == null
                ? null
                : '${(layers.providerConfidence! * 100).round()}%',
            isActive:
                layers.userCategoryId == null && layers.miaCategoryId.isEmpty,
            note: 'Immutable. Mia never edits what your bank sent.',
          ),
          verticalSpace(8),
          ClassificationLayerTile(
            source: ValueSource.miaMapped,
            title: DummyMoney.categoryById(layers.miaCategoryId).name,
            subtitle: layers.normalisedMerchant ?? 'Merchant normalised by Mia',
            isActive: layers.userCategoryId == null,
            note: 'Mia\'s deterministic mapping of the provider taxonomy.',
          ),
          verticalSpace(8),
          ClassificationLayerTile(
            source: ValueSource.userConfirmed,
            title: layers.userCategoryId == null
                ? 'Not corrected yet'
                : DummyMoney.categoryById(layers.userCategoryId!).name,
            subtitle:
                layers.userMerchantAlias ??
                (layers.userCategoryId == null
                    ? 'Your correction would sit here and win'
                    : 'Your alias'),
            isActive: layers.userCategoryId != null,
            note: 'Highest precedence for display and every calculation.',
          ),
        ],
      ),
    );
  }
}

class ClassificationLayerTile extends StatelessWidget {
  const ClassificationLayerTile({
    super.key,
    required this.source,
    required this.title,
    required this.subtitle,
    required this.isActive,
    required this.note,
    this.trailing,
  });

  final ValueSource source;
  final String title;
  final String subtitle;
  final bool isActive;
  final String note;
  final String? trailing;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(getSize(12)),
      decoration: BoxDecoration(
        color: isActive
            ? withCustomOpacity(source.color, 0.12)
            : AppColors.glassFillSoft,
        borderRadius: AppRadii.rMd,
        border: Border.all(
          color: isActive
              ? withCustomOpacity(source.color, 0.4)
              : AppColors.glassBorderSoft,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Icon(source.icon, size: getFontSize(14), color: source.color),
              horizontalSpace(8),
              Expanded(
                child: BaseText(
                  source.label,
                  fontSize: 9.5,
                  textStyle: AppTypography.overline,
                  textColor: source.color,
                  maxLines: 1,
                ),
              ),
              if (trailing != null)
                BaseText(trailing!, fontSize: 10.5, textColor: AppColors.faint),
              if (isActive) ...<Widget>[
                horizontalSpace(6),
                Icon(
                  Icons.check_circle_rounded,
                  size: getFontSize(13),
                  color: source.color,
                ),
              ],
            ],
          ),
          verticalSpace(8),
          BaseText(
            title,
            fontSize: 14,
            fontWeight: FontWeight.w600,
            textColor: isActive ? AppColors.frost : AppColors.mist,
          ),
          verticalSpace(3),
          BaseText(
            subtitle,
            fontSize: 11.5,
            textColor: AppColors.muted,
            height: 1.4,
          ),
          verticalSpace(6),
          BaseText(
            note,
            fontSize: 10.5,
            textColor: AppColors.faint,
            height: 1.4,
          ),
        ],
      ),
    );
  }
}
