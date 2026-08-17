import 'package:flutter/material.dart';

import '../../core/constants/app_constants.dart';
import '../../core/theme/app_colors.dart';
import '../models/core_models.dart';
import '../models/insight_models.dart';

abstract class DummyInsights {
  static DateTime get _now => DateTime.now();

  static DateTime _daysAgo(int d) => _now.subtract(Duration(days: d));

  static DateTime _daysAhead(int d) => _now.add(Duration(days: d));

  static CalculationMeta _meta({
    required String range,
    int records = 0,
    List<String> exclusions = const <String>[],
    List<String> missing = const <String>[],
    Completeness completeness = Completeness.complete,
    List<String> sources = const <String>[],
    List<String> assumptions = const <String>[],
  }) {
    return CalculationMeta(
      version: AppConstants.calculationEngineVersion,
      asOf: _now.subtract(const Duration(minutes: 46)),
      rangeLabel: range,
      recordCount: records,
      exclusions: exclusions,
      missingData: missing,
      completeness: completeness,
      sources: sources,
      assumptions: assumptions,
    );
  }

  static FinancialStanding get standing => FinancialStanding.needsAttention;

  // ── Available after obligations ───────────────────────────────────────────
  static AvailableAfterObligations get availableAfterObligations =>
      AvailableAfterObligations(
        available: 1862.44,
        openingBalance: 8061.55,
        horizonLabel: 'To 30 June',
        lines: <ObligationLine>[
          const ObligationLine(
            label: 'Everyday + Bills balances',
            amount: 8061.55,
            isDeduction: false,
            detail: 'Live balances, 46 minutes ago',
            recordCount: 2,
          ),
          const ObligationLine(
            label: 'Confirmed income before 30 June',
            amount: 4210.00,
            isDeduction: false,
            detail: 'Fortnightly salary, next on the 4th',
            recordCount: 1,
          ),
          const ObligationLine(
            label: 'Confirmed bills & obligations',
            amount: 4256.01,
            isDeduction: true,
            detail: 'Home loan, energy, insurance, water, subscriptions',
            recordCount: 8,
          ),
          const ObligationLine(
            label: 'Planned transfers',
            amount: 1200.00,
            isDeduction: true,
            detail: 'Bills Bucket top-up',
            recordCount: 1,
          ),
          const ObligationLine(
            label: 'Goal contributions',
            amount: 400.00,
            isDeduction: true,
            detail: 'Emergency fund, fortnightly',
            recordCount: 1,
          ),
          const ObligationLine(
            label: 'Overdue school fees',
            amount: 155.00,
            isDeduction: true,
            detail: 'Assigned to Dev, 6 days overdue',
            recordCount: 1,
          ),
          const ObligationLine(
            label: 'Card repayment (already counted)',
            amount: 0,
            isDeduction: true,
            detail: 'Excluded to prevent double counting card purchases',
            recordCount: 1,
          ),
          const ObligationLine(
            label: 'Predicted-only items',
            amount: 398.10,
            isDeduction: true,
            detail: 'Held back separately — not yet confirmed',
            recordCount: 3,
          ),
        ],
        meta: _meta(
          range: 'Today – 30 June',
          records: 18,
          completeness: Completeness.mostlyComplete,
          exclusions: <String>[
            'Confirmed internal transfers',
            'Credit-card repayment linked to counted purchases',
            'Duplicate \$239 debit awaiting confirmation',
          ],
          missing: <String>['ANZ Smart Access 12 Feb – 26 Mar'],
          sources: <String>['CDR banking', 'CDR energy', 'Your corrections'],
          assumptions: <String>[
            'Fortnightly salary continues at the current amount',
            'Variable bills land at their expected midpoint',
          ],
        ),
      );

