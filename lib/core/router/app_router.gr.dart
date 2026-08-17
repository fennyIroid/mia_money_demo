// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i61;
import 'package:flutter/material.dart' as _i62;
import 'package:miamoney/data/models/admin_models.dart' as _i63;
import 'package:miamoney/data/models/money_models.dart' as _i64;
import 'package:miamoney/features/ask_mia/view/ask_mia_view.dart' as _i3;
import 'package:miamoney/features/auth/view/biometric_setup_view.dart' as _i8;
import 'package:miamoney/features/auth/view/reset_password_view.dart' as _i44;
import 'package:miamoney/features/auth/view/sign_in_view.dart' as _i50;
import 'package:miamoney/features/auth/view/sign_up_view.dart' as _i51;
import 'package:miamoney/features/auth/view/verify_email_view.dart' as _i58;
import 'package:miamoney/features/bills/view/bill_detail_view.dart' as _i5;
import 'package:miamoney/features/bills/view/bills_view.dart' as _i7;
import 'package:miamoney/features/bills/view/coming_up_view.dart' as _i13;
import 'package:miamoney/features/bills/view/expected_money_view.dart' as _i19;
import 'package:miamoney/features/connections/view/connections_view.dart'
    as _i14;
import 'package:miamoney/features/discovery/view/help_view.dart' as _i22;
import 'package:miamoney/features/discovery/view/notifications_view.dart'
    as _i34;
import 'package:miamoney/features/discovery/view/search_view.dart' as _i47;
import 'package:miamoney/features/home/view/home_view.dart' as _i23;
import 'package:miamoney/features/inbox/view/inbox_view.dart' as _i26;
import 'package:miamoney/features/inbox/view/review_detail_view.dart' as _i45;
import 'package:miamoney/features/insights/view/available_after_obligations_view.dart'
    as _i4;
import 'package:miamoney/features/insights/view/briefings_view.dart' as _i9;
import 'package:miamoney/features/insights/view/mia_handled_view.dart' as _i30;
import 'package:miamoney/features/insights/view/true_cost_of_life_view.dart'
    as _i56;
import 'package:miamoney/features/insights/view/weekly_reset_view.dart' as _i59;
import 'package:miamoney/features/insights/view/what_changed_view.dart' as _i60;
import 'package:miamoney/features/lenses/view/lenses_view.dart' as _i27;
import 'package:miamoney/features/lenses/view/loan_lens_view.dart' as _i28;
import 'package:miamoney/features/lenses/view/power_lens_view.dart' as _i37;
import 'package:miamoney/features/logging/view/account_editor_view.dart' as _i1;
import 'package:miamoney/features/logging/view/bill_editor_view.dart' as _i6;
import 'package:miamoney/features/logging/view/document_editor_view.dart'
    as _i16;
import 'package:miamoney/features/logging/view/expected_money_editor_view.dart'
    as _i18;
import 'package:miamoney/features/logging/view/log_transaction_view.dart'
    as _i29;
import 'package:miamoney/features/logging/view/purchase_editor_view.dart'
    as _i39;
import 'package:miamoney/features/logging/view/receipt_editor_view.dart'
    as _i40;
import 'package:miamoney/features/money/view/accounts_view.dart' as _i2;
import 'package:miamoney/features/money/view/budgets_view.dart' as _i10;
import 'package:miamoney/features/money/view/goal_editor_view.dart' as _i20;
import 'package:miamoney/features/money/view/goals_view.dart' as _i21;
import 'package:miamoney/features/money/view/money_view.dart' as _i31;
import 'package:miamoney/features/money/view/net_worth_view.dart' as _i33;
import 'package:miamoney/features/money/view/reports_view.dart' as _i43;
import 'package:miamoney/features/more/view/more_view.dart' as _i32;
import 'package:miamoney/features/onboarding/view/onboarding_view.dart' as _i35;
import 'package:miamoney/features/profile/view/data_controls_view.dart' as _i15;
import 'package:miamoney/features/profile/view/household_view.dart' as _i24;
import 'package:miamoney/features/profile/view/settings_view.dart' as _i48;
import 'package:miamoney/features/shell/view/shell_view.dart' as _i49;
import 'package:miamoney/features/splash/view/splash_view.dart' as _i52;
import 'package:miamoney/features/subscription/view/paywall_view.dart' as _i36;
import 'package:miamoney/features/transactions/view/categories_view.dart'
    as _i11;
import 'package:miamoney/features/transactions/view/category_editor_view.dart'
    as _i12;
import 'package:miamoney/features/transactions/view/reconciliation_view.dart'
    as _i42;
