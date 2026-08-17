part of 'splash_bloc.dart';

enum SplashDestination { pending, onboarding, home }

enum SplashPhase { igniting, assembling, revealing, ready }

@freezed
abstract class SplashState with _$SplashState {
  const factory SplashState({
    required SplashPhase phase,
    required SplashDestination destination,
    required String bootMessage,
  }) = _SplashState;

  factory SplashState.initial() => const SplashState(
    phase: SplashPhase.igniting,
    destination: SplashDestination.pending,
    bootMessage: 'Waking Mia',
  );
}
