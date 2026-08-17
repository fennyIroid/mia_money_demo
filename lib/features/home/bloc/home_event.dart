part of 'home_bloc.dart';

@freezed
abstract class HomeEvent with _$HomeEvent {
  const factory HomeEvent.load() = HomeLoad;

  const factory HomeEvent.refresh() = HomeRefresh;

  const factory HomeEvent.approveItem(String itemId) = HomeApproveItem;

  const factory HomeEvent.dismissItem(String itemId) = HomeDismissItem;
}