import 'package:miamoney/features/transactions/view/rules_view.dart' as _i46;
import 'package:miamoney/features/transactions/view/transaction_detail_view.dart'
    as _i53;
import 'package:miamoney/features/transactions/view/transaction_split_view.dart'
    as _i54;
import 'package:miamoney/features/transactions/view/transactions_view.dart'
    as _i55;
import 'package:miamoney/features/vault/view/documents_view.dart' as _i17;
import 'package:miamoney/features/vault/view/imports_view.dart' as _i25;
import 'package:miamoney/features/vault/view/purchase_detail_view.dart' as _i38;
import 'package:miamoney/features/vault/view/receipts_view.dart' as _i41;
import 'package:miamoney/features/vault/view/vault_view.dart' as _i57;

/// generated route for
/// [_i1.AccountEditorView]
class AccountEditorRoute extends _i61.PageRouteInfo<void> {
  const AccountEditorRoute({List<_i61.PageRouteInfo>? children})
    : super(AccountEditorRoute.name, initialChildren: children);

  static const String name = 'AccountEditorRoute';

  static _i61.PageInfo page = _i61.PageInfo(
    name,
    builder: (data) {
      return const _i1.AccountEditorView();
    },
  );
}

/// generated route for
/// [_i2.AccountsView]
class AccountsRoute extends _i61.PageRouteInfo<void> {
  const AccountsRoute({List<_i61.PageRouteInfo>? children})
    : super(AccountsRoute.name, initialChildren: children);

  static const String name = 'AccountsRoute';

  static _i61.PageInfo page = _i61.PageInfo(
    name,
    builder: (data) {
      return const _i2.AccountsView();
    },
  );
}

/// generated route for
/// [_i3.AskMiaView]
class AskMiaRoute extends _i61.PageRouteInfo<void> {
  const AskMiaRoute({List<_i61.PageRouteInfo>? children})
    : super(AskMiaRoute.name, initialChildren: children);

  static const String name = 'AskMiaRoute';

  static _i61.PageInfo page = _i61.PageInfo(
    name,
    builder: (data) {
      return const _i3.AskMiaView();
    },
  );
}

/// generated route for
/// [_i4.AvailableAfterObligationsView]
class AvailableAfterObligationsRoute extends _i61.PageRouteInfo<void> {
  const AvailableAfterObligationsRoute({List<_i61.PageRouteInfo>? children})
    : super(AvailableAfterObligationsRoute.name, initialChildren: children);

  static const String name = 'AvailableAfterObligationsRoute';

  static _i61.PageInfo page = _i61.PageInfo(
    name,
    builder: (data) {
      return const _i4.AvailableAfterObligationsView();
    },
  );
}

/// generated route for
/// [_i5.BillDetailView]
class BillDetailRoute extends _i61.PageRouteInfo<BillDetailRouteArgs> {
  BillDetailRoute({
    _i62.Key? key,
    required _i63.Bill bill,
    List<_i61.PageRouteInfo>? children,
  }) : super(
         BillDetailRoute.name,
         args: BillDetailRouteArgs(key: key, bill: bill),
         initialChildren: children,
       );

  static const String name = 'BillDetailRoute';

  static _i61.PageInfo page = _i61.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<BillDetailRouteArgs>();
      return _i5.BillDetailView(key: args.key, bill: args.bill);
    },
  );
}

class BillDetailRouteArgs {
  const BillDetailRouteArgs({this.key, required this.bill});

  final _i62.Key? key;

  final _i63.Bill bill;

  @override
  String toString() {
    return 'BillDetailRouteArgs{key: $key, bill: $bill}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! BillDetailRouteArgs) return false;
    return key == other.key && bill == other.bill;
  }

  @override
  int get hashCode => key.hashCode ^ bill.hashCode;
}

/// generated route for
/// [_i6.BillEditorView]
class BillEditorRoute extends _i61.PageRouteInfo<void> {
  const BillEditorRoute({List<_i61.PageRouteInfo>? children})
    : super(BillEditorRoute.name, initialChildren: children);

  static const String name = 'BillEditorRoute';

  static _i61.PageInfo page = _i61.PageInfo(
    name,
    builder: (data) {
      return const _i6.BillEditorView();
    },
  );
}

/// generated route for
/// [_i7.BillsView]
class BillsRoute extends _i61.PageRouteInfo<void> {
  const BillsRoute({List<_i61.PageRouteInfo>? children})
    : super(BillsRoute.name, initialChildren: children);

  static const String name = 'BillsRoute';

