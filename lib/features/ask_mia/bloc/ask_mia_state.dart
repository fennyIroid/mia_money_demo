part of 'ask_mia_bloc.dart';

@freezed
abstract class AskMiaState with _$AskMiaState {
  const factory AskMiaState({
    required List<AskMiaMessage> messages,
    required List<AskMiaConversation> conversations,
    required List<String> suggestions,
    required String draft,
    required bool isThinking,
    required bool isReady,
    String? activeConversationId,
  }) = _AskMiaState;

  factory AskMiaState.initial() => const AskMiaState(
    messages: <AskMiaMessage>[],
    conversations: <AskMiaConversation>[],
    suggestions: <String>[],
    draft: '',
    isThinking: false,
    isReady: false,
  );
}

extension AskMiaStateX on AskMiaState {
  bool get isEmptyConversation => messages.isEmpty;

  bool get canSend => draft.trim().length > 2 && !isThinking;
}
