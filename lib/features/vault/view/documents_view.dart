import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/di/injection.dart';
import '../../../core/router/app_router.gr.dart';
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
import '../../../core/widgets/mia_inputs.dart';
import '../../../core/widgets/mia_list_row.dart';
import '../../../core/widgets/mia_scaffold.dart';
import '../../../core/widgets/mia_sheet.dart';
import '../../../core/widgets/mia_states.dart';
import '../../../core/widgets/reveal.dart';
import '../../../core/widgets/status_pill.dart';
import '../../../data/models/admin_models.dart';
import '../../../data/models/core_models.dart';
import '../bloc/vault_bloc.dart';

@RoutePage()
class DocumentsView extends StatelessWidget {
  const DocumentsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<VaultBloc>(
      create: (BuildContext context) =>
          getIt<VaultBloc>()..add(const VaultEvent.load()),
      child: const DocumentsScaffold(),
    );
  }
}

class DocumentsScaffold extends StatelessWidget {
  const DocumentsScaffold({super.key});

  static const List<DocumentKind?> filters = <DocumentKind?>[
    null,
    DocumentKind.bill,
    DocumentKind.statement,
    DocumentKind.receipt,
    DocumentKind.policy,
    DocumentKind.warranty,
    DocumentKind.loanDocument,
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VaultBloc, VaultState>(
      builder: (BuildContext context, VaultState state) {
        final VaultBloc bloc = context.read<VaultBloc>();

        return MiaScaffold(
          title: 'Documents',
          overline: 'Authorised evidence library',
          mood: AuroraMood.calm,
          bottomBar: MiaBottomBar(
            child: MiaButton(
              label: 'Add a document',
              leadingIcon: Icons.upload_rounded,
              onTap: () async {
                final MiaDocument? created = await context.router
                    .push<MiaDocument>(const DocumentEditorRoute());
                if (created == null || !context.mounted) return;
                bloc.add(const VaultEvent.load());
                showMiaToast(
                  context,
                  message: '${created.name} filed under ${created.kind.label}.',
                  icon: Icons.folder_open_rounded,
                );
              },
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Reveal(
                child: MiaSearchField(
                  initialValue: state.query,
                  hint: 'Document name',
                  onChanged: (String value) =>
                      bloc.add(VaultEvent.queryChanged(value)),
                ),
              ),
              verticalSpace(14),
              Reveal(
                index: 1,
                child: MiaChipRow(
                  padding: EdgeInsets.zero,
                  labels: filters
                      .map((DocumentKind? k) => k?.label ?? 'All')
                      .toList(),
                  selectedIndex: filters.indexOf(state.documentFilter),
                  onChanged: (int i) =>
                      bloc.add(VaultEvent.documentFilterChanged(filters[i])),
                ),
              ),
              verticalSpace(16),
              if (!state.isReady)
                const SkeletonTileList(count: 6, tileHeight: 96)
              else if (state.visibleDocuments.isEmpty)
                const MiaStateView(kind: MiaStateKind.empty)
              else
                ...List<Widget>.generate(state.visibleDocuments.length, (
                  int i,
                ) {
                  final MiaDocument doc = state.visibleDocuments[i];
                  return Padding(
                    padding: EdgeInsets.only(bottom: getSize(8)),
                    child: Reveal(
                      index: i.clamp(0, 8),
                      child: DocumentCard(
                        document: doc,
                        onDelete: () async {
                          final bool confirmed = await confirmDestructive(
                            context: context,
                            title: 'Delete this document?',
                            message:
                                'The original file and its extracted fields are removed.',
                            consequences: <String>[
                              'Linked records lose their evidence link',
                              'Dependent calculations are rebuilt',
                              'A deletion record is kept without the content',
                            ],
                          );
                          if (confirmed) {
                            bloc.add(VaultEvent.documentDeleted(doc.id));
                          }
                        },
                        onReprocess: () {
                          bloc.add(VaultEvent.documentReprocessed(doc.id));
                          showMiaToast(
                            context,
                            message:
                                '${doc.name} read again. Its fields are back to Mia\'s reading.',
                            icon: Icons.refresh_rounded,
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

class DocumentCard extends StatelessWidget {
  const DocumentCard({
    super.key,
    required this.document,
    required this.onDelete,
    required this.onReprocess,
  });

  final MiaDocument document;
  final VoidCallback onDelete;
  final VoidCallback onReprocess;

  @override
  Widget build(BuildContext context) {
    return GlassPanel(
      tone: GlassTone.soft,
      onTap: () => showMiaSheet<void>(
        context: context,
        title: document.name,
        overline: document.kind.label,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            if (document.fields.isEmpty)
              BaseText(
                'No fields were extracted from this document.',
                fontSize: 12.5,
                textColor: AppColors.muted,
              )
            else
              ...document.fields.map((ExtractedField field) {
                return Padding(
                  padding: EdgeInsets.only(bottom: getSize(8)),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: EvidenceRow(
                          label: field.label,
                          value: field.value,
                          valueColor: field.needsConfirmation
                              ? AppColors.caution
                              : null,
                        ),
                      ),
                      horizontalSpace(8),
                      StatusPill(
                        label: '${(field.confidence * 100).round()}%',
                        color: field.confidence > 0.9
                            ? AppColors.positive
                            : AppColors.caution,
                        dense: true,
                      ),
                    ],
                  ),
                );
              }),
            verticalSpace(12),
            MiaButton(
              label: 'Reprocess',
              variant: MiaButtonVariant.frost,
              size: MiaButtonSize.medium,
              onTap: () {
                Navigator.of(context).pop();
                onReprocess();
              },
            ),
            verticalSpace(8),
            MiaButton(
              label: 'Delete document',
              variant: MiaButtonVariant.danger,
              size: MiaButtonSize.medium,
              onTap: () {
                Navigator.of(context).pop();
                onDelete();
              },
            ),
          ],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                width: getSize(38),
                height: getSize(38),
                decoration: BoxDecoration(
                  color: withCustomOpacity(AppColors.glacier, 0.14),
                  borderRadius: AppRadii.rSm,
                ),
                child: Icon(
                  document.kind.icon,
                  size: getFontSize(17),
                  color: AppColors.glacier,
                ),
              ),
              horizontalSpace(12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    BaseText(
                      document.name,
                      fontSize: 14,
                      textStyle: AppTypography.titleSmall,
                      maxLines: 2,
                    ),
                    verticalSpace(3),
                    BaseText(
                      '${document.fileType} · ${document.pages} pages · ${relativeLabel(document.uploadedOn)}',
                      fontSize: 11,
                      textColor: AppColors.muted,
                    ),
                  ],
                ),
              ),
            ],
          ),
          verticalSpace(10),
          Wrap(
            spacing: getSize(6),
            runSpacing: getSize(6),
            children: <Widget>[
              StatusPill(
                label: document.state.label,
                color: document.state.color,
                dense: true,
              ),
              StatusPill(
                label: document.source.label,
                color: document.source.color,
                icon: document.source.icon,
                dense: true,
              ),
              if (document.coveragePeriod != null)
                StatusPill(
                  label: document.coveragePeriod!,
                  color: AppColors.muted,
                  icon: Icons.date_range_rounded,
                  dense: true,
                ),
              if (document.visibility != RecordVisibility.private)
                StatusPill(
                  label: document.visibility.label,
                  color: AppColors.glacier,
                  icon: document.visibility.icon,
                  dense: true,
                ),
            ],
          ),
        ],
      ),
    );
  }
}
