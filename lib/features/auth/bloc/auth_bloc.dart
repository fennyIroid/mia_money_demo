import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'auth_bloc.freezed.dart';
part 'auth_event.dart';
part 'auth_state.dart';

@injectable
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthState.initial()) {
    on<AuthEmailChanged>(_onEmailChanged);
    on<AuthPasswordChanged>(_onPasswordChanged);
    on<AuthConfirmPasswordChanged>(_onConfirmPasswordChanged);
    on<AuthSubmitted>(_onSubmitted);
    on<AuthCodeChanged>(_onCodeChanged);
    on<AuthBiometricEnabled>(_onBiometricEnabled);
  }

  void _onEmailChanged(AuthEmailChanged event, Emitter<AuthState> emit) {
    emit(state.copyWith(email: event.value, failure: null));
  }

  void _onPasswordChanged(AuthPasswordChanged event, Emitter<AuthState> emit) {
    emit(state.copyWith(password: event.value, failure: null));
  }

  void _onConfirmPasswordChanged(
    AuthConfirmPasswordChanged event,
    Emitter<AuthState> emit,
  ) {
    emit(state.copyWith(confirmPassword: event.value, failure: null));
  }

  void _onCodeChanged(AuthCodeChanged event, Emitter<AuthState> emit) {
    emit(state.copyWith(code: event.value));
  }

  Future<void> _onSubmitted(
    AuthSubmitted event,
    Emitter<AuthState> emit,
  ) async {
    if (!state.isEmailValid) {
      emit(state.copyWith(failure: 'That email does not look right'));
      return;
    }
    if (!state.isPasswordValid) {
      emit(state.copyWith(failure: 'Use at least 10 characters'));
      return;
    }
    emit(state.copyWith(isSubmitting: true));
    await Future<void>.delayed(const Duration(milliseconds: 700));
    emit(state.copyWith(isSubmitting: false, isAuthenticated: true));
  }

  Future<void> _onBiometricEnabled(
    AuthBiometricEnabled event,
    Emitter<AuthState> emit,
  ) async {
    await Future<void>.delayed(const Duration(milliseconds: 400));
    emit(state.copyWith(biometricEnabled: true));
  }
}