  static _i61.PageInfo page = _i61.PageInfo(
    name,
    builder: (data) {
      return const _i7.BillsView();
    },
  );
}

/// generated route for
/// [_i8.BiometricSetupView]
class BiometricSetupRoute extends _i61.PageRouteInfo<void> {
  const BiometricSetupRoute({List<_i61.PageRouteInfo>? children})
    : super(BiometricSetupRoute.name, initialChildren: children);

  static const String name = 'BiometricSetupRoute';

  static _i61.PageInfo page = _i61.PageInfo(
    name,
    builder: (data) {
      return const _i8.BiometricSetupView();
    },
  );
}

/// generated route for
/// [_i9.BriefingsView]
class BriefingsRoute extends _i61.PageRouteInfo<void> {
  const BriefingsRoute({List<_i61.PageRouteInfo>? children})
    : super(BriefingsRoute.name, initialChildren: children);

  static const String name = 'BriefingsRoute';

  static _i61.PageInfo page = _i61.PageInfo(
    name,
    builder: (data) {
      return const _i9.BriefingsView();
    },
  );
}

/// generated route for
/// [_i10.BudgetsView]
class BudgetsRoute extends _i61.PageRouteInfo<void> {
  const BudgetsRoute({List<_i61.PageRouteInfo>? children})
    : super(BudgetsRoute.name, initialChildren: children);

  static const String name = 'BudgetsRoute';

  static _i61.PageInfo page = _i61.PageInfo(
    name,
    builder: (data) {
      return const _i10.BudgetsView();
    },
  );
}

/// generated route for
/// [_i11.CategoriesView]
class CategoriesRoute extends _i61.PageRouteInfo<void> {
  const CategoriesRoute({List<_i61.PageRouteInfo>? children})
    : super(CategoriesRoute.name, initialChildren: children);

  static const String name = 'CategoriesRoute';

  static _i61.PageInfo page = _i61.PageInfo(
    name,
    builder: (data) {
      return const _i11.CategoriesView();
    },
  );
}

/// generated route for
/// [_i12.CategoryEditorView]
class CategoryEditorRoute extends _i61.PageRouteInfo<void> {
  const CategoryEditorRoute({List<_i61.PageRouteInfo>? children})
    : super(CategoryEditorRoute.name, initialChildren: children);

  static const String name = 'CategoryEditorRoute';

  static _i61.PageInfo page = _i61.PageInfo(
    name,
    builder: (data) {
      return const _i12.CategoryEditorView();
    },
  );
}

/// generated route for
/// [_i13.ComingUpView]
class ComingUpRoute extends _i61.PageRouteInfo<void> {
  const ComingUpRoute({List<_i61.PageRouteInfo>? children})
    : super(ComingUpRoute.name, initialChildren: children);

  static const String name = 'ComingUpRoute';

  static _i61.PageInfo page = _i61.PageInfo(
    name,
    builder: (data) {
      return const _i13.ComingUpView();
    },
  );
}

/// generated route for
/// [_i14.ConnectionsView]
class ConnectionsRoute extends _i61.PageRouteInfo<void> {
  const ConnectionsRoute({List<_i61.PageRouteInfo>? children})
    : super(ConnectionsRoute.name, initialChildren: children);

  static const String name = 'ConnectionsRoute';

  static _i61.PageInfo page = _i61.PageInfo(
    name,
    builder: (data) {
      return const _i14.ConnectionsView();
    },
  );
}

/// generated route for
/// [_i15.DataControlsView]
class DataControlsRoute extends _i61.PageRouteInfo<void> {
  const DataControlsRoute({List<_i61.PageRouteInfo>? children})
    : super(DataControlsRoute.name, initialChildren: children);

  static const String name = 'DataControlsRoute';

  static _i61.PageInfo page = _i61.PageInfo(
    name,
    builder: (data) {
      return const _i15.DataControlsView();
    },
  );
}

/// generated route for
/// [_i16.DocumentEditorView]
class DocumentEditorRoute extends _i61.PageRouteInfo<void> {
  const DocumentEditorRoute({List<_i61.PageRouteInfo>? children})
    : super(DocumentEditorRoute.name, initialChildren: children);

  static const String name = 'DocumentEditorRoute';

  static _i61.PageInfo page = _i61.PageInfo(
    name,
    builder: (data) {
      return const _i16.DocumentEditorView();
    },
  );
}

/// generated route for
/// [_i17.DocumentsView]
class DocumentsRoute extends _i61.PageRouteInfo<void> {
  const DocumentsRoute({List<_i61.PageRouteInfo>? children})
    : super(DocumentsRoute.name, initialChildren: children);

