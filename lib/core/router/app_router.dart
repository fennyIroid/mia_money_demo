import 'package:auto_route/auto_route.dart';

import '../theme/app_motion.dart';
import 'app_router.gr.dart';

/// Every destination in the product. Transitions default to the iOS push so
/// navigation feels native, with fades reserved for full-screen replacements.
@AutoRouterConfig(replaceInRouteName: 'View,Route')
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => const RouteType.cupertino();

  @override
  List<AutoRoute> get routes => <AutoRoute>[
    AutoRoute(
      page: SplashRoute.page,
      initial: true,
      path: '/',
      type: RouteType.custom(
        transitionsBuilder: TransitionsBuilders.fadeIn,
        duration: Duration(milliseconds: 420),
      ),
    ),
    AutoRoute(
      page: OnboardingRoute.page,
      path: '/onboarding',
      type: RouteType.custom(
        transitionsBuilder: TransitionsBuilders.fadeIn,
        duration: Duration(milliseconds: 520),
      ),
    ),
    AutoRoute(page: PaywallRoute.page, path: '/paywall'),

    // Authentication
    AutoRoute(page: SignInRoute.page, path: '/sign-in'),
    AutoRoute(page: SignUpRoute.page, path: '/sign-up'),
    AutoRoute(page: VerifyEmailRoute.page, path: '/verify-email'),
    AutoRoute(page: ResetPasswordRoute.page, path: '/reset-password'),
    AutoRoute(page: BiometricSetupRoute.page, path: '/biometric-setup'),

    // Main shell
    AutoRoute(
      page: ShellRoute.page,
      path: '/app',
      type: RouteType.custom(
        transitionsBuilder: TransitionsBuilders.fadeIn,
        duration: Duration(milliseconds: 480),
      ),
      children: <AutoRoute>[
        AutoRoute(page: HomeRoute.page, path: 'home', initial: true),
        AutoRoute(page: InboxRoute.page, path: 'inbox'),
        AutoRoute(page: MoneyRoute.page, path: 'money'),
        AutoRoute(page: LensesRoute.page, path: 'lenses'),
        AutoRoute(page: MoreRoute.page, path: 'more'),
      ],
    ),

    // Adding and logging by hand
    AutoRoute(page: LogTransactionRoute.page, path: '/log/transaction'),
    AutoRoute(page: BillEditorRoute.page, path: '/log/bill'),
    AutoRoute(page: ExpectedMoneyEditorRoute.page, path: '/log/expected'),
    AutoRoute(page: AccountEditorRoute.page, path: '/log/account'),
    AutoRoute(page: ReceiptEditorRoute.page, path: '/log/receipt'),
    AutoRoute(page: PurchaseEditorRoute.page, path: '/log/purchase'),
    AutoRoute(page: DocumentEditorRoute.page, path: '/log/document'),

    // Financial admin
    AutoRoute(page: ReviewDetailRoute.page, path: '/review'),
    AutoRoute(page: TransactionsRoute.page, path: '/transactions'),
    AutoRoute(page: TransactionDetailRoute.page, path: '/transaction'),
    AutoRoute(page: TransactionSplitRoute.page, path: '/transaction/split'),
    AutoRoute(page: RulesRoute.page, path: '/rules'),
    AutoRoute(page: ReconciliationRoute.page, path: '/reconciliation'),
    AutoRoute(page: CategoriesRoute.page, path: '/categories'),
    AutoRoute(page: CategoryEditorRoute.page, path: '/categories/new'),

    // Obligations
    AutoRoute(page: BillsRoute.page, path: '/bills'),
    AutoRoute(page: BillDetailRoute.page, path: '/bill'),
    AutoRoute(page: ComingUpRoute.page, path: '/coming-up'),
    AutoRoute(page: ExpectedMoneyRoute.page, path: '/expected-money'),

    // Evidence
    AutoRoute(page: VaultRoute.page, path: '/vault'),
    AutoRoute(page: PurchaseDetailRoute.page, path: '/vault/purchase'),
    AutoRoute(page: DocumentsRoute.page, path: '/documents'),
    AutoRoute(page: ReceiptsRoute.page, path: '/receipts'),
    AutoRoute(page: ImportsRoute.page, path: '/imports'),

    // Money
    AutoRoute(page: AccountsRoute.page, path: '/accounts'),
    AutoRoute(page: NetWorthRoute.page, path: '/net-worth'),
    AutoRoute(page: BudgetsRoute.page, path: '/budgets'),
    AutoRoute(page: ReportsRoute.page, path: '/reports'),
    AutoRoute(page: GoalsRoute.page, path: '/goals'),
    AutoRoute(page: GoalEditorRoute.page, path: '/goals/new'),

    // Lenses
    AutoRoute(page: PowerLensRoute.page, path: '/power-lens'),
    AutoRoute(page: LoanLensRoute.page, path: '/loan-lens'),

    // Assistant
    AutoRoute(
      page: AskMiaRoute.page,
      path: '/ask-mia',
      type: RouteType.custom(
        transitionsBuilder: TransitionsBuilders.slideBottom,
        duration: Duration(milliseconds: 420),
      ),
    ),

    // Intelligence
    AutoRoute(
      page: AvailableAfterObligationsRoute.page,
      path: '/available-after-obligations',
    ),
    AutoRoute(page: TrueCostOfLifeRoute.page, path: '/true-cost-of-life'),
    AutoRoute(page: WhatChangedRoute.page, path: '/what-changed'),
    AutoRoute(page: MiaHandledRoute.page, path: '/mia-handled'),
    AutoRoute(page: WeeklyResetRoute.page, path: '/weekly-reset'),
    AutoRoute(page: BriefingsRoute.page, path: '/briefings'),

    // Account and support
    AutoRoute(page: HouseholdRoute.page, path: '/household'),
    AutoRoute(page: ConnectionsRoute.page, path: '/connections'),
    AutoRoute(page: SettingsRoute.page, path: '/settings'),
    AutoRoute(page: DataControlsRoute.page, path: '/data-controls'),
    AutoRoute(
      page: SearchRoute.page,
      path: '/search',
      type: RouteType.custom(
        transitionsBuilder: TransitionsBuilders.fadeIn,
        duration: Duration(milliseconds: 300),
      ),
    ),
    AutoRoute(page: NotificationsRoute.page, path: '/notifications'),
    AutoRoute(page: HelpRoute.page, path: '/help'),
  ];

  /// Kept next to the route table so page transition timing stays with the
  /// rest of the navigation configuration.
  Duration get transitionDuration => AppMotion.normal;
}