  // ── True cost of life ─────────────────────────────────────────────────────
  static TrueCostOfLife get trueCostOfLife => TrueCostOfLife(
    monthlyTotal: 6284.18,
    annualTotal: 75410.16,
    components: const <TrueCostComponent>[
      TrueCostComponent(
        label: 'Housing & loans',
        monthlyAmount: 3606.20,
        color: AppColors.violetHaze,
        itemCount: 3,
      ),
      TrueCostComponent(
        label: 'Utilities',
        monthlyAmount: 486.42,
        color: AppColors.amberGlow,
        itemCount: 4,
      ),
      TrueCostComponent(
        label: 'Insurance',
        monthlyAmount: 298.60,
        color: AppColors.glacier,
        itemCount: 3,
      ),
      TrueCostComponent(
        label: 'Subscriptions',
        monthlyAmount: 187.93,
        color: AppColors.lagoon,
        itemCount: 7,
      ),
      TrueCostComponent(
        label: 'Groceries & food',
        monthlyAmount: 1284.60,
        color: AppColors.positive,
        itemCount: 38,
      ),
      TrueCostComponent(
        label: 'Annual & irregular',
        monthlyAmount: 420.43,
        color: AppColors.ember,
        itemCount: 5,
        isIrregular: true,
      ),
    ],
    meta: _meta(
      range: 'Rolling 12 months to today',
      records: 214,
      completeness: Completeness.mostlyComplete,
      exclusions: <String>[
        'One-off Harvey Norman fridge purchase',
        'Internal transfers',
        'Investment sale proceeds',
      ],
      missing: <String>['Six weeks of ANZ history'],
      assumptions: <String>[
        'Annual commitments spread evenly across 12 months',
        'Variable energy averaged over four most recent bills',
      ],
    ),
  );

  // ── What changed ──────────────────────────────────────────────────────────
  static List<WhatChangedItem> get whatChanged => <WhatChangedItem>[
    WhatChangedItem(
      id: 'wc-1',
      title: 'Origin Energy up \$64.26',
      detail: 'Quarterly bill rose 18.4% against the previous bill',
      amount: 64.26,
      percent: 18.4,
      direction: ChangeDirection.up,
      icon: Icons.bolt_rounded,
      accent: AppColors.amberGlow,
      evidence: const <EvidenceLink>[
        EvidenceLink(
          id: 'wcv-1',
          label: 'Origin bill',
          kind: EvidenceKind.bill,
        ),
      ],
    ),
    WhatChangedItem(
      id: 'wc-2',
      title: 'Eating out down \$118',
      detail: 'Fewer restaurant transactions than the same period last month',
      amount: -118.40,
      percent: -16.2,
      direction: ChangeDirection.down,
      icon: Icons.restaurant_rounded,
      accent: AppColors.positive,
    ),
    WhatChangedItem(
      id: 'wc-3',
      title: 'New recurring payment detected',
      detail: 'Anytime Fitness \$19.20 fortnightly, awaiting your confirmation',
      amount: 19.20,
      direction: ChangeDirection.isNew,
      icon: Icons.autorenew_rounded,
      accent: AppColors.glacier,
    ),
    WhatChangedItem(
      id: 'wc-4',
      title: 'Card balance down \$900',
      detail: 'Repayment recorded and excluded from spending',
      amount: -900.00,
      percent: -29.2,
      direction: ChangeDirection.down,
      icon: Icons.credit_card_rounded,
      accent: AppColors.lagoon,
    ),
    WhatChangedItem(
      id: 'wc-5',
      title: 'Groceries flat',
      detail: 'Within \$8 of your rolling four-week average',
      amount: 8.20,
      percent: 0.6,
      direction: ChangeDirection.flat,
      icon: Icons.shopping_basket_rounded,
      accent: AppColors.muted,
    ),
  ];