  static const String name = 'DocumentsRoute';

  static _i61.PageInfo page = _i61.PageInfo(
    name,
    builder: (data) {
      return const _i17.DocumentsView();
    },
  );
}

/// generated route for
/// [_i18.ExpectedMoneyEditorView]
class ExpectedMoneyEditorRoute extends _i61.PageRouteInfo<void> {
  const ExpectedMoneyEditorRoute({List<_i61.PageRouteInfo>? children})
    : super(ExpectedMoneyEditorRoute.name, initialChildren: children);

  static const String name = 'ExpectedMoneyEditorRoute';

  static _i61.PageInfo page = _i61.PageInfo(
    name,
    builder: (data) {
      return const _i18.ExpectedMoneyEditorView();
    },
  );
}

/// generated route for
/// [_i19.ExpectedMoneyView]
class ExpectedMoneyRoute extends _i61.PageRouteInfo<void> {
  const ExpectedMoneyRoute({List<_i61.PageRouteInfo>? children})
    : super(ExpectedMoneyRoute.name, initialChildren: children);

  static const String name = 'ExpectedMoneyRoute';

  static _i61.PageInfo page = _i61.PageInfo(
    name,
    builder: (data) {
      return const _i19.ExpectedMoneyView();
    },
  );
}

/// generated route for
/// [_i20.GoalEditorView]
class GoalEditorRoute extends _i61.PageRouteInfo<void> {
  const GoalEditorRoute({List<_i61.PageRouteInfo>? children})
    : super(GoalEditorRoute.name, initialChildren: children);

  static const String name = 'GoalEditorRoute';

  static _i61.PageInfo page = _i61.PageInfo(
    name,
    builder: (data) {
      return const _i20.GoalEditorView();
    },
  );
}

/// generated route for
/// [_i21.GoalsView]
class GoalsRoute extends _i61.PageRouteInfo<void> {
  const GoalsRoute({List<_i61.PageRouteInfo>? children})
    : super(GoalsRoute.name, initialChildren: children);

  static const String name = 'GoalsRoute';

  static _i61.PageInfo page = _i61.PageInfo(
    name,
    builder: (data) {
      return const _i21.GoalsView();
    },
  );
}

/// generated route for
/// [_i22.HelpView]
class HelpRoute extends _i61.PageRouteInfo<void> {
  const HelpRoute({List<_i61.PageRouteInfo>? children})
    : super(HelpRoute.name, initialChildren: children);

  static const String name = 'HelpRoute';

  static _i61.PageInfo page = _i61.PageInfo(
    name,
    builder: (data) {
      return const _i22.HelpView();
    },
  );
}

