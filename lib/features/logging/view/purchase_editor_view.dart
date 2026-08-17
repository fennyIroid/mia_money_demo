import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/di/injection.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_typography.dart';
import '../../../core/utils/date_utils.dart';
import '../../../core/utils/spacing_utils.dart';
import '../../../core/widgets/aurora_background.dart';
import '../../../core/widgets/base_text.dart';
import '../../../core/widgets/mia_button.dart';
import '../../../core/widgets/mia_inputs.dart';
import '../../../core/widgets/mia_list_row.dart';
import '../../../core/widgets/mia_scaffold.dart';
import '../../../core/widgets/mia_states.dart';
import '../../../core/widgets/reveal.dart';
import '../../../data/models/admin_models.dart';
import '../bloc/log_bloc.dart';

/// Records something bought, so the written warranty on it can be tracked and
/// reminded on before it ends.
@RoutePage()
class PurchaseEditorView extends StatelessWidget {
  const PurchaseEditorView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LogBloc>(
      create: (BuildContext context) =>
          getIt<LogBloc>()..add(const LogEvent.started()),
      child: const PurchaseEditorScaffold(),
    );
  }
}

class PurchaseEditorScaffold extends StatelessWidget {
  const PurchaseEditorScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LogBloc, LogState>(
      listenWhen: (LogState p, LogState c) =>
          p.createdPurchase != c.createdPurchase,
      listener: (BuildContext context, LogState state) {
        if (state.createdPurchase != null) {
          context.router.maybePop<PurchaseRecord>(state.createdPurchase);
        }
      },
      builder: (BuildContext context, LogState state) {
        final LogBloc bloc = context.read<LogBloc>();
        final int months = state.purchaseWarrantyMonths ?? 12;
        final DateTime warrantyEnd = DateTime(
          state.purchaseDate.year,
          state.purchaseDate.month + months,
          state.purchaseDate.day,
        );

        return MiaScaffold(
          title: 'Add a purchase',
          overline: 'Kept for warranty, not for spending',
          mood: AuroraMood.balanced,
          bottomBar: MiaBottomBar(
            child: MiaButton(
              label: state.isSaving ? 'Saving' : 'Add to the vault',
              leadingIcon: Icons.inventory_2_rounded,
              isEnabled: state.canSavePurchase && !state.isSaving,
              onTap: () => bloc.add(const LogEvent.purchaseSubmitted()),
            ),
          ),
          child: !state.isReady
              ? const SkeletonTileList(count: 4, tileHeight: 76)
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Reveal(
                      child: MiaFormField(
                        label: 'What is it',
                        hint: 'Dishwasher',
                        autofocus: true,
                        prefixIcon: Icons.inventory_2_outlined,
                        onChanged: (String value) => bloc.add(
                          LogEvent.purchaseDraftChanged(itemName: value),
                        ),
                      ),
                    ),
                    verticalSpace(18),
                    Reveal(
                      index: 1,
                      child: MiaFormField(
                        label: 'Bought from',
                        hint: 'The Good Guys',
                        prefixIcon: Icons.storefront_outlined,
                        onChanged: (String value) => bloc.add(
                          LogEvent.purchaseDraftChanged(retailer: value),
                        ),
                      ),
                    ),
                    verticalSpace(18),
                    Reveal(
                      index: 2,
                      child: MiaFormField(
                        label: 'What it cost (optional)',
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
                          LogEvent.purchaseDraftChanged(
                            amount: double.tryParse(value) ?? 0,
                          ),
                        ),
                      ),
                    ),
                    verticalSpace(18),
                    Reveal(
                      index: 3,
                      child: MiaDateField(
                        label: 'Bought on',
                        value: state.purchaseDate,
                        lastDate: DateTime.now(),
                        onChanged: (DateTime date) =>
                            bloc.add(LogEvent.purchaseDraftChanged(date: date)),
                      ),
                    ),
                    verticalSpace(20),
                    Reveal(
                      index: 4,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          BaseText(
                            'Written warranty',
                            fontSize: 10,
                            textStyle: AppTypography.overline,
                            textColor: AppColors.muted,
                          ),
                          verticalSpace(10),
                          MiaStepper(
                            value: months.toDouble(),
                            min: 0,
                            max: 120,
                            step: 6,
                            formatter: (double v) => v == 0
                                ? 'None recorded'
                                : '${v.round()} months',
                            onChanged: (double value) => bloc.add(
                              LogEvent.purchaseDraftChanged(
                                warrantyMonths: value.round(),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    verticalSpace(18),
                    Reveal(
                      index: 5,
                      child: MiaFormField(
                        label: 'Serial number (optional)',
                        hint: 'Helps with a claim later',
                        prefixIcon: Icons.qr_code_2_rounded,
                        onChanged: (String value) => bloc.add(
                          LogEvent.purchaseDraftChanged(serialNumber: value),
                        ),
                      ),
                    ),
                    verticalSpace(18),
                    Reveal(
                      index: 6,
                      child: MiaFormField(
                        label: 'Note (optional)',
                        hint: 'Where it is installed, who to call',
                        maxLines: 3,
                        onChanged: (String value) => bloc.add(
                          LogEvent.purchaseDraftChanged(note: value),
                        ),
                      ),
                    ),
                    verticalSpace(20),
                    Reveal(
                      index: 7,
                      child: MiaGroupedCard(
                        title: 'What Mia will remind you about',
                        footnote:
                            'This is the written warranty only. Your rights under Australian Consumer Law can last longer and are not assessed here.',
                        children: <Widget>[
                          EvidenceRow(
                            label: 'Written warranty ends',
                            value: months == 0
                                ? 'Not recorded'
                                : formatFullDate(warrantyEnd),
                          ),
                          EvidenceRow(
                            label: 'Reminder',
                            value: months == 0
                                ? 'None'
                                : '60 days before it ends',
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
