import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../core/router/app_router.gr.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_typography.dart';
import '../../../core/utils/currency_utils.dart';
import '../../../core/utils/math_utils.dart';
import '../../../core/utils/spacing_utils.dart';
import '../../../core/widgets/base_text.dart';
import '../../../core/widgets/mia_list_row.dart';
import '../../../core/widgets/mia_sheet.dart';
import '../../../data/models/admin_models.dart';
import '../../../data/models/insight_models.dart';
import '../../../data/models/money_models.dart';

/// One entry in the add sheet: the form it opens, and the list the new record
/// belongs to once it exists.
class QuickAddAction {
  const QuickAddAction({
    required this.title,
    required this.description,
    required this.icon,
    required this.accent,
    required this.group,
    required this.open,
  });

  final String title;
  final String description;
  final IconData icon;
  final Color accent;
  final String group;

  /// Opens the form, then returns the message to confirm with — null if the
  /// user backed out without creating anything.
  final Future<String?> Function(BuildContext context) open;
}

/// Everything a person can add by hand, in the order they most often need it.
List<QuickAddAction> quickAddActions() => <QuickAddAction>[
  QuickAddAction(
    title: 'Log money',
    description: 'Cash, a transfer, anything the accounts will not show',
    icon: Icons.edit_note_rounded,
    accent: AppColors.ember,
    group: 'Money',
    open: (BuildContext context) async {
      final MiaTransaction? created = await context.router.push<MiaTransaction>(
        const LogTransactionRoute(),
      );
      if (created == null) return null;
      if (context.mounted) {
        await context.router.push(const TransactionsRoute());
      }
      return '${created.description.isEmpty ? 'Transfer' : created.description} logged for ${formatCurrency(created.amount.abs())}.';
    },
  ),
  QuickAddAction(
    title: 'Add a bill',
    description: 'A bill, subscription or renewal you already know about',
    icon: Icons.receipt_long_rounded,
    accent: AppColors.ember,
    group: 'Commitments',
    open: (BuildContext context) async {
      final Bill? created = await context.router.push<Bill>(
        const BillEditorRoute(),
      );
      if (created == null) return null;
      if (context.mounted) {
        await context.router.push(const BillsRoute());
      }
      return '${created.provider} added at ${formatCurrency(created.amount)} ${created.frequency.label.toLowerCase()}.';
    },
  ),
  QuickAddAction(
    title: 'Money owed to you',
    description: 'A refund, a claim, something a person still owes',
    icon: Icons.hourglass_bottom_rounded,
    accent: AppColors.glacier,
    group: 'Commitments',
    open: (BuildContext context) async {
      final ExpectedMoney? created = await context.router.push<ExpectedMoney>(
        const ExpectedMoneyEditorRoute(),
      );
      if (created == null) return null;
      if (context.mounted) {
        await context.router.push(const ExpectedMoneyRoute());
      }
      return '${formatCurrency(created.amount)} from ${created.counterparty} is now tracked.';
    },
  ),
  QuickAddAction(
    title: 'Add an account',
    description: 'Cash, an asset or a loan you keep up to date yourself',
    icon: Icons.add_card_rounded,
    accent: AppColors.glacier,
    group: 'Money',
    open: (BuildContext context) async {
      final FinancialAccount? created = await context.router
          .push<FinancialAccount>(const AccountEditorRoute());
      if (created == null) return null;
      if (context.mounted) {
        await context.router.push(const AccountsRoute());
      }
      return '${created.name} added at ${formatCurrency(created.balance)}.';
    },
  ),
  QuickAddAction(
    title: 'New goal',
    description: 'A savings target or sinking fund to track',
    icon: Icons.flag_rounded,
    accent: AppColors.ember,
    group: 'Money',
    open: (BuildContext context) async {
      final Goal? created = await context.router.push<Goal>(
        const GoalEditorRoute(),
      );
      if (created == null) return null;
      if (context.mounted) {
        await context.router.push(const GoalsRoute());
      }
      return '${created.name} is now tracked.';
    },
  ),
  QuickAddAction(
    title: 'Add a receipt',
    description: 'Enter one by hand and attach it to a transaction',
    icon: Icons.receipt_rounded,
    accent: AppColors.glacier,
    group: 'Records',
    open: (BuildContext context) async {
      final Receipt? created = await context.router.push<Receipt>(
        const ReceiptEditorRoute(),
      );
      if (created == null) return null;
      if (context.mounted) {
        await context.router.push(const ReceiptsRoute());
      }
      return '${created.merchant} receipt saved for ${formatCurrency(created.total)}.';
    },
  ),
  QuickAddAction(
    title: 'Add a purchase',
    description: 'Something bought, so its warranty can be tracked',
    icon: Icons.inventory_2_rounded,
    accent: AppColors.violetHaze,
    group: 'Records',
    open: (BuildContext context) async {
      final PurchaseRecord? created = await context.router.push<PurchaseRecord>(
        const PurchaseEditorRoute(),
      );
      if (created == null) return null;
      if (context.mounted) {
        await context.router.push(const VaultRoute());
      }
      return '${created.itemName} added to the vault.';
    },
  ),
  QuickAddAction(
    title: 'File a document',
    description: 'A statement, policy or contract to keep',
    icon: Icons.folder_open_rounded,
    accent: AppColors.violetHaze,
    group: 'Records',
    open: (BuildContext context) async {
      final MiaDocument? created = await context.router.push<MiaDocument>(
        const DocumentEditorRoute(),
      );
      if (created == null) return null;
      if (context.mounted) {
        await context.router.push(const DocumentsRoute());
      }
      return '${created.name} filed.';
    },
  ),
  QuickAddAction(
    title: 'New category',
    description: 'Your own category for the way you think about money',
    icon: Icons.label_rounded,
    accent: AppColors.ember,
    group: 'Records',
    open: (BuildContext context) async {
      final MiaCategory? created = await context.router.push<MiaCategory>(
        const CategoryEditorRoute(),
      );
      if (created == null) return null;
      if (context.mounted) {
        await context.router.push(const CategoriesRoute());
      }
      return '${created.name} is ready to use.';
    },
  ),
];

