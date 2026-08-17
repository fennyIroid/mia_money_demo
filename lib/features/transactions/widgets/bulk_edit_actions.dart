import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/widgets/mia_list_row.dart';
import '../../../core/widgets/mia_pickers.dart';
import '../../../core/widgets/mia_sheet.dart';
import '../../../data/models/money_models.dart';

/// What a bulk edit can do to the selected rows.
enum BulkEdit { categorise, transfer, exclude, reimbursable }

/// The result of the bulk edit flow: the correction to apply, and the label to
/// confirm it with once it has been written.
class BulkEditChoice {
  const BulkEditChoice({
    required this.description,
    this.categoryId,
    this.treatment,
  });

  final String description;
  final String? categoryId;
  final TransactionTreatment? treatment;
}

class BulkEditSheet extends StatelessWidget {
  const BulkEditSheet({super.key, required this.count});

  final int count;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        MiaSettingsRow(
          title: 'Set the category',
          subtitle: 'Applies to all $count selected',
          icon: Icons.label_rounded,
          onTap: () => Navigator.of(context).pop(BulkEdit.categorise),
        ),
        MiaSettingsRow(
          title: 'Mark as internal transfers',
          subtitle: 'Removes them from spending and income',
          icon: Icons.sync_alt_rounded,
          onTap: () => Navigator.of(context).pop(BulkEdit.transfer),
        ),
        MiaSettingsRow(
          title: 'Exclude from spending',
          subtitle: 'They stay in the ledger with a reason recorded',
          icon: Icons.visibility_off_rounded,
          onTap: () => Navigator.of(context).pop(BulkEdit.exclude),
        ),
        MiaSettingsRow(
          title: 'Mark reimbursable',
          subtitle: 'Held out of your own spending until repaid',
          icon: Icons.work_history_rounded,
          onTap: () => Navigator.of(context).pop(BulkEdit.reimbursable),
        ),
      ],
    );
  }
}

/// Asks what to apply to the selection. Returns null if the user backed out.
Future<BulkEditChoice?> chooseBulkEdit(
  BuildContext context, {
  required int count,
  required List<MiaCategory> categories,
}) async {
  final BulkEdit? edit = await showMiaSheet<BulkEdit>(
    context: context,
    title: 'Bulk edit',
    overline: '$count selected',
    child: BulkEditSheet(count: count),
  );
  if (!context.mounted || edit == null) {
    return null;
  }

  switch (edit) {
    case BulkEdit.categorise:
      final MiaCategory? picked = await showMiaSheet<MiaCategory>(
        context: context,
        title: 'Category',
        overline: 'Recorded as your confirmed value on each row',
        expand: true,
        child: CategoryPickerSheet(
          categories: categories,
          selectedId: null,
          onSelected: (MiaCategory category) =>
              Navigator.of(context).pop(category),
        ),
      );
      if (picked == null) return null;
      return BulkEditChoice(
        description: '$count moved to ${picked.name}.',
        categoryId: picked.id,
      );
    case BulkEdit.transfer:
      return BulkEditChoice(
        description: '$count marked as internal transfers.',
        treatment: TransactionTreatment.internalTransfer,
      );
    case BulkEdit.exclude:
      return BulkEditChoice(
        description: '$count excluded from spending.',
        treatment: TransactionTreatment.excluded,
      );
    case BulkEdit.reimbursable:
      return BulkEditChoice(
        description: '$count marked reimbursable.',
        treatment: TransactionTreatment.reimbursement,
      );
  }
}

/// Accent used when confirming a bulk edit that removes rows from totals.
const Color bulkEditCautionAccent = AppColors.caution;
