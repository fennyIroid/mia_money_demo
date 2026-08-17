import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/di/injection.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/utils/currency_utils.dart';
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
import '../../../data/models/money_models.dart';
import '../bloc/log_bloc.dart';

/// Records money the connected accounts will never tell Mia about: cash, a
/// split someone paid you back for, a transfer between your own accounts.
@RoutePage()
class LogTransactionView extends StatelessWidget {
  const LogTransactionView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LogBloc>(
      create: (BuildContext context) =>
          getIt<LogBloc>()..add(const LogEvent.started()),
      child: const LogTransactionScaffold(),
    );
  }
}

class LogTransactionScaffold extends StatelessWidget {
  const LogTransactionScaffold({super.key});

  static final List<TextInputFormatter> amountFormatters = <TextInputFormatter>[
    FilteringTextInputFormatter.allow(RegExp(r'^\d{0,9}(\.\d{0,2})?')),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LogBloc, LogState>(
      listenWhen: (LogState p, LogState c) =>
          p.createdTransaction != c.createdTransaction,
      listener: (BuildContext context, LogState state) {
        final MiaTransaction? created = state.createdTransaction;
        if (created != null) {
          context.router.maybePop<MiaTransaction>(created);
        }
      },
      builder: (BuildContext context, LogState state) {
        final LogBloc bloc = context.read<LogBloc>();
        final bool isTransfer = state.isTransfer;

        return MiaScaffold(
          title: 'Log money',
          overline: 'Entered by you, marked as manual',
          mood: AuroraMood.ember,
          bottomBar: MiaBottomBar(
            child: MiaButton(
              label: state.isSaving
                  ? 'Saving'
                  : switch (state.transactionKind) {
                      LoggedMoneyKind.expense => 'Log money out',
                      LoggedMoneyKind.income => 'Log money in',
                      LoggedMoneyKind.transfer => 'Log transfer',
                    },
              leadingIcon: state.transactionKind.icon,
              isEnabled: state.canSaveTransaction && !state.isSaving,
              onTap: () => bloc.add(const LogEvent.transactionSubmitted()),
            ),
          ),
          child: !state.isReady
              ? const SkeletonTileList(count: 5, tileHeight: 76)
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Reveal(
                      child: MiaSegmentedControl(
                        segments: LoggedMoneyKind.values
                            .map((LoggedMoneyKind k) => k.label)
                            .toList(),
                        selectedIndex: LoggedMoneyKind.values.indexOf(
                          state.transactionKind,
                        ),
                        onChanged: (int index) => bloc.add(
                          LogEvent.transactionDraftChanged(
                            kind: LoggedMoneyKind.values[index],
                          ),
                        ),
                      ),
                    ),
                    verticalSpace(20),
                    Reveal(
                      index: 1,
                      child: MiaFormField(
                        label: 'Amount',
                        hint: '0.00',
                        autofocus: true,
                        fontSize: 30,
                        textAlign: TextAlign.center,
                        keyboardType: const TextInputType.numberWithOptions(
                          decimal: true,
                        ),
                        inputFormatters: amountFormatters,
                        onChanged: (String value) => bloc.add(
                          LogEvent.transactionDraftChanged(
                            amount: double.tryParse(value) ?? 0,
                          ),
                        ),
                      ),
                    ),
                    verticalSpace(18),
                    Reveal(
                      index: 2,
                      child: MiaFormField(
                        label: isTransfer
                            ? 'Note on the transfer'
                            : 'What was it',
                        hint: isTransfer
                            ? 'Moving rent money across'
                            : 'Coffee at the markets',
                        prefixIcon: Icons.storefront_outlined,
                        onChanged: (String value) => bloc.add(
                          LogEvent.transactionDraftChanged(description: value),
                        ),
                      ),
                    ),
                    verticalSpace(18),
                    Reveal(
                      index: 3,
                      child: MiaDateField(
                        label: 'When',
                        value: state.transactionDate,
                        lastDate: DateTime.now(),
                        onChanged: (DateTime date) => bloc.add(
                          LogEvent.transactionDraftChanged(date: date),
                        ),
                      ),
                    ),
                    verticalSpace(18),
                    Reveal(
                      index: 4,
                      child: MiaPickerField(
                        label: isTransfer ? 'Out of' : 'Account',
                        value: state.transactionAccount?.name ?? 'Choose one',
                        helper: state.transactionAccount == null
                            ? null
                            : formatCurrency(state.transactionAccount!.balance),
                        icon: Icons.account_balance_wallet_outlined,
                        onTap: () => showMiaSheet<void>(
                          context: context,
                          title: isTransfer ? 'Move out of' : 'Account',
                          overline: 'Where the money sits',
                          child: AccountPickerSheet(
                            accounts: state.accounts,
                            selectedId: state.transactionAccountId,
                            onSelected: (FinancialAccount account) => bloc.add(
                              LogEvent.transactionDraftChanged(
                                accountId: account.id,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    if (isTransfer) ...<Widget>[
                      verticalSpace(14),
                      Reveal(
                        index: 5,
                        child: MiaPickerField(
                          label: 'Into',
                          value:
                              state.transactionToAccount?.name ?? 'Choose one',
                          helper: state.transactionToAccount == null
                              ? null
                              : formatCurrency(
                                  state.transactionToAccount!.balance,
                                ),
                          icon: Icons.south_west_rounded,
                          accent: AppColors.glacier,
                          onTap: () => showMiaSheet<void>(
                            context: context,
                            title: 'Move into',
                            overline: 'The other side of the transfer',
                            child: AccountPickerSheet(
                              accounts: state.accounts,
                              selectedId: state.transactionToAccountId,
                              excludeId: state.transactionAccountId,
                              onSelected: (FinancialAccount account) =>
                                  bloc.add(
                                    LogEvent.transactionDraftChanged(
                                      toAccountId: account.id,
                                    ),
                                  ),
                            ),
                          ),
                        ),
                      ),
                    ],
                    verticalSpace(14),
                    Reveal(
                      index: 6,
                      child: MiaPickerField(
                        label: 'Category',
                        value: state.transactionCategory?.name ?? 'Choose one',
                        icon:
                            state.transactionCategory?.icon ??
                            Icons.label_outline_rounded,
                        accent:
                            state.transactionCategory?.color ?? AppColors.ember,
                        onTap: () => showMiaSheet<void>(
                          context: context,
                          title: 'Category',
                          overline:
                              'You are choosing it, so Mia will not guess',
                          expand: true,
                          child: CategoryPickerSheet(
                            categories: state.selectableCategories,
                            selectedId: state.transactionCategoryId,
                            onSelected: (MiaCategory category) => bloc.add(
                              LogEvent.transactionDraftChanged(
                                categoryId: category.id,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    verticalSpace(18),
                    Reveal(
                      index: 7,
                      child: MiaFormField(
                        label: 'Note (optional)',
                        hint: 'Anything you want to remember later',
                        maxLines: 3,
                        onChanged: (String value) => bloc.add(
                          LogEvent.transactionDraftChanged(note: value),
                        ),
                      ),
                    ),
                    verticalSpace(18),
                    if (!isTransfer)
                      Reveal(
                        index: 8,
                        child: Column(
                          children: <Widget>[
                            MiaSwitchRow(
                              title: 'Someone owes me for this',
                              icon: Icons.handshake_rounded,
                              description:
                                  'Kept out of your own spending until it comes back',
                              value: state.transactionReimbursable,
                              onChanged: (bool value) => bloc.add(
                                LogEvent.transactionDraftChanged(
                                  reimbursable: value,
                                ),
                              ),
                            ),
                            verticalSpace(10),
                            MiaSwitchRow(
                              title: 'Business expense',
                              icon: Icons.work_outline_rounded,
                              description:
                                  'Tagged so it can be separated at tax time',
                              value: state.transactionBusiness,
                              onChanged: (bool value) => bloc.add(
                                LogEvent.transactionDraftChanged(
                                  business: value,
                                ),
                              ),
                            ),
                            verticalSpace(10),
                          ],
                        ),
                      ),
                    Reveal(
                      index: 9,
                      child: MiaSwitchRow(
                        title: 'Share with the household',
                        icon: Icons.group_rounded,
                        description:
                            'Members see this entry and the figures it moves',
                        value: state.transactionShared,
                        onChanged: (bool value) => bloc.add(
                          LogEvent.transactionDraftChanged(shared: value),
                        ),
                      ),
                    ),
                    verticalSpace(20),
                    Reveal(
                      index: 10,
                      child: MiaGroupedCard(
                        title: 'What this will change',
                        footnote:
                            'A manual entry is marked as yours. Mia never presents it as provider supplied.',
                        children: <Widget>[
                          EvidenceRow(
                            label: 'Recorded as',
                            value: isTransfer
                                ? 'Internal transfer, both sides'
                                : state.transactionKind.label,
                          ),
                          if (!isTransfer && state.projectedBalance != null)
                            EvidenceRow(
                              label:
                                  '${state.transactionAccount!.name} becomes',
                              value: formatCurrency(state.projectedBalance!),
                              valueColor: state.projectedBalance! < 0
                                  ? AppColors.negative
                                  : AppColors.positive,
                            ),
                          EvidenceRow(
                            label: 'Counted in spending',
                            value: isTransfer
                                ? 'No, transfers are excluded'
                                : state.transactionKind ==
                                      LoggedMoneyKind.expense
                                ? 'Yes'
                                : 'No, it is income',
                          ),
                          EvidenceRow(label: 'Source', value: 'Manual entry'),
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
