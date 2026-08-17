import 'package:flutter/material.dart';

import '../../core/constants/app_constants.dart';
import '../../core/theme/app_colors.dart';
import '../models/assistant_models.dart';
import '../models/core_models.dart';

abstract class DummyAssistant {
  static DateTime get _now => DateTime.now();

  static DateTime _daysAgo(int d) => _now.subtract(Duration(days: d));

  // ── Connections ───────────────────────────────────────────────────────────
  static List<ConnectionRecord> get connections => <ConnectionRecord>[
    ConnectionRecord(
      id: 'con-cba',
      kind: ConnectionKind.banking,
      institution: 'Commonwealth Bank',
      status: ConsentStatus.active,
      consentGrantedOn: _daysAgo(158),
      consentExpiresOn: _now.add(const Duration(days: 207)),
      scopes: const <String>[
        'Account and balance',
        'Transaction detail (24 months)',
        'Direct debits & scheduled payments',
        'Product and liability detail',
        'Payees',
      ],
      purpose: 'Organise your spending, bills and obligations',
      owner: 'Amara',
      freshness: DataFreshness.live,
      accountCount: 6,
      lastRefreshed: _now.subtract(const Duration(minutes: 46)),
      dataCurrentTo: _now.subtract(const Duration(minutes: 46)),
      accent: AppColors.amberGlow,
      consentHistory: <AuditEvent>[
        AuditEvent(
          id: 'ch-1',
          actor: 'Amara',
          action: 'Consent granted · 12 month duration',
          timestamp: _daysAgo(158),
        ),
        AuditEvent(
          id: 'ch-2',
          actor: 'Amara',
          action: 'Scope extended to liabilities',
          timestamp: _daysAgo(96),
        ),
      ],
    ),
    ConnectionRecord(
      id: 'con-up',
      kind: ConnectionKind.banking,
      institution: 'Up Bank',
      status: ConsentStatus.expiringSoon,
      consentGrantedOn: _daysAgo(340),
      consentExpiresOn: _now.add(const Duration(days: 18)),
      scopes: const <String>['Account and balance', 'Transaction detail'],
      purpose: 'Track your emergency fund balance',
      owner: 'Amara',
      freshness: DataFreshness.recent,
      accountCount: 1,
      lastRefreshed: _now.subtract(const Duration(hours: 7)),
      dataCurrentTo: _now.subtract(const Duration(hours: 7)),
      accent: AppColors.lagoon,
    ),
    ConnectionRecord(
      id: 'con-anz',
      kind: ConnectionKind.banking,
      institution: 'ANZ',
      status: ConsentStatus.active,
      consentGrantedOn: _daysAgo(88),
      consentExpiresOn: _now.add(const Duration(days: 277)),
      scopes: const <String>['Account and balance', 'Transaction detail'],
      purpose: 'Dev\'s everyday account (his consent, his data)',
      owner: 'Dev',
      freshness: DataFreshness.stale,
      accountCount: 1,
      lastRefreshed: _now.subtract(const Duration(hours: 31)),
      dataCurrentTo: _now.subtract(const Duration(hours: 31)),
      historyProcessingMonthsRemaining: 0,
      accent: AppColors.glacier,
    ),
    ConnectionRecord(
      id: 'con-ing',
      kind: ConnectionKind.banking,
      institution: 'ING',
      status: ConsentStatus.reconnectRequired,
      consentGrantedOn: _daysAgo(400),
      consentExpiresOn: _daysAgo(32),
      scopes: const <String>['Account and balance'],
      purpose: 'Old holiday saver',
      owner: 'Amara',
      freshness: DataFreshness.missing,
      accountCount: 1,
      lastRefreshed: _daysAgo(32),
      accent: AppColors.negative,
    ),
    ConnectionRecord(
      id: 'con-origin',
      kind: ConnectionKind.energy,
      institution: 'Origin Energy',
      status: ConsentStatus.active,
      consentGrantedOn: _daysAgo(151),
      consentExpiresOn: _now.add(const Duration(days: 214)),
      scopes: const <String>[
        'Energy account & service points',
        'Usage (interval, 24 months)',
        'Billing & invoices',
        'Current plan & tariff',
        'Solar export',
      ],
      purpose: 'Compare your plan and explain your bills',
      owner: 'Amara',
      freshness: DataFreshness.recent,
      accountCount: 1,
      lastRefreshed: _now.subtract(const Duration(hours: 9)),
      dataCurrentTo: _now.subtract(const Duration(days: 2)),
      logoGlyph: Icons.bolt_rounded,
      accent: AppColors.ember,
    ),
    ConnectionRecord(
      id: 'con-agl',
      kind: ConnectionKind.energy,
      institution: 'AGL',
      status: ConsentStatus.expiringSoon,
      consentGrantedOn: _daysAgo(324),
      consentExpiresOn: _now.add(const Duration(days: 41)),
      scopes: const <String>['Energy account', 'Billing', 'Current plan'],
      purpose: 'Investment property electricity',
      owner: 'Amara',
      freshness: DataFreshness.delayed,
      accountCount: 1,
      lastRefreshed: _daysAgo(3),
      historyProcessingMonthsRemaining: 4,
      logoGlyph: Icons.bolt_rounded,
      accent: AppColors.caution,
    ),
  ];

