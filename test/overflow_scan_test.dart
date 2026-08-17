// Renders every route destination at a range of device sizes and records any
// layout overflow the framework reports. Used to hunt down RenderFlex and
// RenderBox overflow across the product.
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:miamoney/app.dart';
import 'package:miamoney/core/constants/app_constants.dart';
import 'package:miamoney/core/di/injection.dart';
import 'package:miamoney/core/theme/app_theme.dart';
import 'package:miamoney/data/dummy/dummy_admin.dart';
import 'package:miamoney/data/dummy/dummy_money.dart';
import 'package:miamoney/data/models/admin_models.dart';
import 'package:miamoney/data/models/money_models.dart';
import 'package:miamoney/l10n/generated/app_localizations.dart';

import 'package:miamoney/features/ask_mia/view/ask_mia_view.dart';
import 'package:miamoney/features/auth/view/biometric_setup_view.dart';
import 'package:miamoney/features/auth/view/reset_password_view.dart';
import 'package:miamoney/features/auth/view/sign_in_view.dart';
import 'package:miamoney/features/auth/view/sign_up_view.dart';
import 'package:miamoney/features/auth/view/verify_email_view.dart';
import 'package:miamoney/features/bills/view/bill_detail_view.dart';
import 'package:miamoney/features/bills/view/bills_view.dart';
import 'package:miamoney/features/bills/view/coming_up_view.dart';
import 'package:miamoney/features/bills/view/expected_money_view.dart';
import 'package:miamoney/features/connections/view/connections_view.dart';
import 'package:miamoney/features/discovery/view/help_view.dart';
import 'package:miamoney/features/discovery/view/notifications_view.dart';
import 'package:miamoney/features/discovery/view/search_view.dart';
import 'package:miamoney/features/home/view/home_view.dart';
import 'package:miamoney/features/inbox/view/inbox_view.dart';
import 'package:miamoney/features/inbox/view/review_detail_view.dart';
import 'package:miamoney/features/insights/view/available_after_obligations_view.dart';
import 'package:miamoney/features/insights/view/briefings_view.dart';
import 'package:miamoney/features/insights/view/mia_handled_view.dart';
import 'package:miamoney/features/insights/view/true_cost_of_life_view.dart';
import 'package:miamoney/features/insights/view/weekly_reset_view.dart';
import 'package:miamoney/features/insights/view/what_changed_view.dart';
import 'package:miamoney/features/lenses/view/lenses_view.dart';
import 'package:miamoney/features/logging/view/account_editor_view.dart';
import 'package:miamoney/features/logging/view/bill_editor_view.dart';
import 'package:miamoney/features/logging/view/document_editor_view.dart';
import 'package:miamoney/features/logging/view/expected_money_editor_view.dart';
import 'package:miamoney/features/logging/view/log_transaction_view.dart';
import 'package:miamoney/features/logging/view/purchase_editor_view.dart';
import 'package:miamoney/features/logging/view/receipt_editor_view.dart';
import 'package:miamoney/features/lenses/view/loan_lens_view.dart';
import 'package:miamoney/features/lenses/view/power_lens_view.dart';
import 'package:miamoney/features/money/view/accounts_view.dart';
import 'package:miamoney/features/money/view/budgets_view.dart';
import 'package:miamoney/features/money/view/goals_view.dart';
import 'package:miamoney/features/money/view/money_view.dart';
import 'package:miamoney/features/money/view/net_worth_view.dart';
import 'package:miamoney/features/money/view/reports_view.dart';
import 'package:miamoney/features/more/view/more_view.dart';
import 'package:miamoney/features/onboarding/view/onboarding_view.dart';
import 'package:miamoney/features/profile/view/data_controls_view.dart';
import 'package:miamoney/features/profile/view/household_view.dart';
import 'package:miamoney/features/profile/view/settings_view.dart';
import 'package:miamoney/features/subscription/view/paywall_view.dart';
import 'package:miamoney/features/transactions/view/categories_view.dart';
import 'package:miamoney/features/transactions/view/reconciliation_view.dart';
import 'package:miamoney/features/transactions/view/rules_view.dart';
import 'package:miamoney/features/transactions/view/transaction_detail_view.dart';
import 'package:miamoney/features/transactions/view/transaction_split_view.dart';
import 'package:miamoney/features/transactions/view/transactions_view.dart';
import 'package:miamoney/features/vault/view/documents_view.dart';
import 'package:miamoney/features/vault/view/imports_view.dart';
import 'package:miamoney/features/vault/view/purchase_detail_view.dart';
import 'package:miamoney/features/vault/view/receipts_view.dart';
import 'package:miamoney/features/vault/view/vault_view.dart';

