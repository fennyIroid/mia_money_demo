import 'package:injectable/injectable.dart';

import '../dummy/dummy_energy.dart';
import '../dummy/dummy_loans.dart';
import '../models/energy_models.dart';
import '../models/loan_models.dart';
import 'user_repository.dart' show kDummyLatency;

abstract class PowerLensRepository {
  Future<List<ServicePoint>> fetchServicePoints();

  Future<List<EnergyAccountRecord>> fetchEnergyAccounts();

  Future<List<EnergyBillRecord>> fetchEnergyBills();

  Future<PowerLensResult> runComparison(String servicePointId);
}

@LazySingleton(as: PowerLensRepository)
class DummyPowerLensRepository implements PowerLensRepository {
  @override
  Future<List<ServicePoint>> fetchServicePoints() async {
    await Future<void>.delayed(kDummyLatency);
    return DummyEnergy.servicePoints;
  }

  @override
  Future<List<EnergyAccountRecord>> fetchEnergyAccounts() async {
    await Future<void>.delayed(kDummyLatency);
    return DummyEnergy.energyAccounts;
  }

  @override
  Future<List<EnergyBillRecord>> fetchEnergyBills() async {
    await Future<void>.delayed(kDummyLatency);
    return DummyEnergy.energyBills;
  }

  @override
  Future<PowerLensResult> runComparison(String servicePointId) async {
    await Future<void>.delayed(const Duration(milliseconds: 620));
    return DummyEnergy.result;
  }
}

abstract class LoanLensRepository {
  Future<List<Lender>> fetchLenders();

  Future<List<LoanProduct>> fetchCatalogue(LoanProductType type);

  Future<LoanLensResult> runComparison(LoanLensFilters filters);
}

@LazySingleton(as: LoanLensRepository)
class DummyLoanLensRepository implements LoanLensRepository {
  @override
  Future<List<Lender>> fetchLenders() async {
    await Future<void>.delayed(kDummyLatency);
    return DummyLoans.lenders;
  }

  @override
  Future<List<LoanProduct>> fetchCatalogue(LoanProductType type) async {
    await Future<void>.delayed(kDummyLatency);
    return type == LoanProductType.homeLoan
        ? DummyLoans.homeLoans
        : DummyLoans.personalLoans;
  }

  @override
  Future<LoanLensResult> runComparison(LoanLensFilters filters) async {
    await Future<void>.delayed(const Duration(milliseconds: 520));
    return DummyLoans.resultFor(filters);
  }
}
