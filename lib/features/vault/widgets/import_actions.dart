import 'dart:convert';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

import '../../../core/constants/app_constants.dart';
import '../../../core/di/injection.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/widgets/mia_list_row.dart';
import '../../../core/widgets/mia_sheet.dart';
import '../../../data/models/admin_models.dart';
import '../../../data/repositories/admin_repository.dart';
import '../../logging/widgets/quick_add_sheet.dart';

/// The ways records get into Mia in bulk.
enum ImportSource { csv, pdf, manual }

class ImportOptionsSheet extends StatelessWidget {
  const ImportOptionsSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        MiaSettingsRow(
          title: 'Bank or card CSV',
          subtitle:
              'Up to ${AppConstants.csvMaxMegabytes} MB or ${AppConstants.csvMaxRows} rows, with reusable column mapping',
          icon: Icons.table_chart_rounded,
          onTap: () => Navigator.of(context).pop(ImportSource.csv),
        ),
        MiaSettingsRow(
          title: 'PDF statement',
          subtitle:
              'Up to ${AppConstants.pdfMaxMegabytes} MB and ${AppConstants.pdfMaxPages} pages, supported templates only',
          icon: Icons.picture_as_pdf_rounded,
          onTap: () => Navigator.of(context).pop(ImportSource.pdf),
        ),
        MiaSettingsRow(
          title: 'Manual record',
          subtitle:
              'Transactions, bills, accounts, balances, assets and liabilities',
          icon: Icons.edit_note_rounded,
          onTap: () => Navigator.of(context).pop(ImportSource.manual),
        ),
      ],
    );
  }
}

/// Picks a file and files it as an import batch. The row count comes from the
/// file itself rather than being invented, and the batch starts queued because
/// nothing has been read from it yet.
Future<ImportBatch?> startImport(BuildContext context) async {
  final ImportSource? source = await showMiaSheet<ImportSource>(
    context: context,
    title: 'Import options',
    overline: 'Everything previews before it commits',
    child: const ImportOptionsSheet(),
  );
  if (!context.mounted || source == null) {
    return null;
  }

  if (source == ImportSource.manual) {
    await showQuickAddSheet(context);
    return null;
  }

  final bool isCsv = source == ImportSource.csv;
  PlatformFile? file;
  try {
    final FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: <String>[isCsv ? 'csv' : 'pdf'],
      withData: isCsv,
    );
    file = result?.files.firstOrNull;
  } on Exception {
    if (context.mounted) {
      showMiaToast(
        context,
        message: 'Could not open the file picker on this device.',
        icon: Icons.info_outline_rounded,
        accent: AppColors.caution,
      );
    }
    return null;
  }

  if (file == null) {
    return null;
  }

  final int maxBytes =
      (isCsv ? AppConstants.csvMaxMegabytes : AppConstants.pdfMaxMegabytes) *
      1024 *
      1024;
  if (file.size > maxBytes) {
    if (context.mounted) {
      showMiaToast(
        context,
        message: 'That file is over the limit, so nothing was imported.',
        icon: Icons.error_outline_rounded,
        accent: AppColors.negative,
      );
    }
    return null;
  }

  int rowCount = 0;
  if (isCsv && file.bytes != null) {
    // Count the data rows in the file rather than guessing at them.
    rowCount = const LineSplitter()
        .convert(utf8.decode(file.bytes!, allowMalformed: true))
        .where((String line) => line.trim().isNotEmpty)
        .length;
    if (rowCount > 0) rowCount -= 1;
  }

  return getIt<DocumentRepository>().createImport(
    fileName: file.name,
    kind: isCsv ? 'CSV' : 'PDF statement',
    rowCount: rowCount,
  );
}