  static List<EmailIntakeConnection> get emailConnections =>
      <EmailIntakeConnection>[
        EmailIntakeConnection(
          id: 'email-fwd',
          provider: 'Mia forwarding address',
          address: 'amara.k7t9@bills.miamoney.com.au',
          isConnected: true,
          selectedLabels: const <String>[],
          pendingItems: 2,
          forwardingAddress: 'amara.k7t9@bills.miamoney.com.au',
          lastSync: _now.subtract(const Duration(hours: 4)),
        ),
        EmailIntakeConnection(
          id: 'email-gmail',
          provider: 'Gmail',
          address: 'amara.w@gmail.com',
          isConnected: false,
          selectedLabels: const <String>[],
        ),
        EmailIntakeConnection(
          id: 'email-outlook',
          provider: 'Outlook',
          address: 'amara.whitfield@outlook.com',
          isConnected: true,
          selectedLabels: const <String>['Bills', 'Receipts', 'Insurance'],
          lastSync: _now.subtract(const Duration(hours: 11)),
          pendingItems: 1,
        ),
      ];

  // ── Ask Mia ───────────────────────────────────────────────────────────────
  static List<String> get suggestedQuestions => const <String>[
    'How much did we spend on groceries last month?',
    'What changed this month?',
    'What is due in 14 days?',
    'Which warranties expire in six months?',
    'Would another energy plan have cost less?',
    'Show the lowest home loan rates',
    'Why is my Origin bill higher?',
    'How much is really available to spend?',
  ];

