part of 'auth_bloc.dart';

@freezed
abstract class AuthState with _$AuthState {
  const factory AuthState({
    required String email,
    required String password,
    required String confirmPassword,
    required String code,
    required bool isSubmitting,
    required bool isAuthenticated,
    required bool biometricEnabled,
    String? failure,
  }) = _AuthState;

  factory AuthState.initial() => const AuthState(
    email: '',
    password: '',
    confirmPassword: '',
    code: '',
    isSubmitting: false,
    isAuthenticated: false,
    biometricEnabled: false,
  );
}

extension AuthStateX on AuthState {
  bool get isEmailValid =>
      RegExp(r'^[\w.\-+]+@[\w\-]+\.[\w.\-]+$').hasMatch(email.trim());

  bool get isPasswordValid => password.length >= 10;

  bool get passwordsMatch => password == confirmPassword;

  bool get canSubmit => isEmailValid && isPasswordValid && !isSubmitting;
}
