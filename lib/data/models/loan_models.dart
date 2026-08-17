import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';
import 'core_models.dart';

enum LenderGroup { majorBank, otherAdi, customerOwned, nonBank }

extension LenderGroupX on LenderGroup {
  String get label {
    switch (this) {
      case LenderGroup.majorBank:
        return 'Major bank';
      case LenderGroup.otherAdi:
        return 'Other APRA bank';
      case LenderGroup.customerOwned:
        return 'Customer owned';
      case LenderGroup.nonBank:
        return 'Non-bank lender';
    }
  }

  Color get color {
    switch (this) {
      case LenderGroup.majorBank:
        return AppColors.glacier;
      case LenderGroup.otherAdi:
        return AppColors.lagoon;
      case LenderGroup.customerOwned:
        return AppColors.positive;
      case LenderGroup.nonBank:
        return AppColors.violetHaze;
    }
  }
}

@immutable
class Lender {
  const Lender({
    required this.id,
    required this.legalEntity,
    required this.tradingBrand,
    required this.group,
    required this.isApraAdi,
    required this.isCustomerOwned,
    required this.isDigitalOnly,
    required this.hasBranchAccess,
    required this.verifiedOn,
    this.parentGroup,
    this.aliases = const <String>[],
  });

  final String id;
  final String legalEntity;
  final String tradingBrand;
  final LenderGroup group;
  final bool isApraAdi;
  final bool isCustomerOwned;
  final bool isDigitalOnly;
  final bool hasBranchAccess;
  final DateTime verifiedOn;
  final String? parentGroup;
  final List<String> aliases;
}

enum LoanProductType { homeLoan, personalLoan }

enum RepaymentType { principalAndInterest, interestOnly }

enum RateType { variable, fixed, split }

extension RateTypeX on RateType {
  String get label {
    switch (this) {
      case RateType.variable:
        return 'Variable';
      case RateType.fixed:
        return 'Fixed';
      case RateType.split:
        return 'Split';
    }
  }
}

@immutable
class LoanProduct {
  const LoanProduct({
    required this.id,
    required this.lenderId,
    required this.lenderBrand,
    required this.lenderGroup,
    required this.productName,
    required this.type,
    required this.rateType,
    required this.advertisedRate,
    required this.comparisonRate,
    required this.version,
    required this.lastVerified,
    this.repaymentType = RepaymentType.principalAndInterest,
    this.upfrontFee = 0,
    this.annualFee = 0,
    this.monthlyFee = 0,
    this.dischargeFee = 0,
    this.maxLvr,
    this.minLoanAmount,
    this.maxLoanAmount,
    this.termYears,
    this.hasOffset = false,
    this.hasRedraw = false,
    this.isPackage = false,
    this.isSecured,
    this.cashback,
    this.features = const <String>[],
    this.conditions = const <String>[],
    this.ownerOccupied = true,
    this.forRefinance = true,
    this.fixedTermYears,
    this.publishedCriteria = const <String>[],
  });

  final String id;
  final String lenderId;
  final String lenderBrand;
  final LenderGroup lenderGroup;
  final String productName;
  final LoanProductType type;
  final RateType rateType;
  final double advertisedRate;
  final double comparisonRate;
  final String version;
  final DateTime lastVerified;
  final RepaymentType repaymentType;
  final double upfrontFee;
  final double annualFee;
  final double monthlyFee;
  final double dischargeFee;
  final double? maxLvr;
  final double? minLoanAmount;
  final double? maxLoanAmount;
  final int? termYears;
  final bool hasOffset;
  final bool hasRedraw;
  final bool isPackage;
  final bool? isSecured;
  final double? cashback;
  final List<String> features;
  final List<String> conditions;
  final bool ownerOccupied;
  final bool forRefinance;
  final int? fixedTermYears;
  final List<String> publishedCriteria;

  double get knownFeesFirstYear => upfrontFee + annualFee + (monthlyFee * 12);
}

enum LoanRankingObjective {
  lowestTotalCost,
  lowestAdvertisedRate,
  lowestComparisonRate,
  lowestKnownFees,
  retainsFeatures,
}

extension LoanRankingObjectiveX on LoanRankingObjective {
  String get label {
    switch (this) {
      case LoanRankingObjective.lowestTotalCost:
        return 'Lowest estimated total cost';
      case LoanRankingObjective.lowestAdvertisedRate:
        return 'Lowest advertised rate';
      case LoanRankingObjective.lowestComparisonRate:
        return 'Lowest published comparison rate';
      case LoanRankingObjective.lowestKnownFees:
        return 'Lowest known fees';
      case LoanRankingObjective.retainsFeatures:
        return 'Keeps my selected features';
    }
  }
}