  static List<AskMiaConversation> get conversations => <AskMiaConversation>[
    AskMiaConversation(
      id: 'conv-1',
      title: 'Groceries and eating out',
      updatedOn: _now.subtract(const Duration(hours: 2)),
      messages: <AskMiaMessage>[
        AskMiaMessage(
          id: 'm-1',
          body: 'How much did we spend on groceries last month?',
          isFromUser: true,
          timestamp: _now.subtract(const Duration(hours: 2, minutes: 3)),
        ),
        AskMiaMessage(
          id: 'm-2',
          body:
              'Groceries came to \$1,276.40 across 36 eligible transactions last month. That excludes one confirmed duplicate and the \$1,200 transfer into your Bills Bucket.',
          isFromUser: false,
          timestamp: _now.subtract(const Duration(hours: 2, minutes: 2)),
          nature: AnswerNature.calculation,
          figure: '\$1,276.40',
          coveredDates: '1 – 31 May',
          includedAccounts: const <String>[
            'Everyday Access',
            'Bills Bucket',
            'Low Rate Visa',
          ],
          freshness: DataFreshness.live,
          calculationVersion: AppConstants.calculationEngineVersion,
          evidence: const <EvidenceLink>[
            EvidenceLink(
              id: 'e-1',
              label: '36 transactions',
              kind: EvidenceKind.transaction,
            ),
            EvidenceLink(
              id: 'e-2',
              label: 'Category totals calculation',
              kind: EvidenceKind.calculation,
              detail: 'calc-2026.06.3',
            ),
          ],
          followUps: const <String>[
            'How does that compare to this month?',
            'Which merchants were the biggest?',
            'Show me the Woolworths receipts',
          ],
        ),
      ],
    ),
    AskMiaConversation(
      id: 'conv-2',
      title: 'Energy bill increase',
      updatedOn: _daysAgo(1),
      messages: <AskMiaMessage>[
        AskMiaMessage(
          id: 'm-3',
          body: 'Why is my Origin bill higher?',
          isFromUser: true,
          timestamp: _daysAgo(1),
        ),
        AskMiaMessage(
          id: 'm-4',
          body:
              'Your bill rose \$64.26 (18.4%). Usage was almost flat at 1,842 kWh versus 1,806 kWh, so most of the rise came from rates: peak went from 49.8c to 54.12c per kWh and your solar credit fell from \$84.10 to \$61.20 as winter export dropped.',
          isFromUser: false,
          timestamp: _daysAgo(1),
          nature: AnswerNature.calculation,
          figure: '+\$64.26',
          coveredDates: '12 Mar – 10 Jun vs 11 Dec – 11 Mar',
          includedAccounts: const <String>['Origin Energy · 18 Kerrigan St'],
          freshness: DataFreshness.recent,
          calculationVersion: AppConstants.calculationEngineVersion,
          evidence: const <EvidenceLink>[
            EvidenceLink(
              id: 'e-3',
              label: 'Origin bill Jun',
              kind: EvidenceKind.bill,
            ),
            EvidenceLink(
              id: 'e-4',
              label: 'Origin bill Mar',
              kind: EvidenceKind.bill,
            ),
            EvidenceLink(
              id: 'e-5',
              label: 'Interval usage',
              kind: EvidenceKind.usage,
            ),
            EvidenceLink(
              id: 'e-6',
              label: 'Current plan v2026.04',
              kind: EvidenceKind.plan,
            ),
          ],
          missingInformation: const <String>[
            '96 March intervals were estimated by the retailer',
          ],
          followUps: const <String>[
            'Would another plan have cost less?',
            'What is my daily supply charge?',
          ],
        ),
      ],
    ),
    AskMiaConversation(
      id: 'conv-3',
      title: 'Investment advice boundary',
      updatedOn: _daysAgo(4),
      messages: <AskMiaMessage>[
        AskMiaMessage(
          id: 'm-5',
          body: 'Should I put the Vanguard money into my home loan instead?',
          isFromUser: true,
          timestamp: _daysAgo(4),
        ),
        AskMiaMessage(
          id: 'm-6',
          body:
              'That is a personal financial decision I am not able to advise on. What I can do is show the factual position: your home loan is at 6.24% with \$618,420 owing, and \$21,450 sits in the linked offset. I can also model a scenario against your goals without changing any live data.',
          isFromUser: false,
          timestamp: _daysAgo(4),
          nature: AnswerNature.refusal,
          freshness: DataFreshness.recent,
          followUps: const <String>[
            'Show the loan facts',
            'Model it against my Japan goal',
            'Compare my loan rate factually',
          ],
        ),
      ],
    ),
  ];

