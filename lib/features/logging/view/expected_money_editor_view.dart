import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/di/injection.dart';
import '../../../core/theme/app_colors.dart';
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
import '../bloc/log_bloc.dart';

/// Records money owed to the user. Nothing is counted as income until it
/// actually arrives and is matched.
@RoutePage()
class ExpectedMoneyEditorView extends StatelessWidget {
  const ExpectedMoneyEditorView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LogBloc>(
      create: (BuildContext context) =>
          getIt<LogBloc>()..add(const LogEvent.started()),
      child: const ExpectedMoneyEditorScaffold(),
    );
  }
}

class ExpectedMoneyEditorScaffold extends StatelessWidget {
  const ExpectedMoneyEditorScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LogBloc, LogState>(
      listenWhen: (LogState p, LogState c) =>
          p.createdExpected != c.createdExpected,
      listener: (BuildContext context, LogState state) {
        if (state.createdExpected != null) {
          context.router.maybePop<ExpectedMoney>(state.createdExpected);
        }
      },
      builder: (BuildContext context, LogState state) {
        final LogBloc bloc = context.read<LogBloc>();

        return MiaScaffold(
          title: 'Money owed to you',
          overline: 'Tracked, never counted before it lands',
          mood: AuroraMood.glacier,
          bottomBar: MiaBottomBar(
            child: MiaButton(
              label: state.isSaving ? 'Saving' : 'Track this',
              leadingIcon: Icons.hourglass_bottom_rounded,
              isEnabled: state.canSaveExpected && !state.isSaving,
              onTap: () => bloc.add(const LogEvent.expectedSubmitted()),
            ),
          ),
          child: !state.isReady
              ? const SkeletonTileList(count: 4, tileHeight: 76)
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Reveal(
                      child: MiaPickerField(
                        label: 'What kind',
                        value: state.expectedKind.label,
                        icon: state.expectedKind.icon,
                        accent: AppColors.glacier,
                        onTap: () => showMiaSheet<void>(
                          context: context,
                          title: 'What kind',
                          overline: 'Decides how Mia matches it later',
                          child: OptionPickerSheet<ExpectedMoneyKind>(
                            options: ExpectedMoneyKind.values,
                            selected: state.expectedKind,
                            accent: AppColors.glacier,
                            labelOf: (ExpectedMoneyKind k) => k.label,
                            iconOf: (ExpectedMoneyKind k) => k.icon,
                            onSelected: (ExpectedMoneyKind kind) => bloc.add(
                              LogEvent.expectedDraftChanged(kind: kind),
                            ),
                          ),
                        ),
                      ),
                    ),
                    verticalSpace(18),
                    Reveal(
                      index: 1,
                      child: MiaFormField(
                        label: 'Who owes it',
                        hint: 'Medibank',
                        autofocus: true,
                        prefixIcon: Icons.person_outline_rounded,
                        onChanged: (String value) => bloc.add(
                          LogEvent.expectedDraftChanged(counterparty: value),
                        ),
                      ),
                    ),
                    verticalSpace(18),
                    Reveal(
                      index: 2,
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
                          LogEvent.expectedDraftChanged(
                            amount: double.tryParse(value) ?? 0,
                          ),
                        ),
                      ),
                    ),
                    verticalSpace(18),
                    Reveal(
                      index: 3,
                      child: MiaDateField(
                        label: 'Expected by',
                        value: state.expectedDate,
                        icon: Icons.event_available_rounded,
                        onChanged: (DateTime date) => bloc.add(
                          LogEvent.expectedDraftChanged(expectedDate: date),
                        ),
                      ),
                    ),
                    verticalSpace(18),
                    Reveal(
                      index: 4,
                      child: MiaFormField(
                        label: 'Note (optional)',
                        hint: 'Claim number, who to chase',
                        maxLines: 3,
                        onChanged: (String value) => bloc.add(
                          LogEvent.expectedDraftChanged(note: value),
                        ),
                      ),
                    ),
                    verticalSpace(18),
                    Reveal(
                      index: 5,
                      child: MiaSwitchRow(
                        title: 'Share with the household',
                        icon: Icons.group_rounded,
                        value: state.expectedShared,
                        onChanged: (bool value) => bloc.add(
                          LogEvent.expectedDraftChanged(shared: value),
                        ),
                      ),
                    ),
                    verticalSpace(20),
                    Reveal(
                      index: 6,
                      child: MiaGroupedCard(
                        title: 'How Mia will treat it',
                        footnote:
                            'Expected money is never added to income. When a credit matching it appears, Mia asks you to confirm the pair.',
                        children: <Widget>[
                          EvidenceRow(
                            label: 'Chased from',
                            value: formatFullDate(state.expectedDate),
                          ),
                          EvidenceRow(
                            label: 'Counted as income',
                            value: 'Not until it arrives',
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
