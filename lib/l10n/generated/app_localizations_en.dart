// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appName => 'Mia Money';

  @override
  String get appTagline => 'Your financial admin, handled.';

  @override
  String get actionContinue => 'Continue';

  @override
  String get actionNext => 'Next';

  @override
  String get actionBack => 'Back';

  @override
  String get actionSkip => 'Skip';

  @override
  String get actionDone => 'Done';

  @override
  String get actionSave => 'Save';

  @override
  String get actionCancel => 'Cancel';

  @override
  String get actionClose => 'Close';

  @override
  String get actionConfirm => 'Confirm';

  @override
  String get actionApprove => 'Approve';

  @override
  String get actionApproveAll => 'Approve all';

  @override
  String get actionDismiss => 'Dismiss';

  @override
  String get actionDelete => 'Delete';

  @override
  String get actionEdit => 'Edit';

  @override
  String get actionUndo => 'Undo';

  @override
  String get actionRetry => 'Try again';

  @override
  String get actionSeeAll => 'See all';

  @override
  String get actionViewEvidence => 'View evidence';

  @override
  String get actionViewCalculation => 'View calculation';

  @override
  String get actionAskMia => 'Ask Mia';

  @override
  String get actionShare => 'Share';

  @override
  String get actionExport => 'Export';

  @override
  String get actionFilter => 'Filter';

  @override
  String get actionSearch => 'Search';

  @override
  String get actionApply => 'Apply';

  @override
  String get actionReset => 'Reset';

  @override
  String get actionAdd => 'Add';

  @override
  String get actionRemove => 'Remove';

  @override
  String get actionConnect => 'Connect';

  @override
  String get actionReconnect => 'Reconnect';

  @override
  String get actionDisconnect => 'Disconnect';

  @override
  String get actionSnooze => 'Snooze';

  @override
  String get actionMarkHandled => 'Mark handled';

  @override
  String get actionAssign => 'Assign';

  @override
  String get actionComment => 'Comment';

  @override
  String get actionSplit => 'Split';

  @override
  String get actionUnsplit => 'Unsplit';

  @override
  String get actionCorrect => 'Correct';

  @override
  String get actionDefer => 'Defer';

  @override
  String get actionResolve => 'Resolve';

  @override
  String get actionUpload => 'Upload';

  @override
  String get actionScan => 'Scan';

  @override
  String get actionLearnMore => 'Learn more';

  @override
  String get actionNotNow => 'Not now';

  @override
  String get actionGetStarted => 'Get started';

  @override
  String get actionSignIn => 'Sign in';

  @override
  String get actionSignUp => 'Create account';

  @override
  String get actionSignOut => 'Sign out';

  @override
  String get onboardingWelcomeTitle => 'Money admin, minus the admin';

  @override
  String get onboardingWelcomeBody =>
      'Mia collects the evidence, works out what changed, and only asks you when a human call is needed.';

  @override
  String onboardingStepLabel(int current, int total) {
    return 'Step $current of $total';
  }

  @override
  String get onboardingNameQuestion => 'First, what should Mia call you?';

  @override
  String get onboardingNameHint => 'Your first name';

  @override
  String get onboardingHouseholdQuestion => 'Who are you managing money for?';

  @override
  String get onboardingHouseholdSolo => 'Just me';

  @override
  String get onboardingHouseholdCouple => 'Me and a partner';

  @override
  String get onboardingHouseholdFamily => 'A whole household';

  @override
  String get onboardingHouseholdShared => 'A share house';

  @override
  String get onboardingPainQuestion => 'What eats your time today?';

  @override
  String get onboardingPainBills => 'Chasing bills and due dates';

  @override
  String get onboardingPainCategories => 'Fixing wrong categories';

  @override
  String get onboardingPainReceipts => 'Losing receipts and warranties';

  @override
  String get onboardingPainSurprises => 'Being surprised by annual costs';

  @override
  String get onboardingPainEnergy => 'Wondering if I\'m overpaying for power';

  @override
  String get onboardingPainLoans => 'Never comparing my loan again';

  @override
  String get onboardingPayQuestion => 'When does money land?';

  @override
  String get onboardingPayWeekly => 'Weekly';

  @override
  String get onboardingPayFortnightly => 'Fortnightly';

  @override
  String get onboardingPayMonthly => 'Monthly';

  @override
  String get onboardingPayIrregular => 'It varies';

  @override
  String get onboardingBudgetQuestion => 'How much structure do you want?';

  @override
  String get onboardingBudgetTracking => 'Just track it';

  @override
  String get onboardingBudgetFlex => 'One flexible number';

  @override
  String get onboardingBudgetCategory => 'Category limits';

  @override
  String get onboardingBudgetDetailed => 'Plan it properly';

  @override
  String get onboardingReviewQuestion =>
      'How often should Mia bring you a review?';

  @override
  String get onboardingReviewWeekly => 'Weekly reset';

  @override
  String get onboardingReviewFortnightly => 'Every fortnight';

  @override
  String get onboardingReviewMonthly => 'Monthly';

  @override
  String get onboardingLoopTitle => 'How Mia works';

  @override
  String get onboardingLoopCollect => 'Collect';

  @override
  String get onboardingLoopUnderstand => 'Understand';

  @override
  String get onboardingLoopAsk => 'Ask';

  @override
  String get onboardingLoopCorrect => 'Correct';

  @override
  String get onboardingLoopRemember => 'Remember';

  @override
  String get onboardingLoopAct => 'Act';

  @override
  String get onboardingLoopRecheck => 'Recheck';

  @override
  String get onboardingEvidenceTitle => 'Mia never invents a number';

  @override
  String get onboardingEvidenceBody =>
      'Every figure carries its source, its date range and what was left out.';

  @override
  String get onboardingPrivacyTitle => 'Private by default';

  @override
  String get onboardingPrivacyBody =>
      'Household membership never opens someone else\'s bank data, documents or conversations.';

  @override
  String get onboardingResidencyTitle => 'Stored onshore in Australia';

  @override
  String get onboardingResidencyBody =>
      'Your financial records, documents and backups stay in Australian infrastructure.';

  @override
  String get onboardingRecapTitle => 'Here\'s what Mia will do for you';

  @override
  String get onboardingRecapSubtitle => 'Built from your answers';

  @override
  String get onboardingReadyTitle => 'Ready when you are';

  @override
  String get onboardingReadyBody =>
      'Nothing is collected until you subscribe and give consent.';

  @override
  String get paywallTitle => 'Choose your plan';

  @override
  String get paywallSubtitle =>
      'Cancel anytime from the store. Bank data is only collected after you consent.';

  @override
  String get paywallIndividual => 'Individual';

  @override
  String get paywallHousehold => 'Household';

  @override
  String get paywallMonthly => 'Monthly';

  @override
  String get paywallAnnual => 'Annual';

  @override
  String get paywallPerMonth => 'per month';

  @override
  String get paywallPerYear => 'per year';

  @override
  String get paywallBestValue => 'Best value';

  @override
  String paywallSaveLabel(int percent) {
    return 'Save $percent%';
  }

  @override
  String paywallMembersLabel(int count) {
    return 'Up to $count members';
  }

  @override
  String get paywallRestore => 'Restore purchase';

  @override
  String paywallStartPlan(String plan) {
    return 'Start with $plan';
  }

  @override
  String get paywallTermsNote =>
      'Billed through your app store. Prices in AUD.';

  @override
  String get authSignInTitle => 'Welcome back';

  @override
  String get authSignInSubtitle => 'Your evidence is where you left it.';

  @override
  String get authSignUpTitle => 'Create your account';

  @override
  String get authSignUpSubtitle =>
      'Email first. Connections come later, with consent.';

  @override
  String get authEmailLabel => 'Email';

  @override
  String get authEmailHint => 'you@example.com';

  @override
  String get authPasswordLabel => 'Password';

  @override
  String get authPasswordHint => 'At least 10 characters';

  @override
  String get authConfirmPasswordLabel => 'Confirm password';

  @override
  String get authForgotPassword => 'Forgot password?';

  @override
  String get authContinueWithApple => 'Continue with Apple';

  @override
  String get authContinueWithGoogle => 'Continue with Google';

  @override
  String get authNoAccount => 'No account yet?';

  @override
  String get authHaveAccount => 'Already have an account?';

  @override
  String get authVerifyTitle => 'Check your inbox';

  @override
  String authVerifySubtitle(String email) {
    return 'We sent a six digit code to $email.';
  }

  @override
  String get authResendCode => 'Resend code';

  @override
  String get authResetTitle => 'Reset your password';

  @override
  String get authResetSubtitle => 'We\'ll email you a secure reset link.';

  @override
  String get authSendResetLink => 'Send reset link';

  @override
  String get authBiometricTitle => 'Unlock with Face ID';

  @override
  String get authBiometricSubtitle =>
      'Fastest way back in. You can turn this off any time.';

  @override
  String get authBiometricEnable => 'Enable Face ID';

  @override
  String get authMfaTitle => 'Add a second factor';

  @override
  String get authMfaSubtitle =>
      'Recommended for accounts holding banking evidence.';

  @override
  String get authInvalidEmail => 'That email doesn\'t look right';

  @override
  String get authPasswordTooShort => 'Use at least 10 characters';

  @override
  String get authPasswordMismatch => 'Passwords don\'t match';

  @override
  String get navHome => 'Home';

  @override
  String get navInbox => 'Inbox';

  @override
  String get navMoney => 'Money';

  @override
  String get navLenses => 'Lenses';

  @override
  String get navMore => 'More';

  @override
  String get homeGreetingMorning => 'Good morning';

  @override
  String get homeGreetingAfternoon => 'Good afternoon';

  @override
  String get homeGreetingEvening => 'Good evening';

  @override
  String get homeStatusOkay => 'Broadly okay';

  @override
  String get homeStatusAttention => 'Needs attention';

  @override
  String get homeStatusIncomplete => 'Incomplete data';

  @override
  String get homeAvailableAfterObligations => 'Available after obligations';

  @override
  String get homeTrueCostOfLife => 'True cost of life';

  @override
  String get homeWhatChanged => 'What changed';

  @override
  String get homeNeedsReview => 'Needs review';

  @override
  String get homeComingUp => 'Coming up';

  @override
  String get homeMiaHandled => 'Mia handled this';

  @override
  String get homeWeeklyReset => 'Weekly financial reset';

  @override
  String get homePriorityTitle => 'Worth your attention';

  @override
  String get homeCaughtUpTitle => 'You\'re caught up';

  @override
  String get homeCaughtUpBody =>
      'Everything else is handled. Mia keeps watching.';

  @override
  String get homeUpcomingBills => 'Upcoming bills';

  @override
  String get homeExpectedIncome => 'Expected income';

  @override
  String get homeDataGaps => 'Data gaps';

  @override
  String get homeQuickActions => 'Quick actions';

  @override
  String get inboxTitle => 'Financial admin';

  @override
  String get inboxNew => 'New';

  @override
  String get inboxNeedsReview => 'Needs review';

  @override
  String get inboxAssigned => 'Assigned';

  @override
  String get inboxConfirmed => 'Confirmed';

  @override
  String get inboxComingUp => 'Coming up';

  @override
  String get inboxHandled => 'Handled';

  @override
  String get inboxException => 'Exceptions';

  @override
  String get inboxWhyFlagged => 'Why Mia flagged this';

  @override
  String get inboxConfidence => 'Confidence';

  @override
  String get inboxCalculationImpact => 'Calculation impact';

  @override
  String inboxBulkApprove(int count) {
    return 'Approve $count items';
  }

  @override
  String get inboxAuditTrail => 'Audit trail';

  @override
  String get inboxAssignTo => 'Assign to';

  @override
  String get inboxAskMember => 'Ask a household member';

  @override
  String get inboxRecogniseRequest => 'Do you recognise this?';

  @override
  String get transactionsTitle => 'Transactions';

  @override
  String get transactionsSearchHint => 'Merchant, amount, note';

  @override
  String get transactionsSelectedTotal => 'Selected total';

  @override
  String get transactionsSavedFilters => 'Saved filters';

  @override
  String get transactionsBulkEdit => 'Bulk edit';

  @override
  String get transactionSourceLayerProvider => 'Provider supplied';

  @override
  String get transactionSourceLayerMapped => 'Mia mapped';

  @override
  String get transactionSourceLayerConfirmed => 'You confirmed';

  @override
  String get transactionSourceLayerAi => 'AI suggested';

  @override
  String get transactionDetailTitle => 'Transaction';

  @override
  String get transactionOriginalDescription => 'Original description';

  @override
  String get transactionNormalised => 'Normalised merchant';

  @override
  String get transactionProviderCategory => 'Provider category';

  @override
  String get transactionMiaCategory => 'Mia category';

  @override
  String get transactionFlags => 'Flags';

  @override
  String get transactionRelationships => 'Linked records';

  @override
  String get transactionExcludeFromSpending => 'Exclude from spending';

  @override
  String get transactionMarkTransfer => 'Mark as internal transfer';

  @override
  String get transactionMarkReimbursable => 'Mark reimbursable';

  @override
  String get transactionMarkBusiness => 'Mark as business';

  @override
  String get transactionPossibleDuplicate => 'Possible duplicate';

  @override
  String get transactionSplitTitle => 'Split transaction';

  @override
  String get transactionSplitExact => 'Exact amount';

  @override
  String get transactionSplitPercent => 'Percentage';

  @override
  String get transactionSplitEqual => 'Equal shares';

  @override
  String get transactionSplitRemaining => 'Remaining to allocate';

  @override
  String get transactionSplitBalanced => 'Splits balance to the cent';

  @override
  String get categoriesTitle => 'Categories';

  @override
  String get categoriesCreate => 'New category';

  @override
  String get categoriesMerge => 'Merge';

  @override
  String get categoriesArchive => 'Archive';

  @override
  String get categoriesRestore => 'Restore';

  @override
  String get categoriesSubcategories => 'Subcategories';

  @override
  String get categoriesTags => 'Tags';

  @override
  String get rulesTitle => 'Rules centre';

  @override
  String get rulesSubtitle => 'Corrections you approved, reused transparently.';

  @override
  String get rulesCreate => 'New rule';

  @override
  String get rulesPreview => 'Preview matches';

  @override
  String get rulesPriority => 'Priority';

  @override
  String get rulesPause => 'Pause';

  @override
  String get rulesResume => 'Resume';

  @override
  String get rulesApplyHistorically => 'Apply to past transactions';

  @override
  String get rulesSuggestedTitle => 'Turn this into a rule?';

  @override
  String get rulesSuggestedBody =>
      'Mia can apply this correction to future matches. You stay in control.';

  @override
  String rulesMatchCount(int count) {
    return '$count matches';
  }

  @override
  String get billsTitle => 'Bills & obligations';

  @override
  String get billsSubscriptions => 'Subscriptions';

  @override
  String get billsRecurring => 'Recurring';

  @override
  String get billsRenewals => 'Renewals';

  @override
  String get billsDueDate => 'Due date';

  @override
  String get billsServicePeriod => 'Service period';

  @override
  String get billsExpectedRange => 'Expected range';

  @override
  String get billsStatementBalance => 'Statement balance';

  @override
  String get billsMinimumDue => 'Minimum due';

  @override
  String get billsAutopay => 'Autopay';

  @override
  String get billsPriceChange => 'Price change';

  @override
  String get billsCancellationWatch => 'Cancellation watch';

  @override
  String get billsLinkedPayment => 'Linked payment';

  @override
  String get billsMarkPaid => 'Mark as paid';

  @override
  String get comingUpTitle => 'Coming up';

  @override
  String get comingUpNext7 => '7 days';

  @override
  String get comingUpNext14 => '14 days';

  @override
  String get comingUpNext30 => '30 days';

  @override
  String get comingUpIrregular => 'Irregular commitments';

  @override
  String get comingUpMonthlyEquivalent => 'Monthly equivalent';

  @override
  String get comingUpFortnightlyEquivalent => 'Fortnightly equivalent';

  @override
  String get comingUpNotReserved =>
      'Shown as an equivalent only. No money has been set aside.';

  @override
  String get expectedMoneyTitle => 'Expected money';

  @override
  String get expectedMoneySubtitle =>
      'Money you\'re waiting on, never counted as income early.';

  @override
  String expectedMoneyWaiting(int days) {
    return 'Waiting $days days';
  }

  @override
  String get expectedMoneyOverdue => 'Overdue';

  @override
  String get expectedMoneyPossibleMatch => 'Possible match found';

  @override
  String get expectedMoneyConfirmMatch => 'Confirm this match';

  @override
  String get documentsTitle => 'Documents';

  @override
  String get documentsUpload => 'Add document';

  @override
  String get documentsProcessing => 'Processing';

  @override
  String get documentsExtracted => 'Extracted fields';

  @override
  String get documentsConfidence => 'Field confidence';

  @override
  String get documentsSourcePage => 'Source page';

  @override
  String get documentsReprocess => 'Reprocess';

  @override
  String get documentsRetention => 'Retention';

  @override
  String get receiptsTitle => 'Receipts';

  @override
  String get receiptsCapture => 'Capture receipt';

  @override
  String get receiptsMerchant => 'Merchant';

  @override
  String get receiptsSubtotal => 'Subtotal';

  @override
  String get receiptsGst => 'GST';

  @override
  String get receiptsTotal => 'Total';

  @override
  String get receiptsSuggestedMatch => 'Suggested transaction';

  @override
  String get receiptsAcceptMatch => 'Accept match';

  @override
  String get receiptsRejectMatch => 'Not this one';

  @override
  String get receiptsMismatch => 'Total doesn\'t match';

  @override
  String get receiptsDuplicate => 'Duplicate receipt';

  @override
  String get receiptsPhaseNote =>
      'Phase 1 reads receipt totals, not individual products.';

  @override
  String get vaultTitle => 'Purchases & warranty';

  @override
  String get vaultAddPurchase => 'Add purchase';

  @override
  String get vaultItemName => 'Item';

  @override
  String get vaultBrand => 'Brand';

  @override
  String get vaultModel => 'Model';

  @override
  String get vaultSerial => 'Serial number';

  @override
  String get vaultRetailer => 'Retailer';

  @override
  String get vaultPurchaseDate => 'Purchase date';

  @override
  String get vaultWarrantyEnds => 'Written warranty ends';

  @override
  String get vaultExtendedWarranty => 'Extended warranty';

  @override
  String get vaultStatusActive => 'Active';

  @override
  String get vaultStatusExpiring => 'Expiring';

  @override
  String get vaultStatusExpired => 'Ended';

  @override
  String get vaultReminders => 'Reminders';

  @override
  String get vaultWarrantyNote =>
      'Mia tracks the written warranty only. Australian Consumer Law rights can last longer.';

  @override
  String get accountsTitle => 'Accounts';

  @override
  String get accountsAssets => 'Assets';

  @override
  String get accountsLiabilities => 'Liabilities';

  @override
  String accountsBalanceAsOf(String timestamp) {
    return 'Balance as of $timestamp';
  }

  @override
  String get accountsArchived => 'Archived';

  @override
  String get accountsAddManual => 'Add manual account';

  @override
  String get netWorthTitle => 'Net worth';

  @override
  String get netWorthAsAt => 'As at';

  @override
  String get netWorthInvestmentBoundary =>
      'Phase 1 shows dated values only — no benchmarking or trading.';

  @override
  String get budgetsTitle => 'Budgets';

  @override
  String get budgetsModeTracking => 'Tracking only';

  @override
  String get budgetsModeFlex => 'Simple flex';

  @override
  String get budgetsModeCategory => 'Category budget';

  @override
  String get budgetsModeDetailed => 'Detailed planning';

  @override
  String get budgetsPlanned => 'Planned';

  @override
  String get budgetsActual => 'Actual';

  @override
  String get budgetsRemaining => 'Remaining';

  @override
  String get budgetsPace => 'Pace';

  @override
  String get budgetsRollover => 'Rollover';

  @override
  String get budgetsSinkingFunds => 'Sinking funds';

  @override
  String get budgetsRebalance => 'Rebalance';

  @override
  String get budgetsPaceAhead => 'Ahead of pace';

  @override
  String get budgetsPaceBehind => 'Behind pace';

  @override
  String get budgetsPaceOnTrack => 'On pace';

  @override
  String get budgetsParentWarning =>
      'Subcategory limits exceed the parent budget.';

  @override
  String get reportsTitle => 'Reports';

  @override
  String get reportsCashFlow => 'Cash flow';

  @override
  String get reportsIncomeSpending => 'Income & spending';

  @override
  String get reportsCategories => 'Categories';

  @override
  String get reportsMerchants => 'Merchants';

  @override
  String get reportsTags => 'Tags';

  @override
  String get reportsSubscriptions => 'Subscriptions';

  @override
  String get reportsMonthOverMonth => 'Month over month';

  @override
  String get reportsYearOverYear => 'Year over year';

  @override
  String get reportsYearToDate => 'Year to date';

  @override
  String get reportsCustomRange => 'Custom range';

  @override
  String get reportsFinancialYear => 'Financial year';

  @override
  String get reportsSmallerSpending => 'Smaller spending';

  @override
  String get reportsSmallerSpendingNote =>
      'Categories under 0.5% of eligible spending are grouped for display only.';

  @override
  String get reportsShowAllCategories => 'Show all categories';

  @override
  String get reportsExportCsv => 'Export CSV';

  @override
  String get reportsExportPdf => 'Export PDF';

  @override
  String get reportsAccountantExport => 'Accountant export';

  @override
  String get reportsSavedViews => 'Saved views';

  @override
  String get reportsChartAlt => 'Chart description';

  @override
  String get goalsTitle => 'Goals';

  @override
  String get goalsCreate => 'New goal';

  @override
  String get goalsTarget => 'Target';

  @override
  String get goalsTargetDate => 'Target date';

  @override
  String get goalsCurrent => 'Saved so far';

  @override
  String get goalsRequiredContribution => 'Required contribution';

  @override
  String get goalsAhead => 'Ahead';

  @override
  String get goalsOnTrack => 'On track';

  @override
  String get goalsBehind => 'Behind';

  @override
  String get goalsScenario => 'Scenario';

  @override
  String get goalsScenarioPrompt => 'What would this cost do to the goal?';

  @override
  String get goalsScenarioNote =>
      'Scenarios never change your live financial data.';

  @override
  String get goalsLinkedNote => 'Linked balances are not physically set aside.';

  @override
  String get lensesTitle => 'Lenses';

  @override
  String get lensesSubtitle =>
      'Deterministic comparisons on your own evidence.';

  @override
  String get powerLensTitle => 'Power Lens';

  @override
  String get powerLensSubtitle => 'What your usage would cost on other plans.';

  @override
  String get powerLensProperty => 'Property';

  @override
  String get powerLensUsageWindow => 'Usage window';

  @override
  String get powerLensCoverage => 'Data coverage';

  @override
  String get powerLensCurrentPlan => 'Current plan';

  @override
  String get powerLensEstimatedAnnual => 'Estimated annual cost';

  @override
  String get powerLensEstimatedMonthly => 'Estimated monthly';

  @override
  String get powerLensPotentialSaving => 'Potential difference';

  @override
  String get powerLensAssumptions => 'Assumptions';

  @override
  String get powerLensTariffType => 'Tariff type';

  @override
  String get powerLensSupplyCharge => 'Daily supply charge';

  @override
  String get powerLensSolarFeedIn => 'Solar feed-in';

  @override
  String get powerLensEligibility => 'Eligibility';

  @override
  String get powerLensMarketCoverage => 'Market coverage';

  @override
  String get powerLensRecalculate => 'Recalculate';

  @override
  String get powerLensBoundary =>
      'Comparison only. Mia does not switch retailers or submit applications.';

  @override
  String get powerLensMissingData =>
      'Missing usage is disclosed, never guessed.';

  @override
  String get loanLensTitle => 'Loan Lens';

  @override
  String get loanLensSubtitle => 'Factual comparison on filters you choose.';

  @override
  String get loanLensObjective => 'Ranking objective';

  @override
  String get loanLensObjectiveTotalCost => 'Lowest estimated total cost';

  @override
  String get loanLensObjectiveAdvertised => 'Lowest advertised rate';

  @override
  String get loanLensObjectiveComparison => 'Lowest published comparison rate';

  @override
  String get loanLensObjectiveFees => 'Lowest known fees';

  @override
  String get loanLensObjectiveFeatures => 'Keeps my selected features';

  @override
  String get loanLensUniverse => 'Lender universe';

  @override
  String get loanLensUniverseAll => 'All lenders';

  @override
  String get loanLensUniverseMajor => 'Major banks';

  @override
  String get loanLensUniverseOtherAdi => 'Other APRA banks';

  @override
  String get loanLensUniverseCustomerOwned => 'Customer owned';

  @override
  String get loanLensUniverseNonBank => 'Non-bank lenders';

  @override
  String get loanLensFilters => 'Active filters';

  @override
  String get loanLensMarketView => 'Market view';

  @override
  String get loanLensBroaderMarket =>
      'Lower rates may exist outside your selected lender groups.';

  @override
  String get loanLensAdvertisedRate => 'Advertised rate';

  @override
  String get loanLensComparisonRate => 'Comparison rate';

  @override
  String get loanLensRepaymentEstimate => 'Repayment estimate';

  @override
  String get loanLensKnownFees => 'Known fees';

  @override
  String get loanLensEstimatedTotalCost => 'Estimated total cost';

  @override
  String get loanLensEligibilityNotAssessed => 'Eligibility not assessed';

  @override
  String get loanLensWhyMatched => 'Why it matched';

  @override
  String get loanLensRefinance => 'Refinance comparison';

  @override
  String get loanLensBreakEven => 'Break-even';

  @override
  String get loanLensBoundary =>
      'Factual comparison only. Mia does not recommend a lender, assess serviceability or pass on your details.';

  @override
  String get loanLensNeutrality =>
      'Ranking is mathematical. No paid placement.';

  @override
  String get askMiaTitle => 'Ask Mia';

  @override
  String get askMiaPlaceholder => 'Ask about your money';

  @override
  String get askMiaSuggested => 'Try asking';

  @override
  String get askMiaConversations => 'Conversations';

  @override
  String get askMiaNewConversation => 'New conversation';

  @override
  String get askMiaCoveredDates => 'Covered dates';

  @override
  String get askMiaIncludedAccounts => 'Included accounts';

  @override
  String get askMiaFreshness => 'Data freshness';

  @override
  String get askMiaLabelFact => 'Fact';

  @override
  String get askMiaLabelCalculation => 'Calculation';

  @override
  String get askMiaLabelEstimate => 'Estimate';

  @override
  String get askMiaMissingInfo => 'Missing information';

  @override
  String get askMiaUseful => 'Useful';

  @override
  String get askMiaNotUseful => 'Not useful';

  @override
  String get askMiaClarify => 'Mia needs one detail';

  @override
  String get askMiaAdviceBoundary =>
      'Mia can\'t give personal investment, tax, credit or legal advice — here\'s the factual view instead.';

  @override
  String get askMiaOffline =>
      'Mia can\'t reach the model right now. Your draft is safe.';

  @override
  String get askMiaMemory => 'Remembered preferences';

  @override
  String get searchTitle => 'Search';

  @override
  String get searchHint => 'Anything you\'re allowed to see';

  @override
  String get searchRecent => 'Recent';

  @override
  String get searchNoResults => 'Nothing matched';

  @override
  String get searchPermissionNote =>
      'Results respect household and record permissions.';

  @override
  String get householdTitle => 'Household';

  @override
  String get householdMembers => 'Members';

  @override
  String get householdInvite => 'Invite member';

  @override
  String get householdRoleOwner => 'Owner';

  @override
  String get householdRoleAdult => 'Adult member';

  @override
  String get householdRoleLimited => 'Limited access';

  @override
  String get householdLeave => 'Leave household';

  @override
  String get householdTransferOwnership => 'Transfer ownership';

  @override
  String get householdDelete => 'Delete household';

  @override
  String get householdVisibilityPrivate => 'Private';

  @override
  String get householdVisibilityShared => 'Shared with household';

  @override
  String get householdVisibilitySelected => 'Selected members';

  @override
  String get householdFilterMine => 'Mine';

  @override
  String get householdFilterYours => 'Theirs';

  @override
  String get householdFilterOurs => 'Ours';

  @override
  String get householdMyReviews => 'My reviews';

  @override
  String get householdReviews => 'Household reviews';

  @override
  String get householdConsentNote =>
      'A CDR connection belongs to the member who consented.';

  @override
  String get householdPrivacyNote =>
      'Membership never exposes another member\'s records.';

  @override
  String get connectionsTitle => 'Connections';

  @override
  String get connectionsBanking => 'Banking';

  @override
  String get connectionsEnergy => 'Energy';

  @override
  String get connectionsEmail => 'Bill email';

  @override
  String get connectionsImports => 'Imports';

  @override
  String get connectionsAddBank => 'Connect a bank';

  @override
  String get connectionsAddEnergy => 'Connect energy';

  @override
  String get connectionsConsentStatus => 'Consent status';

  @override
  String get connectionsConsentScope => 'Scope';

  @override
  String get connectionsConsentExpiry => 'Expires';

  @override
  String get connectionsConsentPurpose => 'Purpose';

  @override
  String get connectionsConsentHistory => 'Consent history';

  @override
  String get connectionsLastRefreshed => 'Last refreshed';

  @override
  String get connectionsDataCurrentTo => 'Data current to';

  @override
  String get connectionsHistoryProcessing => 'History still processing';

  @override
  String get connectionsNoManualRefresh =>
      'Mia syncs twice daily. Manual refresh isn\'t available.';

  @override
  String get connectionsRevoke => 'Revoke consent';

  @override
  String get connectionsForwardingAddress => 'Private forwarding address';

  @override
  String get connectionsRotateAddress => 'Rotate address';

  @override
  String get connectionsGmail => 'Connect Gmail';

  @override
  String get connectionsOutlook => 'Connect Outlook';

  @override
  String get connectionsEmailScopeNote =>
      'Read-only access to the labels you choose. Mia never scans your whole mailbox.';

  @override
  String get importsCsv => 'CSV import';

  @override
  String get importsPdf => 'PDF statement';

  @override
  String get importsManual => 'Manual record';

  @override
  String get importsColumnMapping => 'Column mapping';

  @override
  String get importsPreview => 'Preview before import';

  @override
  String get importsRollback => 'Roll back import';

  @override
  String get importsDuplicateDetected => 'Duplicates detected';

  @override
  String get importsBatchStatus => 'Batch status';

  @override
  String get notificationsTitle => 'Notifications';

  @override
  String get notificationsCentre => 'Notification centre';

  @override
  String get notificationsQuietHours => 'Quiet hours';

  @override
  String get notificationsChannels => 'Channels';

  @override
  String get notificationsEvents => 'Events';

  @override
  String get notificationsImmediate => 'Immediate';

  @override
  String get notificationsDailyDigest => 'Daily digest';

  @override
  String get notificationsWeeklyDigest => 'Weekly digest';

  @override
  String get notificationsPreviewNote =>
      'Detailed previews can show merchant names on your lock screen.';

  @override
  String get notificationsNoEngagementNote =>
      'Mia never sends notifications just to pull you back in.';

  @override
  String get settingsTitle => 'Settings';

  @override
  String get settingsProfile => 'Profile';

  @override
  String get settingsSecurity => 'Security';

  @override
  String get settingsSessions => 'Devices & sessions';

  @override
  String get settingsPreferences => 'Preferences';

  @override
  String get settingsPrivacy => 'Privacy & consent';

  @override
  String get settingsSubscription => 'Subscription';

  @override
  String get settingsExport => 'Export my data';

  @override
  String get settingsDelete => 'Delete account';

  @override
  String get settingsHelp => 'Help centre';

  @override
  String get settingsSupport => 'Contact support';

  @override
  String get settingsAbout => 'About Mia';

  @override
  String get settingsAppearance => 'Appearance';

  @override
  String get settingsAccessibility => 'Accessibility';

  @override
  String get settingsCurrency => 'Currency';

  @override
  String get settingsTimezone => 'Timezone';

  @override
  String get settingsDateFormat => 'Date format';

  @override
  String get settingsFinancialYear => 'Financial year';

  @override
  String get settingsPayCycle => 'Pay cycle';

  @override
  String get settingsReviewCadence => 'Review cadence';

  @override
  String get settingsReducedMotion => 'Reduced motion';

  @override
  String get settingsLargerText => 'Larger text';

  @override
  String get settingsNonColourStatus => 'Always show status words';

  @override
  String get settingsBiometric => 'Biometric unlock';

  @override
  String get settingsMfa => 'Multi-factor authentication';

  @override
  String get settingsRevokeSession => 'Revoke';

  @override
  String get settingsSignOutAll => 'Sign out everywhere';

  @override
  String get settingsReauthNote => 'Sensitive changes ask you to verify again.';

  @override
  String get settingsDataResidency => 'Data residency';

  @override
  String get settingsCalculationVersion => 'Calculation version';

  @override
  String get settingsAiVersion => 'AI version';

  @override
  String get exportTitle => 'Export your data';

  @override
  String get exportSubtitle =>
      'Choose what to include. Coverage is stated in the file.';

  @override
  String get exportTransactions => 'Transactions';

  @override
  String get exportDocuments => 'Documents';

  @override
  String get exportCalculations => 'Calculations';

  @override
  String get deleteAccountTitle => 'Delete account';

  @override
  String get deleteAccountWarning =>
      'This removes your records, documents, derived calculations and provider tokens.';

  @override
  String get deleteAccountLedger =>
      'A deletion ledger proves completion without keeping your financial content.';

  @override
  String get deleteAccountCdrNote =>
      'CDR deletion follows the required timeframe and shows its status.';

  @override
  String get deleteAccountConfirm => 'Delete everything';

  @override
  String get helpTitle => 'Help centre';

  @override
  String get helpSearchHint => 'Search help';

  @override
  String get helpContactSupport => 'Contact support';

  @override
  String get helpCaseReference => 'Case reference';

  @override
  String get helpCaseStatus => 'Status';

  @override
  String get helpDiagnostics => 'Attach diagnostics';

  @override
  String get helpDiagnosticsNote => 'You choose exactly what Mia sends.';

  @override
  String get evidenceTitle => 'Evidence';

  @override
  String get evidenceSource => 'Source';

  @override
  String get evidenceAsOf => 'As of';

  @override
  String get evidenceDateRange => 'Date range';

  @override
  String get evidenceExclusions => 'Exclusions';

  @override
  String get evidenceMissingData => 'Missing data';

  @override
  String get evidenceCompleteness => 'Completeness';

  @override
  String get evidenceCalculationVersion => 'Calculation version';

  @override
  String get evidenceRecordsUsed => 'Records used';

  @override
  String get evidenceProvenanceNote =>
      'Provider evidence is never overwritten. Corrections sit on top.';

  @override
  String get stateLoading => 'Working on it';

  @override
  String get stateEmpty => 'Nothing here yet';

  @override
  String get stateCaughtUp => 'You\'re caught up';

  @override
  String get stateOffline => 'You\'re offline';

  @override
  String get stateStale => 'Data is stale';

  @override
  String get statePartial => 'Partial data';

  @override
  String get stateQueued => 'Queued';

  @override
  String get stateFailed => 'Something broke';

  @override
  String get statePermissionDenied => 'Private to its owner';

  @override
  String get stateReconnect => 'Reconnect needed';

  @override
  String get stateDuplicate => 'Possible duplicate';

  @override
  String get stateTimeout => 'That took too long';

  @override
  String get stateCancelled => 'Cancelled';
}