  /// Canned answer bank. Keys are matched loosely against what the user types.
  static List<AskMiaMessage> answersFor(String question) {
    final String q = question.toLowerCase();

    if (q.contains('due') || q.contains('14 day') || q.contains('coming')) {
      return <AskMiaMessage>[
        AskMiaMessage(
          id: 'a-due',
          body:
              '\$4,256.01 of confirmed obligations fall in the next 14 days: Netflix \$25.99, Origin Energy \$412.86, your home loan \$3,120.00, AAMI \$149.30, and Sydney Water \$248.60. Anytime Fitness \$19.20 and the health-insurance renewal are predicted only, so I have kept them separate.',
          isFromUser: false,
          timestamp: _now,
          nature: AnswerNature.calculation,
          figure: '\$4,256.01',
          coveredDates: 'Today to 14 days ahead',
          includedAccounts: const <String>[
            'Everyday Access',
            'Bills Bucket',
            'Low Rate Visa',
          ],
          freshness: DataFreshness.live,
          calculationVersion: AppConstants.calculationEngineVersion,
          evidence: const <EvidenceLink>[
            EvidenceLink(
              id: 'ed-1',
              label: '5 confirmed obligations',
              kind: EvidenceKind.bill,
            ),
            EvidenceLink(
              id: 'ed-2',
              label: 'Direct debit evidence',
              kind: EvidenceKind.transaction,
            ),
          ],
          missingInformation: const <String>[
            'Sydney Water service period is still awaiting your decision',
          ],
          followUps: const <String>[
            'What is available after those?',
            'Which of these changed?',
          ],
        ),
      ];
    }

    if (q.contains('warrant')) {
      return <AskMiaMessage>[
        AskMiaMessage(
          id: 'a-warranty',
          body:
              'Two written warranties end within six months: the Bosch dishwasher in 41 days and your MacBook Air in 125 days. The MacBook also has extended cover running a further 730 days. This is about the written warranty only — Australian Consumer Law rights can last longer.',
          isFromUser: false,
          timestamp: _now,
          nature: AnswerNature.fact,
          figure: '2 items',
          coveredDates: 'Next 6 months',
          freshness: DataFreshness.live,
          evidence: const <EvidenceLink>[
            EvidenceLink(
              id: 'ew-1',
              label: 'Bosch warranty document',
              kind: EvidenceKind.document,
            ),
            EvidenceLink(
              id: 'ew-2',
              label: 'Apple purchase receipt',
              kind: EvidenceKind.receipt,
            ),
          ],
          followUps: const <String>[
            'Show the dishwasher receipt',
            'Snooze the reminder',
          ],
        ),
      ];
    }

    if (q.contains('energy') || q.contains('power') || q.contains('plan')) {
      return <AskMiaMessage>[
        AskMiaMessage(
          id: 'a-power',
          body:
              'On your last complete 12 months of usage, Tango Home Time of Use would have cost \$1,806.20 against \$2,184.60 on your current Origin plan — \$378.40 less, or 17.3%. That is a comparison, not a switch: I do not change retailers or submit applications.',
          isFromUser: false,
          timestamp: _now,
          nature: AnswerNature.calculation,
          figure: '−\$378.40',
          coveredDates: 'Most recent complete 12 months',
          includedAccounts: const <String>[
            '18 Kerrigan Street · NMI 41022•••••',
          ],
          freshness: DataFreshness.recent,
          calculationVersion: AppConstants.calculationEngineVersion,
          evidence: const <EvidenceLink>[
            EvidenceLink(
              id: 'ep-1',
              label: 'Power Lens snapshot',
              kind: EvidenceKind.calculation,
            ),
            EvidenceLink(
              id: 'ep-2',
              label: '12 months interval usage',
              kind: EvidenceKind.usage,
            ),
            EvidenceLink(
              id: 'ep-3',
              label: 'Tango plan v2026.05',
              kind: EvidenceKind.plan,
            ),
          ],
          missingInformation: const <String>[
            'Demand-charge plans could not be modelled',
            '96 March intervals were estimated',
          ],
          followUps: const <String>[
            'Show all compared plans',
            'What assumptions were used?',
          ],
        ),
      ];
    }

    if (q.contains('loan') || q.contains('rate') || q.contains('refinance')) {
      return <AskMiaMessage>[
        AskMiaMessage(
          id: 'a-loan',
          body:
              'Within the lender groups you selected, the lowest advertised variable owner-occupier rates are Athena 5.74%, Macquarie Basic 5.79% and ING Mortgage Simplifier 5.84%. Your current rate is 6.24%. These are the lowest-cost products among those compared — not a recommendation, and eligibility is not assessed.',
          isFromUser: false,
          timestamp: _now,
          nature: AnswerNature.calculation,
          figure: '5.74%',
          coveredDates: 'Catalogue verified within 8 days',
          freshness: DataFreshness.recent,
          calculationVersion: AppConstants.calculationEngineVersion,
          evidence: const <EvidenceLink>[
            EvidenceLink(
              id: 'el-1',
              label: 'Loan Lens snapshot',
              kind: EvidenceKind.calculation,
            ),
            EvidenceLink(
              id: 'el-2',
              label: '9 catalogued products',
              kind: EvidenceKind.plan,
            ),
          ],
          missingInformation: const <String>[
            'Lender-specific discounts are not published',
            'Serviceability is outside what Mia does',
          ],
          followUps: const <String>[
            'Rank by total cost instead',
            'Widen my lender universe',
          ],
        ),
      ];
    }

    if (q.contains('available') || q.contains('spend')) {
      return <AskMiaMessage>[
        AskMiaMessage(
          id: 'a-available',
          body:
              '\$1,862.44 is available after confirmed obligations to 30 June. That starts from \$8,061.55 in live balances plus \$4,210.00 of confirmed income, then deducts \$4,256.01 of obligations, \$1,200 of planned transfers, \$400 of goal contributions and \$155 of overdue school fees. Predicted-only items are held back separately.',
          isFromUser: false,
          timestamp: _now,
          nature: AnswerNature.calculation,
          figure: '\$1,862.44',
          coveredDates: 'Today – 30 June',
          includedAccounts: const <String>['Everyday Access', 'Bills Bucket'],
          freshness: DataFreshness.live,
          calculationVersion: AppConstants.calculationEngineVersion,
          evidence: const <EvidenceLink>[
            EvidenceLink(
              id: 'ea-1',
              label: 'Available After Obligations',
              kind: EvidenceKind.calculation,
            ),
            EvidenceLink(
              id: 'ea-2',
              label: 'Live balances',
              kind: EvidenceKind.balance,
            ),
          ],
          missingInformation: const <String>['Six weeks of ANZ history'],
          followUps: const <String>[
            'Show the full working',
            'What if I skip the transfer?',
          ],
        ),
      ];
    }

    if (q.contains('changed')) {
      return <AskMiaMessage>[
        AskMiaMessage(
          id: 'a-changed',
          body:
              'Three things moved materially this month. Origin Energy rose \$64.26 (18.4%). Eating out fell \$118.40 (16.2%). A new fortnightly \$19.20 debit appeared at Anytime Fitness and is waiting on your confirmation. Groceries stayed within \$8 of your four-week average.',
          isFromUser: false,
          timestamp: _now,
          nature: AnswerNature.calculation,
          figure: '3 changes',
          coveredDates: 'This month vs last month',
          freshness: DataFreshness.live,
          calculationVersion: AppConstants.calculationEngineVersion,
          evidence: const <EvidenceLink>[
            EvidenceLink(
              id: 'ec-1',
              label: 'Period comparison',
              kind: EvidenceKind.calculation,
            ),
          ],
          followUps: const <String>[
            'Why did energy rise?',
            'Confirm the gym payment',
          ],
        ),
      ];
    }

    if (q.contains('grocer')) {
      return <AskMiaMessage>[
        AskMiaMessage(
          id: 'a-groceries',
          body:
              'Groceries came to \$1,284.60 across 38 eligible transactions this month, \$8.20 above last month. Woolworths accounted for \$742.18 of that and ALDI \$322.60.',
          isFromUser: false,
          timestamp: _now,
          nature: AnswerNature.calculation,
          figure: '\$1,284.60',
          coveredDates: '1 – 30 June',
          includedAccounts: const <String>['Everyday Access', 'Low Rate Visa'],
          freshness: DataFreshness.live,
          calculationVersion: AppConstants.calculationEngineVersion,
          evidence: const <EvidenceLink>[
            EvidenceLink(
              id: 'eg-1',
              label: '38 transactions',
              kind: EvidenceKind.transaction,
            ),
          ],
          followUps: const <String>[
            'Break it down by merchant',
            'Compare to last year',
          ],
        ),
      ];
    }

    if (q.contains('tax') || q.contains('invest') || q.contains('should i')) {
      return <AskMiaMessage>[
        AskMiaMessage(
          id: 'a-boundary',
          body:
              'That crosses into personal financial, tax or credit advice, which I am not able to give. I can show you the factual position and model a scenario against your goals without touching your live data.',
          isFromUser: false,
          timestamp: _now,
          nature: AnswerNature.refusal,
          followUps: const <String>[
            'Show me the facts instead',
            'Model a scenario',
          ],
        ),
      ];
    }

    if (q.length < 8) {
      return <AskMiaMessage>[
        AskMiaMessage(
          id: 'a-clarify',
          body:
              'I can answer that, but I need one detail first — which period should I use?',
          isFromUser: false,
          timestamp: _now,
          nature: AnswerNature.clarification,
          clarificationOptions: const <String>[
            'This month',
            'Last month',
            'Financial year to date',
            'Last 12 months',
          ],
        ),
      ];
    }

    return <AskMiaMessage>[
      AskMiaMessage(
        id: 'a-generic',
        body:
            'Here is what I can see from your authorised records. Eligible spending this month is \$7,842.16 against \$8,420.00 of genuine income, leaving \$577.84 net. Four items are waiting on a decision from you before those figures settle.',
        isFromUser: false,
        timestamp: _now,
        nature: AnswerNature.calculation,
        figure: '\$577.84',
        coveredDates: '1 – 30 June',
        includedAccounts: const <String>[
          'Everyday Access',
          'Bills Bucket',
          'Low Rate Visa',
          'Emergency Fund',
        ],
        freshness: DataFreshness.live,
        calculationVersion: AppConstants.calculationEngineVersion,
        evidence: const <EvidenceLink>[
          EvidenceLink(
            id: 'egn-1',
            label: 'Cash flow calculation',
            kind: EvidenceKind.calculation,
          ),
        ],
        missingInformation: const <String>[
          'Four review items could move these totals',
        ],
        followUps: const <String>[
          'What are the four items?',
          'Show me the biggest categories',
        ],
      ),
    ];
  }

