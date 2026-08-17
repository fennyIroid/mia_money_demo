import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/di/injection.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/utils/currency_utils.dart';
import '../../../core/utils/date_utils.dart';
import '../../../core/utils/math_utils.dart';
import '../../../core/utils/spacing_utils.dart';
import '../../../core/widgets/aurora_background.dart';
import '../../../core/widgets/mia_button.dart';
import '../../../core/widgets/mia_inputs.dart';
import '../../../core/widgets/mia_list_row.dart';
import '../../../core/widgets/mia_scaffold.dart';
import '../../../core/widgets/mia_sheet.dart';
import '../../../core/widgets/mia_states.dart';
import '../../../core/widgets/reveal.dart';
import '../../../data/models/admin_models.dart';
import '../../../data/models/money_models.dart';
import '../bloc/log_bloc.dart';

/// Enters a receipt by hand and, if the user picks one, ties it to the
/// transaction it belongs to so the figure has its evidence attached.
@RoutePage()
class ReceiptEditorView extends StatelessWidget {
  const ReceiptEditorView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LogBloc>(
      create: (BuildContext context) =>
          getIt<LogBloc>()..add(const LogEvent.started()),
      child: const ReceiptEditorScaffold(),
    );
  }
}

class ReceiptEditorScaffold extends StatelessWidget {
  const ReceiptEditorScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LogBloc, LogState>(
      listenWhen: (LogState p, LogState c) =>
          p.createdReceipt != c.createdReceipt,
      listener: (BuildContext context, LogState state) {
        if (state.createdReceipt != null) {
          context.router.maybePop<Receipt>(state.createdReceipt);
        }
      },
      builder: (BuildContext context, LogState state) {
        final LogBloc bloc = context.read<LogBloc>();
        final MiaTransaction? linked = state.receiptTransactionId == null
            ? null
            : state.transactions.firstWhere(
                (MiaTransaction t) => t.id == state.receiptTransactionId,
              );
        final double difference = linked == null
            ? 0
            : (linked.amount.abs() - state.receiptTotal);

        return MiaScaffold(
          title: 'Add a receipt',
          overline: 'Evidence for a figure, not a loose file',
          mood: AuroraMood.glacier,
          bottomBar: MiaBottomBar(
            child: MiaButton(
              label: state.isSaving ? 'Saving' : 'Save receipt',
              leadingIcon: Icons.receipt_rounded,
              isEnabled: state.canSaveReceipt && !state.isSaving,
              onTap: () => bloc.add(const LogEvent.receiptSubmitted()),
            ),
          ),
          child: !state.isReady
              ? const SkeletonTileList(count: 4, tileHeight: 76)
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Reveal(
                      child: MiaFormField(
                        label: 'Merchant',
                        hint: 'Bunnings Warehouse',
                        autofocus: true,
                        prefixIcon: Icons.storefront_outlined,
                        onChanged: (String value) => bloc.add(
                          LogEvent.receiptDraftChanged(merchant: value),
                        ),
                      ),
                    ),
                    verticalSpace(18),
                    Reveal(
                      index: 1,
                      child: MiaFormField(
                        label: 'Total',
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
                          LogEvent.receiptDraftChanged(
                            total: double.tryParse(value) ?? 0,
                          ),
                        ),
                      ),
                    ),
                    verticalSpace(18),
                    Reveal(
                      index: 2,
                      child: MiaFormField(
                        label: 'GST (optional)',
                        hint: '0.00',
                        keyboardType: const TextInputType.numberWithOptions(
                          decimal: true,
                        ),
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.allow(
                            RegExp(r'^\d{0,9}(\.\d{0,2})?'),
                          ),
                        ],
                        onChanged: (String value) => bloc.add(
                          LogEvent.receiptDraftChanged(
                            gst: double.tryParse(value) ?? 0,
                          ),
                        ),
                      ),
                    ),
                    verticalSpace(18),
                    Reveal(
                      index: 3,
                      child: MiaDateField(
                        label: 'Purchased on',
                        value: state.receiptDate,
                        lastDate: DateTime.now(),
                        onChanged: (DateTime date) =>
                            bloc.add(LogEvent.receiptDraftChanged(date: date)),
                      ),
                    ),
                    verticalSpace(18),
                    Reveal(
                      index: 4,
                      child: MiaFormField(
                        label: 'Receipt number (optional)',
                        hint: 'INV-8842',
                        prefixIcon: Icons.tag_rounded,
                        onChanged: (String value) => bloc.add(
                          LogEvent.receiptDraftChanged(number: value),
                        ),
                      ),
                    ),
                    verticalSpace(18),
                    Reveal(
                      index: 5,
                      child: MiaPickerField(
                        label: 'Attach to a transaction (optional)',
                        value: linked?.merchantDisplay ?? 'Not attached',
                        helper: linked == null
                            ? 'You can attach it later from the receipt'
                            : '${formatCurrency(linked.amount.abs())} · ${formatDayMonth(linked.date)}',
                        icon: Icons.link_rounded,
                        accent: AppColors.glacier,
                        onTap: () => showMiaSheet<void>(
                          context: context,
                          title: 'Attach to',
                          overline: 'The transaction this receipt pays for',
                          expand: true,
                          child: ReceiptTransactionPicker(
                            transactions: state.transactions,
                            selectedId: state.receiptTransactionId,
                            onSelected: (MiaTransaction transaction) =>
                                bloc.add(
                                  LogEvent.receiptDraftChanged(
                                    transactionId: transaction.id,
                                  ),
                                ),
                          ),
                        ),
                      ),
                    ),
                    verticalSpace(20),
                    if (linked != null)
                      Reveal(
                        index: 6,
                        child: MiaGroupedCard(
                          title: 'Against the transaction',
                          footnote: difference.abs() < 0.01
                              ? 'The receipt and the transaction agree.'
                              : 'They do not agree. Mia will raise it for review rather than change either figure.',
                          children: <Widget>[
                            EvidenceRow(
                              label: 'Transaction',
                              value: formatCurrency(linked.amount.abs()),
                            ),
                            EvidenceRow(
                              label: 'Receipt',
                              value: formatCurrency(state.receiptTotal),
                            ),
                            EvidenceRow(
                              label: 'Difference',
                              value: formatCurrency(difference.abs()),
                              valueColor: difference.abs() < 0.01
                                  ? AppColors.positive
                                  : AppColors.caution,
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

/// Ledger rows the receipt can be attached to, most recent first.
class ReceiptTransactionPicker extends StatelessWidget {
  const ReceiptTransactionPicker({
    super.key,
    required this.transactions,
    required this.selectedId,
    required this.onSelected,
  });

  final List<MiaTransaction> transactions;
  final String? selectedId;
  final ValueChanged<MiaTransaction> onSelected;

  @override
  Widget build(BuildContext context) {
    final List<MiaTransaction> spending = transactions
        .where((MiaTransaction t) => !t.isCredit)
        .toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        ...spending.map(
          (MiaTransaction transaction) => Padding(
            padding: EdgeInsets.only(bottom: getSize(8)),
            child: MiaChoiceCard(
              title: transaction.merchantDisplay,
              description:
                  '${formatCurrency(transaction.amount.abs())} · ${formatDayMonth(transaction.date)} · ${transaction.accountName}',
              icon: Icons.swap_horiz_rounded,
              accent: AppColors.glacier,
              selected: transaction.id == selectedId,
              onTap: () {
                onSelected(transaction);
                Navigator.of(context).pop();
              },
            ),
          ),
        ),
      ],
    );
  }
}