/// generated route for
/// [_i23.HomeView]
class HomeRoute extends _i61.PageRouteInfo<void> {
  const HomeRoute({List<_i61.PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static _i61.PageInfo page = _i61.PageInfo(
    name,
    builder: (data) {
      return const _i23.HomeView();
    },
  );
}

/// generated route for
/// [_i24.HouseholdView]
class HouseholdRoute extends _i61.PageRouteInfo<void> {
  const HouseholdRoute({List<_i61.PageRouteInfo>? children})
    : super(HouseholdRoute.name, initialChildren: children);

  static const String name = 'HouseholdRoute';

  static _i61.PageInfo page = _i61.PageInfo(
    name,
    builder: (data) {
      return const _i24.HouseholdView();
    },
  );
}

/// generated route for
/// [_i25.ImportsView]
class ImportsRoute extends _i61.PageRouteInfo<void> {
  const ImportsRoute({List<_i61.PageRouteInfo>? children})
    : super(ImportsRoute.name, initialChildren: children);

  static const String name = 'ImportsRoute';

  static _i61.PageInfo page = _i61.PageInfo(
    name,
    builder: (data) {
      return const _i25.ImportsView();
    },
  );
}

/// generated route for
/// [_i26.InboxView]
class InboxRoute extends _i61.PageRouteInfo<void> {
  const InboxRoute({List<_i61.PageRouteInfo>? children})
    : super(InboxRoute.name, initialChildren: children);

  static const String name = 'InboxRoute';

  static _i61.PageInfo page = _i61.PageInfo(
    name,
    builder: (data) {
      return const _i26.InboxView();
    },
  );
}

/// generated route for
/// [_i27.LensesView]
class LensesRoute extends _i61.PageRouteInfo<void> {
  const LensesRoute({List<_i61.PageRouteInfo>? children})
    : super(LensesRoute.name, initialChildren: children);

  static const String name = 'LensesRoute';

  static _i61.PageInfo page = _i61.PageInfo(
    name,
    builder: (data) {
      return const _i27.LensesView();
    },
  );
}

/// generated route for
/// [_i28.LoanLensView]
class LoanLensRoute extends _i61.PageRouteInfo<void> {
  const LoanLensRoute({List<_i61.PageRouteInfo>? children})
    : super(LoanLensRoute.name, initialChildren: children);

  static const String name = 'LoanLensRoute';

  static _i61.PageInfo page = _i61.PageInfo(
    name,
    builder: (data) {
      return const _i28.LoanLensView();
    },
  );
}

/// generated route for
/// [_i29.LogTransactionView]
class LogTransactionRoute extends _i61.PageRouteInfo<void> {
  const LogTransactionRoute({List<_i61.PageRouteInfo>? children})
    : super(LogTransactionRoute.name, initialChildren: children);

  static const String name = 'LogTransactionRoute';

  static _i61.PageInfo page = _i61.PageInfo(
    name,
    builder: (data) {
      return const _i29.LogTransactionView();
    },
  );
}

/// generated route for
/// [_i30.MiaHandledView]
class MiaHandledRoute extends _i61.PageRouteInfo<void> {
  const MiaHandledRoute({List<_i61.PageRouteInfo>? children})
    : super(MiaHandledRoute.name, initialChildren: children);

  static const String name = 'MiaHandledRoute';

  static _i61.PageInfo page = _i61.PageInfo(
    name,
    builder: (data) {
      return const _i30.MiaHandledView();
    },
  );
}

/// generated route for
/// [_i31.MoneyView]
class MoneyRoute extends _i61.PageRouteInfo<void> {
  const MoneyRoute({List<_i61.PageRouteInfo>? children})
    : super(MoneyRoute.name, initialChildren: children);

  static const String name = 'MoneyRoute';

  static _i61.PageInfo page = _i61.PageInfo(
    name,
    builder: (data) {
      return const _i31.MoneyView();
    },
  );
}

/// generated route for
/// [_i32.MoreView]
class MoreRoute extends _i61.PageRouteInfo<void> {
  const MoreRoute({List<_i61.PageRouteInfo>? children})
    : super(MoreRoute.name, initialChildren: children);

  static const String name = 'MoreRoute';

  static _i61.PageInfo page = _i61.PageInfo(
    name,
    builder: (data) {
      return const _i32.MoreView();
    },
  );
}

/// generated route for
/// [_i33.NetWorthView]
class NetWorthRoute extends _i61.PageRouteInfo<void> {
  const NetWorthRoute({List<_i61.PageRouteInfo>? children})
    : super(NetWorthRoute.name, initialChildren: children);

  static const String name = 'NetWorthRoute';

  static _i61.PageInfo page = _i61.PageInfo(
    name,
    builder: (data) {
      return const _i33.NetWorthView();
    },
  );
}

/// generated route for
/// [_i34.NotificationsView]
class NotificationsRoute extends _i61.PageRouteInfo<void> {
  const NotificationsRoute({List<_i61.PageRouteInfo>? children})
    : super(NotificationsRoute.name, initialChildren: children);

  static const String name = 'NotificationsRoute';

  static _i61.PageInfo page = _i61.PageInfo(
    name,
    builder: (data) {
      return const _i34.NotificationsView();
    },
  );
}

/// generated route for
/// [_i35.OnboardingView]
class OnboardingRoute extends _i61.PageRouteInfo<void> {
  const OnboardingRoute({List<_i61.PageRouteInfo>? children})
    : super(OnboardingRoute.name, initialChildren: children);

  static const String name = 'OnboardingRoute';

  static _i61.PageInfo page = _i61.PageInfo(
    name,
    builder: (data) {
      return const _i35.OnboardingView();
    },
  );
}

/// generated route for
/// [_i36.PaywallView]
class PaywallRoute extends _i61.PageRouteInfo<void> {
  const PaywallRoute({List<_i61.PageRouteInfo>? children})
    : super(PaywallRoute.name, initialChildren: children);

  static const String name = 'PaywallRoute';

  static _i61.PageInfo page = _i61.PageInfo(
    name,
    builder: (data) {
      return const _i36.PaywallView();
    },
  );
}

/// generated route for
/// [_i37.PowerLensView]
class PowerLensRoute extends _i61.PageRouteInfo<void> {
  const PowerLensRoute({List<_i61.PageRouteInfo>? children})
    : super(PowerLensRoute.name, initialChildren: children);

  static const String name = 'PowerLensRoute';

  static _i61.PageInfo page = _i61.PageInfo(
    name,
    builder: (data) {
      return const _i37.PowerLensView();
    },
  );
}

/// generated route for
/// [_i38.PurchaseDetailView]
class PurchaseDetailRoute extends _i61.PageRouteInfo<PurchaseDetailRouteArgs> {
  PurchaseDetailRoute({
    _i62.Key? key,
    required _i63.PurchaseRecord purchase,
    List<_i61.PageRouteInfo>? children,
  }) : super(
         PurchaseDetailRoute.name,
         args: PurchaseDetailRouteArgs(key: key, purchase: purchase),
         initialChildren: children,
       );

  static const String name = 'PurchaseDetailRoute';

  static _i61.PageInfo page = _i61.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<PurchaseDetailRouteArgs>();
      return _i38.PurchaseDetailView(key: args.key, purchase: args.purchase);
    },
  );
}

