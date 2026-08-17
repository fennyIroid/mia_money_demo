part of 'split_bloc.dart';

@freezed
abstract class SplitEvent with _$SplitEvent {
  const factory SplitEvent.started(MiaTransaction transaction) = SplitStarted;

  const factory SplitEvent.methodChanged(SplitMethod method) =
      SplitMethodChanged;

  const factory SplitEvent.lineAdded(String categoryId) = SplitLineAdded;

  const factory SplitEvent.lineRemoved(String lineId) = SplitLineRemoved;

  const factory SplitEvent.lineAmountChanged({
    required String lineId,
    required double amount,
  }) = SplitLineAmountChanged;

  const factory SplitEvent.lineCategoryChanged({
    required String lineId,
    required String categoryId,
  }) = SplitLineCategoryChanged;

  const factory SplitEvent.saved() = SplitSaved;
}