/// Opens the add sheet and runs whichever form the user chose. The confirmation
/// only appears once the record actually exists.
Future<void> showQuickAddSheet(BuildContext context) async {
  final QuickAddAction? action = await showMiaSheet<QuickAddAction>(
    context: context,
    title: 'Add or log',
    overline: 'Nothing here is guessed for you',
    expand: true,
    child: const QuickAddSheet(),
  );

  if (action == null || !context.mounted) {
    return;
  }

  final String? confirmation = await action.open(context);
  if (confirmation == null || !context.mounted) {
    return;
  }

  showMiaToast(context, message: confirmation, icon: action.icon);
}

class QuickAddSheet extends StatelessWidget {
  const QuickAddSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final List<QuickAddAction> actions = quickAddActions();
    final List<String> groups = actions
        .map((QuickAddAction a) => a.group)
        .toSet()
        .toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        for (final String group in groups) ...<Widget>[
          BaseText(
            group,
            fontSize: 10,
            textStyle: AppTypography.overline,
            textColor: AppColors.muted,
          ),
          verticalSpace(10),
          ...actions
              .where((QuickAddAction a) => a.group == group)
              .map(
                (QuickAddAction action) => Padding(
                  padding: EdgeInsets.only(bottom: getSize(8)),
                  child: MiaListRow(
                    title: action.title,
                    subtitle: action.description,
                    icon: action.icon,
                    iconColor: action.accent,
                    showChevron: true,
                    onTap: () =>
                        Navigator.of(context).pop<QuickAddAction>(action),
                  ),
                ),
              ),
          verticalSpace(12),
        ],
      ],
    );
  }
}