  // ── Mia handled this ──────────────────────────────────────────────────────
  static List<HandledItem> get handled => <HandledItem>[
    HandledItem(
      id: 'h-1',
      title: 'Matched the Amazon refund',
      detail: 'Reduced Shopping by \$128.99 instead of counting it as income',
      icon: Icons.replay_rounded,
      handledOn: _now.subtract(const Duration(hours: 6)),
    ),
    HandledItem(
      id: 'h-2',
      title: 'Read the Origin bill',
      detail: 'Extracted total, due date, usage and solar credit',
      icon: Icons.description_rounded,
      handledOn: _daysAgo(8),
      accent: AppColors.glacier,
    ),
    HandledItem(
      id: 'h-3',
      title: 'Paired the Bills Bucket transfer',
      detail: 'Both sides excluded from spending and income',
      icon: Icons.sync_alt_rounded,
      handledOn: _daysAgo(2),
      accent: AppColors.lagoon,
    ),
    HandledItem(
      id: 'h-4',
      title: 'Applied your coffee rule 4 times',
      detail: 'Meridian Coffee renamed and subcategorised automatically',
      icon: Icons.rule_rounded,
      handledOn: _daysAgo(1),
      accent: AppColors.ember,
    ),
    HandledItem(
      id: 'h-5',
      title: 'Linked receipt to the Woolworths debit',
      detail: 'Totals agreed to the cent',
      icon: Icons.receipt_rounded,
      handledOn: _daysAgo(1),
    ),
    HandledItem(
      id: 'h-6',
      title: 'Scheduled 3 warranty reminders',
      detail: 'Only future reminders were created',
      icon: Icons.shield_rounded,
      handledOn: _daysAgo(4),
      accent: AppColors.violetHaze,
    ),
  ];

  // ── Briefings & weekly reset ──────────────────────────────────────────────
  static List<BriefingCard> get weeklyReset => <BriefingCard>[
    const BriefingCard(
      id: 'wr-1',
      overline: 'Step 1 · What changed',
      title: 'Energy is the story this week',
      body:
          'Origin rose 18.4% on the same usage window. Everything else moved less than \$50.',
      icon: Icons.bolt_rounded,
      figure: '+\$64.26',
      accent: AppColors.amberGlow,
      actionLabel: 'Open Power Lens',
      items: <String>[
        'Origin Energy +\$64.26',
        'Eating out −\$118.40',
        'Card balance −\$900.00',
      ],
    ),
    const BriefingCard(
      id: 'wr-2',
      overline: 'Step 2 · Coming up',
      title: '\$4,256 of obligations in 14 days',
      body:
          'Home loan, energy, insurance and water land before your next-but-one pay.',
      icon: Icons.event_rounded,
      figure: '\$4,256',
      accent: AppColors.glacier,
      actionLabel: 'See the timeline',
      items: <String>[
        'Netflix in 3 days',
        'Origin Energy in 6 days',
        'Home loan in 8 days',
        'Sydney Water in 12 days',
      ],
    ),
    const BriefingCard(
      id: 'wr-3',
      overline: 'Step 3 · Decisions',
      title: '4 things only you can answer',
      body:
          'Mia has held these back rather than guessing and moving your totals.',
      icon: Icons.help_outline_rounded,
      figure: '4',
      accent: AppColors.ember,
      actionLabel: 'Start reviewing',
      items: <String>[
        'Unknown \$239 debit',
        'Duplicate \$239 debit',
        'Vanguard proceeds classification',
        'Sydney Water service period',
      ],
    ),
    const BriefingCard(
      id: 'wr-4',
      overline: 'Step 4 · Goals',
      title: 'Emergency fund still on track',
      body:
          'At \$400 a fortnight you reach \$20,000 two weeks before your target date.',
      icon: Icons.flag_rounded,
      figure: '63%',
      accent: AppColors.positive,
      actionLabel: 'Review goals',
    ),
    const BriefingCard(
      id: 'wr-5',
      overline: 'Step 5 · Household',
      title: '2 items waiting on Dev',
      body: 'Both were assigned with a due date and he has opened one.',
      icon: Icons.groups_rounded,
      figure: '2',
      accent: AppColors.violetHaze,
      actionLabel: 'Open household reviews',
    ),
  ];

