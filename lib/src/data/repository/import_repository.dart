import 'package:hive/hive.dart';
import 'package:microzaim/src/data/models/debt/debt_model.dart';
import 'package:microzaim/src/data/models/loan/loan_model.dart';
import 'package:microzaim/src/domain/repository/i_import_repository.dart';
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
    if (_importDebtBox.values.contains(model)) {
      return false;
    }
    await _importDebtBox.add(model);
    return true;
  }

  @override
  Future removeImportDebt(DebtModel model) async {
    int index = _importDebtBox.values.toList().indexOf(model);
    await _importDebtBox.deleteAt(index);
  }

  @override
  Result<List<LoanModel>> getImportLoans() {
    return Result.success(_importLoanBox.values.toList());
  }

  @override
  Future removeImportLoan(LoanModel model) async {
    int index = _importLoanBox.values.toList().indexOf(model);
    await _importLoanBox.deleteAt(index);
  }

  @override
  Future<bool> saveImportLoan(LoanModel model) async {
    if (_importLoanBox.values.contains(model)) {
      return false;
    }
    await _importLoanBox.add(model);
    return true;
  }

  @override
  Future updateImportDebt(DebtModel model, bool isImported) async {
    int index = _importDebtBox.values.toList().indexOf(model);
    await _importDebtBox.deleteAt(index);
    model.imported = isImported;
    await _importDebtBox.putAt(index, model);
  }

  @override
  Future updateImportLoan(LoanModel model, bool isImported) async {
    int index = _importLoanBox.values.toList().indexOf(model);
    await _importLoanBox.deleteAt(index);
    model.imported = isImported;
    await _importLoanBox.putAt(index, model);
  }
}
