import 'dart:math' as math;

import '../../core/constants/app_constants.dart';
import '../models/core_models.dart';
import '../models/loan_models.dart';

abstract class DummyLoans {
  static DateTime get _now => DateTime.now();

  static List<Lender> get lenders => <Lender>[
    Lender(
      id: 'len-cba',
      legalEntity: 'Commonwealth Bank of Australia',
      tradingBrand: 'CommBank',
      group: LenderGroup.majorBank,
      isApraAdi: true,
      isCustomerOwned: false,
      isDigitalOnly: false,
      hasBranchAccess: true,
      verifiedOn: _now.subtract(const Duration(days: 6)),
      aliases: const <String>['CBA'],
    ),
    Lender(
      id: 'len-anz',
      legalEntity: 'Australia and New Zealand Banking Group Limited',
      tradingBrand: 'ANZ',
      group: LenderGroup.majorBank,
      isApraAdi: true,
      isCustomerOwned: false,
      isDigitalOnly: false,
      hasBranchAccess: true,
      verifiedOn: _now.subtract(const Duration(days: 6)),
    ),
    Lender(
      id: 'len-macq',
      legalEntity: 'Macquarie Bank Limited',
      tradingBrand: 'Macquarie',
      group: LenderGroup.otherAdi,
      isApraAdi: true,
      isCustomerOwned: false,
      isDigitalOnly: true,
      hasBranchAccess: false,
      verifiedOn: _now.subtract(const Duration(days: 9)),
    ),
    Lender(
      id: 'len-ing',
      legalEntity: 'ING Bank (Australia) Limited',
      tradingBrand: 'ING',
      group: LenderGroup.otherAdi,
      isApraAdi: true,
      isCustomerOwned: false,
      isDigitalOnly: true,
      hasBranchAccess: false,
      verifiedOn: _now.subtract(const Duration(days: 4)),
    ),
    Lender(
      id: 'len-gtwest',
      legalEntity: 'Greater Bank Limited',
      tradingBrand: 'Greater Bank',
      group: LenderGroup.customerOwned,
      isApraAdi: true,
      isCustomerOwned: true,
      isDigitalOnly: false,
      hasBranchAccess: true,
      verifiedOn: _now.subtract(const Duration(days: 12)),
    ),
    Lender(
      id: 'len-teachers',
      legalEntity: 'Teachers Mutual Bank Limited',
      tradingBrand: 'Teachers Mutual',
      group: LenderGroup.customerOwned,
      isApraAdi: true,
      isCustomerOwned: true,
      isDigitalOnly: false,
      hasBranchAccess: true,
      verifiedOn: _now.subtract(const Duration(days: 15)),
    ),
    Lender(
      id: 'len-athena',
      legalEntity: 'Athena Mortgage Pty Ltd',
      tradingBrand: 'Athena',
      group: LenderGroup.nonBank,
      isApraAdi: false,
      isCustomerOwned: false,
      isDigitalOnly: true,
      hasBranchAccess: false,
      verifiedOn: _now.subtract(const Duration(days: 3)),
    ),
    Lender(
      id: 'len-pepper',
      legalEntity: 'Pepper Money Limited',
      tradingBrand: 'Pepper Money',
      group: LenderGroup.nonBank,
      isApraAdi: false,
      isCustomerOwned: false,
      isDigitalOnly: true,
      hasBranchAccess: false,
      verifiedOn: _now.subtract(const Duration(days: 8)),
    ),
  ];