@immutable
class LoanLensFilters {
  const LoanLensFilters({
    this.objective = LoanRankingObjective.lowestTotalCost,
    this.productType = LoanProductType.homeLoan,
    this.groups = const <LenderGroup>{
      LenderGroup.majorBank,
      LenderGroup.otherAdi,
      LenderGroup.customerOwned,
      LenderGroup.nonBank,
    },
    this.loanAmount = 620000,
    this.propertyValue = 850000,
    this.termYears = 27,
    this.rateType,
    this.repaymentType = RepaymentType.principalAndInterest,
    this.ownerOccupied = true,
    this.requiredFeatures = const <String>{},
    this.horizonYears = 5,
    this.acceptsDigitalOnly = true,
    this.needsBranchAccess = false,
  });

  final LoanRankingObjective objective;
  final LoanProductType productType;
  final Set<LenderGroup> groups;
  final double loanAmount;
  final double propertyValue;
  final int termYears;
  final RateType? rateType;
  final RepaymentType repaymentType;
  final bool ownerOccupied;
  final Set<String> requiredFeatures;
  final int horizonYears;
  final bool acceptsDigitalOnly;
  final bool needsBranchAccess;

  double get lvr => propertyValue == 0 ? 0 : (loanAmount / propertyValue) * 100;

  LoanLensFilters copyWith({
    LoanRankingObjective? objective,
    LoanProductType? productType,
    Set<LenderGroup>? groups,
    double? loanAmount,
    double? propertyValue,
    int? termYears,
    RateType? rateType,
    RepaymentType? repaymentType,
    bool? ownerOccupied,
    Set<String>? requiredFeatures,
    int? horizonYears,
    bool? acceptsDigitalOnly,
    bool? needsBranchAccess,
  }) {
    return LoanLensFilters(
      objective: objective ?? this.objective,
      productType: productType ?? this.productType,
      groups: groups ?? this.groups,
      loanAmount: loanAmount ?? this.loanAmount,
      propertyValue: propertyValue ?? this.propertyValue,
      termYears: termYears ?? this.termYears,
      rateType: rateType ?? this.rateType,
      repaymentType: repaymentType ?? this.repaymentType,
      ownerOccupied: ownerOccupied ?? this.ownerOccupied,
      requiredFeatures: requiredFeatures ?? this.requiredFeatures,
      horizonYears: horizonYears ?? this.horizonYears,
      acceptsDigitalOnly: acceptsDigitalOnly ?? this.acceptsDigitalOnly,
      needsBranchAccess: needsBranchAccess ?? this.needsBranchAccess,
    );
  }
}

/// A product ranked against the user's chosen objective. Wording throughout is
/// factual: no product is described as suitable or recommended.
@immutable
class LoanLensMatch {
  const LoanLensMatch({
    required this.product,
    required this.rank,
    required this.monthlyRepayment,
    required this.estimatedTotalCost,
    required this.knownFees,
    required this.matchReasons,
    this.eligibilityAssessed = false,
    this.monthlyDifferenceVsCurrent,
    this.annualDifferenceVsCurrent,
    this.breakEvenMonths,
  });

  final LoanProduct product;
  final int rank;
  final double monthlyRepayment;
  final double estimatedTotalCost;
  final double knownFees;
  final List<String> matchReasons;
  final bool eligibilityAssessed;
  final double? monthlyDifferenceVsCurrent;
  final double? annualDifferenceVsCurrent;
  final int? breakEvenMonths;
}

@immutable
class LoanLensResult {
  const LoanLensResult({
    required this.filters,
    required this.matches,
    required this.meta,
    required this.coverageNote,
    required this.currentLoanRepayment,
    required this.currentLoanRate,
    this.marketViewLowestByGroup = const <LenderGroup, LoanLensMatch>{},
    this.broaderMarketNotice,
  });

  final LoanLensFilters filters;
  final List<LoanLensMatch> matches;
  final CalculationMeta meta;
  final String coverageNote;
  final double currentLoanRepayment;
  final double currentLoanRate;
  final Map<LenderGroup, LoanLensMatch> marketViewLowestByGroup;
  final String? broaderMarketNotice;
}
