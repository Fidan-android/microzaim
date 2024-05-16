import 'package:microzaim/src/data/models/debt/debt_model.dart';
import 'package:microzaim/src/data/models/loan/loan_model.dart';
import 'package:microzaim/src/helper/result.dart';

abstract class IImportRepository {
  Result<List<LoanModel>> getImportLoans();

  Result<List<DebtModel>> getImportDebts();

  Future<bool> saveImportLoan(LoanModel model);

  Future<bool> saveImportDebt(DebtModel model);

  Future updateImportLoan(LoanModel model, bool isImported);

  Future updateImportDebt(DebtModel model, bool isImported);

  Future removeImportLoan(LoanModel model);

  Future removeImportDebt(DebtModel model);
}