  static List<LoanProduct> get homeLoans => <LoanProduct>[
    LoanProduct(
      id: 'lp-athena-1',
      lenderId: 'len-athena',
      lenderBrand: 'Athena',
      lenderGroup: LenderGroup.nonBank,
      productName: 'Straight Up Variable (Owner Occupied P&I)',
      type: LoanProductType.homeLoan,
      rateType: RateType.variable,
      advertisedRate: 5.74,
      comparisonRate: 5.74,
      version: 'v2026.06.2',
      lastVerified: _now.subtract(const Duration(days: 2)),
      maxLvr: 80,
      minLoanAmount: 100000,
      maxLoanAmount: 2000000,
      hasRedraw: true,
      features: const <String>[
        'Redraw',
        'No ongoing fee',
        'Rate drops as you repay',
      ],
      conditions: const <String>['Owner occupied only', 'Digital application'],
      publishedCriteria: const <String>['Max 80% LVR', 'Australian residents'],
    ),
    LoanProduct(
      id: 'lp-macq-1',
      lenderId: 'len-macq',
      lenderBrand: 'Macquarie',
      lenderGroup: LenderGroup.otherAdi,
      productName: 'Basic Home Loan Variable',
      type: LoanProductType.homeLoan,
      rateType: RateType.variable,
      advertisedRate: 5.79,
      comparisonRate: 5.81,
      version: 'v2026.06.1',
      lastVerified: _now.subtract(const Duration(days: 3)),
      maxLvr: 70,
      hasOffset: true,
      hasRedraw: true,
      features: const <String>['Offset', 'Redraw', 'No annual fee'],
      publishedCriteria: const <String>['Max 70% LVR for this rate tier'],
    ),
    LoanProduct(
      id: 'lp-ing-1',
      lenderId: 'len-ing',
      lenderBrand: 'ING',
      lenderGroup: LenderGroup.otherAdi,
      productName: 'Mortgage Simplifier',
      type: LoanProductType.homeLoan,
      rateType: RateType.variable,
      advertisedRate: 5.84,
      comparisonRate: 5.88,
      version: 'v2026.05.4',
      lastVerified: _now.subtract(const Duration(days: 5)),
      maxLvr: 80,
      monthlyFee: 0,
      hasRedraw: true,
      features: const <String>['Redraw', 'Extra repayments'],
      conditions: const <String>['Requires an Orange Everyday for some offers'],
    ),
    LoanProduct(
      id: 'lp-gtb-1',
      lenderId: 'len-gtwest',
      lenderBrand: 'Greater Bank',
      lenderGroup: LenderGroup.customerOwned,
      productName: 'Great Rate Home Loan',
      type: LoanProductType.homeLoan,
      rateType: RateType.variable,
      advertisedRate: 5.89,
      comparisonRate: 5.90,
      version: 'v2026.06.1',
      lastVerified: _now.subtract(const Duration(days: 7)),
      maxLvr: 80,
      hasRedraw: true,
      features: const <String>['Redraw', 'Customer owned'],
    ),
    LoanProduct(
      id: 'lp-teach-1',
      lenderId: 'len-teachers',
      lenderBrand: 'Teachers Mutual',
      lenderGroup: LenderGroup.customerOwned,
      productName: 'Your Way Basic Variable',
      type: LoanProductType.homeLoan,
      rateType: RateType.variable,
      advertisedRate: 5.94,
      comparisonRate: 5.96,
      version: 'v2026.04.3',
      lastVerified: _now.subtract(const Duration(days: 11)),
      maxLvr: 90,
      annualFee: 0,
      hasRedraw: true,
      features: const <String>['Redraw', 'Customer owned', 'Up to 90% LVR'],
    ),
    LoanProduct(
      id: 'lp-cba-1',
      lenderId: 'len-cba',
      lenderBrand: 'CommBank',
      lenderGroup: LenderGroup.majorBank,
      productName: 'Wealth Package Variable',
      type: LoanProductType.homeLoan,
      rateType: RateType.variable,
      advertisedRate: 6.24,
      comparisonRate: 6.63,
      version: 'v2026.06.3',
      lastVerified: _now.subtract(const Duration(days: 1)),
      maxLvr: 90,
      annualFee: 395,
      hasOffset: true,
      hasRedraw: true,
      isPackage: true,
      features: const <String>[
        'Offset',
        'Redraw',
        'Package discounts',
        'Branch access',
      ],
      conditions: const <String>['\$395 annual package fee'],
    ),
    LoanProduct(
      id: 'lp-anz-1',
      lenderId: 'len-anz',
      lenderBrand: 'ANZ',
      lenderGroup: LenderGroup.majorBank,
      productName: 'Simplicity PLUS',
      type: LoanProductType.homeLoan,
      rateType: RateType.variable,
      advertisedRate: 6.09,
      comparisonRate: 6.12,
      version: 'v2026.05.2',
      lastVerified: _now.subtract(const Duration(days: 4)),
      maxLvr: 80,
      hasRedraw: true,
      features: const <String>['Redraw', 'Branch access'],
    ),
    LoanProduct(
      id: 'lp-macq-fixed',
      lenderId: 'len-macq',
      lenderBrand: 'Macquarie',
      lenderGroup: LenderGroup.otherAdi,
      productName: 'Fixed 2 Year Owner Occupied',
      type: LoanProductType.homeLoan,
      rateType: RateType.fixed,
      fixedTermYears: 2,
      advertisedRate: 5.59,
      comparisonRate: 5.98,
      version: 'v2026.06.1',
      lastVerified: _now.subtract(const Duration(days: 3)),
      maxLvr: 80,
      features: const <String>['Fixed for 2 years'],
      conditions: const <String>[
        'Break costs may apply',
        'Limited extra repayments',
      ],
    ),
    LoanProduct(
      id: 'lp-pepper-1',
      lenderId: 'len-pepper',
      lenderBrand: 'Pepper Money',
      lenderGroup: LenderGroup.nonBank,
      productName: 'Essential Prime Variable',
      type: LoanProductType.homeLoan,
      rateType: RateType.variable,
      advertisedRate: 6.34,
      comparisonRate: 6.41,
      version: 'v2026.05.1',
      lastVerified: _now.subtract(const Duration(days: 8)),
      maxLvr: 95,
      upfrontFee: 795,
      features: const <String>['Up to 95% LVR', 'Flexible criteria'],
    ),
  ];