  static List<BriefingCard> get briefings => <BriefingCard>[
    const BriefingCard(
      id: 'br-1',
      overline: 'Weekly',
      title: 'Weekly financial reset',
      body:
          'Five cards, two to five minutes. Changes, obligations, decisions, goals, household.',
      icon: Icons.restart_alt_rounded,
      accent: AppColors.ember,
      actionLabel: 'Start',
    ),
    const BriefingCard(
      id: 'br-2',
      overline: 'Monthly',
      title: 'June in review',
      body:
          'Eligible spending, genuine income, category movement and what Mia handled.',
      icon: Icons.calendar_month_rounded,
      accent: AppColors.glacier,
      actionLabel: 'Read',
    ),
    const BriefingCard(
      id: 'br-3',
      overline: 'Bills',
      title: 'Bill briefing',
      body:
          'Every obligation in the next 30 days with its evidence and status.',
      icon: Icons.receipt_long_rounded,
      accent: AppColors.amberGlow,
      actionLabel: 'Read',
    ),
    const BriefingCard(
      id: 'br-4',
      overline: 'Renewals',
      title: 'Renewal briefing',
      body: 'Insurance, registration and memberships with their price history.',
      icon: Icons.event_repeat_rounded,
      accent: AppColors.lagoon,
      actionLabel: 'Read',
    ),
    const BriefingCard(
      id: 'br-5',
      overline: 'Warranty',
      title: 'Warranty briefing',
      body:
          'Written warranties ending inside six months, with receipts attached.',
      icon: Icons.shield_rounded,
      accent: AppColors.violetHaze,
      actionLabel: 'Read',
    ),
    const BriefingCard(
      id: 'br-6',
      overline: 'Household',
      title: 'Household money meeting',
      body:
          'Permission-aware version of the reset, built from shared records only.',
      icon: Icons.groups_rounded,
      accent: AppColors.positive,
      actionLabel: 'Start',
    ),
  ];

  // ── Budgets ───────────────────────────────────────────────────────────────
  static BudgetPeriod get currentBudget => BudgetPeriod(
    id: 'bud-jun',
    mode: BudgetMode.categoryBudget,
    label: 'June · monthly',
    start: DateTime(_now.year, _now.month),
    end: DateTime(_now.year, _now.month + 1, 0),
    income: 8420.00,
    flexibleAmount: 1650.00,
    allocations: const <BudgetAllocation>[
      BudgetAllocation(
        id: 'ba-1',
        categoryName: 'Groceries',
        icon: Icons.shopping_basket_rounded,
        color: AppColors.positive,
        planned: 1400,
        actual: 1284.60,
      ),
      BudgetAllocation(
        id: 'ba-2',
        categoryName: 'Eating out',
        icon: Icons.restaurant_rounded,
        color: AppColors.ember,
        planned: 500,
        actual: 612.35,
      ),
      BudgetAllocation(
        id: 'ba-3',
        categoryName: 'Transport',
        icon: Icons.directions_car_rounded,
        color: AppColors.glacier,
        planned: 520,
        actual: 486.10,
      ),
      BudgetAllocation(
        id: 'ba-4',
        categoryName: 'Utilities',
        icon: Icons.bolt_rounded,
        color: AppColors.amberGlow,
        planned: 460,
        actual: 528.44,
        rolloverIn: 42.10,
      ),
      BudgetAllocation(
        id: 'ba-5',
        categoryName: 'Subscriptions',
        icon: Icons.subscriptions_rounded,
        color: AppColors.lagoon,
        planned: 190,
        actual: 187.93,
      ),
      BudgetAllocation(
        id: 'ba-6',
        categoryName: 'Kids & school',
        icon: Icons.school_rounded,
        color: Color(0xFFD9A26B),
        planned: 500,
        actual: 465.00,
        owner: 'Ours',
      ),
      BudgetAllocation(
        id: 'ba-7',
        categoryName: 'Christmas fund',
        icon: Icons.card_giftcard_rounded,
        color: AppColors.violetHaze,
        planned: 200,
        actual: 200,
        isSinkingFund: true,
      ),
      BudgetAllocation(
        id: 'ba-8',
        categoryName: 'Car registration fund',
        icon: Icons.directions_car_filled_rounded,
        color: AppColors.glacier,
        planned: 72,
        actual: 72,
        isSinkingFund: true,
      ),
    ],
    meta: CalculationMeta(
      version: AppConstants.calculationEngineVersion,
      asOf: DateTime.now(),
      rangeLabel: 'June',
      recordCount: 96,
      completeness: Completeness.complete,
      exclusions: <String>['Internal transfers', 'Card repayments'],
    ),
  );

