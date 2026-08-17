import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../data/models/admin_models.dart';
import '../../../data/models/insight_models.dart';
import '../../../data/models/user_models.dart';
import '../../../data/repositories/admin_repository.dart';
import '../../../data/repositories/insight_repository.dart';
import '../../../data/repositories/user_repository.dart';

part 'home_bloc.freezed.dart';
part 'home_event.dart';
part 'home_state.dart';

@injectable
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc(
    this._insightRepository,
    this._reviewRepository,
    this._billRepository,
    this._userRepository,
  ) : super(HomeState.initial()) {
    on<HomeLoad>(_onLoad);
    on<HomeRefresh>(_onLoad);
    on<HomeApproveItem>(_onApproveItem);
    on<HomeDismissItem>(_onDismissItem);
  }

  final InsightRepository _insightRepository;
  final ReviewRepository _reviewRepository;
  final BillRepository _billRepository;
  final UserRepository _userRepository;

  /// Home shows three to five items only. Ordering is by consequence first,
  /// then confidence — the brief's rule, not recency.
  List<ReviewItem> _prioritise(List<ReviewItem> items) {
    final List<ReviewItem> open =
        items
            .where(
              (ReviewItem i) =>
                  i.stage == InboxStage.needsReview ||
                  i.stage == InboxStage.newItem ||
                  i.stage == InboxStage.exception,
            )
            .toList()
          ..sort((ReviewItem a, ReviewItem b) {
            final double aWeight = (a.amount ?? 0).abs() * (1.4 - a.confidence);
            final double bWeight = (b.amount ?? 0).abs() * (1.4 - b.confidence);
            return bWeight.compareTo(aWeight);
          });
    return open.take(5).toList();
  }

  Future<void> _onLoad(HomeEvent event, Emitter<HomeState> emit) async {
    final MiaUser user = await _userRepository.fetchCurrentUser();
    final FinancialStanding standing = await _insightRepository.fetchStanding();
    final AvailableAfterObligations available = await _insightRepository
        .fetchAvailableAfterObligations();
    final TrueCostOfLife trueCost = await _insightRepository
        .fetchTrueCostOfLife();
    final List<WhatChangedItem> changed = await _insightRepository
        .fetchWhatChanged();
    final List<HandledItem> handled = await _insightRepository.fetchHandled();
    final List<ReviewItem> reviews = await _reviewRepository.fetchReviewItems();
    final List<TimelineItem> timeline = await _billRepository.fetchTimeline();

    emit(
      state.copyWith(
        isReady: true,
        user: user,
        standing: standing,
        available: available,
        trueCost: trueCost,
        whatChanged: changed,
        handled: handled,
        priorityItems: _prioritise(reviews),
        comingUp: timeline.take(6).toList(),
      ),
    );
  }

  Future<void> _onApproveItem(
    HomeApproveItem event,
    Emitter<HomeState> emit,
  ) async {
    await _reviewRepository.approve(event.itemId);
    emit(
      state.copyWith(
        priorityItems: state.priorityItems
            .where((ReviewItem i) => i.id != event.itemId)
            .toList(),
      ),
    );
  }

  Future<void> _onDismissItem(
    HomeDismissItem event,
    Emitter<HomeState> emit,
  ) async {
    await _reviewRepository.dismiss(event.itemId);
    emit(
      state.copyWith(
        priorityItems: state.priorityItems
            .where((ReviewItem i) => i.id != event.itemId)
            .toList(),
      ),
    );
  }
}
