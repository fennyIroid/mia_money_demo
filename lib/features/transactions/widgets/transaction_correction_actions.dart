import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../core/di/injection.dart';
import '../../../core/router/app_router.gr.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/utils/spacing_utils.dart';
import '../../../core/widgets/mia_button.dart';
import '../../../core/widgets/mia_inputs.dart';
import '../../../core/widgets/mia_list_row.dart';
import '../../../core/widgets/mia_pickers.dart';
import '../../../core/widgets/mia_sheet.dart';
import '../../../data/models/money_models.dart';
import '../../../data/repositories/money_repository.dart';

/// The corrections a person can make to a single transaction.
enum TransactionCorrection {
  category,
  merchant,
  split,
  transfer,
  exclude,
  reimbursable,
}

/// Contents of the correct-this-transaction sheet.
class TransactionCorrectionSheet extends StatelessWidget {
  const TransactionCorrectionSheet({super.key, required this.transaction});

  final MiaTransaction transaction;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        MiaSettingsRow(
          title: 'Change category',
          subtitle: 'Your choice sits on top of Mia\'s mapping',
          icon: Icons.label_rounded,
          onTap: () =>
              Navigator.of(context).pop(TransactionCorrection.category),
        ),
        MiaSettingsRow(
          title: 'Rename merchant',
          subtitle: 'The provider\'s name is kept underneath',
          icon: Icons.storefront_rounded,
          onTap: () =>
              Navigator.of(context).pop(TransactionCorrection.merchant),
        ),
        MiaSettingsRow(
          title: 'Split transaction',
          icon: Icons.call_split_rounded,
          onTap: () => Navigator.of(context).pop(TransactionCorrection.split),
        ),
        MiaSettingsRow(
          title: 'Mark as internal transfer',
          subtitle: 'Removes it from spending and income',
          icon: Icons.sync_alt_rounded,
          onTap: () =>
              Navigator.of(context).pop(TransactionCorrection.transfer),
        ),
        MiaSettingsRow(
          title: 'Exclude from spending',
          subtitle: 'Stays in the ledger, leaves the totals',
          icon: Icons.visibility_off_rounded,
          onTap: () => Navigator.of(context).pop(TransactionCorrection.exclude),
        ),
        MiaSettingsRow(
          title: 'Mark reimbursable',
          subtitle: 'Held out of your own spending until it comes back',
          icon: Icons.work_history_rounded,
          onTap: () =>
              Navigator.of(context).pop(TransactionCorrection.reimbursable),
        ),
      ],
    );
  }
}

/// Types a merchant name the user prefers to see.
class MerchantRenameSheet extends StatelessWidget {
  const MerchantRenameSheet({super.key, required this.current});

  final String current;

  @override
  Widget build(BuildContext context) {
    String draft = current;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        MiaFormField(
          label: 'Show it as',
          initialValue: current,
          autofocus: true,
          prefixIcon: Icons.storefront_outlined,
          onChanged: (String value) => draft = value,
          onSubmitted: (String value) =>
              Navigator.of(context).pop(value.trim()),
        ),
        verticalSpace(18),
        MiaButton(
          label: 'Use this name',
          leadingIcon: Icons.check_rounded,
          onTap: () => Navigator.of(context).pop(draft.trim()),
        ),
      ],
    );
  }
}

/// Opens the correction sheet and writes whichever correction was chosen.
/// Returns true when something changed, so the caller can reload.
Future<bool> showTransactionCorrections(
  BuildContext context,
  MiaTransaction transaction,
) async {
  final TransactionRepository repository = getIt<TransactionRepository>();
  final CategoryRepository categoryRepository = getIt<CategoryRepository>();

  final TransactionCorrection? correction =
      await showMiaSheet<TransactionCorrection>(
        context: context,
        title: 'Correct this transaction',
        overline: 'Your value takes precedence',
        child: TransactionCorrectionSheet(transaction: transaction),
      );
  if (!context.mounted || correction == null) {
    return false;
  }

  switch (correction) {
    case TransactionCorrection.category:
      final List<MiaCategory> categories = await categoryRepository
          .fetchCategories();
      if (!context.mounted) return false;

      final MiaCategory? picked = await showMiaSheet<MiaCategory>(
        context: context,
        title: 'Category',
        overline: 'Recorded as your confirmed value',
        expand: true,
        child: CategoryPickerSheet(
          categories: categories,
          selectedId: transaction.layers.effectiveCategoryId,
          onSelected: (MiaCategory category) =>
              Navigator.of(context).pop(category),
        ),
      );
      if (!context.mounted || picked == null) return false;

      await repository.applyCorrection(
        transactionId: transaction.id,
        categoryId: picked.id,
      );
      if (!context.mounted) return true;
      showMiaToast(
        context,
        message: 'Now counted under ${picked.name}.',
        icon: Icons.label_rounded,
      );
      return true;

    case TransactionCorrection.merchant:
      final String? name = await showMiaSheet<String>(
        context: context,
        title: 'Rename merchant',
        overline: 'The provider name is kept underneath',
        child: MerchantRenameSheet(current: transaction.merchantDisplay),
      );
      if (!context.mounted || name == null || name.isEmpty) return false;

      await repository.applyCorrection(
        transactionId: transaction.id,
        merchantAlias: name,
      );
      if (!context.mounted) return true;
      showMiaToast(
        context,
        message: 'Shown as $name from now on.',
        icon: Icons.storefront_rounded,
      );
      return true;

    case TransactionCorrection.split:
      await context.router.push(
        TransactionSplitRoute(transaction: transaction),
      );
      return true;

    case TransactionCorrection.transfer:
      await repository.applyCorrection(
        transactionId: transaction.id,
        treatment: TransactionTreatment.internalTransfer,
      );
      if (!context.mounted) return true;
      showMiaToast(
        context,
        message: 'Marked as a transfer. It leaves spending and income.',
        icon: Icons.sync_alt_rounded,
      );
      return true;

    case TransactionCorrection.exclude:
      await repository.applyCorrection(
        transactionId: transaction.id,
        treatment: TransactionTreatment.excluded,
      );
      if (!context.mounted) return true;
      showMiaToast(
        context,
        message: 'Excluded. It stays in the ledger with a reason recorded.',
        icon: Icons.visibility_off_rounded,
        accent: AppColors.caution,
      );
      return true;

    case TransactionCorrection.reimbursable:
      await repository.applyCorrection(
        transactionId: transaction.id,
        treatment: TransactionTreatment.reimbursement,
        tags: <String>[...transaction.tags, 'Reimbursable'],
      );
      if (!context.mounted) return true;
      showMiaToast(
        context,
        message: 'Marked reimbursable until the money comes back.',
        icon: Icons.work_history_rounded,
        accent: AppColors.glacier,
      );
      return true;
  }
}
