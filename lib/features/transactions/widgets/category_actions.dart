import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../core/router/app_router.gr.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_shapes.dart';
import '../../../core/utils/color_utils.dart';
import '../../../core/utils/math_utils.dart';
import '../../../core/utils/spacing_utils.dart';
import '../../../core/widgets/base_text.dart';
import '../../../core/widgets/mia_list_row.dart';
import '../../../core/widgets/mia_sheet.dart';
import '../../../core/widgets/mia_states.dart';
import '../../../data/models/money_models.dart';
import '../bloc/transactions_bloc.dart';

/// Structural edits a user can make to the category tree.
enum CategoryAction { create, merge, move, archive }

class CategoryActionsSheet extends StatelessWidget {
  const CategoryActionsSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        MiaSettingsRow(
          title: 'Create category',
          subtitle: 'Top level, or inside one you already have',
          icon: Icons.add_circle_outline_rounded,
          onTap: () => Navigator.of(context).pop(CategoryAction.create),
        ),
        MiaSettingsRow(
          title: 'Merge two categories',
          subtitle: 'Transactions are migrated, never deleted',
          icon: Icons.merge_rounded,
          onTap: () => Navigator.of(context).pop(CategoryAction.merge),
        ),
        MiaSettingsRow(
          title: 'Move a subcategory',
          subtitle: 'Give it a different parent',
          icon: Icons.drive_file_move_rounded,
          onTap: () => Navigator.of(context).pop(CategoryAction.move),
        ),
        MiaSettingsRow(
          title: 'Archive a category',
          subtitle: 'It stops being offered, past records keep it',
          icon: Icons.archive_rounded,
          onTap: () => Navigator.of(context).pop(CategoryAction.archive),
        ),
      ],
    );
  }
}

/// Picker over a list of categories, showing each one's glyph and load so the
/// choice is made on evidence rather than name alone.
class CategoryPickerSheet extends StatelessWidget {
  const CategoryPickerSheet({
    super.key,
    required this.categories,
    required this.emptyMessage,
    this.footnote,
  });

  final List<MiaCategory> categories;
  final String emptyMessage;
  final String? footnote;

  @override
  Widget build(BuildContext context) {
    if (categories.isEmpty) {
      return MiaStateView(
        kind: MiaStateKind.empty,
        compact: true,
        title: 'Nothing to choose from',
        message: emptyMessage,
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        ...categories.map(
          (MiaCategory category) => MiaSettingsRow(
            title: category.name,
            subtitle: '${category.transactionCount} transactions this month',
            accent: category.color,
            trailing: Container(
              width: getSize(30),
              height: getSize(30),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: withCustomOpacity(category.color, 0.16),
                borderRadius: AppRadii.rXs,
              ),
              child: Icon(
                category.icon,
                size: getFontSize(15),
                color: category.color,
              ),
            ),
            onTap: () => Navigator.of(context).pop(category),
          ),
        ),
        if (footnote != null) ...<Widget>[
          verticalSpace(10),
          BaseText(
            footnote!,
            fontSize: 12,
            textColor: AppColors.muted,
            height: 1.4,
            maxLines: 4,
          ),
        ],
      ],
    );
  }
}

/// Opens the category actions sheet and carries the chosen action through to a
/// real edit. Every path ends in a repository write, not a message.
Future<void> showCategoryActions(
  BuildContext context,
  TransactionsBloc bloc,
) async {
  final CategoryAction? action = await showMiaSheet<CategoryAction>(
    context: context,
    title: 'Category actions',
    child: const CategoryActionsSheet(),
  );
  if (!context.mounted || action == null) {
    return;
  }

  switch (action) {
    case CategoryAction.create:
      final MiaCategory? created = await context.router.push<MiaCategory>(
        const CategoryEditorRoute(),
      );
      if (!context.mounted || created == null) {
        return;
      }
      bloc.add(const TransactionsEvent.load(isRefresh: true));
      showMiaToast(
        context,
        message: '${created.name} is ready to use.',
        icon: Icons.category_rounded,
      );
    case CategoryAction.merge:
      await _mergeFlow(context, bloc);
    case CategoryAction.move:
      await _moveFlow(context, bloc);
    case CategoryAction.archive:
      await _archiveFlow(context, bloc);
  }
}

