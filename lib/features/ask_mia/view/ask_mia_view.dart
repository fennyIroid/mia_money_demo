import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/di/injection.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_shapes.dart';
import '../../../core/theme/app_typography.dart';
import '../../../core/utils/math_utils.dart';
import '../../../core/utils/spacing_utils.dart';
import '../../../core/widgets/aurora_background.dart';
import '../../../core/widgets/base_text.dart';
import '../../../core/widgets/glass_panel.dart';
import '../../../core/widgets/mia_button.dart';
import '../../../core/widgets/mia_inputs.dart';
import '../../../core/widgets/mia_orb.dart';
import '../../../core/widgets/mia_scaffold.dart';
import '../../../core/widgets/mia_sheet.dart';
import '../../../core/widgets/pressable.dart';
import '../../../core/widgets/reveal.dart';
import '../../../data/models/assistant_models.dart';
import '../bloc/ask_mia_bloc.dart';
import '../widgets/ask_mia_message_bubble.dart';

@RoutePage()
class AskMiaView extends StatelessWidget {
  const AskMiaView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AskMiaBloc>(
      create: (BuildContext context) =>
          getIt<AskMiaBloc>()..add(const AskMiaEvent.load()),
      child: const AskMiaScaffold(),
    );
  }
}

class AskMiaScaffold extends StatelessWidget {
  const AskMiaScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AskMiaBloc, AskMiaState>(
      builder: (BuildContext context, AskMiaState state) {
        final AskMiaBloc bloc = context.read<AskMiaBloc>();

        return Scaffold(
          backgroundColor: AppColors.ink,
          resizeToAvoidBottomInset: true,
          body: AuroraBackground(
            mood: AuroraMood.balanced,
            child: SafeArea(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: getSize(16),
                      vertical: getSize(8),
                    ),
                    child: Row(
                      children: <Widget>[
                        GlassIconButton(
                          icon: Icons.arrow_back_ios_new_rounded,
                          iconSize: 14,
                          diameter: 38,
                          onTap: () => context.router.maybePop(),
                        ),
                        horizontalSpace(12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              BaseText(
                                'Ask Mia',
                                fontSize: 18,
                                textStyle: AppTypography.titleSmall,
                              ),
                              BaseText(
                                state.isThinking
                                    ? 'Reading your authorised records'
                                    : 'Explains, never invents',
                                fontSize: 11,
                                textColor: AppColors.muted,
                              ),
                            ],
                          ),
                        ),
                        GlassIconButton(
                          icon: Icons.history_rounded,
                          diameter: 38,
                          iconSize: 16,
                          onTap: () => showMiaSheet<void>(
                            context: context,
                            title: 'Conversations',
                            child: Column(
                              children: state.conversations
                                  .map(
                                    (AskMiaConversation c) => Pressable(
                                      onTap: () {
                                        bloc.add(
                                          AskMiaEvent.conversationOpened(c.id),
                                        );
                                        Navigator.of(context).pop();
                                      },
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                          vertical: getSize(12),
                                        ),
                                        child: Row(
                                          children: <Widget>[
                                            Icon(
                                              Icons.chat_bubble_outline_rounded,
                                              size: getFontSize(15),
                                              color: AppColors.glacier,
                                            ),
                                            horizontalSpace(12),
                                            Expanded(
                                              child: BaseText(
                                                c.title,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  )
                                  .toList(),
                            ),
                          ),
                        ),
                        horizontalSpace(8),
                        GlassIconButton(
                          icon: Icons.add_rounded,
                          diameter: 38,
                          iconSize: 16,
                          onTap: () =>
                              bloc.add(const AskMiaEvent.newConversation()),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: state.isEmptyConversation
                        ? AskMiaEmptyState(
                            suggestions: state.suggestions,
                            onSuggestionTap: (String question) =>
                                bloc.add(AskMiaEvent.submitted(question)),
                          )
                        : ListView.separated(
                            physics: const BouncingScrollPhysics(),
                            padding: EdgeInsets.symmetric(
                              horizontal: getSize(18),
                              vertical: getSize(12),
                            ),
                            itemCount:
                                state.messages.length +
                                (state.isThinking ? 1 : 0),
                            separatorBuilder: (BuildContext context, int i) =>
                                verticalSpace(12),
                            itemBuilder: (BuildContext context, int i) {
                              if (i >= state.messages.length) {
                                return const AskMiaThinkingBubble();
                              }
                              return AskMiaMessageBubble(
                                message: state.messages[i],
                                onFollowUp: (String question) =>
                                    bloc.add(AskMiaEvent.submitted(question)),
                              );
                            },
                          ),
                  ),
                  AskMiaComposer(
                    draft: state.draft,
                    canSend: state.canSend,
                    onChanged: (String value) =>
                        bloc.add(AskMiaEvent.draftChanged(value)),
                    onSend: () => bloc.add(AskMiaEvent.submitted(state.draft)),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class AskMiaEmptyState extends StatelessWidget {
  const AskMiaEmptyState({
    super.key,
    required this.suggestions,
    required this.onSuggestionTap,
  });

  final List<String> suggestions;
  final ValueChanged<String> onSuggestionTap;

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: getSize(20)),
      children: <Widget>[
        verticalSpace(20),
        Reveal(withScale: true, child: const Center(child: MiaOrb(size: 150))),
        verticalSpace(20),
        Reveal(
          index: 1,
          child: BaseText(
            'Ask about your money',
            fontSize: 26,
            textStyle: AppTypography.editorialDisplay,
            textAlign: TextAlign.center,
          ),
        ),
        verticalSpace(8),
        Reveal(
          index: 2,
          child: BaseText(
            'Every material answer carries its dates, accounts, freshness, evidence and what is missing.',
            fontSize: 13,
            textAlign: TextAlign.center,
            textColor: AppColors.muted,
            height: 1.5,
          ),
        ),
        verticalSpace(24),
        Reveal(
          index: 3,
          child: BaseText(
            'Try asking',
            fontSize: 10,
            textStyle: AppTypography.overline,
          ),
        ),
        verticalSpace(12),
        ...List<Widget>.generate(suggestions.length, (int i) {
          return Padding(
            padding: EdgeInsets.only(bottom: getSize(8)),
            child: Reveal(
              index: 4 + i,
              child: GlassPanel(
                tone: GlassTone.soft,
                onTap: () => onSuggestionTap(suggestions[i]),
                padding: EdgeInsets.symmetric(
                  horizontal: getSize(14),
                  vertical: getSize(13),
                ),
                child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.auto_awesome_rounded,
                      size: getFontSize(14),
                      color: AppColors.amberGlow,
                    ),
                    horizontalSpace(12),
                    Expanded(
                      child: BaseText(
                        suggestions[i],
                        fontSize: 13,
                        textColor: AppColors.mist,
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward_rounded,
                      size: getFontSize(14),
                      color: AppColors.faint,
                    ),
                  ],
                ),
              ),
            ),
          );
        }),
        verticalSpace(30),
      ],
    );
  }
}

class AskMiaComposer extends StatelessWidget {
  const AskMiaComposer({
    super.key,
    required this.draft,
    required this.canSend,
    required this.onChanged,
    required this.onSend,
  });

  final String draft;
  final bool canSend;
  final ValueChanged<String> onChanged;
  final VoidCallback onSend;

  @override
  Widget build(BuildContext context) {
    return MiaBottomBar(
      child: Row(
        children: <Widget>[
          Expanded(
            child: MiaSearchField(
              hint: 'Ask about your money',
              onChanged: onChanged,
              onSubmitted: (String _) => onSend(),
            ),
          ),
          horizontalSpace(10),
          Pressable(
            onTap: canSend ? onSend : null,
            pressedScale: 0.88,
            child: Container(
              width: getSize(50),
              height: getSize(50),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: const LinearGradient(
                  colors: <Color>[AppColors.amberGlow, AppColors.ember],
                ),
                boxShadow: AppShadows.glow(AppColors.ember, strength: 0.8),
              ),
              child: Opacity(
                opacity: canSend ? 1 : 0.45,
                child: Icon(
                  Icons.arrow_upward_rounded,
                  color: AppColors.ink,
                  size: getFontSize(20),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AskMiaThinkingBubble extends StatelessWidget {
  const AskMiaThinkingBubble({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        const MiaOrb(size: 34, speed: 2.2, showSatellites: false),
        horizontalSpace(12),
        GlassPanel(
          tone: GlassTone.soft,
          padding: EdgeInsets.symmetric(
            horizontal: getSize(14),
            vertical: getSize(12),
          ),
          child: BaseText(
            'Reading your authorised records…',
            fontSize: 12.5,
            textColor: AppColors.muted,
          ),
        ),
      ],
    );
  }
}