  // ── Notifications ─────────────────────────────────────────────────────────
  static List<MiaNotification> get notifications => <MiaNotification>[
    MiaNotification(
      id: 'n-1',
      category: NotificationCategory.bill,
      title: 'Origin Energy is due in 6 days',
      body: 'Amount changed since the last bill. Tap to see why.',
      timestamp: _now.subtract(const Duration(hours: 3)),
      deepLinkLabel: 'Open bill',
    ),
    MiaNotification(
      id: 'n-2',
      category: NotificationCategory.review,
      title: 'Dev opened the item you assigned',
      body: 'Pepper Money \$486.20 · assigned 8 days ago',
      timestamp: _now.subtract(const Duration(hours: 9)),
      deepLinkLabel: 'Open review',
    ),
    MiaNotification(
      id: 'n-3',
      category: NotificationCategory.security,
      title: 'New sign-in from Melbourne',
      body: 'Pixel 9 · if this was not you, revoke the session now.',
      timestamp: _daysAgo(3),
      isCritical: true,
      deepLinkLabel: 'Review sessions',
    ),
    MiaNotification(
      id: 'n-4',
      category: NotificationCategory.dataSource,
      title: 'ANZ has not refreshed in 31 hours',
      body: 'Figures using this account are flagged stale.',
      timestamp: _now.subtract(const Duration(hours: 5)),
      deepLinkLabel: 'Open connections',
    ),
    MiaNotification(
      id: 'n-5',
      category: NotificationCategory.warranty,
      title: 'Dishwasher warranty ends in 41 days',
      body: 'Bosch SMS66 · receipt attached',
      timestamp: _daysAgo(1),
      isRead: true,
      deepLinkLabel: 'Open vault',
    ),
    MiaNotification(
      id: 'n-6',
      category: NotificationCategory.expectedMoney,
      title: 'Medibank claim is 19 days overdue',
      body: '\$184.00 expected. Nothing matching has arrived.',
      timestamp: _daysAgo(2),
      isRead: true,
      deepLinkLabel: 'Open expected money',
    ),
    MiaNotification(
      id: 'n-7',
      category: NotificationCategory.budget,
      title: 'Eating out is over its limit',
      body: '\$612.35 of \$500 with 8 days left in the period.',
      timestamp: _daysAgo(2),
      isRead: true,
    ),
    MiaNotification(
      id: 'n-8',
      category: NotificationCategory.processing,
      title: 'A PDF import failed',
      body: 'anz-statement-feb.pdf is password protected.',
      timestamp: _daysAgo(3),
      isRead: true,
      deepLinkLabel: 'Open imports',
    ),
    MiaNotification(
      id: 'n-9',
      category: NotificationCategory.billing,
      title: 'Household plan renews in 151 days',
      body: 'Annual · \$179.99 through the App Store.',
      timestamp: _daysAgo(6),
      isRead: true,
    ),
  ];

