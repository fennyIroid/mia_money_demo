part of 'split_bloc.dart';

enum SplitMethod { exactAmount, percentage, equalShares }

extension SplitMethodX on SplitMethod {
  String get label {
    switch (this) {
      case SplitMethod.exactAmount:
        return 'Exact amount';
      case SplitMethod.percentage:
        return 'Percentage';
      case SplitMethod.equalShares:
        return 'Equal shares';
    }
  }
}

@freezed
abstract class SplitState with _$SplitState {
  const factory SplitState({
    required String transactionId,
    required double parentAmount,
    required List<TransactionSplit> lines,
    required SplitMethod method,
    required bool isSaved,
  }) = _SplitState;

  factory SplitState.initial() => const SplitState(
    transactionId: '',
    parentAmount: 0,
    lines: <TransactionSplit>[],
    method: SplitMethod.exactAmount,
    isSaved: false,
  );
}

extension SplitStateX on SplitState {
  double get allocated =>
      lines.fold<double>(0, (double sum, TransactionSplit l) => sum + l.amount);

  double get remaining =>
      double.parse((parentAmount - allocated).toStringAsFixed(2));

  /// Splits must reconcile to the cent before they can be saved.
  bool get balances => remaining.abs() < 0.005 && lines.isNotEmpty;
}
