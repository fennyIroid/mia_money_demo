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
import '../../../core/widgets/mia_charts.dart';
import '../../../core/widgets/mia_list_row.dart';
import '../../../core/widgets/mia_scaffold.dart';
import '../../../core/widgets/mia_sheet.dart';
import '../../../core/widgets/mia_states.dart';
import '../../../core/widgets/reveal.dart';
import '../../../core/widgets/status_pill.dart';
import '../../../data/models/admin_models.dart';
import '../bloc/vault_bloc.dart';
import '../widgets/import_actions.dart';

@RoutePage()
class ImportsView extends StatelessWidget {
  const ImportsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<VaultBloc>(
      create: (BuildContext context) =>
          getIt<VaultBloc>()..add(const VaultEvent.load()),
      child: const ImportsScaffold(),
    );
  }
}

class ImportsScaffold extends StatelessWidget {
  const ImportsScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VaultBloc, VaultState>(
      builder: (BuildContext context, VaultState state) {
        final VaultBloc bloc = context.read<VaultBloc>();

        return MiaScaffold(
          title: 'Imports',
          overline: 'CSV, PDF and manual records',
          mood: AuroraMood.calm,
          bottomBar: MiaBottomBar(
            child: MiaButton(
              label: 'Start an import',
              leadingIcon: Icons.upload_file_rounded,
              onTap: () async {
                final ImportBatch? batch = await startImport(context);
                if (!context.mounted) return;
                bloc.add(const VaultEvent.load());
                if (batch == null) return;
                showMiaToast(
                  context,
                  message: batch.rowCount == 0
                      ? '${batch.fileName} queued. Nothing is committed until it previews.'
                      : '${batch.fileName} queued with ${batch.rowCount} rows to preview.',
                  icon: Icons.upload_file_rounded,
                );
              },
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Reveal(
                child: MiaNoticeStrip(
                  message:
                      'Every import previews before it commits, detects duplicates, and can be rolled back whole.',
                  icon: Icons.undo_rounded,
                  accent: AppColors.lagoon,
                ),
              ),
              verticalSpace(16),
              if (!state.isReady)
                const SkeletonTileList(count: 4, tileHeight: 120)
              else if (state.imports.isEmpty)
                const MiaStateView(kind: MiaStateKind.empty)
              else
                ...List<Widget>.generate(state.imports.length, (int i) {
                  return Padding(
                    padding: EdgeInsets.only(bottom: getSize(10)),
                    child: Reveal(
                      index: i,
                      child: ImportCard(
                        batch: state.imports[i],
                        onRollBack: () {
                          bloc.add(
                            VaultEvent.importRolledBack(state.imports[i].id),
                          );
                          showMiaToast(
                            context,
                            message:
                                'Rolled back. Every row that batch created has left the ledger.',
                            icon: Icons.undo_rounded,
                            accent: AppColors.caution,
                          );
                        },
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

class ImportCard extends StatelessWidget {
  const ImportCard({super.key, required this.batch, required this.onRollBack});

  final ImportBatch batch;
  final VoidCallback onRollBack;

  @override
  Widget build(BuildContext context) {
    final double progress = batch.rowCount == 0
        ? 0
        : batch.importedCount / batch.rowCount;

    return GlassPanel(
      tone: GlassTone.soft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                width: getSize(38),
                height: getSize(38),
                decoration: BoxDecoration(
                  color: withCustomOpacity(batch.state.color, 0.14),
                  borderRadius: AppRadii.rSm,
                ),
                child: Icon(
                  Icons.file_present_rounded,
                  size: getFontSize(17),
                  color: batch.state.color,
                ),
              ),
              horizontalSpace(12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    BaseText(
                      batch.fileName,
                      fontSize: 14,
                      textStyle: AppTypography.titleSmall,
                      maxLines: 1,
                    ),
                    verticalSpace(3),
                    BaseText(
                      '${batch.kind} · ${relativeLabel(batch.startedOn)}',
                      fontSize: 11.5,
                      textColor: AppColors.muted,
                    ),
                  ],
                ),
              ),
              StatusPill(
                label: batch.state.label,
                color: batch.state.color,
                dense: true,
              ),
            ],
          ),
          verticalSpace(12),
          ProportionBar(value: progress, color: batch.state.color, height: 6),
          verticalSpace(10),
          Row(
            children: <Widget>[
              ImportStat(
                label: 'Imported',
                value: '${batch.importedCount}',
                color: AppColors.positive,
              ),
              ImportStat(
                label: 'Duplicates',
                value: '${batch.duplicateCount}',
                color: AppColors.violetHaze,
              ),
              ImportStat(
                label: 'Failed',
                value: '${batch.failedCount}',
                color: AppColors.negative,
              ),
              ImportStat(
                label: 'Rows',
                value: '${batch.rowCount}',
                color: AppColors.muted,
              ),
            ],
          ),
          if (batch.coveragePeriod != null) ...<Widget>[
            verticalSpace(8),
            EvidenceRow(
              label: 'Coverage',
              value: batch.coveragePeriod!,
              icon: Icons.date_range_rounded,
            ),
          ],
          if (batch.canRollback) ...<Widget>[
            verticalSpace(10),
            MiaButton(
              label: 'Roll back this import',
              variant: MiaButtonVariant.outline,
              size: MiaButtonSize.small,
              onTap: () async {
                final bool confirmed = await confirmDestructive(
                  context: context,
                  title: 'Roll back the import?',
                  message:
                      'Every record created by this batch is removed together.',
                  confirmLabel: 'Roll back',
                  consequences: <String>[
                    'No orphaned or partial records are left behind',
                    'Dependent calculations are rebuilt',
                  ],
                );
                if (confirmed && context.mounted) {
                  onRollBack();
                }
              },
            ),
          ],
        ],
      ),
    );
  }
}

class ImportStat extends StatelessWidget {
  const ImportStat({
    super.key,
    required this.label,
    required this.value,
    required this.color,
  });

  final String label;
  final String value;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          BaseText(
            label.toUpperCase(),
            fontSize: 8.5,
            textStyle: AppTypography.overline,
            textColor: color,
          ),
          verticalSpace(3),
          BaseText(value, fontSize: 15, textStyle: AppTypography.figureMedium),
        ],
      ),
    );
  }
}