/// Device frames the product is expected to survive. The design baseline is
/// 393x852; the others bracket it at both ends.
const List<(String, Size)> kFrames = <(String, Size)>[
  ('se-320x568', Size(320, 568)),
  ('android-360x640', Size(360, 640)),
  ('design-393x852', Size(393, 852)),
  ('max-430x932', Size(430, 932)),
];

final Set<String> overflowReports = <String>{};

/// Set `OVERFLOW_DEBUG` to a screen-name fragment to dump the offending
/// render subtree for those screens.
final String kDebugTarget = const String.fromEnvironment(
  'OVERFLOW_DEBUG',
  defaultValue: '',
);

Element? _creatorElement(FlutterErrorDetails details) {
  for (final DiagnosticsNode node
      in details.informationCollector?.call() ?? const <DiagnosticsNode>[]) {
    final Object? value = node.value;
    if (value != null && value.runtimeType.toString() == 'DebugCreator') {
      return (value as dynamic).element as Element;
    }
  }
  return null;
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() async {
    await configureDependencies();
  });

  final Map<String, Widget Function()> screens = <String, Widget Function()>{
    // Splash routes itself onward, so it is driven through the real app root
    // rather than the bare-widget harness.
    'Splash': () => const MiaMoneyApp(),
    'Onboarding': () => const OnboardingView(),
    'Paywall': () => const PaywallView(),
    'SignIn': () => const SignInView(),
    'SignUp': () => const SignUpView(),
    'VerifyEmail': () => const VerifyEmailView(),
    'ResetPassword': () => const ResetPasswordView(),
    'BiometricSetup': () => const BiometricSetupView(),
    'Home': () => const HomeView(),
    'Inbox': () => const InboxView(),
    'Money': () => const MoneyView(),
    'Lenses': () => const LensesView(),
    'More': () => const MoreView(),
    'Transactions': () => const TransactionsView(),
    'Rules': () => const RulesView(),
    'Reconciliation': () => const ReconciliationView(),
    'Categories': () => const CategoriesView(),
    'Bills': () => const BillsView(),
    'ComingUp': () => const ComingUpView(),
    'ExpectedMoney': () => const ExpectedMoneyView(),
    'Vault': () => const VaultView(),
    'Documents': () => const DocumentsView(),
    'Receipts': () => const ReceiptsView(),
    'Imports': () => const ImportsView(),
    'Accounts': () => const AccountsView(),
    'NetWorth': () => const NetWorthView(),
    'Budgets': () => const BudgetsView(),
    'Reports': () => const ReportsView(),
    'Goals': () => const GoalsView(),
    'PowerLens': () => const PowerLensView(),
    'LoanLens': () => const LoanLensView(),
    'AskMia': () => const AskMiaView(),
    'AvailableAfterObligations': () => const AvailableAfterObligationsView(),
    'TrueCostOfLife': () => const TrueCostOfLifeView(),
    'WhatChanged': () => const WhatChangedView(),
    'MiaHandled': () => const MiaHandledView(),
    'WeeklyReset': () => const WeeklyResetView(),
    'Briefings': () => const BriefingsView(),
    'Household': () => const HouseholdView(),
    'Connections': () => const ConnectionsView(),
    'Settings': () => const SettingsView(),
    'DataControls': () => const DataControlsView(),
    'Search': () => const SearchView(),
    'Notifications': () => const NotificationsView(),
    'Help': () => const HelpView(),
    'LogTransaction': () => const LogTransactionView(),
    'BillEditor': () => const BillEditorView(),
    'ExpectedMoneyEditor': () => const ExpectedMoneyEditorView(),
    'AccountEditor': () => const AccountEditorView(),
    'ReceiptEditor': () => const ReceiptEditorView(),
    'PurchaseEditor': () => const PurchaseEditorView(),
    'DocumentEditor': () => const DocumentEditorView(),
  };

  // Detail screens take a model, so every dummy record is rendered — the
  // longest merchant name or note is usually what breaks a row.
  for (final ReviewItem item in DummyAdmin.reviewItems) {
    screens['ReviewDetail/${item.id}'] = () => ReviewDetailView(item: item);
  }
  for (final Bill bill in DummyAdmin.bills) {
    screens['BillDetail/${bill.id}'] = () => BillDetailView(bill: bill);
  }
  for (final PurchaseRecord p in DummyAdmin.purchases) {
    screens['PurchaseDetail/${p.id}'] = () => PurchaseDetailView(purchase: p);
  }
  for (final MiaTransaction t in DummyMoney.transactions) {
    screens['TransactionDetail/${t.id}'] = () =>
        TransactionDetailView(transaction: t);
  }
  screens['TransactionSplit'] = () =>
      TransactionSplitView(transaction: DummyMoney.transactions.first);

  for (final MapEntry<String, Widget Function()> entry in screens.entries) {
    for (final (String frameName, Size size) in kFrames) {
      testWidgets('${entry.key} @ $frameName', (WidgetTester tester) async {
        tester.view.physicalSize = size;
        tester.view.devicePixelRatio = 1.0;
        addTearDown(tester.view.reset);

        final List<String> captured = <String>[];
        final void Function(FlutterErrorDetails)? previous =
            FlutterError.onError;
        FlutterError.onError = (FlutterErrorDetails details) {
          final String text = details.exceptionAsString();
          if (text.contains('overflowed')) {
            final String summary = text.split('\n').first;
            String where = '';
            for (final DiagnosticsNode node
                in details.informationCollector?.call() ??
                    const <DiagnosticsNode>[]) {
              final Object? value = node.value;
              if (value != null &&
                  value.runtimeType.toString() == 'DebugCreator') {
                final Element element = (value as dynamic).element as Element;
                where = element.debugGetCreatorChain(40);
                break;
              }
            }
            captured.add('$summary  <<$where>>');
            if (kDebugTarget.isNotEmpty && entry.key.contains(kDebugTarget)) {
              final Element? element = _creatorElement(details);
              if (element != null) {
                // ignore: avoid_print
                print(
                  'OVERFLOW-DEBUG: ${entry.key} @ $frameName\n'
                  '${element.renderObject?.toStringDeep(minLevel: DiagnosticLevel.info)}',
                );
              }
            }
          } else {
            previous?.call(details);
          }
        };

        try {
          final Widget screen = entry.value();
          await tester.pumpWidget(
            screen is MiaMoneyApp ? screen : _harness(screen),
          );
          // The app root boots through the splash timers before it settles, so
          // it needs a longer run than a bare screen.
          final int pumps = screen is MiaMoneyApp ? 32 : 12;
          for (int i = 0; i < pumps; i++) {
            await tester.pump(const Duration(milliseconds: 250));
          }
        } finally {
          FlutterError.onError = previous;
        }

        for (final String message in captured.toSet()) {
          overflowReports.add('${entry.key} @ $frameName :: $message');
        }
      });
    }
  }

  tearDownAll(() {
    if (overflowReports.isEmpty) {
      // ignore: avoid_print
      print('OVERFLOW-SCAN: clean');
      return;
    }
    final List<String> sorted = overflowReports.toList()..sort();
    for (final String line in sorted) {
      // ignore: avoid_print
      print('OVERFLOW-SCAN: $line');
    }
  });
}

Widget _harness(Widget child) {
  return ScreenUtilInit(
    designSize: const Size(AppConstants.designWidth, AppConstants.designHeight),
    minTextAdapt: true,
    splitScreenMode: false,
    builder: (BuildContext context, Widget? _) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.dark,
        darkTheme: AppTheme.dark,
        themeMode: ThemeMode.dark,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        builder: (BuildContext context, Widget? inner) {
          return MediaQuery.withNoTextScaling(
            child: inner ?? const SizedBox.shrink(),
          );
        },
        // Views only reach for `context.router` inside tap handlers, which
        // never fire here, so no router scope is needed.
        home: child,
      );
    },
  );
}
