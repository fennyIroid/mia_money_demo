part of 'loan_lens_bloc.dart';

@freezed
abstract class LoanLensEvent with _$LoanLensEvent {
  const factory LoanLensEvent.load() = LoanLensLoad;

  const factory LoanLensEvent.objectiveChanged(LoanRankingObjective objective) =
      LoanLensObjectiveChanged;

  const factory LoanLensEvent.productTypeChanged(LoanProductType type) =
      LoanLensProductTypeChanged;

  const factory LoanLensEvent.groupToggled(LenderGroup group) =
      LoanLensGroupToggled;

  const factory LoanLensEvent.amountChanged(double amount) =
      LoanLensAmountChanged;

  const factory LoanLensEvent.featureToggled(String feature) =
      LoanLensFeatureToggled;

  const factory LoanLensEvent.recalculated() = LoanLensRecalculated;
}
