import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';
import 'core_models.dart';

enum TariffType { flat, blockTier, timeOfUse, seasonal, demand, controlledLoad }

extension TariffTypeX on TariffType {
  String get label {
    switch (this) {
      case TariffType.flat:
        return 'Single rate';
      case TariffType.blockTier:
        return 'Block tiers';
      case TariffType.timeOfUse:
        return 'Time of use';
      case TariffType.seasonal:
        return 'Seasonal';
      case TariffType.demand:
        return 'Demand';
      case TariffType.controlledLoad:
        return 'Controlled load';
    }
  }
}

@immutable
class ServicePoint {
  const ServicePoint({
    required this.id,
    required this.address,
    required this.nmi,
    required this.meterType,
    required this.retailer,
    required this.hasIntervalData,
    this.hasSolar = false,
    this.hasControlledLoad = false,
    this.hasBattery = false,
    this.owner = 'You',
    this.distributionZone,
    this.postcode,
  });

  final String id;
  final String address;
  final String nmi;
  final String meterType;
  final String retailer;
  final bool hasIntervalData;
  final bool hasSolar;
  final bool hasControlledLoad;
  final bool hasBattery;
  final String owner;
  final String? distributionZone;
  final String? postcode;
}

@immutable
class UsageMonth {
  const UsageMonth({
    required this.label,
    required this.kwh,
    required this.isEstimated,
    this.solarExportKwh = 0,
    this.controlledLoadKwh = 0,
    this.missingIntervals = 0,
    this.peakKwh,
    this.shoulderKwh,
    this.offPeakKwh,
  });

  final String label;
  final double kwh;
  final bool isEstimated;
  final double solarExportKwh;
  final double controlledLoadKwh;
  final int missingIntervals;
  final double? peakKwh;
  final double? shoulderKwh;
  final double? offPeakKwh;
}

@immutable
class EnergyAccountRecord {
  const EnergyAccountRecord({
    required this.id,
    required this.retailer,
    required this.accountNumberMasked,
    required this.status,
    required this.consentExpiry,
    required this.freshness,
    required this.servicePointIds,
    this.owner = 'You',
    this.lastSync,
  });

  final String id;
  final String retailer;
  final String accountNumberMasked;
  final String status;
  final DateTime consentExpiry;
  final DataFreshness freshness;
  final List<String> servicePointIds;
  final String owner;
  final DateTime? lastSync;
}

@immutable
class EnergyBillRecord {
  const EnergyBillRecord({
    required this.id,
    required this.retailer,
    required this.issueDate,
    required this.servicePeriod,
    required this.total,
    required this.usageComponent,
    required this.supplyComponent,
    required this.isPaid,
    this.solarCredit = 0,
    this.documentId,
    this.source = ValueSource.provider,
  });

  final String id;
  final String retailer;
  final DateTime issueDate;
  final String servicePeriod;
  final double total;
  final double usageComponent;
  final double supplyComponent;
  final bool isPaid;
  final double solarCredit;
  final String? documentId;
  final ValueSource source;
}

@immutable
class TariffComponent {
  const TariffComponent({
    required this.label,
    required this.rate,
    required this.unit,
    this.window,
  });

  final String label;
  final double rate;
  final String unit;
  final String? window;
}

@immutable
class EnergyPlan {
  const EnergyPlan({
    required this.id,
    required this.retailer,
    required this.planName,
    required this.tariffType,
    required this.dailySupplyCents,
    required this.components,
    required this.version,
    required this.effectiveFrom,
    this.solarFeedInCents,
    this.discountNote,
    this.conditions = const <String>[],
    this.membershipRequired = false,
    this.eligibilityNote,
    this.benefitPeriodMonths,
    this.exitFee = 0,
    this.isCurrentPlan = false,
  });

  final String id;
  final String retailer;
  final String planName;
  final TariffType tariffType;
  final double dailySupplyCents;
  final List<TariffComponent> components;
  final String version;
  final DateTime effectiveFrom;
  final double? solarFeedInCents;
  final String? discountNote;
  final List<String> conditions;
  final bool membershipRequired;
  final String? eligibilityNote;
  final int? benefitPeriodMonths;
  final double exitFee;
  final bool isCurrentPlan;
}

enum PlanEligibility { eligible, uncertain, ineligible }

extension PlanEligibilityX on PlanEligibility {
  String get label {
    switch (this) {
      case PlanEligibility.eligible:
        return 'Eligible';
      case PlanEligibility.uncertain:
        return 'Eligibility unclear';
      case PlanEligibility.ineligible:
        return 'Not available here';
    }
  }

  Color get color {
    switch (this) {
      case PlanEligibility.eligible:
        return AppColors.positive;
      case PlanEligibility.uncertain:
        return AppColors.caution;
      case PlanEligibility.ineligible:
        return AppColors.negative;
    }
  }
}

/// One plan costed against the customer's own usage window.
@immutable
class PowerLensCandidate {
  const PowerLensCandidate({
    required this.plan,
    required this.estimatedAnnualCost,
    required this.eligibility,
    required this.usageCharges,
    required this.supplyCharges,
    required this.breakdown,
    this.solarCredits = 0,
    this.discounts = 0,
    this.fees = 0,
    this.rank = 0,
  });

  final EnergyPlan plan;
  final double estimatedAnnualCost;
  final PlanEligibility eligibility;
  final double usageCharges;
  final double supplyCharges;
  final List<TariffComponent> breakdown;
  final double solarCredits;
  final double discounts;
  final double fees;
  final int rank;

  double get estimatedMonthlyCost => estimatedAnnualCost / 12;
}

@immutable
class PowerLensResult {
  const PowerLensResult({
    required this.servicePoint,
    required this.currentPlanCost,
    required this.candidates,
    required this.usageWindowLabel,
    required this.usageMonths,
    required this.meta,
    required this.marketCoverageNote,
    required this.coveragePercent,
  });

  final ServicePoint servicePoint;
  final PowerLensCandidate currentPlanCost;
  final List<PowerLensCandidate> candidates;
  final String usageWindowLabel;
  final List<UsageMonth> usageMonths;
  final CalculationMeta meta;
  final String marketCoverageNote;
  final double coveragePercent;

  List<PowerLensCandidate> get lowestThree => candidates
      .where(
        (PowerLensCandidate c) => c.eligibility != PlanEligibility.ineligible,
      )
      .take(3)
      .toList();

  double get bestSaving => candidates.isEmpty
      ? 0
      : currentPlanCost.estimatedAnnualCost -
            candidates.first.estimatedAnnualCost;

  double? get bestSavingPercent => currentPlanCost.estimatedAnnualCost == 0
      ? null
      : (bestSaving / currentPlanCost.estimatedAnnualCost) * 100;

  double get totalUsageKwh =>
      usageMonths.fold<double>(0, (double s, UsageMonth m) => s + m.kwh);
}
