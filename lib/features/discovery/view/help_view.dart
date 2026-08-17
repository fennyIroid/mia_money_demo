import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/di/injection.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_typography.dart';
import '../../../core/utils/date_utils.dart';
import '../../../core/utils/math_utils.dart';
import '../../../core/utils/spacing_utils.dart';
import '../../../core/widgets/aurora_background.dart';
import '../../../core/widgets/base_text.dart';
import '../../../core/widgets/glass_panel.dart';
import '../../../core/widgets/mia_button.dart';
import '../../../core/widgets/mia_inputs.dart';
import '../../../core/widgets/mia_list_row.dart';
import '../../../core/widgets/mia_scaffold.dart';
import '../../../core/widgets/mia_sheet.dart';
import '../../../core/widgets/mia_states.dart';
import '../../../core/widgets/reveal.dart';
import '../../../core/widgets/status_pill.dart';
import '../../../data/models/assistant_models.dart';
import '../bloc/discovery_bloc.dart';

@RoutePage()
class HelpView extends StatelessWidget {
  const HelpView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<DiscoveryBloc>(
      create: (BuildContext context) =>
          getIt<DiscoveryBloc>()..add(const DiscoveryEvent.load()),
      child: const HelpScaffold(),
    );
  }
}

class HelpScaffold extends StatelessWidget {
  const HelpScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DiscoveryBloc, DiscoveryState>(
      builder: (BuildContext context, DiscoveryState state) {
        final DiscoveryBloc bloc = context.read<DiscoveryBloc>();

        return MiaScaffold(
          title: 'Help & support',
          overline: 'Answers and cases',
          mood: AuroraMood.calm,
          bottomBar: MiaBottomBar(
            child: MiaButton(
              label: 'Contact support',
              leadingIcon: Icons.support_agent_rounded,
              onTap: () async {
                final SupportDraft? draft = await showMiaSheet<SupportDraft>(
                  context: context,
                  title: 'Contact support',
                  overline: 'You choose what Mia sends',
                  child: const ContactSupportSheet(),
                );
                if (draft == null || !context.mounted) return;

                bloc.add(
                  DiscoveryEvent.caseSubmitted(
                    subject: draft.subject,
                    diagnostics: draft.diagnostics,
                  ),
                );
                showMiaToast(
                  context,
                  message: 'Case opened. It is at the top of Your cases.',
                  icon: Icons.support_agent_rounded,
                );
              },
            ),
          ),
          child: !state.isReady
              ? const SkeletonTileList(count: 6, tileHeight: 80)
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    if (state.cases.isNotEmpty) ...<Widget>[
                      Reveal(
                        child: MiaGroupedCard(
                          title: 'Your cases',
                          children: state.cases
                              .map(
                                (SupportCase c) => MiaSettingsRow(
                                  title: c.subject,
                                  subtitle:
                                      '${c.reference} · opened ${relativeLabel(c.openedOn)}',
                                  icon: Icons.confirmation_number_rounded,
                                  value: c.status,
                                  onTap: () => showMiaSheet<void>(
                                    context: context,
                                    title: c.subject,
                                    overline: c.reference,
                                    child: SupportCaseSheet(supportCase: c),
                                  ),
                                ),
                              )
                              .toList(),
                        ),
                      ),
                      verticalSpace(16),
                    ],
                    Reveal(
                      index: 1,
                      child: BaseText(
                        'Answers',
                        fontSize: 10,
                        textStyle: AppTypography.overline,
                      ),
                    ),
                    verticalSpace(10),
                    ...List<Widget>.generate(state.articles.length, (int i) {
                      final HelpArticle article = state.articles[i];
                      return Padding(
                        padding: EdgeInsets.only(bottom: getSize(8)),
                        child: Reveal(
                          index: i.clamp(0, 8),
                          child: GlassPanel(
                            tone: GlassTone.soft,
                            onTap: () => showMiaSheet<void>(
                              context: context,
                              title: article.title,
                              overline: article.category,
                              child: BaseText(
                                article.body,
                                fontSize: 13.5,
                                textColor: AppColors.mist,
                                height: 1.6,
                              ),
                            ),
                            child: Row(
                              children: <Widget>[
                                Icon(
                                  article.icon,
                                  size: getFontSize(17),
                                  color: AppColors.glacier,
                                ),
                                horizontalSpace(12),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      BaseText(
                                        article.title,
                                        fontSize: 13.5,
                                        fontWeight: FontWeight.w600,
                                        maxLines: 2,
                                      ),
                                      verticalSpace(4),
                                      StatusPill(
                                        label: article.category,
                                        color: AppColors.muted,
                                        dense: true,
                                      ),
                                    ],
                                  ),
                                ),
                                Icon(
                                  Icons.chevron_right_rounded,
                                  size: getFontSize(18),
                                  color: AppColors.faint,
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
                  ],
                ),
        );
      },
    );
  }
}

/// What the user chose to send with a support case.
class SupportDraft {
  const SupportDraft({required this.subject, required this.diagnostics});

  final String subject;
  final bool diagnostics;
}

/// Writes the case. Diagnostics are opt-out and say exactly what they carry.
class ContactSupportSheet extends StatelessWidget {
  const ContactSupportSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<bool> diagnostics = ValueNotifier<bool>(true);
    String subject = '';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        MiaFormField(
          label: 'What is happening?',
          hint: 'Describe the problem',
          maxLines: 4,
          fontSize: 14,
          autofocus: true,
          onChanged: (String value) => subject = value,
        ),
        verticalSpace(12),
        ValueListenableBuilder<bool>(
          valueListenable: diagnostics,
          builder: (BuildContext context, bool value, Widget? _) {
            return MiaSwitchRow(
              title: 'Attach diagnostics',
              description:
                  'App version, environment, recent job status. No transaction content.',
              value: value,
              icon: Icons.bug_report_rounded,
              onChanged: (bool next) => diagnostics.value = next,
            );
          },
        ),
        verticalSpace(12),
        MiaButton(
          label: 'Submit',
          onTap: () {
            if (subject.trim().isEmpty) return;
            Navigator.of(context).pop(
              SupportDraft(
                subject: subject.trim(),
                diagnostics: diagnostics.value,
              ),
            );
          },
        ),
      ],
    );
  }
}

/// What Mia knows about a case the user opened, including exactly what was
/// sent with it.
class SupportCaseSheet extends StatelessWidget {
  const SupportCaseSheet({super.key, required this.supportCase});

  final SupportCase supportCase;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        EvidenceRow(label: 'Reference', value: supportCase.reference),
        EvidenceRow(label: 'Status', value: supportCase.status),
        EvidenceRow(
          label: 'Opened',
          value: formatFullDate(supportCase.openedOn),
        ),
        if (supportCase.lastUpdate != null)
          EvidenceRow(
            label: 'Last update',
            value: relativeLabel(supportCase.lastUpdate!),
          ),
        EvidenceRow(
          label: 'Diagnostics sent',
          value: supportCase.diagnosticsAttached
              ? 'App version, environment, job status'
              : 'None',
        ),
        verticalSpace(12),
        BaseText(
          'No transaction content is ever attached to a support case.',
          fontSize: 11.5,
          textColor: AppColors.faint,
          height: 1.45,
        ),
      ],
    );
  }
}