  static List<LoanProduct> get personalLoans => <LoanProduct>[
    LoanProduct(
      id: 'pl-ing-1',
      lenderId: 'len-ing',
      lenderBrand: 'ING',
      lenderGroup: LenderGroup.otherAdi,
      productName: 'Personal Loan (Unsecured)',
      type: LoanProductType.personalLoan,
      rateType: RateType.fixed,
      advertisedRate: 7.49,
      comparisonRate: 8.09,
      version: 'v2026.06.1',
      lastVerified: _now.subtract(const Duration(days: 5)),
      isSecured: false,
      upfrontFee: 150,
      minLoanAmount: 5000,
      maxLoanAmount: 60000,
      termYears: 7,
      features: const <String>['Fixed repayments', 'No early repayment fee'],
    ),
    LoanProduct(
      id: 'pl-teach-1',
      lenderId: 'len-teachers',
      lenderBrand: 'Teachers Mutual',
      lenderGroup: LenderGroup.customerOwned,
      productName: 'Secured Car Loan',
      type: LoanProductType.personalLoan,
      rateType: RateType.fixed,
      advertisedRate: 6.89,
      comparisonRate: 7.32,
      version: 'v2026.05.2',
      lastVerified: _now.subtract(const Duration(days: 12)),
      isSecured: true,
      upfrontFee: 195,
      termYears: 7,
      features: const <String>[
        'Secured by the vehicle',
        'Redraw not available',
      ],
      conditions: const <String>['Vehicle under 7 years old'],
    ),
    LoanProduct(
      id: 'pl-pepper-1',
      lenderId: 'len-pepper',
      lenderBrand: 'Pepper Money',
      lenderGroup: LenderGroup.nonBank,
      productName: 'Personal Loan Secured',
      type: LoanProductType.personalLoan,
      rateType: RateType.fixed,
      advertisedRate: 8.45,
      comparisonRate: 9.12,
      version: 'v2026.04.1',
      lastVerified: _now.subtract(const Duration(days: 8)),
      isSecured: true,
      upfrontFee: 495,
      monthlyFee: 9.95,
      termYears: 7,
      features: const <String>['Flexible credit criteria'],
    ),
    LoanProduct(
      id: 'pl-cba-1',
      lenderId: 'len-cba',
      lenderBrand: 'CommBank',
      lenderGroup: LenderGroup.majorBank,
      productName: 'Variable Rate Personal Loan',
      type: LoanProductType.personalLoan,
      rateType: RateType.variable,
      advertisedRate: 9.90,
      comparisonRate: 10.65,
      version: 'v2026.06.1',
      lastVerified: _now.subtract(const Duration(days: 1)),
      isSecured: false,
      monthlyFee: 12,
      termYears: 7,
      features: const <String>['Branch access', 'Redraw'],
    ),
  ];

  /// Standard amortised repayment. Deterministic, decimal-safe enough for the
  /// demo and identical for every product being compared.
  static double monthlyRepayment({
    required double principal,
    required double annualRatePercent,
    required int termYears,
  }) {
    final double r = annualRatePercent / 100 / 12;
    final int n = termYears * 12;
    if (r == 0) return principal / n;
    return principal * r / (1 - math.pow(1 + r, -n));
  }