  // ── Reports ───────────────────────────────────────────────────────────────
  static ReportSnapshot get monthReport => ReportSnapshot(
    id: 'rep-month',
    title: 'Income & spending',
    periodLabel: 'This month',
    eligibleSpending: 7842.16,
    genuineIncome: 8420.00,
    previousSpending: 7418.90,
    previousIncome: 8420.00,
    categories: <CategoryTotal>[
      const CategoryTotal(
        id: 'cat-housing',
        name: 'Housing',
        amount: 3120.00,
        color: AppColors.violetHaze,
        icon: Icons.house_rounded,
        previousAmount: 3120.00,
        transactionCount: 3,
      ),
      const CategoryTotal(
        id: 'cat-groceries',
        name: 'Groceries',
        amount: 1284.60,
        color: AppColors.positive,
        icon: Icons.shopping_basket_rounded,
        previousAmount: 1276.40,
        transactionCount: 38,
        children: <CategoryTotal>[
          CategoryTotal(
            id: 'cat-groceries-fresh',
            name: 'Fresh food',
            amount: 410.20,
            color: AppColors.positive,
            icon: Icons.eco_rounded,
            transactionCount: 12,
          ),
        ],
      ),
      const CategoryTotal(
        id: 'cat-shopping',
        name: 'Shopping',
        amount: 728.15,
        color: Color(0xFF7FE0D2),
        icon: Icons.shopping_bag_rounded,
        previousAmount: 512.30,
        transactionCount: 14,
      ),
      const CategoryTotal(
        id: 'cat-eating-out',
        name: 'Eating out',
        amount: 612.35,
        color: AppColors.ember,
        icon: Icons.restaurant_rounded,
        previousAmount: 730.75,
        transactionCount: 22,
      ),
      const CategoryTotal(
        id: 'cat-utilities',
        name: 'Utilities',
        amount: 528.44,
        color: AppColors.amberGlow,
        icon: Icons.bolt_rounded,
        previousAmount: 464.18,
        transactionCount: 6,
      ),
      const CategoryTotal(
        id: 'cat-transport',
        name: 'Transport',
        amount: 486.10,
        color: AppColors.glacier,
        icon: Icons.directions_car_rounded,
        previousAmount: 502.60,
        transactionCount: 17,
      ),
      const CategoryTotal(
        id: 'cat-kids',
        name: 'Kids & school',
        amount: 465.00,
        color: Color(0xFFD9A26B),
        icon: Icons.school_rounded,
        previousAmount: 310.00,
        transactionCount: 7,
      ),
      const CategoryTotal(
        id: 'cat-health',
        name: 'Health',
        amount: 342.90,
        color: AppColors.negative,
        icon: Icons.favorite_rounded,
        previousAmount: 188.20,
        transactionCount: 9,
      ),
      const CategoryTotal(
        id: 'cat-insurance',
        name: 'Insurance',
        amount: 298.60,
        color: Color(0xFF4E8CC4),
        icon: Icons.shield_rounded,
        previousAmount: 298.60,
        transactionCount: 4,
      ),
      const CategoryTotal(
        id: 'cat-subscriptions',
        name: 'Subscriptions',
        amount: 187.93,
        color: AppColors.lagoon,
        icon: Icons.subscriptions_rounded,
        previousAmount: 165.94,
        transactionCount: 11,
      ),
      const CategoryTotal(
        id: 'cat-pets',
        name: 'Pets',
        amount: 142.80,
        color: AppColors.amberGlow,
        icon: Icons.pets_rounded,
        previousAmount: 68.40,
        transactionCount: 3,
      ),
      const CategoryTotal(
        id: 'cat-fitness',
        name: 'Fitness',
        amount: 96.00,
        color: AppColors.positive,
        icon: Icons.fitness_center_rounded,
        previousAmount: 76.80,
        transactionCount: 5,
      ),
      const CategoryTotal(
        id: 'cat-gifts',
        name: 'Gifts & donations',
        amount: 85.00,
        color: AppColors.violetHaze,
        icon: Icons.card_giftcard_rounded,
        previousAmount: 0,
        transactionCount: 2,
      ),
      const CategoryTotal(
        id: 'cat-fees',
        name: 'Bank fees',
        amount: 26.50,
        color: AppColors.negative,
        icon: Icons.receipt_rounded,
        previousAmount: 24.00,
        transactionCount: 4,
      ),
      const CategoryTotal(
        id: 'cat-parking',
        name: 'Parking',
        amount: 21.40,
        color: AppColors.muted,
        icon: Icons.local_parking_rounded,
        previousAmount: 18.20,
        transactionCount: 3,
      ),
      const CategoryTotal(
        id: 'cat-stationery',
        name: 'Stationery',
        amount: 14.20,
        color: AppColors.muted,
        icon: Icons.edit_rounded,
        previousAmount: 9.90,
        transactionCount: 2,
      ),
      const CategoryTotal(
        id: 'cat-postage',
        name: 'Postage',
        amount: 9.60,
        color: AppColors.muted,
        icon: Icons.local_post_office_rounded,
        transactionCount: 1,
      ),
      const CategoryTotal(
        id: 'cat-newspaper',
        name: 'News',
        amount: 8.00,
        color: AppColors.muted,
        icon: Icons.newspaper_rounded,
        transactionCount: 1,
      ),
    ],
    merchants: const <MerchantTotal>[
      MerchantTotal(
        name: 'Commonwealth Bank',
        amount: 3120.00,
        count: 1,
        categoryName: 'Housing',
      ),
      MerchantTotal(
        name: 'Woolworths',
        amount: 742.18,
        count: 9,
        categoryName: 'Groceries',
      ),
      MerchantTotal(
        name: 'Harvey Norman',
        amount: 1899.00,
        count: 1,
        categoryName: 'Shopping',
      ),
      MerchantTotal(
        name: 'Origin Energy',
        amount: 412.86,
        count: 1,
        categoryName: 'Utilities',
      ),
      MerchantTotal(
        name: 'ALDI',
        amount: 322.60,
        count: 5,
        categoryName: 'Groceries',
      ),
      MerchantTotal(
        name: 'Ampol',
        amount: 289.40,
        count: 3,
        categoryName: 'Transport',
      ),
      MerchantTotal(
        name: 'St Leonards Dental',
        amount: 284.00,
        count: 1,
        categoryName: 'Health',
      ),
      MerchantTotal(
        name: 'Sydney Water',
        amount: 248.60,
        count: 1,
        categoryName: 'Utilities',
      ),
      MerchantTotal(
        name: 'Meridian Coffee',
        amount: 132.60,
        count: 14,
        categoryName: 'Eating out',
      ),
      MerchantTotal(
        name: 'Netflix',
        amount: 25.99,
        count: 1,
        categoryName: 'Subscriptions',
      ),
    ],
    cashFlow: const <CashFlowPoint>[
      CashFlowPoint(label: 'Jan', income: 8420, spending: 7120),
      CashFlowPoint(label: 'Feb', income: 8420, spending: 6980),
      CashFlowPoint(label: 'Mar', income: 8420, spending: 7640),
      CashFlowPoint(label: 'Apr', income: 8420, spending: 7210),
      CashFlowPoint(label: 'May', income: 8420, spending: 7418),
      CashFlowPoint(label: 'Jun', income: 8420, spending: 7842),
    ],
    meta: CalculationMeta(
      version: AppConstants.calculationEngineVersion,
      asOf: DateTime.now(),
      rangeLabel: '1 – 30 June',
      recordCount: 152,
      completeness: Completeness.mostlyComplete,
      exclusions: <String>[
        'Internal transfers (\$1,200)',
        'Credit-card repayment (\$900)',
        'Investment proceeds (\$2,860)',
        'Duplicate \$239 debit pending confirmation',
      ],
      missingData: <String>['ANZ Smart Access 12 Feb – 26 Mar'],
      sources: <String>['CDR banking', 'CSV import', 'Your corrections'],
    ),
  );

