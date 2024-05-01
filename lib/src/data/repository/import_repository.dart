import 'package:hive/hive.dart';
import 'package:microzaim/src/data/models/debt/debt_model.dart';
import 'package:microzaim/src/data/models/loan/loan_model.dart';
import 'package:microzaim/src/domain/repository/i_debt_repository.dart';
import 'package:microzaim/src/domain/repository/i_import_repository.dart';
import 'package:microzaim/src/domain/repository/i_loan_repository.dart';
import 'package:microzaim/src/helper/result.dart';

class ImportRepository extends IImportRepository {
  final _importLoanBox = Hive.box<LoanModel>('import_loan');
  final _importDebtBox = Hive.box<DebtModel>('import_debt');

  @override
  Result<List<DebtModel>> getImportDebts() {
    return Result.success(_importDebtBox.values.toList());
  }

  @override
  Future<bool> saveImportDebt(DebtModel model) async {
    await _importDebtBox.add(model);
    return true;
  }

  @override
  Future<Result<List<DebtModel>>> removeImportDebt(DebtModel model) async {
    await _importDebtBox.delete(model);
    return Result.success(_importDebtBox.values.toList());
  }

  @override
  Result<List<LoanModel>> getImportLoans() {
    return Result.success(_importLoanBox.values.toList());
  }

  @override
  Future<Result<List<LoanModel>>> removeImportLoan(LoanModel model) async {
    await _importLoanBox.delete(model);
    return Result.success(_importLoanBox.values.toList());
  }

  @override
  Future<bool> saveImportLoan(LoanModel model) async {
    await _importLoanBox.add(model);
    return true;
  }
}
