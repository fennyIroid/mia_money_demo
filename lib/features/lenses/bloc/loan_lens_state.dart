part of 'loan_lens_bloc.dart';

@freezed
abstract class LoanLensState with _$LoanLensState {
  const factory LoanLensState({
    required List<Lender> lenders,
    required LoanLensFilters filters,
    required bool isCalculating,
    required bool isReady,
    LoanLensResult? result,
  }) = _LoanLensState;

  factory LoanLensState.initial() => const LoanLensState(
    lenders: <Lender>[],
    filters: LoanLensFilters(),
    isCalculating: false,
    isReady: false,
  );
}

extension LoanLensStateX on LoanLensState {
  static const List<String> selectableFeatures = <String>[
    'Offset',
    'Redraw',
    'Branch access',
    'No annual fee',
  ];
}