  // ── Goals ─────────────────────────────────────────────────────────────────
  static List<Goal> get goals => <Goal>[
    Goal(
      id: 'goal-1',
      name: 'Emergency fund',
      kind: GoalKind.emergencyFund,
      target: 20000,
      current: 12680.42,
      targetDate: _daysAhead(280),
      status: GoalStatus.onTrack,
      owner: 'Amara',
      linkedAccountName: 'Emergency Fund · Up Bank',
      accent: AppColors.positive,
      meta: CalculationMeta(
        version: AppConstants.calculationEngineVersion,
        asOf: DateTime.now(),
        rangeLabel: 'Since Nov',
        recordCount: 18,
      ),
      movements: <GoalMovement>[
        GoalMovement(
          date: _daysAgo(56),
          amount: 400,
          label: 'Fortnightly contribution',
        ),
        GoalMovement(
          date: _daysAgo(42),
          amount: 400,
          label: 'Fortnightly contribution',
        ),
        GoalMovement(
          date: _daysAgo(28),
          amount: 400,
          label: 'Fortnightly contribution',
        ),
        GoalMovement(
          date: _daysAgo(21),
          amount: -600,
          label: 'Dental withdrawal',
        ),
        GoalMovement(
          date: _daysAgo(14),
          amount: 400,
          label: 'Fortnightly contribution',
        ),
      ],
    ),
    Goal(
      id: 'goal-2',
      name: 'Japan trip',
      kind: GoalKind.holiday,
      target: 9500,
      current: 3120.00,
      targetDate: _daysAhead(400),
      status: GoalStatus.behind,
      owner: 'Amara & Dev',
      visibility: RecordVisibility.household,
      accent: AppColors.ember,
      meta: CalculationMeta(
        version: AppConstants.calculationEngineVersion,
        asOf: DateTime.now(),
        rangeLabel: 'Since Feb',
        recordCount: 9,
      ),
      movements: <GoalMovement>[
        GoalMovement(date: _daysAgo(70), amount: 1000, label: 'Tax refund'),
        GoalMovement(date: _daysAgo(35), amount: 1200, label: 'Bonus'),
        GoalMovement(date: _daysAgo(12), amount: 920, label: 'Transfer'),
      ],
    ),
    Goal(
      id: 'goal-3',
      name: 'Christmas',
      kind: GoalKind.christmas,
      target: 2400,
      current: 1600.00,
      targetDate: _daysAhead(170),
      status: GoalStatus.ahead,
      owner: 'Amara & Dev',
      visibility: RecordVisibility.household,
      accent: AppColors.violetHaze,
      meta: CalculationMeta(
        version: AppConstants.calculationEngineVersion,
        asOf: DateTime.now(),
        rangeLabel: 'Since Jan',
        recordCount: 8,
      ),
    ),
    Goal(
      id: 'goal-4',
      name: 'Car registration',
      kind: GoalKind.annualBill,
      target: 862,
      current: 648.00,
      targetDate: _daysAhead(24),
      status: GoalStatus.onTrack,
      owner: 'Dev',
      visibility: RecordVisibility.household,
      accent: AppColors.glacier,
      meta: CalculationMeta(
        version: AppConstants.calculationEngineVersion,
        asOf: DateTime.now(),
        rangeLabel: 'Sinking fund',
        recordCount: 9,
      ),
    ),
    Goal(
      id: 'goal-5',
      name: 'Kitchen renovation',
      kind: GoalKind.purchase,
      target: 28000,
      current: 4200.00,
      targetDate: _daysAhead(900),
      status: GoalStatus.behind,
      owner: 'Amara & Dev',
      visibility: RecordVisibility.household,
      accent: AppColors.lagoon,
      meta: CalculationMeta(
        version: AppConstants.calculationEngineVersion,
        asOf: DateTime.now(),
        rangeLabel: 'Since Mar',
        recordCount: 5,
      ),
    ),
  ];