Future<void> _mergeFlow(BuildContext context, TransactionsBloc bloc) async {
  final MiaCategory? from = await _pick(
    context,
    title: 'Merge which category?',
    overline: 'Step 1 of 2',
    categories: bloc.state.categories,
    emptyMessage: 'Categories load with your transactions.',
    footnote: 'This one is emptied and retired.',
  );
  if (!context.mounted || from == null) {
    return;
  }

  final MiaCategory? into = await _pick(
    context,
    title: 'Move its transactions into',
    overline: 'Step 2 of 2',
    categories: bloc.state.categories
        .where((MiaCategory c) => c.id != from.id)
        .toList(),
    emptyMessage: 'There is nothing else to merge into yet.',
    footnote: '${from.transactionCount} transactions move across.',
  );
  if (!context.mounted || into == null) {
    return;
  }

  final bool confirmed = await confirmDestructive(
    context: context,
    title: 'Merge ${from.name} into ${into.name}?',
    message:
        '${from.transactionCount} transactions move to ${into.name} and ${from.name} is retired.',
    confirmLabel: 'Merge',
    consequences: <String>[
      'No transaction is deleted',
      'The provider category underneath each transaction is untouched',
      'Reports for past months change to reflect the merge',
    ],
  );
  if (!context.mounted || !confirmed) {
    return;
  }

  bloc.add(
    TransactionsEvent.categoriesMerged(fromId: from.id, intoId: into.id),
  );
  showMiaToast(
    context,
    message: '${from.name} merged into ${into.name}.',
    icon: Icons.merge_rounded,
  );
}

Future<void> _moveFlow(BuildContext context, TransactionsBloc bloc) async {
  final MiaCategory? child = await _pick(
    context,
    title: 'Move which subcategory?',
    overline: 'Step 1 of 2',
    categories: bloc.state.subcategories,
    emptyMessage: 'You have no subcategories yet.',
  );
  if (!context.mounted || child == null) {
    return;
  }

  final MiaCategory? parent = await _pick(
    context,
    title: 'Put it under',
    overline: 'Step 2 of 2',
    categories: bloc.state.parentCategories
        .where((MiaCategory c) => c.id != child.parentId)
        .toList(),
    emptyMessage: 'There is no other parent category to move it to.',
  );
  if (!context.mounted || parent == null) {
    return;
  }

  bloc.add(
    TransactionsEvent.subcategoryMoved(
      categoryId: child.id,
      parentId: parent.id,
    ),
  );
  showMiaToast(
    context,
    message: '${child.name} now sits under ${parent.name}.',
    icon: Icons.drive_file_move_rounded,
  );
}

Future<void> _archiveFlow(BuildContext context, TransactionsBloc bloc) async {
  final MiaCategory? category = await _pick(
    context,
    title: 'Archive which category?',
    categories: bloc.state.categories,
    emptyMessage: 'Categories load with your transactions.',
    footnote: 'Archived categories stop being offered on new transactions.',
  );
  if (!context.mounted || category == null) {
    return;
  }

  final bool confirmed = await confirmDestructive(
    context: context,
    title: 'Archive ${category.name}?',
    message:
        'It disappears from pickers and reports going forward. Past transactions keep it.',
    confirmLabel: 'Archive',
    consequences: <String>[
      '${category.transactionCount} existing transactions keep this category',
      'Rules pointing at it stop matching',
      'You can bring it back from the archived list',
    ],
  );
  if (!context.mounted || !confirmed) {
    return;
  }

  bloc.add(TransactionsEvent.categoryArchived(category.id));
  showMiaToast(
    context,
    message: '${category.name} archived.',
    icon: Icons.archive_rounded,
    accent: AppColors.caution,
  );
}

Future<MiaCategory?> _pick(
  BuildContext context, {
  required String title,
  required List<MiaCategory> categories,
  required String emptyMessage,
  String? overline,
  String? footnote,
}) {
  return showMiaSheet<MiaCategory>(
    context: context,
    title: title,
    overline: overline,
    child: CategoryPickerSheet(
      categories: categories,
      emptyMessage: emptyMessage,
      footnote: footnote,
    ),
  );
}
