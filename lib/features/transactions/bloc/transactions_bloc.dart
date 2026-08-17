import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../core/theme/app_colors.dart';

import '../../../data/models/core_models.dart';
import '../../../data/models/money_models.dart';
import '../../../data/repositories/money_repository.dart';

part 'transactions_bloc.freezed.dart';
part 'transactions_event.dart';
part 'transactions_state.dart';

@injectable
class TransactionsBloc extends Bloc<TransactionsEvent, TransactionsState> {
  TransactionsBloc(
    this._transactionRepository,
    this._categoryRepository,
    this._ruleRepository,
  ) : super(TransactionsState.initial()) {
    on<TransactionsLoad>(_onLoad);
    on<TransactionsSearchChanged>(_onSearchChanged);
    on<TransactionsFilterChanged>(_onFilterChanged);
    on<TransactionsSelectionToggled>(_onSelectionToggled);
    on<TransactionsCorrectionApplied>(_onCorrectionApplied);
    on<TransactionsBulkCorrectionApplied>(_onBulkCorrectionApplied);
    on<TransactionsReconciliationConfirmed>(_onReconciliationConfirmed);
    on<TransactionsReconciliationDismissed>(_onReconciliationDismissed);
    on<TransactionsRuleTogglePaused>(_onRuleTogglePaused);
    on<TransactionsRuleCreated>(_onRuleCreated);
    on<TransactionsRuleDeleted>(_onRuleDeleted);
    on<TransactionsCategoryDraftStarted>(_onCategoryDraftStarted);
    on<TransactionsCategoryDraftChanged>(_onCategoryDraftChanged);
    on<TransactionsCategoryDraftSubmitted>(_onCategoryDraftSubmitted);
    on<TransactionsCategoriesMerged>(_onCategoriesMerged);
    on<TransactionsSubcategoryMoved>(_onSubcategoryMoved);
    on<TransactionsCategoryArchived>(_onCategoryArchived);
  }

  /// Palette and glyphs a user-created category can be built from. Colours come
  /// from the data spectrum so a new category reads like every other one.
  static const List<IconData> categoryIcons = <IconData>[
    Icons.shopping_basket_rounded,
    Icons.restaurant_rounded,
    Icons.directions_car_rounded,
    Icons.home_rounded,
    Icons.bolt_rounded,
    Icons.medical_services_rounded,
    Icons.school_rounded,
    Icons.pets_rounded,
    Icons.flight_rounded,
    Icons.savings_rounded,
  ];

  final TransactionRepository _transactionRepository;
  final CategoryRepository _categoryRepository;
  final RuleRepository _ruleRepository;

  Future<void> _onLoad(
    TransactionsEvent event,
    Emitter<TransactionsState> emit,
  ) async {
    final bool isRefresh = event is TransactionsLoad && event.isRefresh;

    if (!isRefresh &&
        state.currentPage > state.lastPage &&
        state.lastPage != 0) {
      state.refreshController.loadNoData();
      return;
    }

    final int page = isRefresh ? 1 : state.currentPage;
    final List<MiaTransaction> fetched = await _transactionRepository
        .fetchTransactions(page: page, perPage: 20);
    final List<MiaCategory> categories = await _categoryRepository
        .fetchCategories();
    final List<MiaRule> rules = await _ruleRepository.fetchRules();
    final List<ReconciliationCandidate> candidates =
        await _transactionRepository.fetchReconciliationCandidates();

    emit(
      state.copyWith(
        isReady: true,
        transactions: isRefresh
            ? fetched
            : <MiaTransaction>[...state.transactions, ...fetched],
        categories: categories,
        rules: rules,
        candidates: candidates,
        currentPage: page + 1,
        lastPage: fetched.length < 20 ? page : page + 1,
      ),
    );

    if (isRefresh) {
      state.refreshController.refreshCompleted();
    } else {
      state.refreshController.loadComplete();
    }
  }

  void _onSearchChanged(
    TransactionsSearchChanged event,
    Emitter<TransactionsState> emit,
  ) {
    emit(state.copyWith(query: event.query));
  }

  void _onFilterChanged(
    TransactionsFilterChanged event,
    Emitter<TransactionsState> emit,
  ) {
    emit(state.copyWith(filter: event.filter));
  }

  void _onSelectionToggled(
    TransactionsSelectionToggled event,
    Emitter<TransactionsState> emit,
  ) {
    final Set<String> next = <String>{...state.selectedIds};
    if (!next.remove(event.id)) {
      next.add(event.id);
    }
    emit(state.copyWith(selectedIds: next));
  }

  Future<void> _onCorrectionApplied(
    TransactionsCorrectionApplied event,
    Emitter<TransactionsState> emit,
  ) async {
    await _transactionRepository.applyCorrection(
      transactionId: event.transactionId,
      categoryId: event.categoryId,
      treatment: event.treatment,
    );
    emit(state.copyWith(lastCorrectionId: event.transactionId));
  }