  static ScenarioResult scenarioFor(Goal goal, double expense) {
    final double remaining = (goal.target - goal.current + expense).clamp(
      0,
      double.infinity,
    );
    final double monthly = goal.requiredMonthlyContribution == 0
        ? 400
        : goal.requiredMonthlyContribution;
    final int monthsNeeded = (remaining / monthly).ceil();
    final DateTime after = _now.add(Duration(days: monthsNeeded * 30));
    return ScenarioResult(
      description:
          'A \$${expense.toStringAsFixed(0)} expense against ${goal.name}',
      beforeCompletionDate: goal.targetDate,
      afterCompletionDate: after,
      monthsDelayed: after.isAfter(goal.targetDate)
          ? (after.difference(goal.targetDate).inDays / 30).ceil()
          : 0,
      newRequiredContribution:
          remaining / (goal.monthsRemaining == 0 ? 1 : goal.monthsRemaining),
      assumptions: <String>[
        'Contributions continue at their current amount',
        'No interest or investment return applied',
        'Your live data is unchanged by this scenario',
      ],
    );
  }

  // ── Net worth ─────────────────────────────────────────────────────────────
  static NetWorthSnapshot get netWorth => NetWorthSnapshot(
    asAt: _now,
    history: const <double>[
      512000,
      528400,
      541200,
      549800,
      561300,
      574600,
      588120,
      596400,
      602880,
    ],
    assets: <NetWorthEntry>[
      NetWorthEntry(
        label: '18 Kerrigan Street',
        amount: 985000,
        source: ValueSource.manual,
        asOf: _daysAgo(120),
        freshness: DataFreshness.stale,
        icon: Icons.apartment_rounded,
      ),
      NetWorthEntry(
        label: 'Australian Retirement Trust',
        amount: 184320,
        source: ValueSource.manual,
        asOf: _daysAgo(62),
        freshness: DataFreshness.stale,
        icon: Icons.elderly_rounded,
      ),
      NetWorthEntry(
        label: 'Offset Account',
        amount: 21450,
        source: ValueSource.provider,
        asOf: _now.subtract(const Duration(minutes: 46)),
        freshness: DataFreshness.live,
        icon: Icons.compare_arrows_rounded,
      ),
      NetWorthEntry(
        label: 'Emergency Fund',
        amount: 12680.42,
        source: ValueSource.provider,
        asOf: _now.subtract(const Duration(hours: 7)),
        freshness: DataFreshness.recent,
        icon: Icons.savings_rounded,
      ),
      NetWorthEntry(
        label: 'Mazda CX-5',
        amount: 28500,
        source: ValueSource.manual,
        asOf: _daysAgo(95),
        freshness: DataFreshness.stale,
        icon: Icons.directions_car_rounded,
      ),
      NetWorthEntry(
        label: 'Everyday & Bills balances',
        amount: 8061.55,
        source: ValueSource.provider,
        asOf: _now.subtract(const Duration(minutes: 46)),
        freshness: DataFreshness.live,
        icon: Icons.account_balance_wallet_rounded,
      ),
      NetWorthEntry(
        label: 'Dev · Smart Access',
        amount: 2110.88,
        source: ValueSource.provider,
        asOf: _now.subtract(const Duration(hours: 31)),
        freshness: DataFreshness.delayed,
        icon: Icons.account_balance_wallet_rounded,
      ),
    ],
    liabilities: <NetWorthEntry>[
      NetWorthEntry(
        label: 'Home loan',
        amount: 618420,
        source: ValueSource.provider,
        asOf: _now.subtract(const Duration(hours: 14)),
        freshness: DataFreshness.recent,
        icon: Icons.house_rounded,
        isLiability: true,
      ),
      NetWorthEntry(
        label: 'Car loan',
        amount: 14280,
        source: ValueSource.provider,
        asOf: _now.subtract(const Duration(hours: 14)),
        freshness: DataFreshness.recent,
        icon: Icons.request_quote_rounded,
        isLiability: true,
      ),
      NetWorthEntry(
        label: 'Low Rate Visa',
        amount: 2184.30,
        source: ValueSource.provider,
        asOf: _now.subtract(const Duration(minutes: 46)),
        freshness: DataFreshness.live,
        icon: Icons.credit_card_rounded,
        isLiability: true,
      ),
    ],
    meta: CalculationMeta(
      version: AppConstants.calculationEngineVersion,
      asOf: DateTime.now(),
      rangeLabel: 'As at today',
      recordCount: 10,
      completeness: Completeness.partial,
      missingData: <String>[
        'Property valuation is 120 days old',
        'Super balance is 62 days old',
      ],
      assumptions: <String>[
        'Latest eligible value on or before today is used for each item',
      ],
    ),
  );
}
