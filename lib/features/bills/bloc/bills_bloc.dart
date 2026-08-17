import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../data/models/admin_models.dart';
import '../../../data/repositories/admin_repository.dart';

part 'bills_bloc.freezed.dart';
part 'bills_event.dart';
part 'bills_state.dart';

@injectable
class BillsBloc extends Bloc<BillsEvent, BillsState> {
  BillsBloc(this._billRepository, this._expectedMoneyRepository)
    : super(BillsState.initial()) {
    on<BillsLoad>(_onLoad);
    on<BillsFilterChanged>(_onFilterChanged);
    on<BillsHorizonChanged>(_onHorizonChanged);
    on<BillsMarkPaid>(_onMarkPaid);
    on<BillsConfirmExpectedMatch>(_onConfirmExpectedMatch);
    on<BillsChaseExpected>(_onChaseExpected);
    on<BillsExpectedWrittenOff>(_onExpectedWrittenOff);
    on<BillsBillCancelled>(_onBillCancelled);
  }

  final BillRepository _billRepository;
  final ExpectedMoneyRepository _expectedMoneyRepository;

  Future<void> _onLoad(BillsLoad event, Emitter<BillsState> emit) async {
    final List<Bill> bills = await _billRepository.fetchBills();
    final List<TimelineItem> timeline = await _billRepository.fetchTimeline();
    final List<ExpectedMoney> expected = await _expectedMoneyRepository
        .fetchExpectedMoney();

    emit(
      state.copyWith(
        isReady: true,
        bills: bills,
        timeline: timeline,
        expected: expected,
      ),
    );
  }

  void _onFilterChanged(BillsFilterChanged event, Emitter<BillsState> emit) {
    emit(state.copyWith(filter: event.filter));
  }

  void _onHorizonChanged(BillsHorizonChanged event, Emitter<BillsState> emit) {
    emit(state.copyWith(horizonDays: event.days));
  }

  Future<void> _onMarkPaid(
    BillsMarkPaid event,
    Emitter<BillsState> emit,
  ) async {
    await _billRepository.markPaid(event.billId);
    add(const BillsEvent.load());
  }

  Future<void> _onConfirmExpectedMatch(
    BillsConfirmExpectedMatch event,
    Emitter<BillsState> emit,
  ) async {
    await _expectedMoneyRepository.confirmMatch(event.id);
    add(const BillsEvent.load());
  }

  Future<void> _onChaseExpected(
    BillsChaseExpected event,
    Emitter<BillsState> emit,
  ) async {
    await _expectedMoneyRepository.chase(event.id);
    add(const BillsEvent.load());
  }

  /// Writing it off closes the record without ever having counted it as money
  /// the user had.
  Future<void> _onExpectedWrittenOff(
    BillsExpectedWrittenOff event,
    Emitter<BillsState> emit,
  ) async {
    await _expectedMoneyRepository.markHandled(event.id);
    add(const BillsEvent.load());
  }

  Future<void> _onBillCancelled(
    BillsBillCancelled event,
    Emitter<BillsState> emit,
  ) async {
    await _billRepository.cancelBill(event.billId);
    add(const BillsEvent.load());
  }
}