  // ── Search ────────────────────────────────────────────────────────────────
  static List<SearchResult> get searchCorpus => <SearchResult>[
    SearchResult(
      id: 'sr-1',
      kind: SearchResultKind.transaction,
      title: 'Woolworths Marrickville',
      subtitle: 'Groceries · Everyday Access',
      amount: -184.22,
      date: _daysAgo(1),
      visibility: RecordVisibility.household,
    ),
    SearchResult(
      id: 'sr-2',
      kind: SearchResultKind.bill,
      title: 'Origin Energy',
      subtitle: 'Quarterly · due in 6 days · amount changed',
      amount: -412.86,
      visibility: RecordVisibility.household,
    ),
    SearchResult(
      id: 'sr-3',
      kind: SearchResultKind.warranty,
      title: 'Bosch Dishwasher',
      subtitle: 'Written warranty ends in 41 days',
      visibility: RecordVisibility.household,
    ),
    SearchResult(
      id: 'sr-4',
      kind: SearchResultKind.purchase,
      title: 'Fisher & Paykel Fridge',
      subtitle: 'Harvey Norman · serial FP-2026-884213',
      amount: -1899.00,
      visibility: RecordVisibility.household,
    ),
    SearchResult(
      id: 'sr-5',
      kind: SearchResultKind.document,
      title: 'Origin Energy bill · Mar–Jun',
      subtitle: '4 pages · extracted 5 fields',
      visibility: RecordVisibility.household,
    ),
    SearchResult(
      id: 'sr-6',
      kind: SearchResultKind.energyPlan,
      title: 'Tango Home Time of Use',
      subtitle: 'Lowest estimated annual cost in Power Lens',
    ),
    SearchResult(
      id: 'sr-7',
      kind: SearchResultKind.expectedMoney,
      title: 'Medibank health claim',
      subtitle: 'Overdue by 19 days',
      amount: 184.00,
    ),
    SearchResult(
      id: 'sr-8',
      kind: SearchResultKind.merchant,
      title: 'Meridian Coffee',
      subtitle: '14 transactions · \$132.60 this month',
    ),
    SearchResult(
      id: 'sr-9',
      kind: SearchResultKind.householdTask,
      title: 'Pepper Money \$486.20',
      subtitle: 'Assigned to Dev · opened',
      visibility: RecordVisibility.household,
    ),
    SearchResult(
      id: 'sr-10',
      kind: SearchResultKind.servicePoint,
      title: '18 Kerrigan Street',
      subtitle: 'Smart meter · solar · controlled load',
      visibility: RecordVisibility.household,
    ),
    SearchResult(
      id: 'sr-11',
      kind: SearchResultKind.receipt,
      title: 'Harvey Norman receipt',
      subtitle: 'Total mismatch of \$12.40',
      amount: -1911.40,
      visibility: RecordVisibility.household,
    ),
    SearchResult(
      id: 'sr-12',
      kind: SearchResultKind.subscription,
      title: 'Netflix',
      subtitle: 'Monthly · \$25.99 · rose \$3.00 in Nov',
      amount: -25.99,
      visibility: RecordVisibility.household,
    ),
    SearchResult(
      id: 'sr-13',
      kind: SearchResultKind.category,
      title: 'Eating out',
      subtitle: '22 transactions · over budget',
    ),
    SearchResult(
      id: 'sr-14',
      kind: SearchResultKind.tag,
      title: 'reimbursable',
      subtitle: '6 transactions tagged',
    ),
  ];

