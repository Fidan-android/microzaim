import 'package:microzaim/src/data/models/debt/debt_model.dart';
import 'package:microzaim/src/data/models/loan/loan_model.dart';
import 'package:microzaim/src/helper/result.dart';

abstract class IImportRepository {
  Result<List<LoanModel>> getImportLoans();

  Result<List<DebtModel>> getImportDebts();

  Future<bool> saveImportLoan(LoanModel model);

  Future<bool> saveImportDebt(DebtModel model);

  Future<Result<List<LoanModel>>> removeImportLoan(LoanModel model);

  Future<Result<List<DebtModel>>> removeImportDebt(DebtModel model);
}
