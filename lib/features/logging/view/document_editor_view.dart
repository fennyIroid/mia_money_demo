import 'package:auto_route/auto_route.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/di/injection.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/utils/spacing_utils.dart';
import '../../../core/widgets/aurora_background.dart';
import '../../../core/widgets/mia_button.dart';
import '../../../core/widgets/mia_inputs.dart';
import '../../../core/widgets/mia_pickers.dart';
import '../../../core/widgets/mia_list_row.dart';
import '../../../core/widgets/mia_scaffold.dart';
import '../../../core/widgets/mia_sheet.dart';
import '../../../core/widgets/mia_states.dart';
import '../../../core/widgets/reveal.dart';
import '../../../data/models/admin_models.dart';
import '../bloc/log_bloc.dart';

/// Files a document into the vault. Choosing a file fills the name, type and
/// size from the file itself so those fields are not invented.
@RoutePage()
class DocumentEditorView extends StatelessWidget {
  const DocumentEditorView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LogBloc>(
      create: (BuildContext context) =>
          getIt<LogBloc>()..add(const LogEvent.started()),
      child: const DocumentEditorScaffold(),
    );
  }
}

class DocumentEditorScaffold extends StatelessWidget {
  const DocumentEditorScaffold({super.key});

  Future<void> _pickFile(BuildContext context, LogBloc bloc) async {
    try {
      final FilePickerResult? result = await FilePicker.platform.pickFiles();
      final PlatformFile? file = result?.files.firstOrNull;
      if (file == null) return;

      bloc.add(
        LogEvent.documentDraftChanged(
          name: file.name,
          fileType: (file.extension ?? 'file').toUpperCase(),
          sizeKb: (file.size / 1024).round(),
        ),
      );
    } on Exception {
      // A picker the platform refuses should not block a manual entry: the
      // user can still name the document themselves.
      if (context.mounted) {
        showMiaToast(
          context,
          message: 'Could not open the file picker. Name it by hand instead.',
          icon: Icons.info_outline_rounded,
          accent: AppColors.caution,
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LogBloc, LogState>(
      listenWhen: (LogState p, LogState c) =>
          p.createdDocument != c.createdDocument,
      listener: (BuildContext context, LogState state) {
        if (state.createdDocument != null) {
          context.router.maybePop<MiaDocument>(state.createdDocument);
        }
      },
      builder: (BuildContext context, LogState state) {
        final LogBloc bloc = context.read<LogBloc>();

        return MiaScaffold(
          title: 'File a document',
          overline: 'Kept where the record it belongs to is',
          mood: AuroraMood.glacier,
          bottomBar: MiaBottomBar(
            child: MiaButton(
              label: state.isSaving ? 'Saving' : 'File it',
              leadingIcon: Icons.folder_open_rounded,
              isEnabled: state.canSaveDocument && !state.isSaving,
              onTap: () => bloc.add(const LogEvent.documentSubmitted()),
            ),
          ),
          child: !state.isReady
              ? const SkeletonTileList(count: 3, tileHeight: 76)
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Reveal(
                      child: MiaButton(
                        label: 'Choose a file',
                        leadingIcon: Icons.attach_file_rounded,
                        variant: MiaButtonVariant.outline,
                        onTap: () => _pickFile(context, bloc),
                      ),
                    ),
                    verticalSpace(18),
                    Reveal(
                      index: 1,
                      child: MiaFormField(
                        label: 'Name',
                        hint: 'Origin electricity — March quarter',
                        initialValue: state.documentName,
                        prefixIcon: Icons.description_outlined,
                        onChanged: (String value) => bloc.add(
                          LogEvent.documentDraftChanged(name: value),
                        ),
                      ),
                    ),
                    verticalSpace(18),
                    Reveal(
                      index: 2,
                      child: MiaPickerField(
                        label: 'Kind',
                        value: state.documentKind.label,
                        icon: state.documentKind.icon,
                        accent: AppColors.glacier,
                        onTap: () => showMiaSheet<void>(
                          context: context,
                          title: 'Kind',
                          overline: 'Decides where Mia files it',
                          expand: true,
                          child: OptionPickerSheet<DocumentKind>(
                            options: DocumentKind.values,
                            selected: state.documentKind,
                            accent: AppColors.glacier,
                            labelOf: (DocumentKind k) => k.label,
                            iconOf: (DocumentKind k) => k.icon,
                            onSelected: (DocumentKind kind) => bloc.add(
                              LogEvent.documentDraftChanged(kind: kind),
                            ),
                          ),
                        ),
                      ),
                    ),
                    verticalSpace(18),
                    Reveal(
                      index: 3,
                      child: MiaFormField(
                        label: 'Period it covers (optional)',
                        hint: '1 Jan – 31 Mar 2026',
                        prefixIcon: Icons.date_range_rounded,
                        onChanged: (String value) => bloc.add(
                          LogEvent.documentDraftChanged(coveragePeriod: value),
                        ),
                      ),
                    ),
                    verticalSpace(20),
                    Reveal(
                      index: 4,
                      child: MiaGroupedCard(
                        title: 'What is stored',
                        footnote:
                            'Nothing is extracted from a document you filed by hand until you ask Mia to read it.',
                        children: <Widget>[
                          EvidenceRow(
                            label: 'File type',
                            value: state.documentFileType,
                          ),
                          EvidenceRow(
                            label: 'Size',
                            value: state.documentSizeKb == 0
                                ? 'Not known'
                                : '${state.documentSizeKb} KB',
                          ),
                          const EvidenceRow(
                            label: 'Retention',
                            value: 'Until you delete it',
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
        );
      },
    );
  }
}