  // ── Help & support ────────────────────────────────────────────────────────
  static List<HelpArticle> get helpArticles => const <HelpArticle>[
    HelpArticle(
      id: 'help-1',
      title: 'Why can Mia not refresh my bank on demand?',
      category: 'Connections',
      body:
          'Mia syncs twice a day, morning and afternoon, within what the Consumer Data Right permits. Every screen shows what the data is current to, so you always know how fresh a figure is rather than pulling a refresh that would not return anything new.',
      icon: Icons.sync_rounded,
    ),
    HelpArticle(
      id: 'help-2',
      title: 'What does "private by default" actually mean?',
      category: 'Household',
      body:
          'Joining a household grants nothing on its own. Each record stays private until its owner shares it with everyone or with named members. Totals never leak a private record indirectly, and the household owner cannot see members\' private data.',
      icon: Icons.lock_rounded,
    ),
    HelpArticle(
      id: 'help-3',
      title: 'How does Mia decide something needs review?',
      category: 'Reviews',
      body:
          'Thresholds consider the consequence of being wrong, not just model confidence. A low-confidence \$4 coffee is categorised silently; a \$2,860 inflow that would distort your income is always brought to you.',
      icon: Icons.rule_rounded,
    ),
    HelpArticle(
      id: 'help-4',
      title: 'Where is my data stored?',
      category: 'Privacy',
      body:
          'Financial records, documents, search indexes, queues and backups are held in Australian infrastructure. Any transient offshore processing by an AI or document provider is disclosed in Privacy & consent.',
      icon: Icons.public_rounded,
    ),
    HelpArticle(
      id: 'help-5',
      title: 'Does Mia recommend a loan or energy plan?',
      category: 'Lenses',
      body:
          'No. Power Lens costs plans against your own usage and ranks them by estimated cost. Loan Lens ranks products factually against filters you choose. Neither assesses suitability, and Mia never switches a retailer or applies for credit.',
      icon: Icons.balance_rounded,
    ),
    HelpArticle(
      id: 'help-6',
      title: 'Can I undo a correction?',
      category: 'Corrections',
      body:
          'Yes. Provider evidence is never overwritten, so a correction is a layer on top. Removing it restores the previous value and recalculates every figure that depended on it, keeping the audit history intact.',
      icon: Icons.undo_rounded,
    ),
    HelpArticle(
      id: 'help-7',
      title: 'Why does receipt scanning not list products?',
      category: 'Receipts',
      body:
          'Phase 1 reads receipt-level fields such as merchant, date, subtotal, GST and total, and suggests a matching transaction. Individual product recognition and item price history are Phase 2.',
      icon: Icons.receipt_rounded,
    ),
    HelpArticle(
      id: 'help-8',
      title: 'What happens when I delete my account?',
      category: 'Data',
      body:
          'Deletion covers the database, files, search and vector data, caches, provider tokens, derived calculations and queues. A deletion ledger records that it completed without retaining the deleted content, and backups expire on a documented schedule.',
      icon: Icons.delete_forever_rounded,
    ),
  ];

  static List<SupportCase> get supportCases => <SupportCase>[
    SupportCase(
      id: 'sc-1',
      reference: 'MIA-48213',
      subject: 'ANZ statement PDF will not import',
      status: 'With support',
      openedOn: _daysAgo(3),
      lastUpdate: _daysAgo(1),
      diagnosticsAttached: true,
    ),
    SupportCase(
      id: 'sc-2',
      reference: 'MIA-47990',
      subject: 'Ask Mia answer looked wrong',
      status: 'Resolved',
      openedOn: _daysAgo(21),
      lastUpdate: _daysAgo(18),
    ),
  ];
}
