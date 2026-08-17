part of 'bills_bloc.dart';

@freezed
abstract class BillsEvent with _$BillsEvent {
  const factory BillsEvent.load() = BillsLoad;

  const factory BillsEvent.filterChanged(BillFilter filter) =
      BillsFilterChanged;

  const factory BillsEvent.horizonChanged(int days) = BillsHorizonChanged;

  const factory BillsEvent.markPaid(String billId) = BillsMarkPaid;

  const factory BillsEvent.confirmExpectedMatch(String id) =
      BillsConfirmExpectedMatch;

  const factory BillsEvent.chaseExpected(String id) = BillsChaseExpected;

  const factory BillsEvent.expectedWrittenOff(String id) =
      BillsExpectedWrittenOff;

  const factory BillsEvent.billCancelled(String billId) = BillsBillCancelled;
}
