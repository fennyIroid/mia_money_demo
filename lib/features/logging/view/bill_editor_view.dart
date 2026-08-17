import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/di/injection.dart';
import '../../../core/utils/currency_utils.dart';
import '../../../core/utils/date_utils.dart';
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
import '../../../data/models/money_models.dart';
import '../bloc/log_bloc.dart';

/// Adds an obligation the user already knows about — a bill, a subscription, a
/// renewal — before any provider or document tells Mia about it.
@RoutePage()
class BillEditorView extends StatelessWidget {
  const BillEditorView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LogBloc>(
      create: (BuildContext context) =>
          getIt<LogBloc>()..add(const LogEvent.started()),
      child: const BillEditorScaffold(),
    );
  }
}

class BillEditorScaffold extends StatelessWidget {
  const BillEditorScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LogBloc, LogState>(
      listenWhen: (LogState p, LogState c) => p.createdBill != c.createdBill,
      listener: (BuildContext context, LogState state) {
        if (state.createdBill != null) {
          context.router.maybePop<Bill>(state.createdBill);
        }
      },
      builder: (BuildContext context, LogState state) {
        final LogBloc bloc = context.read<LogBloc>();

        return MiaScaffold(
          title: 'Add a bill',
          overline: 'Something you already know is coming',
          mood: AuroraMood.ember,
          bottomBar: MiaBottomBar(
            child: MiaButton(
              label: state.isSaving ? 'Saving' : 'Add bill',
              leadingIcon: Icons.receipt_long_rounded,
              isEnabled: state.canSaveBill && !state.isSaving,
              onTap: () => bloc.add(const LogEvent.billSubmitted()),
            ),
          ),
          child: !state.isReady
              ? const SkeletonTileList(count: 5, tileHeight: 76)
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Reveal(
                      child: MiaFormField(
                        label: 'Provider',
                        hint: 'Origin Energy',
                        autofocus: true,
                        prefixIcon: Icons.storefront_outlined,
                        onChanged: (String value) => bloc.add(
                          LogEvent.billDraftChanged(provider: value),
                        ),
                      ),
                    ),
                    verticalSpace(18),
                    Reveal(
                      index: 1,
                      child: MiaFormField(
                        label: 'Amount',
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
                          LogEvent.billDraftChanged(
                            amount: double.tryParse(value) ?? 0,
                          ),
                        ),
                      ),
                    ),
                    verticalSpace(18),
                    Reveal(
                      index: 2,
                      child: MiaPickerField(
                        label: 'Kind',
                        value: state.billKind.label,
                        icon: state.billKind.icon,
                        onTap: () => showMiaSheet<void>(
                          context: context,
                          title: 'Kind',
                          overline: 'How Mia should talk about it',
                          child: OptionPickerSheet<ObligationKind>(
                            options: ObligationKind.values,
                            selected: state.billKind,
                            labelOf: (ObligationKind k) => k.label,
                            iconOf: (ObligationKind k) => k.icon,
                            onSelected: (ObligationKind kind) =>
                                bloc.add(LogEvent.billDraftChanged(kind: kind)),
                          ),
                        ),
                      ),
                    ),
                    verticalSpace(14),
                    Reveal(
                      index: 3,
                      child: MiaPickerField(
                        label: 'How often',
                        value: state.billFrequency.label,
                        icon: Icons.autorenew_rounded,
                        onTap: () => showMiaSheet<void>(
                          context: context,
                          title: 'How often',
                          overline: 'Used to work out the monthly equivalent',
                          child: OptionPickerSheet<RecurrenceFrequency>(
                            options: RecurrenceFrequency.values,
                            selected: state.billFrequency,
                            labelOf: (RecurrenceFrequency f) => f.label,
                            onSelected: (RecurrenceFrequency frequency) =>
                                bloc.add(
                                  LogEvent.billDraftChanged(
                                    frequency: frequency,
                                  ),
                                ),
                          ),
                        ),
                      ),
                    ),
                    verticalSpace(14),
                    Reveal(
                      index: 4,
                      child: MiaDateField(
                        label: 'Next due',
                        value: state.billDueDate,
                        firstDate: DateTime.now().subtract(
                          const Duration(days: 365),
                        ),
                        onChanged: (DateTime date) =>
                            bloc.add(LogEvent.billDraftChanged(dueDate: date)),
                      ),
                    ),
                    verticalSpace(14),
                    Reveal(
                      index: 5,
                      child: MiaPickerField(
                        label: 'Paid from',
                        value: state.billPaymentAccountName ?? 'Not set',
                        icon: Icons.account_balance_wallet_outlined,
                        onTap: () => showMiaSheet<void>(
                          context: context,
                          title: 'Paid from',
                          overline: 'Only used to explain the figure later',
                          child: AccountPickerSheet(
                            accounts: state.accounts,
                            selectedId: null,
                            onSelected: (FinancialAccount account) => bloc.add(
                              LogEvent.billDraftChanged(
                                paymentAccountName: account.name,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    verticalSpace(18),
                    Reveal(
                      index: 6,
                      child: MiaSwitchRow(
                        title: 'Paid automatically',
                        icon: Icons.bolt_rounded,
                        description:
                            'Mia will still tell you before it leaves the account',
                        value: state.billAutopay,
                        onChanged: (bool value) =>
                            bloc.add(LogEvent.billDraftChanged(autopay: value)),
                      ),
                    ),
                    verticalSpace(10),
                    Reveal(
                      index: 7,
                      child: MiaSwitchRow(
                        title: 'Share with the household',
                        icon: Icons.group_rounded,
                        value: state.billShared,
                        onChanged: (bool value) =>
                            bloc.add(LogEvent.billDraftChanged(shared: value)),
                      ),
                    ),
                    verticalSpace(20),
                    Reveal(
                      index: 8,
                      child: MiaGroupedCard(
                        title: 'What this works out to',
                        footnote:
                            'Entered by you, so it is marked as manual until a bill or statement backs it up.',
                        children: <Widget>[
                          EvidenceRow(
                            label: 'Monthly equivalent',
                            value: formatCurrency(state.billMonthlyEquivalent),
                          ),
                          EvidenceRow(
                            label: 'Annual equivalent',
                            value: formatCurrency(
                              state.billAmount * state.billFrequency.perYear,
                            ),
                          ),
                          EvidenceRow(
                            label: 'Shows on the timeline',
                            value: formatFullDate(state.billDueDate),
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
