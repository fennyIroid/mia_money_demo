part of 'auth_bloc.dart';

@freezed
abstract class AuthEvent with _$AuthEvent {
  const factory AuthEvent.emailChanged(String value) = AuthEmailChanged;

  const factory AuthEvent.passwordChanged(String value) = AuthPasswordChanged;

  const factory AuthEvent.confirmPasswordChanged(String value) =
      AuthConfirmPasswordChanged;

  const factory AuthEvent.codeChanged(String value) = AuthCodeChanged;

  const factory AuthEvent.submitted() = AuthSubmitted;

  const factory AuthEvent.biometricEnabled() = AuthBiometricEnabled;
}
