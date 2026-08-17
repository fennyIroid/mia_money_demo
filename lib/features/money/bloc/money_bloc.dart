import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../core/constants/app_constants.dart';
import '../../../data/models/admin_models.dart';
import '../../../data/models/core_models.dart';
import '../../../data/models/insight_models.dart';
import '../../../data/models/money_models.dart';
import '../../../data/models/user_models.dart';
import '../../../data/repositories/admin_repository.dart';
import '../../../data/repositories/insight_repository.dart';
import '../../../data/repositories/money_repository.dart';
import '../../../data/repositories/user_repository.dart';

part 'money_bloc.freezed.dart';
part 'money_event.dart';
part 'money_state.dart';

@injectable
class MoneyBloc extends Bloc<MoneyEvent, MoneyState> {
  MoneyBloc(
    this._accountRepository,
    this._netWorthRepository,
    this._budgetRepository,
    this._reportRepository,
    this._goalRepository,
    this._userRepository,
    this._exportRepository,
  ) : super(MoneyState.initial()) {
    on<MoneyLoad>(_onLoad);
    on<MoneyPeriodChanged>(_onPeriodChanged);
    on<MoneyBudgetModeChanged>(_onBudgetModeChanged);
    on<MoneySmallerSpendingToggled>(_onSmallerSpendingToggled);
    on<MoneyScenarioRun>(_onScenarioRun);
    on<MoneyShowArchivedToggled>(_onShowArchivedToggled);
    on<MoneyGoalDraftStarted>(_onGoalDraftStarted);
    on<MoneyGoalDraftChanged>(_onGoalDraftChanged);
    on<MoneyGoalDraftSubmitted>(_onGoalDraftSubmitted);
    on<MoneyGoalMovementRecorded>(_onGoalMovementRecorded);
    on<MoneyExportRequested>(_onExportRequested);
    on<MoneyAccountArchived>(_onAccountArchived);
  }

  final AccountRepository _accountRepository;
  final NetWorthRepository _netWorthRepository;
  final BudgetRepository _budgetRepository;
  final ReportRepository _reportRepository;
  final GoalRepository _goalRepository;
  final UserRepository _userRepository;
  final ExportRepository _exportRepository;

  Future<void> _onLoad(MoneyLoad event, Emitter<MoneyState> emit) async {
    final List<FinancialAccount> accounts = await _accountRepository
        .fetchAccounts(includeArchived: state.showArchived);
    final NetWorthSnapshot netWorth = await _netWorthRepository.fetchSnapshot();
    final BudgetPeriod budget = await _budgetRepository.fetchCurrentPeriod();
    final ReportSnapshot report = await _reportRepository.fetchReport();
    final List<Goal> goals = await _goalRepository.fetchGoals();
    final List<ExportJob> exports = await _exportRepository.fetchExports();

    emit(
      state.copyWith(
        isReady: true,
        accounts: accounts,
        netWorth: netWorth,
        budget: budget,
        report: report,
        goals: goals,
        exports: exports,
      ),
    );
  }

  void _onPeriodChanged(MoneyPeriodChanged event, Emitter<MoneyState> emit) {
    emit(state.copyWith(period: event.period));
  }

  Future<void> _onBudgetModeChanged(
    MoneyBudgetModeChanged event,
    Emitter<MoneyState> emit,
  ) async {
    await _budgetRepository.setMode(event.mode);
    emit(state.copyWith(budgetMode: event.mode));
  }

  void _onSmallerSpendingToggled(
    MoneySmallerSpendingToggled event,
    Emitter<MoneyState> emit,
  ) {
    emit(state.copyWith(groupSmallerSpending: !state.groupSmallerSpending));
  }

  Future<void> _onScenarioRun(
    MoneyScenarioRun event,
    Emitter<MoneyState> emit,
  ) async {
    final ScenarioResult result = await _goalRepository.runScenario(
      event.goal,
      event.expense,
    );
    emit(state.copyWith(scenario: result));
  }

