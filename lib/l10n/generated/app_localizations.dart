import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'generated/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[Locale('en')];

  /// No description provided for @appName.
  ///
  /// In en, this message translates to:
  /// **'Mia Money'**
  String get appName;

  /// No description provided for @appTagline.
  ///
  /// In en, this message translates to:
  /// **'Your financial admin, handled.'**
  String get appTagline;

  /// No description provided for @actionContinue.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get actionContinue;

  /// No description provided for @actionNext.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get actionNext;

  /// No description provided for @actionBack.
  ///
  /// In en, this message translates to:
  /// **'Back'**
  String get actionBack;

  /// No description provided for @actionSkip.
  ///
  /// In en, this message translates to:
  /// **'Skip'**
  String get actionSkip;

  /// No description provided for @actionDone.
  ///
  /// In en, this message translates to:
  /// **'Done'**
  String get actionDone;

  /// No description provided for @actionSave.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get actionSave;

  /// No description provided for @actionCancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get actionCancel;

  /// No description provided for @actionClose.
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get actionClose;

  /// No description provided for @actionConfirm.
  ///
  /// In en, this message translates to:
  /// **'Confirm'**
  String get actionConfirm;

  /// No description provided for @actionApprove.
  ///
  /// In en, this message translates to:
  /// **'Approve'**
  String get actionApprove;

  /// No description provided for @actionApproveAll.
  ///
  /// In en, this message translates to:
  /// **'Approve all'**
  String get actionApproveAll;

  /// No description provided for @actionDismiss.
  ///
  /// In en, this message translates to:
  /// **'Dismiss'**
  String get actionDismiss;

  /// No description provided for @actionDelete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get actionDelete;

  /// No description provided for @actionEdit.
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get actionEdit;

  /// No description provided for @actionUndo.
  ///
  /// In en, this message translates to:
  /// **'Undo'**
  String get actionUndo;

  /// No description provided for @actionRetry.
  ///
  /// In en, this message translates to:
  /// **'Try again'**
  String get actionRetry;

  /// No description provided for @actionSeeAll.
  ///
  /// In en, this message translates to:
  /// **'See all'**
  String get actionSeeAll;

  /// No description provided for @actionViewEvidence.
  ///
  /// In en, this message translates to:
  /// **'View evidence'**
  String get actionViewEvidence;

  /// No description provided for @actionViewCalculation.
  ///
  /// In en, this message translates to:
  /// **'View calculation'**
  String get actionViewCalculation;

  /// No description provided for @actionAskMia.
  ///
  /// In en, this message translates to:
  /// **'Ask Mia'**
  String get actionAskMia;

  /// No description provided for @actionShare.
  ///
  /// In en, this message translates to:
  /// **'Share'**
  String get actionShare;

  /// No description provided for @actionExport.
  ///
  /// In en, this message translates to:
  /// **'Export'**
  String get actionExport;

  /// No description provided for @actionFilter.
  ///
  /// In en, this message translates to:
  /// **'Filter'**
  String get actionFilter;

  /// No description provided for @actionSearch.
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get actionSearch;

  /// No description provided for @actionApply.
  ///
  /// In en, this message translates to:
  /// **'Apply'**
  String get actionApply;

  /// No description provided for @actionReset.
  ///
  /// In en, this message translates to:
  /// **'Reset'**
  String get actionReset;

  /// No description provided for @actionAdd.
  ///
  /// In en, this message translates to:
  /// **'Add'**
  String get actionAdd;

  /// No description provided for @actionRemove.
  ///
  /// In en, this message translates to:
  /// **'Remove'**
  String get actionRemove;

  /// No description provided for @actionConnect.
  ///
  /// In en, this message translates to:
  /// **'Connect'**
  String get actionConnect;

  /// No description provided for @actionReconnect.
  ///
  /// In en, this message translates to:
  /// **'Reconnect'**
  String get actionReconnect;

  /// No description provided for @actionDisconnect.
  ///
  /// In en, this message translates to:
  /// **'Disconnect'**
  String get actionDisconnect;

  /// No description provided for @actionSnooze.
  ///
  /// In en, this message translates to:
  /// **'Snooze'**
  String get actionSnooze;

  /// No description provided for @actionMarkHandled.
  ///
  /// In en, this message translates to:
  /// **'Mark handled'**
  String get actionMarkHandled;

  /// No description provided for @actionAssign.
  ///
  /// In en, this message translates to:
  /// **'Assign'**
  String get actionAssign;

  /// No description provided for @actionComment.
  ///
  /// In en, this message translates to:
  /// **'Comment'**
  String get actionComment;

  /// No description provided for @actionSplit.
  ///
  /// In en, this message translates to:
  /// **'Split'**
  String get actionSplit;

  /// No description provided for @actionUnsplit.
  ///
  /// In en, this message translates to:
  /// **'Unsplit'**
  String get actionUnsplit;

  /// No description provided for @actionCorrect.
  ///
  /// In en, this message translates to:
  /// **'Correct'**
  String get actionCorrect;

  /// No description provided for @actionDefer.
  ///
  /// In en, this message translates to:
  /// **'Defer'**
  String get actionDefer;

  /// No description provided for @actionResolve.
  ///
  /// In en, this message translates to:
  /// **'Resolve'**
  String get actionResolve;

  /// No description provided for @actionUpload.
  ///
  /// In en, this message translates to:
  /// **'Upload'**
  String get actionUpload;

  /// No description provided for @actionScan.
  ///
  /// In en, this message translates to:
  /// **'Scan'**
  String get actionScan;

  /// No description provided for @actionLearnMore.
  ///
  /// In en, this message translates to:
  /// **'Learn more'**
  String get actionLearnMore;

  /// No description provided for @actionNotNow.
  ///
  /// In en, this message translates to:
  /// **'Not now'**
  String get actionNotNow;

  /// No description provided for @actionGetStarted.
  ///
  /// In en, this message translates to:
  /// **'Get started'**
  String get actionGetStarted;

  /// No description provided for @actionSignIn.
  ///
  /// In en, this message translates to:
  /// **'Sign in'**
  String get actionSignIn;

  /// No description provided for @actionSignUp.
  ///
  /// In en, this message translates to:
  /// **'Create account'**
  String get actionSignUp;

  /// No description provided for @actionSignOut.
  ///
  /// In en, this message translates to:
  /// **'Sign out'**
  String get actionSignOut;

  /// No description provided for @onboardingWelcomeTitle.
  ///
  /// In en, this message translates to:
  /// **'Money admin, minus the admin'**
  String get onboardingWelcomeTitle;

  /// No description provided for @onboardingWelcomeBody.
  ///
  /// In en, this message translates to:
  /// **'Mia collects the evidence, works out what changed, and only asks you when a human call is needed.'**
  String get onboardingWelcomeBody;

  /// No description provided for @onboardingStepLabel.
  ///
  /// In en, this message translates to:
  /// **'Step {current} of {total}'**
  String onboardingStepLabel(int current, int total);

  /// No description provided for @onboardingNameQuestion.
  ///
  /// In en, this message translates to:
  /// **'First, what should Mia call you?'**
  String get onboardingNameQuestion;

  /// No description provided for @onboardingNameHint.
  ///
  /// In en, this message translates to:
  /// **'Your first name'**
  String get onboardingNameHint;

  /// No description provided for @onboardingHouseholdQuestion.
  ///
  /// In en, this message translates to:
  /// **'Who are you managing money for?'**
  String get onboardingHouseholdQuestion;

  /// No description provided for @onboardingHouseholdSolo.
  ///
  /// In en, this message translates to:
  /// **'Just me'**
  String get onboardingHouseholdSolo;

  /// No description provided for @onboardingHouseholdCouple.
  ///
  /// In en, this message translates to:
  /// **'Me and a partner'**
  String get onboardingHouseholdCouple;

  /// No description provided for @onboardingHouseholdFamily.
  ///
  /// In en, this message translates to:
  /// **'A whole household'**
  String get onboardingHouseholdFamily;

  /// No description provided for @onboardingHouseholdShared.
  ///
  /// In en, this message translates to:
  /// **'A share house'**
  String get onboardingHouseholdShared;

  /// No description provided for @onboardingPainQuestion.
  ///
  /// In en, this message translates to:
  /// **'What eats your time today?'**
  String get onboardingPainQuestion;

  /// No description provided for @onboardingPainBills.
  ///
  /// In en, this message translates to:
  /// **'Chasing bills and due dates'**
  String get onboardingPainBills;

  /// No description provided for @onboardingPainCategories.
  ///
  /// In en, this message translates to:
  /// **'Fixing wrong categories'**
  String get onboardingPainCategories;

  /// No description provided for @onboardingPainReceipts.
  ///
  /// In en, this message translates to:
  /// **'Losing receipts and warranties'**
  String get onboardingPainReceipts;

  /// No description provided for @onboardingPainSurprises.
  ///
  /// In en, this message translates to:
  /// **'Being surprised by annual costs'**
  String get onboardingPainSurprises;

  /// No description provided for @onboardingPainEnergy.
  ///
  /// In en, this message translates to:
  /// **'Wondering if I\'m overpaying for power'**
  String get onboardingPainEnergy;

  /// No description provided for @onboardingPainLoans.
  ///
  /// In en, this message translates to:
  /// **'Never comparing my loan again'**
  String get onboardingPainLoans;

  /// No description provided for @onboardingPayQuestion.
  ///
  /// In en, this message translates to:
  /// **'When does money land?'**
  String get onboardingPayQuestion;

  /// No description provided for @onboardingPayWeekly.
  ///
  /// In en, this message translates to:
  /// **'Weekly'**
  String get onboardingPayWeekly;

  /// No description provided for @onboardingPayFortnightly.
  ///
  /// In en, this message translates to:
  /// **'Fortnightly'**
  String get onboardingPayFortnightly;

  /// No description provided for @onboardingPayMonthly.
  ///
  /// In en, this message translates to:
  /// **'Monthly'**
  String get onboardingPayMonthly;

  /// No description provided for @onboardingPayIrregular.
  ///
  /// In en, this message translates to:
  /// **'It varies'**
  String get onboardingPayIrregular;

  /// No description provided for @onboardingBudgetQuestion.
  ///
  /// In en, this message translates to:
  /// **'How much structure do you want?'**
  String get onboardingBudgetQuestion;

  /// No description provided for @onboardingBudgetTracking.
  ///
  /// In en, this message translates to:
  /// **'Just track it'**
  String get onboardingBudgetTracking;

  /// No description provided for @onboardingBudgetFlex.
  ///
  /// In en, this message translates to:
  /// **'One flexible number'**
  String get onboardingBudgetFlex;

  /// No description provided for @onboardingBudgetCategory.
  ///
  /// In en, this message translates to:
  /// **'Category limits'**
  String get onboardingBudgetCategory;

  /// No description provided for @onboardingBudgetDetailed.
  ///
  /// In en, this message translates to:
  /// **'Plan it properly'**
  String get onboardingBudgetDetailed;

  /// No description provided for @onboardingReviewQuestion.
  ///
  /// In en, this message translates to:
  /// **'How often should Mia bring you a review?'**
  String get onboardingReviewQuestion;

  /// No description provided for @onboardingReviewWeekly.
  ///
  /// In en, this message translates to:
  /// **'Weekly reset'**
  String get onboardingReviewWeekly;

  /// No description provided for @onboardingReviewFortnightly.
  ///
  /// In en, this message translates to:
  /// **'Every fortnight'**
  String get onboardingReviewFortnightly;

  /// No description provided for @onboardingReviewMonthly.
  ///
  /// In en, this message translates to:
  /// **'Monthly'**
  String get onboardingReviewMonthly;

  /// No description provided for @onboardingLoopTitle.
  ///
  /// In en, this message translates to:
  /// **'How Mia works'**
  String get onboardingLoopTitle;

  /// No description provided for @onboardingLoopCollect.
  ///
  /// In en, this message translates to:
  /// **'Collect'**
  String get onboardingLoopCollect;

  /// No description provided for @onboardingLoopUnderstand.
  ///
  /// In en, this message translates to:
  /// **'Understand'**
  String get onboardingLoopUnderstand;

  /// No description provided for @onboardingLoopAsk.
  ///
  /// In en, this message translates to:
  /// **'Ask'**
  String get onboardingLoopAsk;

  /// No description provided for @onboardingLoopCorrect.
  ///
  /// In en, this message translates to:
  /// **'Correct'**
  String get onboardingLoopCorrect;

  /// No description provided for @onboardingLoopRemember.
  ///
  /// In en, this message translates to:
  /// **'Remember'**
  String get onboardingLoopRemember;

  /// No description provided for @onboardingLoopAct.
  ///
  /// In en, this message translates to:
  /// **'Act'**
  String get onboardingLoopAct;

  /// No description provided for @onboardingLoopRecheck.
  ///
  /// In en, this message translates to:
  /// **'Recheck'**
  String get onboardingLoopRecheck;

  /// No description provided for @onboardingEvidenceTitle.
  ///
  /// In en, this message translates to:
  /// **'Mia never invents a number'**
  String get onboardingEvidenceTitle;

  /// No description provided for @onboardingEvidenceBody.
  ///
  /// In en, this message translates to:
  /// **'Every figure carries its source, its date range and what was left out.'**
  String get onboardingEvidenceBody;

  /// No description provided for @onboardingPrivacyTitle.
  ///
  /// In en, this message translates to:
  /// **'Private by default'**
  String get onboardingPrivacyTitle;

  /// No description provided for @onboardingPrivacyBody.
  ///
  /// In en, this message translates to:
  /// **'Household membership never opens someone else\'s bank data, documents or conversations.'**
  String get onboardingPrivacyBody;

  /// No description provided for @onboardingResidencyTitle.
  ///
  /// In en, this message translates to:
  /// **'Stored onshore in Australia'**
  String get onboardingResidencyTitle;

  /// No description provided for @onboardingResidencyBody.
  ///
  /// In en, this message translates to:
  /// **'Your financial records, documents and backups stay in Australian infrastructure.'**
  String get onboardingResidencyBody;

  /// No description provided for @onboardingRecapTitle.
  ///
  /// In en, this message translates to:
  /// **'Here\'s what Mia will do for you'**
  String get onboardingRecapTitle;

  /// No description provided for @onboardingRecapSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Built from your answers'**
  String get onboardingRecapSubtitle;

  /// No description provided for @onboardingReadyTitle.
  ///
  /// In en, this message translates to:
  /// **'Ready when you are'**
  String get onboardingReadyTitle;

  /// No description provided for @onboardingReadyBody.
  ///
  /// In en, this message translates to:
  /// **'Nothing is collected until you subscribe and give consent.'**
  String get onboardingReadyBody;

  /// No description provided for @paywallTitle.
  ///
  /// In en, this message translates to:
  /// **'Choose your plan'**
  String get paywallTitle;

  /// No description provided for @paywallSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Cancel anytime from the store. Bank data is only collected after you consent.'**
  String get paywallSubtitle;

  /// No description provided for @paywallIndividual.
  ///
  /// In en, this message translates to:
  /// **'Individual'**
  String get paywallIndividual;

  /// No description provided for @paywallHousehold.
  ///
  /// In en, this message translates to:
  /// **'Household'**
  String get paywallHousehold;

  /// No description provided for @paywallMonthly.
  ///
  /// In en, this message translates to:
  /// **'Monthly'**
  String get paywallMonthly;

  /// No description provided for @paywallAnnual.
  ///
  /// In en, this message translates to:
  /// **'Annual'**
  String get paywallAnnual;

  /// No description provided for @paywallPerMonth.
  ///
  /// In en, this message translates to:
  /// **'per month'**
  String get paywallPerMonth;

  /// No description provided for @paywallPerYear.
  ///
  /// In en, this message translates to:
  /// **'per year'**
  String get paywallPerYear;

  /// No description provided for @paywallBestValue.
  ///
  /// In en, this message translates to:
  /// **'Best value'**
  String get paywallBestValue;

  /// No description provided for @paywallSaveLabel.
  ///
  /// In en, this message translates to:
  /// **'Save {percent}%'**
  String paywallSaveLabel(int percent);

  /// No description provided for @paywallMembersLabel.
  ///
  /// In en, this message translates to:
  /// **'Up to {count} members'**
  String paywallMembersLabel(int count);

  /// No description provided for @paywallRestore.
  ///
  /// In en, this message translates to:
  /// **'Restore purchase'**
  String get paywallRestore;

  /// No description provided for @paywallStartPlan.
  ///
  /// In en, this message translates to:
  /// **'Start with {plan}'**
  String paywallStartPlan(String plan);

  /// No description provided for @paywallTermsNote.
  ///
  /// In en, this message translates to:
  /// **'Billed through your app store. Prices in AUD.'**
  String get paywallTermsNote;

  /// No description provided for @authSignInTitle.
  ///
  /// In en, this message translates to:
  /// **'Welcome back'**
  String get authSignInTitle;

  /// No description provided for @authSignInSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Your evidence is where you left it.'**
  String get authSignInSubtitle;

  /// No description provided for @authSignUpTitle.
  ///
  /// In en, this message translates to:
  /// **'Create your account'**
  String get authSignUpTitle;

  /// No description provided for @authSignUpSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Email first. Connections come later, with consent.'**
  String get authSignUpSubtitle;

  /// No description provided for @authEmailLabel.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get authEmailLabel;

  /// No description provided for @authEmailHint.
  ///
  /// In en, this message translates to:
  /// **'you@example.com'**
  String get authEmailHint;

  /// No description provided for @authPasswordLabel.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get authPasswordLabel;

  /// No description provided for @authPasswordHint.
  ///
  /// In en, this message translates to:
  /// **'At least 10 characters'**
  String get authPasswordHint;

  /// No description provided for @authConfirmPasswordLabel.
  ///
  /// In en, this message translates to:
  /// **'Confirm password'**
  String get authConfirmPasswordLabel;

  /// No description provided for @authForgotPassword.
  ///
  /// In en, this message translates to:
  /// **'Forgot password?'**
  String get authForgotPassword;

  /// No description provided for @authContinueWithApple.
  ///
  /// In en, this message translates to:
  /// **'Continue with Apple'**
  String get authContinueWithApple;

  /// No description provided for @authContinueWithGoogle.
  ///
  /// In en, this message translates to:
  /// **'Continue with Google'**
  String get authContinueWithGoogle;

  /// No description provided for @authNoAccount.
  ///
  /// In en, this message translates to:
  /// **'No account yet?'**
  String get authNoAccount;

  /// No description provided for @authHaveAccount.
  ///
  /// In en, this message translates to:
  /// **'Already have an account?'**
  String get authHaveAccount;

  /// No description provided for @authVerifyTitle.
  ///
  /// In en, this message translates to:
  /// **'Check your inbox'**
  String get authVerifyTitle;

  /// No description provided for @authVerifySubtitle.
  ///
  /// In en, this message translates to:
  /// **'We sent a six digit code to {email}.'**
  String authVerifySubtitle(String email);

  /// No description provided for @authResendCode.
  ///
  /// In en, this message translates to:
  /// **'Resend code'**
  String get authResendCode;

  /// No description provided for @authResetTitle.
  ///
  /// In en, this message translates to:
  /// **'Reset your password'**
  String get authResetTitle;

  /// No description provided for @authResetSubtitle.
  ///
  /// In en, this message translates to:
  /// **'We\'ll email you a secure reset link.'**
  String get authResetSubtitle;

  /// No description provided for @authSendResetLink.
  ///
  /// In en, this message translates to:
  /// **'Send reset link'**
  String get authSendResetLink;

  /// No description provided for @authBiometricTitle.
  ///
  /// In en, this message translates to:
  /// **'Unlock with Face ID'**
  String get authBiometricTitle;

  /// No description provided for @authBiometricSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Fastest way back in. You can turn this off any time.'**
  String get authBiometricSubtitle;

  /// No description provided for @authBiometricEnable.
  ///
  /// In en, this message translates to:
  /// **'Enable Face ID'**
  String get authBiometricEnable;

  /// No description provided for @authMfaTitle.
  ///
  /// In en, this message translates to:
  /// **'Add a second factor'**
  String get authMfaTitle;

  /// No description provided for @authMfaSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Recommended for accounts holding banking evidence.'**
  String get authMfaSubtitle;

  /// No description provided for @authInvalidEmail.
  ///
  /// In en, this message translates to:
  /// **'That email doesn\'t look right'**
  String get authInvalidEmail;

  /// No description provided for @authPasswordTooShort.
  ///
  /// In en, this message translates to:
  /// **'Use at least 10 characters'**
  String get authPasswordTooShort;

  /// No description provided for @authPasswordMismatch.
  ///
  /// In en, this message translates to:
  /// **'Passwords don\'t match'**
  String get authPasswordMismatch;

  /// No description provided for @navHome.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get navHome;

  /// No description provided for @navInbox.
  ///
  /// In en, this message translates to:
  /// **'Inbox'**
  String get navInbox;

  /// No description provided for @navMoney.
  ///
  /// In en, this message translates to:
  /// **'Money'**
  String get navMoney;

  /// No description provided for @navLenses.
  ///
  /// In en, this message translates to:
  /// **'Lenses'**
  String get navLenses;

  /// No description provided for @navMore.
  ///
  /// In en, this message translates to:
  /// **'More'**
  String get navMore;

  /// No description provided for @homeGreetingMorning.
  ///
  /// In en, this message translates to:
  /// **'Good morning'**
  String get homeGreetingMorning;

  /// No description provided for @homeGreetingAfternoon.
  ///
  /// In en, this message translates to:
  /// **'Good afternoon'**
  String get homeGreetingAfternoon;

  /// No description provided for @homeGreetingEvening.
  ///
  /// In en, this message translates to:
  /// **'Good evening'**
  String get homeGreetingEvening;

  /// No description provided for @homeStatusOkay.
  ///
  /// In en, this message translates to:
  /// **'Broadly okay'**
  String get homeStatusOkay;

  /// No description provided for @homeStatusAttention.
  ///
  /// In en, this message translates to:
  /// **'Needs attention'**
  String get homeStatusAttention;

  /// No description provided for @homeStatusIncomplete.
  ///
  /// In en, this message translates to:
  /// **'Incomplete data'**
  String get homeStatusIncomplete;

  /// No description provided for @homeAvailableAfterObligations.
  ///
  /// In en, this message translates to:
  /// **'Available after obligations'**
  String get homeAvailableAfterObligations;

  /// No description provided for @homeTrueCostOfLife.
  ///
  /// In en, this message translates to:
  /// **'True cost of life'**
  String get homeTrueCostOfLife;

  /// No description provided for @homeWhatChanged.
  ///
  /// In en, this message translates to:
  /// **'What changed'**
  String get homeWhatChanged;

  /// No description provided for @homeNeedsReview.
  ///
  /// In en, this message translates to:
  /// **'Needs review'**
  String get homeNeedsReview;

  /// No description provided for @homeComingUp.
  ///
  /// In en, this message translates to:
  /// **'Coming up'**
  String get homeComingUp;

  /// No description provided for @homeMiaHandled.
  ///
  /// In en, this message translates to:
  /// **'Mia handled this'**
  String get homeMiaHandled;

  /// No description provided for @homeWeeklyReset.
  ///
  /// In en, this message translates to:
  /// **'Weekly financial reset'**
  String get homeWeeklyReset;

  /// No description provided for @homePriorityTitle.
  ///
  /// In en, this message translates to:
  /// **'Worth your attention'**
  String get homePriorityTitle;

  /// No description provided for @homeCaughtUpTitle.
  ///
  /// In en, this message translates to:
  /// **'You\'re caught up'**
  String get homeCaughtUpTitle;

  /// No description provided for @homeCaughtUpBody.
  ///
  /// In en, this message translates to:
  /// **'Everything else is handled. Mia keeps watching.'**
  String get homeCaughtUpBody;

  /// No description provided for @homeUpcomingBills.
  ///
  /// In en, this message translates to:
  /// **'Upcoming bills'**
  String get homeUpcomingBills;

  /// No description provided for @homeExpectedIncome.
  ///
  /// In en, this message translates to:
  /// **'Expected income'**
  String get homeExpectedIncome;

  /// No description provided for @homeDataGaps.
  ///
  /// In en, this message translates to:
  /// **'Data gaps'**
  String get homeDataGaps;

  /// No description provided for @homeQuickActions.
  ///
  /// In en, this message translates to:
  /// **'Quick actions'**
  String get homeQuickActions;

  /// No description provided for @inboxTitle.
  ///
  /// In en, this message translates to:
  /// **'Financial admin'**
  String get inboxTitle;

  /// No description provided for @inboxNew.
  ///
  /// In en, this message translates to:
  /// **'New'**
  String get inboxNew;

  /// No description provided for @inboxNeedsReview.
  ///
  /// In en, this message translates to:
  /// **'Needs review'**
  String get inboxNeedsReview;

  /// No description provided for @inboxAssigned.
  ///
  /// In en, this message translates to:
  /// **'Assigned'**
  String get inboxAssigned;

  /// No description provided for @inboxConfirmed.
  ///
  /// In en, this message translates to:
  /// **'Confirmed'**
  String get inboxConfirmed;

  /// No description provided for @inboxComingUp.
  ///
  /// In en, this message translates to:
  /// **'Coming up'**
  String get inboxComingUp;

  /// No description provided for @inboxHandled.
  ///
  /// In en, this message translates to:
  /// **'Handled'**
  String get inboxHandled;

  /// No description provided for @inboxException.
  ///
  /// In en, this message translates to:
  /// **'Exceptions'**
  String get inboxException;

  /// No description provided for @inboxWhyFlagged.
  ///
  /// In en, this message translates to:
  /// **'Why Mia flagged this'**
  String get inboxWhyFlagged;

  /// No description provided for @inboxConfidence.
  ///
  /// In en, this message translates to:
  /// **'Confidence'**
  String get inboxConfidence;

  /// No description provided for @inboxCalculationImpact.
  ///
  /// In en, this message translates to:
  /// **'Calculation impact'**
  String get inboxCalculationImpact;

  /// No description provided for @inboxBulkApprove.
  ///
  /// In en, this message translates to:
  /// **'Approve {count} items'**
  String inboxBulkApprove(int count);

  /// No description provided for @inboxAuditTrail.
  ///
  /// In en, this message translates to:
  /// **'Audit trail'**
  String get inboxAuditTrail;

  /// No description provided for @inboxAssignTo.
  ///
  /// In en, this message translates to:
  /// **'Assign to'**
  String get inboxAssignTo;

  /// No description provided for @inboxAskMember.
  ///
  /// In en, this message translates to:
  /// **'Ask a household member'**
  String get inboxAskMember;

  /// No description provided for @inboxRecogniseRequest.
  ///
  /// In en, this message translates to:
  /// **'Do you recognise this?'**
  String get inboxRecogniseRequest;

  /// No description provided for @transactionsTitle.
  ///
  /// In en, this message translates to:
  /// **'Transactions'**
  String get transactionsTitle;

  /// No description provided for @transactionsSearchHint.
  ///
  /// In en, this message translates to:
  /// **'Merchant, amount, note'**
  String get transactionsSearchHint;

  /// No description provided for @transactionsSelectedTotal.
  ///
  /// In en, this message translates to:
  /// **'Selected total'**
  String get transactionsSelectedTotal;

  /// No description provided for @transactionsSavedFilters.
  ///
  /// In en, this message translates to:
  /// **'Saved filters'**
  String get transactionsSavedFilters;

  /// No description provided for @transactionsBulkEdit.
  ///
  /// In en, this message translates to:
  /// **'Bulk edit'**
  String get transactionsBulkEdit;

  /// No description provided for @transactionSourceLayerProvider.
  ///
  /// In en, this message translates to:
  /// **'Provider supplied'**
  String get transactionSourceLayerProvider;

  /// No description provided for @transactionSourceLayerMapped.
  ///
  /// In en, this message translates to:
  /// **'Mia mapped'**
  String get transactionSourceLayerMapped;

  /// No description provided for @transactionSourceLayerConfirmed.
  ///
  /// In en, this message translates to:
  /// **'You confirmed'**
  String get transactionSourceLayerConfirmed;

  /// No description provided for @transactionSourceLayerAi.
  ///
  /// In en, this message translates to:
  /// **'AI suggested'**
  String get transactionSourceLayerAi;

  /// No description provided for @transactionDetailTitle.
  ///
  /// In en, this message translates to:
  /// **'Transaction'**
  String get transactionDetailTitle;

  /// No description provided for @transactionOriginalDescription.
  ///
  /// In en, this message translates to:
  /// **'Original description'**
  String get transactionOriginalDescription;

  /// No description provided for @transactionNormalised.
  ///
  /// In en, this message translates to:
  /// **'Normalised merchant'**
  String get transactionNormalised;

  /// No description provided for @transactionProviderCategory.
  ///
  /// In en, this message translates to:
  /// **'Provider category'**
  String get transactionProviderCategory;

  /// No description provided for @transactionMiaCategory.
  ///
  /// In en, this message translates to:
  /// **'Mia category'**
  String get transactionMiaCategory;

  /// No description provided for @transactionFlags.
  ///
  /// In en, this message translates to:
  /// **'Flags'**
  String get transactionFlags;

  /// No description provided for @transactionRelationships.
  ///
  /// In en, this message translates to:
  /// **'Linked records'**
  String get transactionRelationships;

  /// No description provided for @transactionExcludeFromSpending.
  ///
  /// In en, this message translates to:
  /// **'Exclude from spending'**
  String get transactionExcludeFromSpending;

  /// No description provided for @transactionMarkTransfer.
  ///
  /// In en, this message translates to:
  /// **'Mark as internal transfer'**
  String get transactionMarkTransfer;

  /// No description provided for @transactionMarkReimbursable.
  ///
  /// In en, this message translates to:
  /// **'Mark reimbursable'**
  String get transactionMarkReimbursable;

  /// No description provided for @transactionMarkBusiness.
  ///
  /// In en, this message translates to:
  /// **'Mark as business'**
  String get transactionMarkBusiness;

  /// No description provided for @transactionPossibleDuplicate.
  ///
  /// In en, this message translates to:
  /// **'Possible duplicate'**
  String get transactionPossibleDuplicate;

  /// No description provided for @transactionSplitTitle.
  ///
  /// In en, this message translates to:
  /// **'Split transaction'**
  String get transactionSplitTitle;

  /// No description provided for @transactionSplitExact.
  ///
  /// In en, this message translates to:
  /// **'Exact amount'**
  String get transactionSplitExact;

  /// No description provided for @transactionSplitPercent.
  ///
  /// In en, this message translates to:
  /// **'Percentage'**
  String get transactionSplitPercent;

  /// No description provided for @transactionSplitEqual.
  ///
  /// In en, this message translates to:
  /// **'Equal shares'**
  String get transactionSplitEqual;

  /// No description provided for @transactionSplitRemaining.
  ///
  /// In en, this message translates to:
  /// **'Remaining to allocate'**
  String get transactionSplitRemaining;

  /// No description provided for @transactionSplitBalanced.
  ///
  /// In en, this message translates to:
  /// **'Splits balance to the cent'**
  String get transactionSplitBalanced;

  /// No description provided for @categoriesTitle.
  ///
  /// In en, this message translates to:
  /// **'Categories'**
  String get categoriesTitle;

  /// No description provided for @categoriesCreate.
  ///
  /// In en, this message translates to:
  /// **'New category'**
  String get categoriesCreate;

  /// No description provided for @categoriesMerge.
  ///
  /// In en, this message translates to:
  /// **'Merge'**
  String get categoriesMerge;

  /// No description provided for @categoriesArchive.
  ///
  /// In en, this message translates to:
  /// **'Archive'**
  String get categoriesArchive;

  /// No description provided for @categoriesRestore.
  ///
  /// In en, this message translates to:
  /// **'Restore'**
  String get categoriesRestore;

  /// No description provided for @categoriesSubcategories.
  ///
  /// In en, this message translates to:
  /// **'Subcategories'**
  String get categoriesSubcategories;

  /// No description provided for @categoriesTags.
  ///
  /// In en, this message translates to:
  /// **'Tags'**
  String get categoriesTags;

  /// No description provided for @rulesTitle.
  ///
  /// In en, this message translates to:
  /// **'Rules centre'**
  String get rulesTitle;

  /// No description provided for @rulesSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Corrections you approved, reused transparently.'**
  String get rulesSubtitle;

  /// No description provided for @rulesCreate.
  ///
  /// In en, this message translates to:
  /// **'New rule'**
  String get rulesCreate;

  /// No description provided for @rulesPreview.
  ///
  /// In en, this message translates to:
  /// **'Preview matches'**
  String get rulesPreview;

  /// No description provided for @rulesPriority.
  ///
  /// In en, this message translates to:
  /// **'Priority'**
  String get rulesPriority;

  /// No description provided for @rulesPause.
  ///
  /// In en, this message translates to:
  /// **'Pause'**
  String get rulesPause;

  /// No description provided for @rulesResume.
  ///
  /// In en, this message translates to:
  /// **'Resume'**
  String get rulesResume;

  /// No description provided for @rulesApplyHistorically.
  ///
  /// In en, this message translates to:
  /// **'Apply to past transactions'**
  String get rulesApplyHistorically;

  /// No description provided for @rulesSuggestedTitle.
  ///
  /// In en, this message translates to:
  /// **'Turn this into a rule?'**
  String get rulesSuggestedTitle;

  /// No description provided for @rulesSuggestedBody.
  ///
  /// In en, this message translates to:
  /// **'Mia can apply this correction to future matches. You stay in control.'**
  String get rulesSuggestedBody;

  /// No description provided for @rulesMatchCount.
  ///
  /// In en, this message translates to:
  /// **'{count} matches'**
  String rulesMatchCount(int count);

  /// No description provided for @billsTitle.
  ///
  /// In en, this message translates to:
  /// **'Bills & obligations'**
  String get billsTitle;

  /// No description provided for @billsSubscriptions.
  ///
  /// In en, this message translates to:
  /// **'Subscriptions'**
  String get billsSubscriptions;

  /// No description provided for @billsRecurring.
  ///
  /// In en, this message translates to:
  /// **'Recurring'**
  String get billsRecurring;

  /// No description provided for @billsRenewals.
  ///
  /// In en, this message translates to:
  /// **'Renewals'**
  String get billsRenewals;

  /// No description provided for @billsDueDate.
  ///
  /// In en, this message translates to:
  /// **'Due date'**
  String get billsDueDate;

  /// No description provided for @billsServicePeriod.
  ///
  /// In en, this message translates to:
  /// **'Service period'**
  String get billsServicePeriod;

  /// No description provided for @billsExpectedRange.
  ///
  /// In en, this message translates to:
  /// **'Expected range'**
  String get billsExpectedRange;

  /// No description provided for @billsStatementBalance.
  ///
  /// In en, this message translates to:
  /// **'Statement balance'**
  String get billsStatementBalance;

  /// No description provided for @billsMinimumDue.
  ///
  /// In en, this message translates to:
  /// **'Minimum due'**
  String get billsMinimumDue;

  /// No description provided for @billsAutopay.
  ///
  /// In en, this message translates to:
  /// **'Autopay'**
  String get billsAutopay;

  /// No description provided for @billsPriceChange.
  ///
  /// In en, this message translates to:
  /// **'Price change'**
  String get billsPriceChange;

  /// No description provided for @billsCancellationWatch.
  ///
  /// In en, this message translates to:
  /// **'Cancellation watch'**
  String get billsCancellationWatch;

  /// No description provided for @billsLinkedPayment.
  ///
  /// In en, this message translates to:
  /// **'Linked payment'**
  String get billsLinkedPayment;

  /// No description provided for @billsMarkPaid.
  ///
  /// In en, this message translates to:
  /// **'Mark as paid'**
  String get billsMarkPaid;

  /// No description provided for @comingUpTitle.
  ///
  /// In en, this message translates to:
  /// **'Coming up'**
  String get comingUpTitle;

  /// No description provided for @comingUpNext7.
  ///
  /// In en, this message translates to:
  /// **'7 days'**
  String get comingUpNext7;

  /// No description provided for @comingUpNext14.
  ///
  /// In en, this message translates to:
  /// **'14 days'**
  String get comingUpNext14;

  /// No description provided for @comingUpNext30.
  ///
  /// In en, this message translates to:
  /// **'30 days'**
  String get comingUpNext30;

  /// No description provided for @comingUpIrregular.
  ///
  /// In en, this message translates to:
  /// **'Irregular commitments'**
  String get comingUpIrregular;

  /// No description provided for @comingUpMonthlyEquivalent.
  ///
  /// In en, this message translates to:
  /// **'Monthly equivalent'**
  String get comingUpMonthlyEquivalent;

  /// No description provided for @comingUpFortnightlyEquivalent.
  ///
  /// In en, this message translates to:
  /// **'Fortnightly equivalent'**
  String get comingUpFortnightlyEquivalent;

  /// No description provided for @comingUpNotReserved.
  ///
  /// In en, this message translates to:
  /// **'Shown as an equivalent only. No money has been set aside.'**
  String get comingUpNotReserved;

  /// No description provided for @expectedMoneyTitle.
  ///
  /// In en, this message translates to:
  /// **'Expected money'**
  String get expectedMoneyTitle;

  /// No description provided for @expectedMoneySubtitle.
  ///
  /// In en, this message translates to:
  /// **'Money you\'re waiting on, never counted as income early.'**
  String get expectedMoneySubtitle;

  /// No description provided for @expectedMoneyWaiting.
  ///
  /// In en, this message translates to:
  /// **'Waiting {days} days'**
  String expectedMoneyWaiting(int days);

  /// No description provided for @expectedMoneyOverdue.
  ///
  /// In en, this message translates to:
  /// **'Overdue'**
  String get expectedMoneyOverdue;

  /// No description provided for @expectedMoneyPossibleMatch.
  ///
  /// In en, this message translates to:
  /// **'Possible match found'**
  String get expectedMoneyPossibleMatch;

  /// No description provided for @expectedMoneyConfirmMatch.
  ///
  /// In en, this message translates to:
  /// **'Confirm this match'**
  String get expectedMoneyConfirmMatch;

  /// No description provided for @documentsTitle.
  ///
  /// In en, this message translates to:
  /// **'Documents'**
  String get documentsTitle;

  /// No description provided for @documentsUpload.
  ///
  /// In en, this message translates to:
  /// **'Add document'**
  String get documentsUpload;

  /// No description provided for @documentsProcessing.
  ///
  /// In en, this message translates to:
  /// **'Processing'**
  String get documentsProcessing;

  /// No description provided for @documentsExtracted.
  ///
  /// In en, this message translates to:
  /// **'Extracted fields'**
  String get documentsExtracted;

  /// No description provided for @documentsConfidence.
  ///
  /// In en, this message translates to:
  /// **'Field confidence'**
  String get documentsConfidence;

  /// No description provided for @documentsSourcePage.
  ///
  /// In en, this message translates to:
  /// **'Source page'**
  String get documentsSourcePage;

  /// No description provided for @documentsReprocess.
  ///
  /// In en, this message translates to:
  /// **'Reprocess'**
  String get documentsReprocess;

  /// No description provided for @documentsRetention.
  ///
  /// In en, this message translates to:
  /// **'Retention'**
  String get documentsRetention;

  /// No description provided for @receiptsTitle.
  ///
  /// In en, this message translates to:
  /// **'Receipts'**
  String get receiptsTitle;

  /// No description provided for @receiptsCapture.
  ///
  /// In en, this message translates to:
  /// **'Capture receipt'**
  String get receiptsCapture;

  /// No description provided for @receiptsMerchant.
  ///
  /// In en, this message translates to:
  /// **'Merchant'**
  String get receiptsMerchant;

  /// No description provided for @receiptsSubtotal.
  ///
  /// In en, this message translates to:
  /// **'Subtotal'**
  String get receiptsSubtotal;

  /// No description provided for @receiptsGst.
  ///
  /// In en, this message translates to:
  /// **'GST'**
  String get receiptsGst;

  /// No description provided for @receiptsTotal.
  ///
  /// In en, this message translates to:
  /// **'Total'**
  String get receiptsTotal;

  /// No description provided for @receiptsSuggestedMatch.
  ///
  /// In en, this message translates to:
  /// **'Suggested transaction'**
  String get receiptsSuggestedMatch;

  /// No description provided for @receiptsAcceptMatch.
  ///
  /// In en, this message translates to:
  /// **'Accept match'**
  String get receiptsAcceptMatch;

  /// No description provided for @receiptsRejectMatch.
  ///
  /// In en, this message translates to:
  /// **'Not this one'**
  String get receiptsRejectMatch;

  /// No description provided for @receiptsMismatch.
  ///
  /// In en, this message translates to:
  /// **'Total doesn\'t match'**
  String get receiptsMismatch;

  /// No description provided for @receiptsDuplicate.
  ///
  /// In en, this message translates to:
  /// **'Duplicate receipt'**
  String get receiptsDuplicate;

  /// No description provided for @receiptsPhaseNote.
  ///
  /// In en, this message translates to:
  /// **'Phase 1 reads receipt totals, not individual products.'**
  String get receiptsPhaseNote;

  /// No description provided for @vaultTitle.
  ///
  /// In en, this message translates to:
  /// **'Purchases & warranty'**
  String get vaultTitle;

  /// No description provided for @vaultAddPurchase.
  ///
  /// In en, this message translates to:
  /// **'Add purchase'**
  String get vaultAddPurchase;

  /// No description provided for @vaultItemName.
  ///
  /// In en, this message translates to:
  /// **'Item'**
  String get vaultItemName;

  /// No description provided for @vaultBrand.
  ///
  /// In en, this message translates to:
  /// **'Brand'**
  String get vaultBrand;

  /// No description provided for @vaultModel.
  ///
  /// In en, this message translates to:
  /// **'Model'**
  String get vaultModel;

  /// No description provided for @vaultSerial.
  ///
  /// In en, this message translates to:
  /// **'Serial number'**
  String get vaultSerial;

  /// No description provided for @vaultRetailer.
  ///
  /// In en, this message translates to:
  /// **'Retailer'**
  String get vaultRetailer;

  /// No description provided for @vaultPurchaseDate.
  ///
  /// In en, this message translates to:
  /// **'Purchase date'**
  String get vaultPurchaseDate;

  /// No description provided for @vaultWarrantyEnds.
  ///
  /// In en, this message translates to:
  /// **'Written warranty ends'**
  String get vaultWarrantyEnds;

  /// No description provided for @vaultExtendedWarranty.
  ///
  /// In en, this message translates to:
  /// **'Extended warranty'**
  String get vaultExtendedWarranty;

  /// No description provided for @vaultStatusActive.
  ///
  /// In en, this message translates to:
  /// **'Active'**
  String get vaultStatusActive;

  /// No description provided for @vaultStatusExpiring.
  ///
  /// In en, this message translates to:
  /// **'Expiring'**
  String get vaultStatusExpiring;

  /// No description provided for @vaultStatusExpired.
  ///
  /// In en, this message translates to:
  /// **'Ended'**
  String get vaultStatusExpired;

  /// No description provided for @vaultReminders.
  ///
  /// In en, this message translates to:
  /// **'Reminders'**
  String get vaultReminders;

  /// No description provided for @vaultWarrantyNote.
  ///
  /// In en, this message translates to:
  /// **'Mia tracks the written warranty only. Australian Consumer Law rights can last longer.'**
  String get vaultWarrantyNote;

  /// No description provided for @accountsTitle.
  ///
  /// In en, this message translates to:
  /// **'Accounts'**
  String get accountsTitle;

  /// No description provided for @accountsAssets.
  ///
  /// In en, this message translates to:
  /// **'Assets'**
  String get accountsAssets;

  /// No description provided for @accountsLiabilities.
  ///
  /// In en, this message translates to:
  /// **'Liabilities'**
  String get accountsLiabilities;

  /// No description provided for @accountsBalanceAsOf.
  ///
  /// In en, this message translates to:
  /// **'Balance as of {timestamp}'**
  String accountsBalanceAsOf(String timestamp);

  /// No description provided for @accountsArchived.
  ///
  /// In en, this message translates to:
  /// **'Archived'**
  String get accountsArchived;

  /// No description provided for @accountsAddManual.
  ///
  /// In en, this message translates to:
  /// **'Add manual account'**
  String get accountsAddManual;

  /// No description provided for @netWorthTitle.
  ///
  /// In en, this message translates to:
  /// **'Net worth'**
  String get netWorthTitle;

  /// No description provided for @netWorthAsAt.
  ///
  /// In en, this message translates to:
  /// **'As at'**
  String get netWorthAsAt;

  /// No description provided for @netWorthInvestmentBoundary.
  ///
  /// In en, this message translates to:
  /// **'Phase 1 shows dated values only — no benchmarking or trading.'**
  String get netWorthInvestmentBoundary;

  /// No description provided for @budgetsTitle.
  ///
  /// In en, this message translates to:
  /// **'Budgets'**
  String get budgetsTitle;

  /// No description provided for @budgetsModeTracking.
  ///
  /// In en, this message translates to:
  /// **'Tracking only'**
  String get budgetsModeTracking;

  /// No description provided for @budgetsModeFlex.
  ///
  /// In en, this message translates to:
  /// **'Simple flex'**
  String get budgetsModeFlex;

  /// No description provided for @budgetsModeCategory.
  ///
  /// In en, this message translates to:
  /// **'Category budget'**
  String get budgetsModeCategory;

  /// No description provided for @budgetsModeDetailed.
  ///
  /// In en, this message translates to:
  /// **'Detailed planning'**
  String get budgetsModeDetailed;

  /// No description provided for @budgetsPlanned.
  ///
  /// In en, this message translates to:
  /// **'Planned'**
  String get budgetsPlanned;

  /// No description provided for @budgetsActual.
  ///
  /// In en, this message translates to:
  /// **'Actual'**
  String get budgetsActual;

  /// No description provided for @budgetsRemaining.
  ///
  /// In en, this message translates to:
  /// **'Remaining'**
  String get budgetsRemaining;

  /// No description provided for @budgetsPace.
  ///
  /// In en, this message translates to:
  /// **'Pace'**
  String get budgetsPace;

  /// No description provided for @budgetsRollover.
  ///
  /// In en, this message translates to:
  /// **'Rollover'**
  String get budgetsRollover;

  /// No description provided for @budgetsSinkingFunds.
  ///
  /// In en, this message translates to:
  /// **'Sinking funds'**
  String get budgetsSinkingFunds;

  /// No description provided for @budgetsRebalance.
  ///
  /// In en, this message translates to:
  /// **'Rebalance'**
  String get budgetsRebalance;

  /// No description provided for @budgetsPaceAhead.
  ///
  /// In en, this message translates to:
  /// **'Ahead of pace'**
  String get budgetsPaceAhead;

  /// No description provided for @budgetsPaceBehind.
  ///
  /// In en, this message translates to:
  /// **'Behind pace'**
  String get budgetsPaceBehind;

  /// No description provided for @budgetsPaceOnTrack.
  ///
  /// In en, this message translates to:
  /// **'On pace'**
  String get budgetsPaceOnTrack;

  /// No description provided for @budgetsParentWarning.
  ///
  /// In en, this message translates to:
  /// **'Subcategory limits exceed the parent budget.'**
  String get budgetsParentWarning;

  /// No description provided for @reportsTitle.
  ///
  /// In en, this message translates to:
  /// **'Reports'**
  String get reportsTitle;

  /// No description provided for @reportsCashFlow.
  ///
  /// In en, this message translates to:
  /// **'Cash flow'**
  String get reportsCashFlow;

  /// No description provided for @reportsIncomeSpending.
  ///
  /// In en, this message translates to:
  /// **'Income & spending'**
  String get reportsIncomeSpending;

  /// No description provided for @reportsCategories.
  ///
  /// In en, this message translates to:
  /// **'Categories'**
  String get reportsCategories;

  /// No description provided for @reportsMerchants.
  ///
  /// In en, this message translates to:
  /// **'Merchants'**
  String get reportsMerchants;

  /// No description provided for @reportsTags.
  ///
  /// In en, this message translates to:
  /// **'Tags'**
  String get reportsTags;

  /// No description provided for @reportsSubscriptions.
  ///
  /// In en, this message translates to:
  /// **'Subscriptions'**
  String get reportsSubscriptions;

  /// No description provided for @reportsMonthOverMonth.
  ///
  /// In en, this message translates to:
  /// **'Month over month'**
  String get reportsMonthOverMonth;

  /// No description provided for @reportsYearOverYear.
  ///
  /// In en, this message translates to:
  /// **'Year over year'**
  String get reportsYearOverYear;

  /// No description provided for @reportsYearToDate.
  ///
  /// In en, this message translates to:
  /// **'Year to date'**
  String get reportsYearToDate;

  /// No description provided for @reportsCustomRange.
  ///
  /// In en, this message translates to:
  /// **'Custom range'**
  String get reportsCustomRange;

  /// No description provided for @reportsFinancialYear.
  ///
  /// In en, this message translates to:
  /// **'Financial year'**
  String get reportsFinancialYear;

  /// No description provided for @reportsSmallerSpending.
  ///
  /// In en, this message translates to:
  /// **'Smaller spending'**
  String get reportsSmallerSpending;

  /// No description provided for @reportsSmallerSpendingNote.
  ///
  /// In en, this message translates to:
  /// **'Categories under 0.5% of eligible spending are grouped for display only.'**
  String get reportsSmallerSpendingNote;

  /// No description provided for @reportsShowAllCategories.
  ///
  /// In en, this message translates to:
  /// **'Show all categories'**
  String get reportsShowAllCategories;

  /// No description provided for @reportsExportCsv.
  ///
  /// In en, this message translates to:
  /// **'Export CSV'**
  String get reportsExportCsv;

  /// No description provided for @reportsExportPdf.
  ///
  /// In en, this message translates to:
  /// **'Export PDF'**
  String get reportsExportPdf;

  /// No description provided for @reportsAccountantExport.
  ///
  /// In en, this message translates to:
  /// **'Accountant export'**
  String get reportsAccountantExport;

  /// No description provided for @reportsSavedViews.
  ///
  /// In en, this message translates to:
  /// **'Saved views'**
  String get reportsSavedViews;

  /// No description provided for @reportsChartAlt.
  ///
  /// In en, this message translates to:
  /// **'Chart description'**
  String get reportsChartAlt;

  /// No description provided for @goalsTitle.
  ///
  /// In en, this message translates to:
  /// **'Goals'**
  String get goalsTitle;

  /// No description provided for @goalsCreate.
  ///
  /// In en, this message translates to:
  /// **'New goal'**
  String get goalsCreate;

  /// No description provided for @goalsTarget.
  ///
  /// In en, this message translates to:
  /// **'Target'**
  String get goalsTarget;

  /// No description provided for @goalsTargetDate.
  ///
  /// In en, this message translates to:
  /// **'Target date'**
  String get goalsTargetDate;

  /// No description provided for @goalsCurrent.
  ///
  /// In en, this message translates to:
  /// **'Saved so far'**
  String get goalsCurrent;

  /// No description provided for @goalsRequiredContribution.
  ///
  /// In en, this message translates to:
  /// **'Required contribution'**
  String get goalsRequiredContribution;

  /// No description provided for @goalsAhead.
  ///
  /// In en, this message translates to:
  /// **'Ahead'**
  String get goalsAhead;

  /// No description provided for @goalsOnTrack.
  ///
  /// In en, this message translates to:
  /// **'On track'**
  String get goalsOnTrack;

  /// No description provided for @goalsBehind.
  ///
  /// In en, this message translates to:
  /// **'Behind'**
  String get goalsBehind;

  /// No description provided for @goalsScenario.
  ///
  /// In en, this message translates to:
  /// **'Scenario'**
  String get goalsScenario;

  /// No description provided for @goalsScenarioPrompt.
  ///
  /// In en, this message translates to:
  /// **'What would this cost do to the goal?'**
  String get goalsScenarioPrompt;

  /// No description provided for @goalsScenarioNote.
  ///
  /// In en, this message translates to:
  /// **'Scenarios never change your live financial data.'**
  String get goalsScenarioNote;

  /// No description provided for @goalsLinkedNote.
  ///
  /// In en, this message translates to:
  /// **'Linked balances are not physically set aside.'**
  String get goalsLinkedNote;

  /// No description provided for @lensesTitle.
  ///
  /// In en, this message translates to:
  /// **'Lenses'**
  String get lensesTitle;

  /// No description provided for @lensesSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Deterministic comparisons on your own evidence.'**
  String get lensesSubtitle;

  /// No description provided for @powerLensTitle.
  ///
  /// In en, this message translates to:
  /// **'Power Lens'**
  String get powerLensTitle;

  /// No description provided for @powerLensSubtitle.
  ///
  /// In en, this message translates to:
  /// **'What your usage would cost on other plans.'**
  String get powerLensSubtitle;

  /// No description provided for @powerLensProperty.
  ///
  /// In en, this message translates to:
  /// **'Property'**
  String get powerLensProperty;

  /// No description provided for @powerLensUsageWindow.
  ///
  /// In en, this message translates to:
  /// **'Usage window'**
  String get powerLensUsageWindow;

  /// No description provided for @powerLensCoverage.
  ///
  /// In en, this message translates to:
  /// **'Data coverage'**
  String get powerLensCoverage;

  /// No description provided for @powerLensCurrentPlan.
  ///
  /// In en, this message translates to:
  /// **'Current plan'**
  String get powerLensCurrentPlan;

  /// No description provided for @powerLensEstimatedAnnual.
  ///
  /// In en, this message translates to:
  /// **'Estimated annual cost'**
  String get powerLensEstimatedAnnual;

  /// No description provided for @powerLensEstimatedMonthly.
  ///
  /// In en, this message translates to:
  /// **'Estimated monthly'**
  String get powerLensEstimatedMonthly;

  /// No description provided for @powerLensPotentialSaving.
  ///
  /// In en, this message translates to:
  /// **'Potential difference'**
  String get powerLensPotentialSaving;

  /// No description provided for @powerLensAssumptions.
  ///
  /// In en, this message translates to:
  /// **'Assumptions'**
  String get powerLensAssumptions;

  /// No description provided for @powerLensTariffType.
  ///
  /// In en, this message translates to:
  /// **'Tariff type'**
  String get powerLensTariffType;

  /// No description provided for @powerLensSupplyCharge.
  ///
  /// In en, this message translates to:
  /// **'Daily supply charge'**
  String get powerLensSupplyCharge;

  /// No description provided for @powerLensSolarFeedIn.
  ///
  /// In en, this message translates to:
  /// **'Solar feed-in'**
  String get powerLensSolarFeedIn;

  /// No description provided for @powerLensEligibility.
  ///
  /// In en, this message translates to:
  /// **'Eligibility'**
  String get powerLensEligibility;

  /// No description provided for @powerLensMarketCoverage.
  ///
  /// In en, this message translates to:
  /// **'Market coverage'**
  String get powerLensMarketCoverage;

  /// No description provided for @powerLensRecalculate.
  ///
  /// In en, this message translates to:
  /// **'Recalculate'**
  String get powerLensRecalculate;

  /// No description provided for @powerLensBoundary.
  ///
  /// In en, this message translates to:
  /// **'Comparison only. Mia does not switch retailers or submit applications.'**
  String get powerLensBoundary;

  /// No description provided for @powerLensMissingData.
  ///
  /// In en, this message translates to:
  /// **'Missing usage is disclosed, never guessed.'**
  String get powerLensMissingData;

  /// No description provided for @loanLensTitle.
  ///
  /// In en, this message translates to:
  /// **'Loan Lens'**
  String get loanLensTitle;

  /// No description provided for @loanLensSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Factual comparison on filters you choose.'**
  String get loanLensSubtitle;

  /// No description provided for @loanLensObjective.
  ///
  /// In en, this message translates to:
  /// **'Ranking objective'**
  String get loanLensObjective;

  /// No description provided for @loanLensObjectiveTotalCost.
  ///
  /// In en, this message translates to:
  /// **'Lowest estimated total cost'**
  String get loanLensObjectiveTotalCost;

  /// No description provided for @loanLensObjectiveAdvertised.
  ///
  /// In en, this message translates to:
  /// **'Lowest advertised rate'**
  String get loanLensObjectiveAdvertised;

  /// No description provided for @loanLensObjectiveComparison.
  ///
  /// In en, this message translates to:
  /// **'Lowest published comparison rate'**
  String get loanLensObjectiveComparison;

  /// No description provided for @loanLensObjectiveFees.
  ///
  /// In en, this message translates to:
  /// **'Lowest known fees'**
  String get loanLensObjectiveFees;

  /// No description provided for @loanLensObjectiveFeatures.
  ///
  /// In en, this message translates to:
  /// **'Keeps my selected features'**
  String get loanLensObjectiveFeatures;

  /// No description provided for @loanLensUniverse.
  ///
  /// In en, this message translates to:
  /// **'Lender universe'**
  String get loanLensUniverse;

  /// No description provided for @loanLensUniverseAll.
  ///
  /// In en, this message translates to:
  /// **'All lenders'**
  String get loanLensUniverseAll;

  /// No description provided for @loanLensUniverseMajor.
  ///
  /// In en, this message translates to:
  /// **'Major banks'**
  String get loanLensUniverseMajor;

  /// No description provided for @loanLensUniverseOtherAdi.
  ///
  /// In en, this message translates to:
  /// **'Other APRA banks'**
  String get loanLensUniverseOtherAdi;

  /// No description provided for @loanLensUniverseCustomerOwned.
  ///
  /// In en, this message translates to:
  /// **'Customer owned'**
  String get loanLensUniverseCustomerOwned;

  /// No description provided for @loanLensUniverseNonBank.
  ///
  /// In en, this message translates to:
  /// **'Non-bank lenders'**
  String get loanLensUniverseNonBank;

  /// No description provided for @loanLensFilters.
  ///
  /// In en, this message translates to:
  /// **'Active filters'**
  String get loanLensFilters;

  /// No description provided for @loanLensMarketView.
  ///
  /// In en, this message translates to:
  /// **'Market view'**
  String get loanLensMarketView;

  /// No description provided for @loanLensBroaderMarket.
  ///
  /// In en, this message translates to:
  /// **'Lower rates may exist outside your selected lender groups.'**
  String get loanLensBroaderMarket;

  /// No description provided for @loanLensAdvertisedRate.
  ///
  /// In en, this message translates to:
  /// **'Advertised rate'**
  String get loanLensAdvertisedRate;

  /// No description provided for @loanLensComparisonRate.
  ///
  /// In en, this message translates to:
  /// **'Comparison rate'**
  String get loanLensComparisonRate;

  /// No description provided for @loanLensRepaymentEstimate.
  ///
  /// In en, this message translates to:
  /// **'Repayment estimate'**
  String get loanLensRepaymentEstimate;

  /// No description provided for @loanLensKnownFees.
  ///
  /// In en, this message translates to:
  /// **'Known fees'**
  String get loanLensKnownFees;

  /// No description provided for @loanLensEstimatedTotalCost.
  ///
  /// In en, this message translates to:
  /// **'Estimated total cost'**
  String get loanLensEstimatedTotalCost;

  /// No description provided for @loanLensEligibilityNotAssessed.
  ///
  /// In en, this message translates to:
  /// **'Eligibility not assessed'**
  String get loanLensEligibilityNotAssessed;

  /// No description provided for @loanLensWhyMatched.
  ///
  /// In en, this message translates to:
  /// **'Why it matched'**
  String get loanLensWhyMatched;

  /// No description provided for @loanLensRefinance.
  ///
  /// In en, this message translates to:
  /// **'Refinance comparison'**
  String get loanLensRefinance;

  /// No description provided for @loanLensBreakEven.
  ///
  /// In en, this message translates to:
  /// **'Break-even'**
  String get loanLensBreakEven;

  /// No description provided for @loanLensBoundary.
  ///
  /// In en, this message translates to:
  /// **'Factual comparison only. Mia does not recommend a lender, assess serviceability or pass on your details.'**
  String get loanLensBoundary;

  /// No description provided for @loanLensNeutrality.
  ///
  /// In en, this message translates to:
  /// **'Ranking is mathematical. No paid placement.'**
  String get loanLensNeutrality;

  /// No description provided for @askMiaTitle.
  ///
  /// In en, this message translates to:
  /// **'Ask Mia'**
  String get askMiaTitle;

  /// No description provided for @askMiaPlaceholder.
  ///
  /// In en, this message translates to:
  /// **'Ask about your money'**
  String get askMiaPlaceholder;

  /// No description provided for @askMiaSuggested.
  ///
  /// In en, this message translates to:
  /// **'Try asking'**
  String get askMiaSuggested;

  /// No description provided for @askMiaConversations.
  ///
  /// In en, this message translates to:
  /// **'Conversations'**
  String get askMiaConversations;

  /// No description provided for @askMiaNewConversation.
  ///
  /// In en, this message translates to:
  /// **'New conversation'**
  String get askMiaNewConversation;

  /// No description provided for @askMiaCoveredDates.
  ///
  /// In en, this message translates to:
  /// **'Covered dates'**
  String get askMiaCoveredDates;

  /// No description provided for @askMiaIncludedAccounts.
  ///
  /// In en, this message translates to:
  /// **'Included accounts'**
  String get askMiaIncludedAccounts;

  /// No description provided for @askMiaFreshness.
  ///
  /// In en, this message translates to:
  /// **'Data freshness'**
  String get askMiaFreshness;

  /// No description provided for @askMiaLabelFact.
  ///
  /// In en, this message translates to:
  /// **'Fact'**
  String get askMiaLabelFact;

  /// No description provided for @askMiaLabelCalculation.
  ///
  /// In en, this message translates to:
  /// **'Calculation'**
  String get askMiaLabelCalculation;

  /// No description provided for @askMiaLabelEstimate.
  ///
  /// In en, this message translates to:
  /// **'Estimate'**
  String get askMiaLabelEstimate;

  /// No description provided for @askMiaMissingInfo.
  ///
  /// In en, this message translates to:
  /// **'Missing information'**
  String get askMiaMissingInfo;

  /// No description provided for @askMiaUseful.
  ///
  /// In en, this message translates to:
  /// **'Useful'**
  String get askMiaUseful;

  /// No description provided for @askMiaNotUseful.
  ///
  /// In en, this message translates to:
  /// **'Not useful'**
  String get askMiaNotUseful;

  /// No description provided for @askMiaClarify.
  ///
  /// In en, this message translates to:
  /// **'Mia needs one detail'**
  String get askMiaClarify;

  /// No description provided for @askMiaAdviceBoundary.
  ///
  /// In en, this message translates to:
  /// **'Mia can\'t give personal investment, tax, credit or legal advice — here\'s the factual view instead.'**
  String get askMiaAdviceBoundary;

  /// No description provided for @askMiaOffline.
  ///
  /// In en, this message translates to:
  /// **'Mia can\'t reach the model right now. Your draft is safe.'**
  String get askMiaOffline;

  /// No description provided for @askMiaMemory.
  ///
  /// In en, this message translates to:
  /// **'Remembered preferences'**
  String get askMiaMemory;

  /// No description provided for @searchTitle.
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get searchTitle;

  /// No description provided for @searchHint.
  ///
  /// In en, this message translates to:
  /// **'Anything you\'re allowed to see'**
  String get searchHint;

  /// No description provided for @searchRecent.
  ///
  /// In en, this message translates to:
  /// **'Recent'**
  String get searchRecent;

  /// No description provided for @searchNoResults.
  ///
  /// In en, this message translates to:
  /// **'Nothing matched'**
  String get searchNoResults;

  /// No description provided for @searchPermissionNote.
  ///
  /// In en, this message translates to:
  /// **'Results respect household and record permissions.'**
  String get searchPermissionNote;

  /// No description provided for @householdTitle.
  ///
  /// In en, this message translates to:
  /// **'Household'**
  String get householdTitle;

  /// No description provided for @householdMembers.
  ///
  /// In en, this message translates to:
  /// **'Members'**
  String get householdMembers;

  /// No description provided for @householdInvite.
  ///
  /// In en, this message translates to:
  /// **'Invite member'**
  String get householdInvite;

  /// No description provided for @householdRoleOwner.
  ///
  /// In en, this message translates to:
  /// **'Owner'**
  String get householdRoleOwner;

  /// No description provided for @householdRoleAdult.
  ///
  /// In en, this message translates to:
  /// **'Adult member'**
  String get householdRoleAdult;

  /// No description provided for @householdRoleLimited.
  ///
  /// In en, this message translates to:
  /// **'Limited access'**
  String get householdRoleLimited;

  /// No description provided for @householdLeave.
  ///
  /// In en, this message translates to:
  /// **'Leave household'**
  String get householdLeave;

  /// No description provided for @householdTransferOwnership.
  ///
  /// In en, this message translates to:
  /// **'Transfer ownership'**
  String get householdTransferOwnership;

  /// No description provided for @householdDelete.
  ///
  /// In en, this message translates to:
  /// **'Delete household'**
  String get householdDelete;

  /// No description provided for @householdVisibilityPrivate.
  ///
  /// In en, this message translates to:
  /// **'Private'**
  String get householdVisibilityPrivate;

  /// No description provided for @householdVisibilityShared.
  ///
  /// In en, this message translates to:
  /// **'Shared with household'**
  String get householdVisibilityShared;

  /// No description provided for @householdVisibilitySelected.
  ///
  /// In en, this message translates to:
  /// **'Selected members'**
  String get householdVisibilitySelected;

  /// No description provided for @householdFilterMine.
  ///
  /// In en, this message translates to:
  /// **'Mine'**
  String get householdFilterMine;

  /// No description provided for @householdFilterYours.
  ///
  /// In en, this message translates to:
  /// **'Theirs'**
  String get householdFilterYours;

  /// No description provided for @householdFilterOurs.
  ///
  /// In en, this message translates to:
  /// **'Ours'**
  String get householdFilterOurs;

  /// No description provided for @householdMyReviews.
  ///
  /// In en, this message translates to:
  /// **'My reviews'**
  String get householdMyReviews;

  /// No description provided for @householdReviews.
  ///
  /// In en, this message translates to:
  /// **'Household reviews'**
  String get householdReviews;

  /// No description provided for @householdConsentNote.
  ///
  /// In en, this message translates to:
  /// **'A CDR connection belongs to the member who consented.'**
  String get householdConsentNote;

  /// No description provided for @householdPrivacyNote.
  ///
  /// In en, this message translates to:
  /// **'Membership never exposes another member\'s records.'**
  String get householdPrivacyNote;

  /// No description provided for @connectionsTitle.
  ///
  /// In en, this message translates to:
  /// **'Connections'**
  String get connectionsTitle;

  /// No description provided for @connectionsBanking.
  ///
  /// In en, this message translates to:
  /// **'Banking'**
  String get connectionsBanking;

  /// No description provided for @connectionsEnergy.
  ///
  /// In en, this message translates to:
  /// **'Energy'**
  String get connectionsEnergy;

  /// No description provided for @connectionsEmail.
  ///
  /// In en, this message translates to:
  /// **'Bill email'**
  String get connectionsEmail;

  /// No description provided for @connectionsImports.
  ///
  /// In en, this message translates to:
  /// **'Imports'**
  String get connectionsImports;

  /// No description provided for @connectionsAddBank.
  ///
  /// In en, this message translates to:
  /// **'Connect a bank'**
  String get connectionsAddBank;

  /// No description provided for @connectionsAddEnergy.
  ///
  /// In en, this message translates to:
  /// **'Connect energy'**
  String get connectionsAddEnergy;

  /// No description provided for @connectionsConsentStatus.
  ///
  /// In en, this message translates to:
  /// **'Consent status'**
  String get connectionsConsentStatus;

  /// No description provided for @connectionsConsentScope.
  ///
  /// In en, this message translates to:
  /// **'Scope'**
  String get connectionsConsentScope;

  /// No description provided for @connectionsConsentExpiry.
  ///
  /// In en, this message translates to:
  /// **'Expires'**
  String get connectionsConsentExpiry;

  /// No description provided for @connectionsConsentPurpose.
  ///
  /// In en, this message translates to:
  /// **'Purpose'**
  String get connectionsConsentPurpose;

  /// No description provided for @connectionsConsentHistory.
  ///
  /// In en, this message translates to:
  /// **'Consent history'**
  String get connectionsConsentHistory;

  /// No description provided for @connectionsLastRefreshed.
  ///
  /// In en, this message translates to:
  /// **'Last refreshed'**
  String get connectionsLastRefreshed;

  /// No description provided for @connectionsDataCurrentTo.
  ///
  /// In en, this message translates to:
  /// **'Data current to'**
  String get connectionsDataCurrentTo;

  /// No description provided for @connectionsHistoryProcessing.
  ///
  /// In en, this message translates to:
  /// **'History still processing'**
  String get connectionsHistoryProcessing;

  /// No description provided for @connectionsNoManualRefresh.
  ///
  /// In en, this message translates to:
  /// **'Mia syncs twice daily. Manual refresh isn\'t available.'**
  String get connectionsNoManualRefresh;

  /// No description provided for @connectionsRevoke.
  ///
  /// In en, this message translates to:
  /// **'Revoke consent'**
  String get connectionsRevoke;

  /// No description provided for @connectionsForwardingAddress.
  ///
  /// In en, this message translates to:
  /// **'Private forwarding address'**
  String get connectionsForwardingAddress;

  /// No description provided for @connectionsRotateAddress.
  ///
  /// In en, this message translates to:
  /// **'Rotate address'**
  String get connectionsRotateAddress;

  /// No description provided for @connectionsGmail.
  ///
  /// In en, this message translates to:
  /// **'Connect Gmail'**
  String get connectionsGmail;

  /// No description provided for @connectionsOutlook.
  ///
  /// In en, this message translates to:
  /// **'Connect Outlook'**
  String get connectionsOutlook;

  /// No description provided for @connectionsEmailScopeNote.
  ///
  /// In en, this message translates to:
  /// **'Read-only access to the labels you choose. Mia never scans your whole mailbox.'**
  String get connectionsEmailScopeNote;

  /// No description provided for @importsCsv.
  ///
  /// In en, this message translates to:
  /// **'CSV import'**
  String get importsCsv;

  /// No description provided for @importsPdf.
  ///
  /// In en, this message translates to:
  /// **'PDF statement'**
  String get importsPdf;

  /// No description provided for @importsManual.
  ///
  /// In en, this message translates to:
  /// **'Manual record'**
  String get importsManual;

  /// No description provided for @importsColumnMapping.
  ///
  /// In en, this message translates to:
  /// **'Column mapping'**
  String get importsColumnMapping;

  /// No description provided for @importsPreview.
  ///
  /// In en, this message translates to:
  /// **'Preview before import'**
  String get importsPreview;

  /// No description provided for @importsRollback.
  ///
  /// In en, this message translates to:
  /// **'Roll back import'**
  String get importsRollback;

  /// No description provided for @importsDuplicateDetected.
  ///
  /// In en, this message translates to:
  /// **'Duplicates detected'**
  String get importsDuplicateDetected;

  /// No description provided for @importsBatchStatus.
  ///
  /// In en, this message translates to:
  /// **'Batch status'**
  String get importsBatchStatus;

  /// No description provided for @notificationsTitle.
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get notificationsTitle;

  /// No description provided for @notificationsCentre.
  ///
  /// In en, this message translates to:
  /// **'Notification centre'**
  String get notificationsCentre;

  /// No description provided for @notificationsQuietHours.
  ///
  /// In en, this message translates to:
  /// **'Quiet hours'**
  String get notificationsQuietHours;

  /// No description provided for @notificationsChannels.
  ///
  /// In en, this message translates to:
  /// **'Channels'**
  String get notificationsChannels;

  /// No description provided for @notificationsEvents.
  ///
  /// In en, this message translates to:
  /// **'Events'**
  String get notificationsEvents;

  /// No description provided for @notificationsImmediate.
  ///
  /// In en, this message translates to:
  /// **'Immediate'**
  String get notificationsImmediate;

  /// No description provided for @notificationsDailyDigest.
  ///
  /// In en, this message translates to:
  /// **'Daily digest'**
  String get notificationsDailyDigest;

  /// No description provided for @notificationsWeeklyDigest.
  ///
  /// In en, this message translates to:
  /// **'Weekly digest'**
  String get notificationsWeeklyDigest;

  /// No description provided for @notificationsPreviewNote.
  ///
  /// In en, this message translates to:
  /// **'Detailed previews can show merchant names on your lock screen.'**
  String get notificationsPreviewNote;

  /// No description provided for @notificationsNoEngagementNote.
  ///
  /// In en, this message translates to:
  /// **'Mia never sends notifications just to pull you back in.'**
  String get notificationsNoEngagementNote;

  /// No description provided for @settingsTitle.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settingsTitle;

  /// No description provided for @settingsProfile.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get settingsProfile;

  /// No description provided for @settingsSecurity.
  ///
  /// In en, this message translates to:
  /// **'Security'**
  String get settingsSecurity;

  /// No description provided for @settingsSessions.
  ///
  /// In en, this message translates to:
  /// **'Devices & sessions'**
  String get settingsSessions;

  /// No description provided for @settingsPreferences.
  ///
  /// In en, this message translates to:
  /// **'Preferences'**
  String get settingsPreferences;

  /// No description provided for @settingsPrivacy.
  ///
  /// In en, this message translates to:
  /// **'Privacy & consent'**
  String get settingsPrivacy;

  /// No description provided for @settingsSubscription.
  ///
  /// In en, this message translates to:
  /// **'Subscription'**
  String get settingsSubscription;

  /// No description provided for @settingsExport.
  ///
  /// In en, this message translates to:
  /// **'Export my data'**
  String get settingsExport;

  /// No description provided for @settingsDelete.
  ///
  /// In en, this message translates to:
  /// **'Delete account'**
  String get settingsDelete;

  /// No description provided for @settingsHelp.
  ///
  /// In en, this message translates to:
  /// **'Help centre'**
  String get settingsHelp;

  /// No description provided for @settingsSupport.
  ///
  /// In en, this message translates to:
  /// **'Contact support'**
  String get settingsSupport;

  /// No description provided for @settingsAbout.
  ///
  /// In en, this message translates to:
  /// **'About Mia'**
  String get settingsAbout;

  /// No description provided for @settingsAppearance.
  ///
  /// In en, this message translates to:
  /// **'Appearance'**
  String get settingsAppearance;

  /// No description provided for @settingsAccessibility.
  ///
  /// In en, this message translates to:
  /// **'Accessibility'**
  String get settingsAccessibility;

  /// No description provided for @settingsCurrency.
  ///
  /// In en, this message translates to:
  /// **'Currency'**
  String get settingsCurrency;

  /// No description provided for @settingsTimezone.
  ///
  /// In en, this message translates to:
  /// **'Timezone'**
  String get settingsTimezone;

  /// No description provided for @settingsDateFormat.
  ///
  /// In en, this message translates to:
  /// **'Date format'**
  String get settingsDateFormat;

  /// No description provided for @settingsFinancialYear.
  ///
  /// In en, this message translates to:
  /// **'Financial year'**
  String get settingsFinancialYear;

  /// No description provided for @settingsPayCycle.
  ///
  /// In en, this message translates to:
  /// **'Pay cycle'**
  String get settingsPayCycle;

  /// No description provided for @settingsReviewCadence.
  ///
  /// In en, this message translates to:
  /// **'Review cadence'**
  String get settingsReviewCadence;

  /// No description provided for @settingsReducedMotion.
  ///
  /// In en, this message translates to:
  /// **'Reduced motion'**
  String get settingsReducedMotion;

  /// No description provided for @settingsLargerText.
  ///
  /// In en, this message translates to:
  /// **'Larger text'**
  String get settingsLargerText;

  /// No description provided for @settingsNonColourStatus.
  ///
  /// In en, this message translates to:
  /// **'Always show status words'**
  String get settingsNonColourStatus;

  /// No description provided for @settingsBiometric.
  ///
  /// In en, this message translates to:
  /// **'Biometric unlock'**
  String get settingsBiometric;

  /// No description provided for @settingsMfa.
  ///
  /// In en, this message translates to:
  /// **'Multi-factor authentication'**
  String get settingsMfa;

  /// No description provided for @settingsRevokeSession.
  ///
  /// In en, this message translates to:
  /// **'Revoke'**
  String get settingsRevokeSession;

  /// No description provided for @settingsSignOutAll.
  ///
  /// In en, this message translates to:
  /// **'Sign out everywhere'**
  String get settingsSignOutAll;

  /// No description provided for @settingsReauthNote.
  ///
  /// In en, this message translates to:
  /// **'Sensitive changes ask you to verify again.'**
  String get settingsReauthNote;

  /// No description provided for @settingsDataResidency.
  ///
  /// In en, this message translates to:
  /// **'Data residency'**
  String get settingsDataResidency;

  /// No description provided for @settingsCalculationVersion.
  ///
  /// In en, this message translates to:
  /// **'Calculation version'**
  String get settingsCalculationVersion;

  /// No description provided for @settingsAiVersion.
  ///
  /// In en, this message translates to:
  /// **'AI version'**
  String get settingsAiVersion;

  /// No description provided for @exportTitle.
  ///
  /// In en, this message translates to:
  /// **'Export your data'**
  String get exportTitle;

  /// No description provided for @exportSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Choose what to include. Coverage is stated in the file.'**
  String get exportSubtitle;

  /// No description provided for @exportTransactions.
  ///
  /// In en, this message translates to:
  /// **'Transactions'**
  String get exportTransactions;

  /// No description provided for @exportDocuments.
  ///
  /// In en, this message translates to:
  /// **'Documents'**
  String get exportDocuments;

  /// No description provided for @exportCalculations.
  ///
  /// In en, this message translates to:
  /// **'Calculations'**
  String get exportCalculations;

  /// No description provided for @deleteAccountTitle.
  ///
  /// In en, this message translates to:
  /// **'Delete account'**
  String get deleteAccountTitle;

  /// No description provided for @deleteAccountWarning.
  ///
  /// In en, this message translates to:
  /// **'This removes your records, documents, derived calculations and provider tokens.'**
  String get deleteAccountWarning;

  /// No description provided for @deleteAccountLedger.
  ///
  /// In en, this message translates to:
  /// **'A deletion ledger proves completion without keeping your financial content.'**
  String get deleteAccountLedger;

  /// No description provided for @deleteAccountCdrNote.
  ///
  /// In en, this message translates to:
  /// **'CDR deletion follows the required timeframe and shows its status.'**
  String get deleteAccountCdrNote;

  /// No description provided for @deleteAccountConfirm.
  ///
  /// In en, this message translates to:
  /// **'Delete everything'**
  String get deleteAccountConfirm;

  /// No description provided for @helpTitle.
  ///
  /// In en, this message translates to:
  /// **'Help centre'**
  String get helpTitle;

  /// No description provided for @helpSearchHint.
  ///
  /// In en, this message translates to:
  /// **'Search help'**
  String get helpSearchHint;

  /// No description provided for @helpContactSupport.
  ///
  /// In en, this message translates to:
  /// **'Contact support'**
  String get helpContactSupport;

  /// No description provided for @helpCaseReference.
  ///
  /// In en, this message translates to:
  /// **'Case reference'**
  String get helpCaseReference;

  /// No description provided for @helpCaseStatus.
  ///
  /// In en, this message translates to:
  /// **'Status'**
  String get helpCaseStatus;

  /// No description provided for @helpDiagnostics.
  ///
  /// In en, this message translates to:
  /// **'Attach diagnostics'**
  String get helpDiagnostics;

  /// No description provided for @helpDiagnosticsNote.
  ///
  /// In en, this message translates to:
  /// **'You choose exactly what Mia sends.'**
  String get helpDiagnosticsNote;

  /// No description provided for @evidenceTitle.
  ///
  /// In en, this message translates to:
  /// **'Evidence'**
  String get evidenceTitle;

  /// No description provided for @evidenceSource.
  ///
  /// In en, this message translates to:
  /// **'Source'**
  String get evidenceSource;

  /// No description provided for @evidenceAsOf.
  ///
  /// In en, this message translates to:
  /// **'As of'**
  String get evidenceAsOf;

  /// No description provided for @evidenceDateRange.
  ///
  /// In en, this message translates to:
  /// **'Date range'**
  String get evidenceDateRange;

  /// No description provided for @evidenceExclusions.
  ///
  /// In en, this message translates to:
  /// **'Exclusions'**
  String get evidenceExclusions;

  /// No description provided for @evidenceMissingData.
  ///
  /// In en, this message translates to:
  /// **'Missing data'**
  String get evidenceMissingData;

  /// No description provided for @evidenceCompleteness.
  ///
  /// In en, this message translates to:
  /// **'Completeness'**
  String get evidenceCompleteness;

  /// No description provided for @evidenceCalculationVersion.
  ///
  /// In en, this message translates to:
  /// **'Calculation version'**
  String get evidenceCalculationVersion;

  /// No description provided for @evidenceRecordsUsed.
  ///
  /// In en, this message translates to:
  /// **'Records used'**
  String get evidenceRecordsUsed;

  /// No description provided for @evidenceProvenanceNote.
  ///
  /// In en, this message translates to:
  /// **'Provider evidence is never overwritten. Corrections sit on top.'**
  String get evidenceProvenanceNote;

  /// No description provided for @stateLoading.
  ///
  /// In en, this message translates to:
  /// **'Working on it'**
  String get stateLoading;

  /// No description provided for @stateEmpty.
  ///
  /// In en, this message translates to:
  /// **'Nothing here yet'**
  String get stateEmpty;

  /// No description provided for @stateCaughtUp.
  ///
  /// In en, this message translates to:
  /// **'You\'re caught up'**
  String get stateCaughtUp;

  /// No description provided for @stateOffline.
  ///
  /// In en, this message translates to:
  /// **'You\'re offline'**
  String get stateOffline;

  /// No description provided for @stateStale.
  ///
  /// In en, this message translates to:
  /// **'Data is stale'**
  String get stateStale;

  /// No description provided for @statePartial.
  ///
  /// In en, this message translates to:
  /// **'Partial data'**
  String get statePartial;

  /// No description provided for @stateQueued.
  ///
  /// In en, this message translates to:
  /// **'Queued'**
  String get stateQueued;

  /// No description provided for @stateFailed.
  ///
  /// In en, this message translates to:
  /// **'Something broke'**
  String get stateFailed;

  /// No description provided for @statePermissionDenied.
  ///
  /// In en, this message translates to:
  /// **'Private to its owner'**
  String get statePermissionDenied;

  /// No description provided for @stateReconnect.
  ///
  /// In en, this message translates to:
  /// **'Reconnect needed'**
  String get stateReconnect;

  /// No description provided for @stateDuplicate.
  ///
  /// In en, this message translates to:
  /// **'Possible duplicate'**
  String get stateDuplicate;

  /// No description provided for @stateTimeout.
  ///
  /// In en, this message translates to:
  /// **'That took too long'**
  String get stateTimeout;

  /// No description provided for @stateCancelled.
  ///
  /// In en, this message translates to:
  /// **'Cancelled'**
  String get stateCancelled;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