class PurchaseDetailRouteArgs {
  const PurchaseDetailRouteArgs({this.key, required this.purchase});

  final _i62.Key? key;

  final _i63.PurchaseRecord purchase;

  @override
  String toString() {
    return 'PurchaseDetailRouteArgs{key: $key, purchase: $purchase}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! PurchaseDetailRouteArgs) return false;
    return key == other.key && purchase == other.purchase;
  }

  @override
  int get hashCode => key.hashCode ^ purchase.hashCode;
}

/// generated route for
/// [_i39.PurchaseEditorView]
class PurchaseEditorRoute extends _i61.PageRouteInfo<void> {
  const PurchaseEditorRoute({List<_i61.PageRouteInfo>? children})
    : super(PurchaseEditorRoute.name, initialChildren: children);

  static const String name = 'PurchaseEditorRoute';

  static _i61.PageInfo page = _i61.PageInfo(
    name,
    builder: (data) {
      return const _i39.PurchaseEditorView();
    },
  );
}

/// generated route for
/// [_i40.ReceiptEditorView]
class ReceiptEditorRoute extends _i61.PageRouteInfo<void> {
  const ReceiptEditorRoute({List<_i61.PageRouteInfo>? children})
    : super(ReceiptEditorRoute.name, initialChildren: children);

  static const String name = 'ReceiptEditorRoute';

  static _i61.PageInfo page = _i61.PageInfo(
    name,
    builder: (data) {
      return const _i40.ReceiptEditorView();
    },
  );
}

/// generated route for
/// [_i41.ReceiptsView]
class ReceiptsRoute extends _i61.PageRouteInfo<void> {
  const ReceiptsRoute({List<_i61.PageRouteInfo>? children})
    : super(ReceiptsRoute.name, initialChildren: children);

  static const String name = 'ReceiptsRoute';

  static _i61.PageInfo page = _i61.PageInfo(
    name,
    builder: (data) {
      return const _i41.ReceiptsView();
    },
  );
}

/// generated route for
/// [_i42.ReconciliationView]
class ReconciliationRoute extends _i61.PageRouteInfo<void> {
  const ReconciliationRoute({List<_i61.PageRouteInfo>? children})
    : super(ReconciliationRoute.name, initialChildren: children);

  static const String name = 'ReconciliationRoute';

  static _i61.PageInfo page = _i61.PageInfo(
    name,
    builder: (data) {
      return const _i42.ReconciliationView();
    },
  );
}

/// generated route for
/// [_i43.ReportsView]
class ReportsRoute extends _i61.PageRouteInfo<void> {
  const ReportsRoute({List<_i61.PageRouteInfo>? children})
    : super(ReportsRoute.name, initialChildren: children);

  static const String name = 'ReportsRoute';

  static _i61.PageInfo page = _i61.PageInfo(
    name,
    builder: (data) {
      return const _i43.ReportsView();
    },
  );
}

/// generated route for
/// [_i44.ResetPasswordView]
class ResetPasswordRoute extends _i61.PageRouteInfo<void> {
  const ResetPasswordRoute({List<_i61.PageRouteInfo>? children})
    : super(ResetPasswordRoute.name, initialChildren: children);

  static const String name = 'ResetPasswordRoute';

  static _i61.PageInfo page = _i61.PageInfo(
    name,
    builder: (data) {
      return const _i44.ResetPasswordView();
    },
  );
}

/// generated route for
/// [_i45.ReviewDetailView]
class ReviewDetailRoute extends _i61.PageRouteInfo<ReviewDetailRouteArgs> {
  ReviewDetailRoute({
    _i62.Key? key,
    required _i63.ReviewItem item,
    List<_i61.PageRouteInfo>? children,
  }) : super(
         ReviewDetailRoute.name,
         args: ReviewDetailRouteArgs(key: key, item: item),
         initialChildren: children,
       );

