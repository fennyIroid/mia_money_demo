import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../data/models/user_models.dart';
import '../../../data/repositories/user_repository.dart';

part 'subscription_bloc.freezed.dart';
part 'subscription_event.dart';
part 'subscription_state.dart';

@injectable
class SubscriptionBloc
    extends Bloc<SubscriptionEvent, SubscriptionScreenState> {
  SubscriptionBloc(this._userRepository)
    : super(SubscriptionScreenState.initial()) {
    on<SubscriptionLoadPlans>(_onLoadPlans);
    on<SubscriptionKindSelected>(_onKindSelected);
    on<SubscriptionTermSelected>(_onTermSelected);
    on<SubscriptionPurchase>(_onPurchase);
    on<SubscriptionRestore>(_onRestore);
  }

  final UserRepository _userRepository;

  Future<void> _onLoadPlans(
    SubscriptionLoadPlans event,
    Emitter<SubscriptionScreenState> emit,
  ) async {
    final List<SubscriptionPlan> plans = await _userRepository.fetchPlans();
    final SubscriptionState current = await _userRepository.fetchSubscription();
    emit(state.copyWith(plans: plans, current: current));
  }

  void _onKindSelected(
    SubscriptionKindSelected event,
    Emitter<SubscriptionScreenState> emit,
  ) {
    emit(state.copyWith(selectedKind: event.kind));
  }

  void _onTermSelected(
    SubscriptionTermSelected event,
    Emitter<SubscriptionScreenState> emit,
  ) {
    emit(state.copyWith(selectedTerm: event.term));
  }

  Future<void> _onPurchase(
    SubscriptionPurchase event,
    Emitter<SubscriptionScreenState> emit,
  ) async {
    // A real build hands off to StoreKit / Play Billing here and waits for the
    // server-validated entitlement before unlocking anything.
    await Future<void>.delayed(const Duration(milliseconds: 900));
    emit(state.copyWith(isPurchased: true));
  }

  Future<void> _onRestore(
    SubscriptionRestore event,
    Emitter<SubscriptionScreenState> emit,
  ) async {
    emit(state.copyWith(isRestoring: true));
    await Future<void>.delayed(const Duration(milliseconds: 700));
    emit(state.copyWith(isRestoring: false, isPurchased: true));
  }
}
