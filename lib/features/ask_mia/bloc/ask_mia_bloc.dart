import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../data/models/assistant_models.dart';
import '../../../data/repositories/assistant_repository.dart';

part 'ask_mia_bloc.freezed.dart';
part 'ask_mia_event.dart';
part 'ask_mia_state.dart';

@injectable
class AskMiaBloc extends Bloc<AskMiaEvent, AskMiaState> {
  AskMiaBloc(this._repository) : super(AskMiaState.initial()) {
    on<AskMiaLoad>(_onLoad);
    on<AskMiaDraftChanged>(_onDraftChanged);
    on<AskMiaSubmitted>(_onSubmitted);
    on<AskMiaConversationOpened>(_onConversationOpened);
    on<AskMiaNewConversation>(_onNewConversation);
  }

  final AskMiaRepository _repository;

  Future<void> _onLoad(AskMiaLoad event, Emitter<AskMiaState> emit) async {
    final List<String> suggestions = await _repository
        .fetchSuggestedQuestions();
    final List<AskMiaConversation> conversations = await _repository
        .fetchConversations();
    emit(
      state.copyWith(
        isReady: true,
        suggestions: suggestions,
        conversations: conversations,
      ),
    );
  }

  void _onDraftChanged(AskMiaDraftChanged event, Emitter<AskMiaState> emit) {
    emit(state.copyWith(draft: event.value));
  }

  Future<void> _onSubmitted(
    AskMiaSubmitted event,
    Emitter<AskMiaState> emit,
  ) async {
    final String question = event.question.trim();
    if (question.isEmpty) return;

    final AskMiaMessage userMessage = AskMiaMessage(
      id: 'u-${DateTime.now().microsecondsSinceEpoch}',
      body: question,
      isFromUser: true,
      timestamp: DateTime.now(),
    );

    emit(
      state.copyWith(
        messages: <AskMiaMessage>[...state.messages, userMessage],
        draft: '',
        isThinking: true,
      ),
    );

    final List<AskMiaMessage> answers = await _repository.ask(question);

    emit(
      state.copyWith(
        messages: <AskMiaMessage>[...state.messages, ...answers],
        isThinking: false,
      ),
    );
  }

  void _onConversationOpened(
    AskMiaConversationOpened event,
    Emitter<AskMiaState> emit,
  ) {
    for (final AskMiaConversation conversation in state.conversations) {
      if (conversation.id == event.conversationId) {
        emit(
          state.copyWith(
            messages: conversation.messages,
            activeConversationId: conversation.id,
          ),
        );
        return;
      }
    }
  }

  void _onNewConversation(
    AskMiaNewConversation event,
    Emitter<AskMiaState> emit,
  ) {
    emit(
      state.copyWith(
        messages: const <AskMiaMessage>[],
        activeConversationId: null,
      ),
    );
  }
}
