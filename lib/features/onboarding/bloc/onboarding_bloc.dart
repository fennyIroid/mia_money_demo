import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../data/models/insight_models.dart';
import '../../../data/models/user_models.dart';

part 'onboarding_bloc.freezed.dart';
part 'onboarding_event.dart';
part 'onboarding_state.dart';

@injectable
class OnboardingBloc extends Bloc<OnboardingEvent, OnboardingState> {
  OnboardingBloc() : super(OnboardingState.initial()) {
    on<OnboardingAdvance>(_onAdvance);
    on<OnboardingGoBack>(_onGoBack);
    on<OnboardingJumpTo>(_onJumpTo);
    on<OnboardingNameChanged>(_onNameChanged);
    on<OnboardingHouseholdChosen>(_onHouseholdChosen);
    on<OnboardingPainToggled>(_onPainToggled);
    on<OnboardingPayFrequencyChosen>(_onPayFrequencyChosen);
    on<OnboardingBudgetModeChosen>(_onBudgetModeChosen);
    on<OnboardingCadenceChosen>(_onCadenceChosen);
  }

  void _onAdvance(OnboardingAdvance event, Emitter<OnboardingState> emit) {
    if (!state.canAdvance) return;
    final int next = state.step.index + 1;
    if (next >= OnboardingStep.values.length) return;
    emit(state.copyWith(step: OnboardingStep.values[next], isForward: true));
  }

  void _onGoBack(OnboardingGoBack event, Emitter<OnboardingState> emit) {
    final int previous = state.step.index - 1;
    if (previous < 0) return;
    emit(
      state.copyWith(step: OnboardingStep.values[previous], isForward: false),
    );
  }

  void _onJumpTo(OnboardingJumpTo event, Emitter<OnboardingState> emit) {
    emit(
      state.copyWith(
        step: event.step,
        isForward: event.step.index >= state.step.index,
      ),
    );
  }

  void _onNameChanged(
    OnboardingNameChanged event,
    Emitter<OnboardingState> emit,
  ) {
    emit(state.copyWith(firstName: event.value));
  }

  void _onHouseholdChosen(
    OnboardingHouseholdChosen event,
    Emitter<OnboardingState> emit,
  ) {
    emit(state.copyWith(householdShape: event.shape));
  }

  void _onPainToggled(
    OnboardingPainToggled event,
    Emitter<OnboardingState> emit,
  ) {
    final Set<String> next = <String>{...state.pains};
    if (!next.remove(event.pain)) {
      next.add(event.pain);
    }
    emit(state.copyWith(pains: next));
  }

  void _onPayFrequencyChosen(
    OnboardingPayFrequencyChosen event,
    Emitter<OnboardingState> emit,
  ) {
    emit(state.copyWith(payFrequency: event.frequency));
  }

  void _onBudgetModeChosen(
    OnboardingBudgetModeChosen event,
    Emitter<OnboardingState> emit,
  ) {
    emit(state.copyWith(budgetMode: event.mode));
  }

  void _onCadenceChosen(
    OnboardingCadenceChosen event,
    Emitter<OnboardingState> emit,
  ) {
    emit(state.copyWith(reviewCadence: event.cadence));
  }
}
