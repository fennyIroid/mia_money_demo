/// Non-visual product configuration. Everything commercial here is a working
/// baseline that a real build would fetch from remote config, never hard-code.
abstract class AppConstants {
  static const String appName = 'Mia Money';
  static const String apiBaseUrl = 'https://api.miamoney.com.au/v1';
  static const Duration networkTimeout = Duration(seconds: 30);

  /// Design baseline used by flutter_screenutil.
  static const double designWidth = 393;
  static const double designHeight = 852;

  // Product limits from the Phase 1 estimation baseline.
  static const int maxInstitutionsPerMember = 5;
  static const int maxAccountsPerMember = 20;
  static const int maxEnergyConnectionsPerHousehold = 3;
  static const int maxServicePointsPerHousehold = 5;
  static const int maxHouseholdMembers = 5;
  static const int bankingHistoryMonths = 24;
  static const int prioritisedHistoryMonths = 12;

  // Upload baselines.
  static const int csvMaxMegabytes = 10;
  static const int csvMaxRows = 10000;
  static const int pdfMaxMegabytes = 20;
  static const int pdfMaxPages = 50;
  static const int imageMaxMegabytes = 10;

  /// Categories contributing strictly below this share are grouped as Smaller
  /// Spending in eligible reports.
  static const double smallerSpendingThresholdPercent = 0.5;

  static const String calculationEngineVersion = 'calc-2026.06.3';
  static const String taxonomyMappingVersion = 'map-2026.05.1';
  static const String aiModelVersion = 'mia-explain-4.2';
  static const String dataResidency = 'AWS ap-southeast-2 (Sydney)';

  static const String privacyUrl = 'https://miamoney.com.au/privacy';
  static const String termsUrl = 'https://miamoney.com.au/terms';
  static const String cdrPolicyUrl = 'https://miamoney.com.au/cdr-policy';
}
