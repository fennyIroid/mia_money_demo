part of 'splash_bloc.dart';

@freezed
abstract class SplashEvent with _$SplashEvent {
  const factory SplashEvent.started() = SplashStarted;

  const factory SplashEvent.animationSettled() = SplashAnimationSettled;
}
