import 'package:microzaim/src/data/models/loan/loan_model.dart';
import 'package:microzaim/src/helper/result.dart';

abstract class ILoanRepository {
  Result<List<LoanModel>> getLoans();

  Future<bool> saveLoan(LoanModel model);

  Future<Result<List<LoanModel>>> removeLoan(LoanModel model);
}