  static const String name = 'ReviewDetailRoute';

  static _i61.PageInfo page = _i61.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ReviewDetailRouteArgs>();
      return _i45.ReviewDetailView(key: args.key, item: args.item);
    },
  );
}

class ReviewDetailRouteArgs {
  const ReviewDetailRouteArgs({this.key, required this.item});

  final _i62.Key? key;

  final _i63.ReviewItem item;

  @override
  String toString() {
    return 'ReviewDetailRouteArgs{key: $key, item: $item}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! ReviewDetailRouteArgs) return false;
    return key == other.key && item == other.item;
  }

  @override
  int get hashCode => key.hashCode ^ item.hashCode;
}

/// generated route for
/// [_i46.RulesView]
class RulesRoute extends _i61.PageRouteInfo<void> {
  const RulesRoute({List<_i61.PageRouteInfo>? children})
    : super(RulesRoute.name, initialChildren: children);

  static const String name = 'RulesRoute';

  static _i61.PageInfo page = _i61.PageInfo(
    name,
    builder: (data) {
      return const _i46.RulesView();
    },
  );
}

/// generated route for
/// [_i47.SearchView]
class SearchRoute extends _i61.PageRouteInfo<void> {
  const SearchRoute({List<_i61.PageRouteInfo>? children})
    : super(SearchRoute.name, initialChildren: children);

  static const String name = 'SearchRoute';

  static _i61.PageInfo page = _i61.PageInfo(
    name,
    builder: (data) {
      return const _i47.SearchView();
    },
  );
}

/// generated route for
/// [_i48.SettingsView]
class SettingsRoute extends _i61.PageRouteInfo<void> {
  const SettingsRoute({List<_i61.PageRouteInfo>? children})
    : super(SettingsRoute.name, initialChildren: children);

  static const String name = 'SettingsRoute';

  static _i61.PageInfo page = _i61.PageInfo(
    name,
    builder: (data) {
      return const _i48.SettingsView();
    },
  );
}

/// generated route for
/// [_i49.ShellView]
class ShellRoute extends _i61.PageRouteInfo<void> {
  const ShellRoute({List<_i61.PageRouteInfo>? children})
    : super(ShellRoute.name, initialChildren: children);

  static const String name = 'ShellRoute';

  static _i61.PageInfo page = _i61.PageInfo(
    name,
    builder: (data) {
      return const _i49.ShellView();
    },
  );
}

/// generated route for
/// [_i50.SignInView]
class SignInRoute extends _i61.PageRouteInfo<void> {
  const SignInRoute({List<_i61.PageRouteInfo>? children})
    : super(SignInRoute.name, initialChildren: children);

  static const String name = 'SignInRoute';

  static _i61.PageInfo page = _i61.PageInfo(
    name,
    builder: (data) {
      return const _i50.SignInView();
    },
  );
}

/// generated route for
/// [_i51.SignUpView]
class SignUpRoute extends _i61.PageRouteInfo<void> {
  const SignUpRoute({List<_i61.PageRouteInfo>? children})
    : super(SignUpRoute.name, initialChildren: children);

  static const String name = 'SignUpRoute';

  static _i61.PageInfo page = _i61.PageInfo(
    name,
    builder: (data) {
      return const _i51.SignUpView();
    },
  );
}

/// generated route for
/// [_i52.SplashView]
class SplashRoute extends _i61.PageRouteInfo<void> {
  const SplashRoute({List<_i61.PageRouteInfo>? children})
    : super(SplashRoute.name, initialChildren: children);

  static const String name = 'SplashRoute';

  static _i61.PageInfo page = _i61.PageInfo(
    name,
    builder: (data) {
      return const _i52.SplashView();
    },
  );
}

/// generated route for
/// [_i53.TransactionDetailView]
class TransactionDetailRoute
    extends _i61.PageRouteInfo<TransactionDetailRouteArgs> {
  TransactionDetailRoute({
    _i62.Key? key,
    required _i64.MiaTransaction transaction,
    List<_i61.PageRouteInfo>? children,
  }) : super(
         TransactionDetailRoute.name,
         args: TransactionDetailRouteArgs(key: key, transaction: transaction),
         initialChildren: children,
       );

  static const String name = 'TransactionDetailRoute';

  static _i61.PageInfo page = _i61.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<TransactionDetailRouteArgs>();
      return _i53.TransactionDetailView(
        key: args.key,
        transaction: args.transaction,
      );
    },
  );
}