  /// Applies one correction to every selected row, then reloads so the ledger
  /// and its totals show the result rather than only claiming it.
  Future<void> _onBulkCorrectionApplied(
    TransactionsBulkCorrectionApplied event,
    Emitter<TransactionsState> emit,
  ) async {
    for (final String id in state.selectedIds) {
      await _transactionRepository.applyCorrection(
        transactionId: id,
        categoryId: event.categoryId,
        treatment: event.treatment,
      );
    }
    emit(state.copyWith(selectedIds: const <String>{}));
    add(const TransactionsEvent.load(isRefresh: true));
  }

  Future<void> _onReconciliationConfirmed(
    TransactionsReconciliationConfirmed event,
    Emitter<TransactionsState> emit,
  ) async {
    await _transactionRepository.confirmReconciliation(event.candidateId);
    add(const TransactionsEvent.load(isRefresh: true));
  }

  Future<void> _onReconciliationDismissed(
    TransactionsReconciliationDismissed event,
    Emitter<TransactionsState> emit,
  ) async {
    await _transactionRepository.dismissReconciliation(event.candidateId);
    add(const TransactionsEvent.load(isRefresh: true));
  }

  Future<void> _onRuleTogglePaused(
    TransactionsRuleTogglePaused event,
    Emitter<TransactionsState> emit,
  ) async {
    await _ruleRepository.setPaused(event.ruleId, event.paused);
    final List<MiaRule> rules = await _ruleRepository.fetchRules();
    emit(state.copyWith(rules: rules));
  }

  Future<void> _onRuleCreated(
    TransactionsRuleCreated event,
    Emitter<TransactionsState> emit,
  ) async {
    await _ruleRepository.createRule(event.rule);
    emit(state.copyWith(rules: await _ruleRepository.fetchRules()));
  }

  Future<void> _onRuleDeleted(
    TransactionsRuleDeleted event,
    Emitter<TransactionsState> emit,
  ) async {
    await _ruleRepository.deleteRule(event.ruleId);
    emit(state.copyWith(rules: await _ruleRepository.fetchRules()));
  }

  void _onCategoryDraftStarted(
    TransactionsCategoryDraftStarted event,
    Emitter<TransactionsState> emit,
  ) {
    emit(
      state.copyWith(
        categoryDraftName: '',
        categoryDraftColourIndex: 0,
        categoryDraftIconIndex: 0,
        categoryDraftParentId: null,
        createdCategory: null,
      ),
    );
  }

  void _onCategoryDraftChanged(
    TransactionsCategoryDraftChanged event,
    Emitter<TransactionsState> emit,
  ) {
    emit(
      state.copyWith(
        categoryDraftName: event.name ?? state.categoryDraftName,
        categoryDraftColourIndex:
            event.colourIndex ?? state.categoryDraftColourIndex,
        categoryDraftIconIndex: event.iconIndex ?? state.categoryDraftIconIndex,
        categoryDraftParentId: event.clearParent
            ? null
            : event.parentId ?? state.categoryDraftParentId,
      ),
    );
  }

  Future<void> _onCategoryDraftSubmitted(
    TransactionsCategoryDraftSubmitted event,
    Emitter<TransactionsState> emit,
  ) async {
    if (!state.canCreateCategory) {
      return;
    }

    final MiaCategory created = await _categoryRepository.createCategory(
      name: state.categoryDraftName.trim(),
      icon: categoryIcons[state.categoryDraftIconIndex],
      color: AppColors.dataSpectrum[state.categoryDraftColourIndex],
      parentId: state.categoryDraftParentId,
    );
    emit(
      state.copyWith(
        categories: await _categoryRepository.fetchCategories(),
        createdCategory: created,
      ),
    );
  }

  Future<void> _onCategoriesMerged(
    TransactionsCategoriesMerged event,
    Emitter<TransactionsState> emit,
  ) async {
    await _categoryRepository.mergeCategories(
      fromId: event.fromId,
      intoId: event.intoId,
    );
    emit(
      state.copyWith(categories: await _categoryRepository.fetchCategories()),
    );
  }

  Future<void> _onSubcategoryMoved(
    TransactionsSubcategoryMoved event,
    Emitter<TransactionsState> emit,
  ) async {
    await _categoryRepository.moveSubcategory(
      categoryId: event.categoryId,
      parentId: event.parentId,
    );
    emit(
      state.copyWith(categories: await _categoryRepository.fetchCategories()),
    );
  }

  Future<void> _onCategoryArchived(
    TransactionsCategoryArchived event,
    Emitter<TransactionsState> emit,
  ) async {
    await _categoryRepository.setArchived(
      categoryId: event.categoryId,
      value: true,
    );
    emit(
      state.copyWith(categories: await _categoryRepository.fetchCategories()),
    );
  }

  @override
  Future<void> close() {
    state.refreshController.dispose();
    return super.close();
  }
}
