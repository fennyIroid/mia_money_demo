part of 'ask_mia_bloc.dart';

@freezed
abstract class AskMiaEvent with _$AskMiaEvent {
  const factory AskMiaEvent.load() = AskMiaLoad;

  const factory AskMiaEvent.draftChanged(String value) = AskMiaDraftChanged;

  const factory AskMiaEvent.submitted(String question) = AskMiaSubmitted;

  const factory AskMiaEvent.conversationOpened(String conversationId) =
      AskMiaConversationOpened;

  const factory AskMiaEvent.newConversation() = AskMiaNewConversation;
}