  static LoanLensResult resultFor(LoanLensFilters filters) {
    final List<LoanProduct> catalogue =
        filters.productType == LoanProductType.homeLoan
        ? homeLoans
        : personalLoans;

    final double currentRate = filters.productType == LoanProductType.homeLoan
        ? 6.24
        : 8.45;
    final double currentRepayment = monthlyRepayment(
      principal: filters.loanAmount,
      annualRatePercent: currentRate,
      termYears: filters.termYears,
    );

    final List<LoanProduct> matching = catalogue.where((LoanProduct p) {
      if (!filters.groups.contains(p.lenderGroup)) return false;
      if (filters.rateType != null && p.rateType != filters.rateType) {
        return false;
      }
      if (p.maxLvr != null && filters.lvr > p.maxLvr!) return false;
      if (p.minLoanAmount != null && filters.loanAmount < p.minLoanAmount!) {
        return false;
      }
      if (p.maxLoanAmount != null && filters.loanAmount > p.maxLoanAmount!) {
        return false;
      }
      if (filters.needsBranchAccess) {
        final Lender lender = lenders.firstWhere(
          (Lender l) => l.id == p.lenderId,
        );
        if (!lender.hasBranchAccess) return false;
      }
      for (final String feature in filters.requiredFeatures) {
        if (!p.features.any(
          (String f) => f.toLowerCase().contains(feature.toLowerCase()),
        )) {
          return false;
        }
      }
      return true;
    }).toList();

    final List<LoanLensMatch> matches = matching.map((LoanProduct p) {
      final double repayment = monthlyRepayment(
        principal: filters.loanAmount,
        annualRatePercent: p.advertisedRate,
        termYears: filters.termYears,
      );
      final double fees =
          p.upfrontFee +
          (p.annualFee * filters.horizonYears) +
          (p.monthlyFee * 12 * filters.horizonYears);
      final double total =
          (repayment * 12 * filters.horizonYears) + fees - (p.cashback ?? 0);
      return LoanLensMatch(
        product: p,
        rank: 0,
        monthlyRepayment: repayment,
        estimatedTotalCost: total,
        knownFees: fees,
        monthlyDifferenceVsCurrent: repayment - currentRepayment,
        annualDifferenceVsCurrent: (repayment - currentRepayment) * 12,
        breakEvenMonths: repayment < currentRepayment
            ? ((p.upfrontFee + 350) / (currentRepayment - repayment)).ceil()
            : null,
        matchReasons: <String>[
          'Within your selected lender groups',
          if (p.maxLvr != null)
            'Published max LVR ${p.maxLvr!.toStringAsFixed(0)}% covers your ${filters.lvr.toStringAsFixed(1)}%',
          '${p.rateType.label} rate',
          for (final String f in filters.requiredFeatures) 'Keeps $f',
        ],
      );
    }).toList();

    matches.sort((LoanLensMatch a, LoanLensMatch b) {
      switch (filters.objective) {
        case LoanRankingObjective.lowestTotalCost:
          return a.estimatedTotalCost.compareTo(b.estimatedTotalCost);
        case LoanRankingObjective.lowestAdvertisedRate:
          return a.product.advertisedRate.compareTo(b.product.advertisedRate);
        case LoanRankingObjective.lowestComparisonRate:
          return a.product.comparisonRate.compareTo(b.product.comparisonRate);
        case LoanRankingObjective.lowestKnownFees:
          return a.knownFees.compareTo(b.knownFees);
        case LoanRankingObjective.retainsFeatures:
          return b.product.features.length.compareTo(a.product.features.length);
      }
    });

    final List<LoanLensMatch> ranked = <LoanLensMatch>[
      for (int i = 0; i < matches.length; i++)
        LoanLensMatch(
          product: matches[i].product,
          rank: i + 1,
          monthlyRepayment: matches[i].monthlyRepayment,
          estimatedTotalCost: matches[i].estimatedTotalCost,
          knownFees: matches[i].knownFees,
          matchReasons: matches[i].matchReasons,
          monthlyDifferenceVsCurrent: matches[i].monthlyDifferenceVsCurrent,
          annualDifferenceVsCurrent: matches[i].annualDifferenceVsCurrent,
          breakEvenMonths: matches[i].breakEvenMonths,
        ),
    ];

    final Map<LenderGroup, LoanLensMatch> marketView =
        <LenderGroup, LoanLensMatch>{};
    for (final LenderGroup group in LenderGroup.values) {
      final Iterable<LoanLensMatch> inGroup = ranked.where(
        (LoanLensMatch m) => m.product.lenderGroup == group,
      );
      if (inGroup.isNotEmpty) {
        marketView[group] = inGroup.first;
      }
    }

    final bool groupsNarrowed =
        filters.groups.length < LenderGroup.values.length;

    return LoanLensResult(
      filters: filters,
      matches: ranked.take(5).toList(),
      currentLoanRepayment: currentRepayment,
      currentLoanRate: currentRate,
      marketViewLowestByGroup: marketView,
      broaderMarketNotice: groupsNarrowed
          ? 'Lower advertised rates exist outside your selected lender groups.'
          : null,
      coverageNote:
          'Compared ${matching.length} of ${catalogue.length} catalogued products. The catalogue is not the whole market.',
      meta: CalculationMeta(
        version: AppConstants.calculationEngineVersion,
        asOf: _now.subtract(const Duration(hours: 2)),
        rangeLabel: '${filters.horizonYears}-year comparison horizon',
        recordCount: matching.length,
        completeness: Completeness.partial,
        exclusions: <String>[
          'Products whose published criteria exclude your loan amount or LVR',
          'Products outside your selected lender groups',
        ],
        missingData: <String>[
          'Lender-specific pricing discounts are not published',
          'Serviceability and eligibility are not assessed',
        ],
        sources: <String>[
          'Provider-neutral product catalogue',
          'Admin CSV import (fallback)',
        ],
        assumptions: <String>[
          'Standard amortised repayments over the selected term',
          'Advertised rate held constant for the whole horizon',
          'Only published fees included',
          'No offset or redraw benefit modelled',
        ],
      ),
    );
  }
}
