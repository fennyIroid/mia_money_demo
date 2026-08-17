import 'package:flutter/material.dart';

import '../../data/models/money_models.dart';
import '../theme/app_colors.dart';
import '../utils/currency_utils.dart';
import '../utils/math_utils.dart';
import '../utils/spacing_utils.dart';
import 'mia_inputs.dart';

/// Account chooser used by every form that has to say where money sits.
class AccountPickerSheet extends StatelessWidget {
  const AccountPickerSheet({
    super.key,
    required this.accounts,
    required this.selectedId,
    required this.onSelected,
    this.excludeId,
  });

  final List<FinancialAccount> accounts;
  final String? selectedId;
  final ValueChanged<FinancialAccount> onSelected;

  /// Used by the transfer form so the same account cannot be both sides.
  final String? excludeId;

  @override
  Widget build(BuildContext context) {
    final List<FinancialAccount> options = accounts
        .where((FinancialAccount a) => a.id != excludeId)
        .toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        ...options.map(
          (FinancialAccount account) => Padding(
            padding: EdgeInsets.only(bottom: getSize(8)),
            child: MiaChoiceCard(
              title: account.name,
              description:
                  '${account.institution} · ${formatCurrency(account.balance)}',
              icon: account.type.icon,
              selected: account.id == selectedId,
              accent: account.isLiability ? AppColors.caution : AppColors.ember,
              onTap: () {
                onSelected(account);
                Navigator.of(context).pop();
              },
            ),
          ),
        ),
      ],
    );
  }
}

/// Category chooser. Subcategories are shown under the name of their parent so
/// the choice reads the way the ledger does.
class CategoryPickerSheet extends StatelessWidget {
  const CategoryPickerSheet({
    super.key,
    required this.categories,
    required this.selectedId,
    required this.onSelected,
  });

  final List<MiaCategory> categories;
  final String? selectedId;
  final ValueChanged<MiaCategory> onSelected;

  String? _parentName(MiaCategory category) {
    if (category.parentId == null) return null;
    for (final MiaCategory candidate in categories) {
      if (candidate.id == category.parentId) return candidate.name;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        ...categories.map(
          (MiaCategory category) => Padding(
            padding: EdgeInsets.only(bottom: getSize(8)),
            child: MiaChoiceCard(
              title: category.name,
              description: _parentName(category),
              icon: category.icon,
              accent: category.color,
              selected: category.id == selectedId,
              onTap: () {
                onSelected(category);
                Navigator.of(context).pop();
              },
            ),
          ),
        ),
        verticalSpace(4),
      ],
    );
  }
}

/// Generic chooser for the small enum lists these forms carry: obligation kind,
/// frequency, account type, document kind.
class OptionPickerSheet<T> extends StatelessWidget {
  const OptionPickerSheet({
    super.key,
    required this.options,
    required this.selected,
    required this.labelOf,
    required this.onSelected,
    this.iconOf,
    this.descriptionOf,
    this.accent = AppColors.ember,
  });

  final List<T> options;
  final T selected;
  final String Function(T) labelOf;
  final ValueChanged<T> onSelected;
  final IconData Function(T)? iconOf;
  final String? Function(T)? descriptionOf;
  final Color accent;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        ...options.map(
          (T option) => Padding(
            padding: EdgeInsets.only(bottom: getSize(8)),
            child: MiaChoiceCard(
              title: labelOf(option),
              description: descriptionOf?.call(option),
              icon: iconOf?.call(option),
              accent: accent,
              selected: option == selected,
              onTap: () {
                onSelected(option);
                Navigator.of(context).pop();
              },
            ),
          ),
        ),
      ],
    );
  }
}
