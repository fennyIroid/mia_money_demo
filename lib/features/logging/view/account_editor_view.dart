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

/// Adds an account no provider reports: cash, a car, a private loan, an asset
/// the user tracks themselves. Its balance is manual and stays labelled so.
@RoutePage()
class AccountEditorView extends StatelessWidget {
  const AccountEditorView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LogBloc>(
      create: (BuildContext context) =>
          getIt<LogBloc>()..add(const LogEvent.started()),
      child: const AccountEditorScaffold(),
    );
  }
}

class AccountEditorScaffold extends StatelessWidget {
  const AccountEditorScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LogBloc, LogState>(
      listenWhen: (LogState p, LogState c) =>
          p.createdAccount != c.createdAccount,
      listener: (BuildContext context, LogState state) {
        if (state.createdAccount != null) {
          context.router.maybePop<FinancialAccount>(state.createdAccount);
        }
      },
      builder: (BuildContext context, LogState state) {
        final LogBloc bloc = context.read<LogBloc>();
        final bool isLiability = state.accountType.isLiability;

        return MiaScaffold(
          title: 'Add an account',
          overline: 'One you keep up to date yourself',
          mood: AuroraMood.glacier,
          bottomBar: MiaBottomBar(
            child: MiaButton(
              label: state.isSaving ? 'Saving' : 'Add account',
              leadingIcon: Icons.add_card_rounded,
              isEnabled: state.canSaveAccount && !state.isSaving,
              onTap: () => bloc.add(const LogEvent.accountSubmitted()),
            ),
          ),
          child: !state.isReady
              ? const SkeletonTileList(count: 4, tileHeight: 76)
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Reveal(
                      child: MiaFormField(
                        label: 'Name it',
                        hint: 'Cash in the house',
                        autofocus: true,
                        prefixIcon: Icons.drive_file_rename_outline_rounded,
                        onChanged: (String value) =>
                            bloc.add(LogEvent.accountDraftChanged(name: value)),
                      ),
                    ),
                    verticalSpace(18),
                    Reveal(
                      index: 1,
                      child: MiaPickerField(
                        label: 'Type',
                        value: state.accountType.label,
                        icon: state.accountType.icon,
                        accent: isLiability
                            ? AppColors.caution
                            : AppColors.glacier,
                        onTap: () => showMiaSheet<void>(
                          context: context,
                          title: 'Type',
                          overline:
                              'Decides which side of net worth it sits on',
                          expand: true,
                          child: OptionPickerSheet<AccountType>(
                            options: AccountType.values,
                            selected: state.accountType,
                            accent: AppColors.glacier,
                            labelOf: (AccountType t) => t.label,
                            iconOf: (AccountType t) => t.icon,
                            descriptionOf: (AccountType t) =>
                                t.isLiability ? 'Counted as a liability' : null,
                            onSelected: (AccountType type) => bloc.add(
                              LogEvent.accountDraftChanged(type: type),
                            ),
                          ),
                        ),
                      ),
                    ),
                    verticalSpace(18),
                    Reveal(
                      index: 2,
                      child: MiaFormField(
                        label: isLiability ? 'Amount owing' : 'Current balance',
                        hint: '0.00',
                        fontSize: 26,
                        keyboardType: const TextInputType.numberWithOptions(
                          decimal: true,
                        ),
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.allow(
                            RegExp(r'^\d{0,9}(\.\d{0,2})?'),
                          ),
                        ],
                        onChanged: (String value) => bloc.add(
                          LogEvent.accountDraftChanged(
                            balance: double.tryParse(value) ?? 0,
                          ),
                        ),
                      ),
                    ),
                    verticalSpace(18),
                    Reveal(
                      index: 3,
                      child: MiaFormField(
                        label: 'Held with (optional)',
                        hint: 'Great Southern Bank',
                        prefixIcon: Icons.account_balance_outlined,
                        onChanged: (String value) => bloc.add(
                          LogEvent.accountDraftChanged(institution: value),
                        ),
                      ),
                    ),
                    verticalSpace(18),
                    Reveal(
                      index: 4,
                      child: MiaSwitchRow(
                        title: 'Share with the household',
                        icon: Icons.group_rounded,
                        description:
                            'Members see the balance and what it does to net worth',
                        value: state.accountShared,
                        onChanged: (bool value) => bloc.add(
                          LogEvent.accountDraftChanged(shared: value),
                        ),
                      ),
                    ),
                    verticalSpace(20),
                    Reveal(
                      index: 5,
                      child: MiaGroupedCard(
                        title: 'How this is treated',
                        footnote:
                            'Nothing is connected. The balance stays exactly what you last told Mia, and every figure built on it says so.',
                        children: <Widget>[
                          EvidenceRow(
                            label: 'Counts towards',
                            value: isLiability
                                ? 'What you owe'
                                : 'What you own',
                          ),
                          EvidenceRow(
                            label: 'Balance recorded',
                            value: formatCurrency(
                              isLiability
                                  ? -state.accountBalance.abs()
                                  : state.accountBalance,
                            ),
                            valueColor: isLiability
                                ? AppColors.negative
                                : AppColors.positive,
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
