import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_typography.dart';
import '../../../core/utils/date_utils.dart';
import '../../../core/utils/math_utils.dart';
import '../../../core/utils/spacing_utils.dart';
import '../../../core/widgets/base_text.dart';
import '../../../core/widgets/glass_panel.dart';
import '../../../core/widgets/mia_charts.dart';
import '../../../core/widgets/mia_list_row.dart';
import '../../../data/models/core_models.dart';

/// Shows the provenance of a material figure: version, window, exclusions,
/// missing data and completeness. Attached to every calculated result.
class CalculationMetaPanel extends StatelessWidget {
  const CalculationMetaPanel({
    super.key,
    required this.meta,
    this.title = 'How this was calculated',
  });

  final CalculationMeta meta;
  final String title;

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
                Icons.functions_rounded,
                size: getFontSize(15),
                color: AppColors.lagoon,
              ),
              horizontalSpace(8),
              BaseText(title, fontSize: 10, textStyle: AppTypography.overline),
            ],
          ),
          verticalSpace(12),
          Row(
            children: <Widget>[
              Expanded(
                child: ProportionBar(
                  value: meta.completeness.coverage,
                  color: meta.completeness == Completeness.complete
                      ? AppColors.positive
                      : AppColors.caution,
                  height: 6,
                ),
              ),
              horizontalSpace(10),
              BaseText(
                meta.completeness.label,
                fontSize: 11,
                fontWeight: FontWeight.w600,
                textColor: meta.completeness == Completeness.complete
                    ? AppColors.positive
                    : AppColors.caution,
              ),
            ],
          ),
          verticalSpace(10),
          EvidenceRow(label: 'Calculation version', value: meta.version),
          EvidenceRow(label: 'Date range', value: meta.rangeLabel),
          EvidenceRow(label: 'As of', value: formatDateTimeStamp(meta.asOf)),
          EvidenceRow(label: 'Records used', value: '${meta.recordCount}'),
          if (meta.sources.isNotEmpty)
            EvidenceRow(label: 'Sources', value: meta.sources.join(', ')),
          if (meta.exclusions.isNotEmpty) ...<Widget>[
            verticalSpace(8),
            BaseText(
              'Excluded',
              fontSize: 10,
              textStyle: AppTypography.overline,
              textColor: AppColors.muted,
            ),
            verticalSpace(6),
            ...meta.exclusions.map(
              (String line) => MetaBullet(text: line, color: AppColors.muted),
            ),
          ],
          if (meta.missingData.isNotEmpty) ...<Widget>[
            verticalSpace(8),
            BaseText(
              'Missing',
              fontSize: 10,
              textStyle: AppTypography.overline,
              textColor: AppColors.caution,
            ),
            verticalSpace(6),
            ...meta.missingData.map(
              (String line) => MetaBullet(text: line, color: AppColors.caution),
            ),
          ],
          if (meta.assumptions.isNotEmpty) ...<Widget>[
            verticalSpace(8),
            BaseText(
              'Assumptions',
              fontSize: 10,
              textStyle: AppTypography.overline,
              textColor: AppColors.glacier,
            ),
            verticalSpace(6),
            ...meta.assumptions.map(
              (String line) => MetaBullet(text: line, color: AppColors.glacier),
            ),
          ],
        ],
      ),
    );
  }
}

class MetaBullet extends StatelessWidget {
  const MetaBullet({super.key, required this.text, required this.color});

  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: getSize(5)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: getSize(6)),
            child: Container(
              width: getSize(4),
              height: getSize(4),
              decoration: BoxDecoration(color: color, shape: BoxShape.circle),
            ),
          ),
          horizontalSpace(8),
          Expanded(
            child: BaseText(
              text,
              fontSize: 11.5,
              textColor: AppColors.mist,
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }
}
