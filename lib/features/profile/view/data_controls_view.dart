import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/di/injection.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_typography.dart';
import '../../../core/utils/math_utils.dart';
import '../../../core/utils/spacing_utils.dart';
import '../../../core/widgets/aurora_background.dart';
import '../../../core/widgets/base_text.dart';
import '../../../core/widgets/glass_panel.dart';
import '../../../core/widgets/mia_button.dart';
import '../../../core/widgets/mia_inputs.dart';
import '../../../core/widgets/mia_list_row.dart';
import '../../../core/widgets/mia_scaffold.dart';
import '../../../core/widgets/mia_sheet.dart';
import '../../../core/widgets/reveal.dart';
import '../../../data/models/admin_models.dart';
import '../../../data/models/assistant_models.dart';
import '../../../data/repositories/assistant_repository.dart';
import '../bloc/profile_bloc.dart';

@RoutePage()
class DataControlsView extends StatelessWidget {
  const DataControlsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProfileBloc>(
      create: (BuildContext context) =>
          getIt<ProfileBloc>()..add(const ProfileEvent.load()),
      child: const DataControlsScaffold(),
    );
  }
}

/// What the export can carry. Each part is opt-in and is named in the record
/// the export leaves behind.
const List<String> exportParts = <String>[
  'Transactions and corrections',
  'Bills, obligations and expected money',
  'Documents and receipts',
  'Calculations and their evidence',
];

class DataControlsScaffold extends StatelessWidget {
  const DataControlsScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<Set<String>> included = ValueNotifier<Set<String>>(
      <String>{exportParts[0], exportParts[1], exportParts[3]},
    );
    final ProfileBloc bloc = context.read<ProfileBloc>();

    return MiaScaffold(
      title: 'Your data',
      overline: 'Export, retention and deletion',
      mood: AuroraMood.calm,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Reveal(
            child: GlassPanel(
              tone: GlassTone.soft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  BaseText(
                    'Export',
                    fontSize: 10,
                    textStyle: AppTypography.overline,
                  ),
                  verticalSpace(8),
                  BaseText(
                    'Choose what to include. The file states its own coverage so you always know what it contains.',
                    fontSize: 12.5,
                    textColor: AppColors.mist,
                    height: 1.5,
                  ),
                  verticalSpace(12),
                  ValueListenableBuilder<Set<String>>(
                    valueListenable: included,
                    builder: (BuildContext context, Set<String> parts, Widget? _) {
                      void toggle(String part, bool on) {
                        included.value = <String>{...parts, if (on) part}
                          ..removeWhere((String p) => !on && p == part);
                      }

                      return Column(
                        children: <Widget>[
                          MiaSwitchRow(
                            title: exportParts[0],
                            value: parts.contains(exportParts[0]),
                            icon: Icons.swap_horiz_rounded,
                            onChanged: (bool v) => toggle(exportParts[0], v),
                          ),
                          MiaSwitchRow(
                            title: exportParts[1],
                            value: parts.contains(exportParts[1]),
                            icon: Icons.receipt_long_rounded,
                            onChanged: (bool v) => toggle(exportParts[1], v),
                          ),
                          MiaSwitchRow(
                            title: exportParts[2],
                            value: parts.contains(exportParts[2]),
                            icon: Icons.folder_rounded,
                            onChanged: (bool v) => toggle(exportParts[2], v),
                          ),
                          MiaSwitchRow(
                            title: exportParts[3],
                            value: parts.contains(exportParts[3]),
                            icon: Icons.functions_rounded,
                            onChanged: (bool v) => toggle(exportParts[3], v),
                          ),
                          verticalSpace(12),
                          MiaButton(
                            label: 'Prepare export',
                            variant: MiaButtonVariant.frost,
                            size: MiaButtonSize.medium,
                            isEnabled: parts.isNotEmpty,
                            onTap: () {
                              bloc.add(
                                ProfileEvent.exportRequested(parts.toList()),
                              );
                              showMiaToast(
                                context,
                                message:
                                    'Export built with ${parts.length} of ${exportParts.length} parts. It is listed below.',
                                icon: Icons.download_rounded,
                              );
                            },
                          ),
                        ],
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          verticalSpace(16),
          Reveal(
            index: 1,
            child: GlassPanel(
              tone: GlassTone.soft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  BaseText(
                    'What deletion covers',
                    fontSize: 10,
                    textStyle: AppTypography.overline,
                  ),
                  verticalSpace(8),
                  const EvidenceRow(
                    label: 'Primary database',
                    value: 'Deleted',
                  ),
                  const EvidenceRow(
                    label: 'Files and objects',
                    value: 'Deleted',
                  ),
                  const EvidenceRow(
                    label: 'Search and vector indexes',
                    value: 'Deleted',
                  ),
                  const EvidenceRow(
                    label: 'Caches and queues',
                    value: 'Purged',
                  ),
                  const EvidenceRow(
                    label: 'Provider tokens',
                    value: 'Revoked and deleted',
                  ),
                  const EvidenceRow(
                    label: 'Derived calculations',
                    value: 'Deleted',
                  ),
                  const EvidenceRow(
                    label: 'Backups',
                    value: 'Expire on a documented schedule',
                    valueColor: AppColors.caution,
                  ),
                  const EvidenceRow(
                    label: 'Deletion ledger',
                    value: 'Proves completion, keeps no content',
                    valueColor: AppColors.positive,
                  ),
                  const EvidenceRow(
                    label: 'CDR deletion',
                    value: 'Within the required timeframe, status visible',
                  ),
                ],
              ),
            ),
          ),
          verticalSpace(16),
          BlocBuilder<ProfileBloc, ProfileState>(
            builder: (BuildContext context, ProfileState state) {
              if (state.exports.isEmpty) return const SizedBox.shrink();
              return Padding(
                padding: EdgeInsets.only(bottom: getSize(16)),
                child: MiaGroupedCard(
                  title: 'Your exports',
                  footnote:
                      'Each file states the parts it covers, so you always know what is in it.',
                  children: state.exports
                      .map<Widget>(
                        (ExportJob job) => EvidenceRow(
                          label: '${job.format} · ${job.label}',
                          value: job.coveragePeriod,
                        ),
                      )
                      .toList(),
                ),
              );
            },
          ),
          Reveal(
            index: 2,
            child: MiaButton(
              label: 'Delete my account',
              variant: MiaButtonVariant.danger,
              onTap: () async {
                final bool confirmed = await confirmDestructive(
                  context: context,
                  title: 'Delete everything?',
                  message:
                      'This removes your records, documents, derived calculations and provider tokens.',
                  confirmLabel: 'Delete everything',
                  consequences: <String>[
                    'Household members keep their own records',
                    'Backups expire on the documented schedule',
                    'A deletion ledger records completion without content',
                  ],
                );
                if (!confirmed || !context.mounted) return;

                // A deletion request is a case with a reference, so its status
                // is something the user can come back to rather than a message
                // that vanished.
                final SupportCase
                opened = await getIt<SupportRepository>().submitCase(
                  'Account deletion requested',
                  'Delete every record, document, derived calculation and provider token.',
                  true,
                );
                if (!context.mounted) return;
                showMiaToast(
                  context,
                  message:
                      'Deletion started under ${opened.reference}. Track it in Help & support.',
                  icon: Icons.delete_forever_rounded,
                  accent: AppColors.negative,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