  Future<void> _onShowArchivedToggled(
    MoneyShowArchivedToggled event,
    Emitter<MoneyState> emit,
  ) async {
    emit(state.copyWith(showArchived: !state.showArchived));
    add(const MoneyEvent.load());
  }

  void _onGoalDraftStarted(
    MoneyGoalDraftStarted event,
    Emitter<MoneyState> emit,
  ) {
    final MoneyState blank = MoneyState.initial();
    emit(
      state.copyWith(
        goalDraftName: blank.goalDraftName,
        goalDraftKind: blank.goalDraftKind,
        goalDraftTarget: blank.goalDraftTarget,
        goalDraftCurrent: blank.goalDraftCurrent,
        goalDraftMonths: blank.goalDraftMonths,
        goalDraftShared: blank.goalDraftShared,
        createdGoal: null,
      ),
    );
  }

  void _onGoalDraftChanged(
    MoneyGoalDraftChanged event,
    Emitter<MoneyState> emit,
  ) {
    emit(
      state.copyWith(
        goalDraftName: event.name ?? state.goalDraftName,
        goalDraftKind: event.kind ?? state.goalDraftKind,
        goalDraftTarget: event.target ?? state.goalDraftTarget,
        goalDraftCurrent: event.current ?? state.goalDraftCurrent,
        goalDraftMonths: event.months ?? state.goalDraftMonths,
        goalDraftShared: event.sharedWithHousehold ?? state.goalDraftShared,
      ),
    );
  }

  Future<void> _onGoalDraftSubmitted(
    MoneyGoalDraftSubmitted event,
    Emitter<MoneyState> emit,
  ) async {
    if (!state.canCreateGoal) {
      return;
    }

    final MiaUser user = await _userRepository.fetchCurrentUser();
    final DateTime now = DateTime.now();
    // A goal the user has just written down has exactly one source: the user.
    // The meta panel has to say so rather than imply a calculated history.
    final Goal goal = Goal(
      id: 'goal-${now.microsecondsSinceEpoch}',
      name: state.goalDraftName.trim(),
      kind: state.goalDraftKind,
      target: state.goalDraftTarget,
      current: state.goalDraftCurrent,
      targetDate: state.goalDraftTargetDate,
      status: GoalStatus.onTrack,
      owner: user.firstName,
      visibility: state.goalDraftShared
          ? RecordVisibility.household
          : RecordVisibility.private,
      meta: CalculationMeta(
        version: AppConstants.calculationEngineVersion,
        asOf: now,
        rangeLabel: 'Since today',
        sources: const <String>['You'],
        assumptions: const <String>[
          'Contributions are spread evenly across the months remaining',
          'No interest or growth is assumed',
        ],
      ),
    );

    final Goal created = await _goalRepository.createGoal(goal);
    final List<Goal> goals = await _goalRepository.fetchGoals();
    emit(state.copyWith(goals: goals, createdGoal: created));
  }

  /// Money the user allocated to a goal. Nothing moves between accounts — the
  /// goal only tracks what they say they have set aside.
  Future<void> _onGoalMovementRecorded(
    MoneyGoalMovementRecorded event,
    Emitter<MoneyState> emit,
  ) async {
    await _goalRepository.recordMovement(
      goalId: event.goalId,
      amount: event.amount,
      label: event.label,
    );
    emit(state.copyWith(goals: await _goalRepository.fetchGoals()));
  }

  /// An export becomes a record with its own coverage period, so the file the
  /// user asked for is something they can find again.
  Future<void> _onExportRequested(
    MoneyExportRequested event,
    Emitter<MoneyState> emit,
  ) async {
    await _exportRepository.requestExport(
      label: event.label,
      format: event.format,
      coveragePeriod: state.report?.periodLabel ?? 'This month',
      recordCount: state.report?.categories.length ?? 0,
    );
    emit(state.copyWith(exports: await _exportRepository.fetchExports()));
  }

  Future<void> _onAccountArchived(
    MoneyAccountArchived event,
    Emitter<MoneyState> emit,
  ) async {
    await _accountRepository.archiveAccount(event.accountId);
    add(const MoneyEvent.load());
  }
}