class TransactionDetailRouteArgs {
  const TransactionDetailRouteArgs({this.key, required this.transaction});

  final _i62.Key? key;

  final _i64.MiaTransaction transaction;

  @override
  String toString() {
    return 'TransactionDetailRouteArgs{key: $key, transaction: $transaction}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! TransactionDetailRouteArgs) return false;
    return key == other.key && transaction == other.transaction;
  }

  @override
  int get hashCode => key.hashCode ^ transaction.hashCode;
}

/// generated route for
/// [_i54.TransactionSplitView]
class TransactionSplitRoute
    extends _i61.PageRouteInfo<TransactionSplitRouteArgs> {
  TransactionSplitRoute({
    _i62.Key? key,
    required _i64.MiaTransaction transaction,
    List<_i61.PageRouteInfo>? children,
  }) : super(
         TransactionSplitRoute.name,
         args: TransactionSplitRouteArgs(key: key, transaction: transaction),
         initialChildren: children,
       );

  static const String name = 'TransactionSplitRoute';

  static _i61.PageInfo page = _i61.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<TransactionSplitRouteArgs>();
      return _i54.TransactionSplitView(
        key: args.key,
        transaction: args.transaction,
      );
    },
  );
}

class TransactionSplitRouteArgs {
  const TransactionSplitRouteArgs({this.key, required this.transaction});

  final _i62.Key? key;

  final _i64.MiaTransaction transaction;

  @override
  String toString() {
    return 'TransactionSplitRouteArgs{key: $key, transaction: $transaction}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! TransactionSplitRouteArgs) return false;
    return key == other.key && transaction == other.transaction;
  }

  @override
  int get hashCode => key.hashCode ^ transaction.hashCode;
}

/// generated route for
/// [_i55.TransactionsView]
class TransactionsRoute extends _i61.PageRouteInfo<void> {
  const TransactionsRoute({List<_i61.PageRouteInfo>? children})
    : super(TransactionsRoute.name, initialChildren: children);

  static const String name = 'TransactionsRoute';

  static _i61.PageInfo page = _i61.PageInfo(
    name,
    builder: (data) {
      return const _i55.TransactionsView();
    },
  );
}

/// generated route for
/// [_i56.TrueCostOfLifeView]
class TrueCostOfLifeRoute extends _i61.PageRouteInfo<void> {
  const TrueCostOfLifeRoute({List<_i61.PageRouteInfo>? children})
    : super(TrueCostOfLifeRoute.name, initialChildren: children);

  static const String name = 'TrueCostOfLifeRoute';

  static _i61.PageInfo page = _i61.PageInfo(
    name,
    builder: (data) {
      return const _i56.TrueCostOfLifeView();
    },
  );
}

/// generated route for
/// [_i57.VaultView]
class VaultRoute extends _i61.PageRouteInfo<void> {
  const VaultRoute({List<_i61.PageRouteInfo>? children})
    : super(VaultRoute.name, initialChildren: children);

  static const String name = 'VaultRoute';

  static _i61.PageInfo page = _i61.PageInfo(
    name,
    builder: (data) {
      return const _i57.VaultView();
    },
  );
}

/// generated route for
/// [_i58.VerifyEmailView]
class VerifyEmailRoute extends _i61.PageRouteInfo<void> {
  const VerifyEmailRoute({List<_i61.PageRouteInfo>? children})
    : super(VerifyEmailRoute.name, initialChildren: children);

  static const String name = 'VerifyEmailRoute';

  static _i61.PageInfo page = _i61.PageInfo(
    name,
    builder: (data) {
      return const _i58.VerifyEmailView();
    },
  );
}

/// generated route for
/// [_i59.WeeklyResetView]
class WeeklyResetRoute extends _i61.PageRouteInfo<void> {
  const WeeklyResetRoute({List<_i61.PageRouteInfo>? children})
    : super(WeeklyResetRoute.name, initialChildren: children);

  static const String name = 'WeeklyResetRoute';

  static _i61.PageInfo page = _i61.PageInfo(
    name,
    builder: (data) {
      return const _i59.WeeklyResetView();
    },
  );
}

/// generated route for
/// [_i60.WhatChangedView]
class WhatChangedRoute extends _i61.PageRouteInfo<void> {
  const WhatChangedRoute({List<_i61.PageRouteInfo>? children})
    : super(WhatChangedRoute.name, initialChildren: children);

  static const String name = 'WhatChangedRoute';

  static _i61.PageInfo page = _i61.PageInfo(
    name,
    builder: (data) {
      return const _i60.WhatChangedView();
    },
  );
}
