// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i558;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../data/repositories/admin_repository.dart' as _i190;
import '../../data/repositories/assistant_repository.dart' as _i635;
import '../../data/repositories/insight_repository.dart' as _i1047;
import '../../data/repositories/lens_repository.dart' as _i160;
import '../../data/repositories/money_repository.dart' as _i836;
import '../../data/repositories/user_repository.dart' as _i517;
import '../../data/store/mia_store.dart' as _i630;
import '../../features/ask_mia/bloc/ask_mia_bloc.dart' as _i981;
import '../../features/auth/bloc/auth_bloc.dart' as _i55;
import '../../features/bills/bloc/bills_bloc.dart' as _i435;
import '../../features/connections/bloc/connections_bloc.dart' as _i35;
import '../../features/discovery/bloc/discovery_bloc.dart' as _i388;
import '../../features/home/bloc/home_bloc.dart' as _i854;
import '../../features/inbox/bloc/inbox_bloc.dart' as _i1059;
import '../../features/insights/bloc/insights_bloc.dart' as _i1045;
import '../../features/lenses/bloc/loan_lens_bloc.dart' as _i710;
import '../../features/lenses/bloc/power_lens_bloc.dart' as _i215;
import '../../features/logging/bloc/log_bloc.dart' as _i974;
import '../../features/money/bloc/money_bloc.dart' as _i242;
import '../../features/onboarding/bloc/onboarding_bloc.dart' as _i327;
import '../../features/profile/bloc/profile_bloc.dart' as _i40;
import '../../features/splash/bloc/splash_bloc.dart' as _i480;
import '../../features/subscription/bloc/subscription_bloc.dart' as _i499;
import '../../features/transactions/bloc/split_bloc.dart' as _i161;
import '../../features/transactions/bloc/transactions_bloc.dart' as _i53;
import '../../features/vault/bloc/vault_bloc.dart' as _i653;
import '../network/injectable_module.dart' as _i369;
import '../router/app_router.dart' as _i81;
import '../router/router_module.dart' as _i948;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final injectableModule = _$InjectableModule();
    final routerModule = _$RouterModule();
    gh.factory<_i55.AuthBloc>(() => _i55.AuthBloc());
    gh.factory<_i327.OnboardingBloc>(() => _i327.OnboardingBloc());
    gh.lazySingleton<_i361.Dio>(() => injectableModule.dio);
    gh.lazySingleton<_i558.FlutterSecureStorage>(
      () => injectableModule.secureStorage,
    );
    gh.lazySingleton<_i81.AppRouter>(() => routerModule.appRouter);
    gh.lazySingleton<_i630.MiaStore>(() => _i630.MiaStore());
    gh.lazySingleton<_i635.SupportRepository>(
      () => _i635.DummySupportRepository(gh<_i630.MiaStore>()),
    );
    gh.lazySingleton<_i190.ExpectedMoneyRepository>(
      () => _i190.DummyExpectedMoneyRepository(gh<_i630.MiaStore>()),
    );
    gh.lazySingleton<_i1047.InsightRepository>(
      () => _i1047.DummyInsightRepository(gh<_i630.MiaStore>()),
    );
    gh.lazySingleton<_i635.ConnectionRepository>(
      () => _i635.DummyConnectionRepository(gh<_i630.MiaStore>()),
    );
    gh.lazySingleton<_i160.LoanLensRepository>(
      () => _i160.DummyLoanLensRepository(),
    );
    gh.lazySingleton<_i635.AskMiaRepository>(
      () => _i635.DummyAskMiaRepository(),
    );
    gh.lazySingleton<_i190.ReviewRepository>(
      () => _i190.DummyReviewRepository(gh<_i630.MiaStore>()),
    );
    gh.lazySingleton<_i1047.BudgetRepository>(
      () => _i1047.DummyBudgetRepository(),
    );
    gh.lazySingleton<_i1047.NetWorthRepository>(
      () => _i1047.DummyNetWorthRepository(),
    );
    gh.lazySingleton<_i517.UserRepository>(() => _i517.DummyUserRepository());
    gh.lazySingleton<_i1047.ReportRepository>(
      () => _i1047.DummyReportRepository(),
    );
    gh.lazySingleton<_i836.CategoryRepository>(
      () => _i836.DummyCategoryRepository(gh<_i630.MiaStore>()),
    );
    gh.lazySingleton<_i836.RuleRepository>(
      () => _i836.DummyRuleRepository(gh<_i630.MiaStore>()),
    );
    gh.lazySingleton<_i160.PowerLensRepository>(
      () => _i160.DummyPowerLensRepository(),
    );
    gh.lazySingleton<_i190.BillRepository>(
      () => _i190.DummyBillRepository(gh<_i630.MiaStore>()),
    );
    gh.lazySingleton<_i190.VaultRepository>(
      () => _i190.DummyVaultRepository(gh<_i630.MiaStore>()),
    );
    gh.lazySingleton<_i190.ExportRepository>(
      () => _i190.DummyExportRepository(gh<_i630.MiaStore>()),
    );
    gh.lazySingleton<_i635.SearchRepository>(
      () => _i635.DummySearchRepository(),
    );
    gh.lazySingleton<_i635.NotificationRepository>(
      () => _i635.DummyNotificationRepository(),
    );
    gh.lazySingleton<_i190.DocumentRepository>(
      () => _i190.DummyDocumentRepository(gh<_i630.MiaStore>()),
    );
    gh.lazySingleton<_i836.TransactionRepository>(
      () => _i836.DummyTransactionRepository(gh<_i630.MiaStore>()),
    );
    gh.lazySingleton<_i1047.GoalRepository>(
      () => _i1047.DummyGoalRepository(gh<_i630.MiaStore>()),
    );
    gh.factory<_i854.HomeBloc>(
      () => _i854.HomeBloc(
        gh<_i1047.InsightRepository>(),
        gh<_i190.ReviewRepository>(),
        gh<_i190.BillRepository>(),
        gh<_i517.UserRepository>(),
      ),
    );
    gh.factory<_i35.ConnectionsBloc>(
      () => _i35.ConnectionsBloc(gh<_i635.ConnectionRepository>()),
    );
    gh.lazySingleton<_i517.HouseholdRepository>(
      () => _i517.DummyHouseholdRepository(),
    );
    gh.lazySingleton<_i836.AccountRepository>(
      () => _i836.DummyAccountRepository(gh<_i630.MiaStore>()),
    );
    gh.factory<_i1059.InboxBloc>(
      () => _i1059.InboxBloc(gh<_i190.ReviewRepository>()),
    );
    gh.factory<_i161.SplitBloc>(
      () => _i161.SplitBloc(gh<_i836.TransactionRepository>()),
    );
    gh.factory<_i710.LoanLensBloc>(
      () => _i710.LoanLensBloc(gh<_i160.LoanLensRepository>()),
    );
    gh.factory<_i981.AskMiaBloc>(
      () => _i981.AskMiaBloc(gh<_i635.AskMiaRepository>()),
    );
    gh.factory<_i480.SplashBloc>(
      () => _i480.SplashBloc(gh<_i517.UserRepository>()),
    );
    gh.factory<_i499.SubscriptionBloc>(
      () => _i499.SubscriptionBloc(gh<_i517.UserRepository>()),
    );
    gh.factory<_i435.BillsBloc>(
      () => _i435.BillsBloc(
        gh<_i190.BillRepository>(),
        gh<_i190.ExpectedMoneyRepository>(),
      ),
    );
    gh.factory<_i1045.InsightsBloc>(
      () => _i1045.InsightsBloc(gh<_i1047.InsightRepository>()),
    );
    gh.factory<_i388.DiscoveryBloc>(
      () => _i388.DiscoveryBloc(
        gh<_i635.SearchRepository>(),
        gh<_i635.NotificationRepository>(),
        gh<_i635.SupportRepository>(),
      ),
    );
    gh.factory<_i242.MoneyBloc>(
      () => _i242.MoneyBloc(
        gh<_i836.AccountRepository>(),
        gh<_i1047.NetWorthRepository>(),
        gh<_i1047.BudgetRepository>(),
        gh<_i1047.ReportRepository>(),
        gh<_i1047.GoalRepository>(),
        gh<_i517.UserRepository>(),
        gh<_i190.ExportRepository>(),
      ),
    );
    gh.factory<_i40.ProfileBloc>(
      () => _i40.ProfileBloc(
        gh<_i517.UserRepository>(),
        gh<_i517.HouseholdRepository>(),
        gh<_i190.ExportRepository>(),
      ),
    );
    gh.factory<_i653.VaultBloc>(
      () => _i653.VaultBloc(
        gh<_i190.DocumentRepository>(),
        gh<_i190.VaultRepository>(),
      ),
    );
    gh.factory<_i53.TransactionsBloc>(
      () => _i53.TransactionsBloc(
        gh<_i836.TransactionRepository>(),
        gh<_i836.CategoryRepository>(),
        gh<_i836.RuleRepository>(),
      ),
    );
    gh.factory<_i215.PowerLensBloc>(
      () => _i215.PowerLensBloc(gh<_i160.PowerLensRepository>()),
    );
    gh.factory<_i974.LogBloc>(
      () => _i974.LogBloc(
        gh<_i836.TransactionRepository>(),
        gh<_i836.AccountRepository>(),
        gh<_i836.CategoryRepository>(),
        gh<_i190.BillRepository>(),
        gh<_i190.ExpectedMoneyRepository>(),
        gh<_i190.DocumentRepository>(),
        gh<_i190.VaultRepository>(),
        gh<_i1047.GoalRepository>(),
        gh<_i517.UserRepository>(),
      ),
    );
    return this;
  }
}

class _$InjectableModule extends _i369.InjectableModule {}

class _$RouterModule extends _i948.RouterModule {}
