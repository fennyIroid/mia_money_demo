import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../data/repositories/user_repository.dart';

part 'splash_bloc.freezed.dart';
part 'splash_event.dart';
part 'splash_state.dart';

@injectable
class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc(this._userRepository) : super(SplashState.initial()) {
    on<SplashStarted>(_onStarted);
    on<SplashAnimationSettled>(_onAnimationSettled);
  }

  final UserRepository _userRepository;

  Future<void> _onStarted(
    SplashStarted event,
    Emitter<SplashState> emit,
  ) async {
    emit(
      state.copyWith(phase: SplashPhase.igniting, bootMessage: 'Waking Mia'),
    );

    await Future<void>.delayed(const Duration(milliseconds: 900));
    emit(
      state.copyWith(
        phase: SplashPhase.assembling,
        bootMessage: 'Reading your evidence',
      ),
    );

    await _userRepository.fetchPreferences();
    await Future<void>.delayed(const Duration(milliseconds: 700));
    emit(
      state.copyWith(
        phase: SplashPhase.revealing,
        bootMessage: 'Recalculating what changed',
      ),
    );

    await Future<void>.delayed(const Duration(milliseconds: 800));
    add(const SplashEvent.animationSettled());
  }

  Future<void> _onAnimationSettled(
    SplashAnimationSettled event,
    Emitter<SplashState> emit,
  ) async {
    // A real build would read the persisted onboarding/session flags here.
    emit(
      state.copyWith(
        phase: SplashPhase.ready,
        destination: SplashDestination.onboarding,
        bootMessage: 'Ready',
      ),
    );
  }
}
