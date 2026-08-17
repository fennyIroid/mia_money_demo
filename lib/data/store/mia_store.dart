import 'package:injectable/injectable.dart';

import '../dummy/dummy_admin.dart';
import '../dummy/dummy_assistant.dart';
import '../dummy/dummy_insights.dart';
import '../dummy/dummy_money.dart';
import '../models/admin_models.dart';
import '../models/assistant_models.dart';
import '../models/insight_models.dart';
import '../models/money_models.dart';

/// The single mutable copy of the demo data set.
///
/// The dummy classes expose getters that rebuild their lists on every read, so
/// nothing written through them survives. This store seeds itself from them
/// once and then owns the data, which is what lets an added transaction show up
/// in the ledger, in its category totals and in the account balance behind it.
/// A real backend replaces this class, not the repositories above it.
@lazySingleton
class MiaStore {
  final List<FinancialAccount> accounts = <FinancialAccount>[
    ...DummyMoney.accounts,
  ];
  final List<MiaCategory> categories = <MiaCategory>[...DummyMoney.categories];
  final List<MiaTransaction> transactions = <MiaTransaction>[
    ...DummyMoney.transactions,
  ];
  final List<MiaRule> rules = <MiaRule>[...DummyMoney.rules];
  final List<ReconciliationCandidate> reconciliationCandidates =
      <ReconciliationCandidate>[...DummyMoney.reconciliationCandidates];

  final List<ReviewItem> reviewItems = <ReviewItem>[...DummyAdmin.reviewItems];
  final List<Bill> bills = <Bill>[...DummyAdmin.bills];
  final List<TimelineItem> timeline = <TimelineItem>[...DummyAdmin.timeline];
  final List<ExpectedMoney> expectedMoney = <ExpectedMoney>[
    ...DummyAdmin.expectedMoney,
  ];
  final List<MiaDocument> documents = <MiaDocument>[...DummyAdmin.documents];
  final List<Receipt> receipts = <Receipt>[...DummyAdmin.receipts];
  final List<ImportBatch> imports = <ImportBatch>[...DummyAdmin.imports];
  final List<PurchaseRecord> purchases = <PurchaseRecord>[
    ...DummyAdmin.purchases,
  ];

  final List<Goal> goals = <Goal>[...DummyInsights.goals];

  final List<SupportCase> supportCases = <SupportCase>[
    ...DummyAssistant.supportCases,
  ];
  final List<ConnectionRecord> connections = <ConnectionRecord>[
    ...DummyAssistant.connections,
  ];
  final List<EmailIntakeConnection> emailConnections = <EmailIntakeConnection>[
    ...DummyAssistant.emailConnections,
  ];

  /// Files the user asked Mia to build. Empty until they ask for one.
  final List<ExportJob> exports = <ExportJob>[];

  /// When the user last finished a weekly reset, so the app can say so instead
  /// of only congratulating them once.
  DateTime? weeklyResetCompletedOn;

  int _sequence = 0;

  /// Ids are only unique within a session, which is all the demo data needs.
  String nextId(String prefix) {
    _sequence += 1;
    return '$prefix-${DateTime.now().microsecondsSinceEpoch}-$_sequence';
  }

  T? _firstOrNull<T>(List<T> items, bool Function(T) test) {
    for (final T item in items) {
      if (test(item)) return item;
    }
    return null;
  }

  MiaTransaction? transactionById(String id) =>
      _firstOrNull(transactions, (MiaTransaction t) => t.id == id);

  FinancialAccount? accountById(String id) =>
      _firstOrNull(accounts, (FinancialAccount a) => a.id == id);

  MiaCategory? categoryById(String id) =>
      _firstOrNull(categories, (MiaCategory c) => c.id == id);

  Bill? billById(String id) => _firstOrNull(bills, (Bill b) => b.id == id);

  Receipt? receiptById(String id) =>
      _firstOrNull(receipts, (Receipt r) => r.id == id);

  Goal? goalById(String id) => _firstOrNull(goals, (Goal g) => g.id == id);

  /// Replaces [item] in [list] by id match, keeping list order.
  void replace<T>(List<T> list, bool Function(T) test, T item) {
    final int index = list.indexWhere(test);
    if (index != -1) {
      list[index] = item;
    }
  }

  /// Applies a posted transaction to the account balance behind it and to the
  /// running totals of the category it landed in, so the figures a user sees
  /// after logging something match what they just entered.
  void applyTransactionToTotals(MiaTransaction transaction, {int sign = 1}) {
    final FinancialAccount? account = accountById(transaction.accountId);
    if (account != null) {
      replace(
        accounts,
        (FinancialAccount a) => a.id == account.id,
        account.copyWith(
          balance: account.balance + (transaction.amount * sign),
          balanceAsOf: DateTime.now(),
        ),
      );
    }

    final MiaCategory? category = categoryById(
      transaction.layers.effectiveCategoryId,
    );
    if (category != null && !transaction.treatment.excludedFromSpending) {
      replace(
        categories,
        (MiaCategory c) => c.id == category.id,
        category.copyWith(
          transactionCount: category.transactionCount + sign,
          monthTotal: category.monthTotal + (transaction.amount.abs() * sign),
        ),
      );
    }
  }
}
