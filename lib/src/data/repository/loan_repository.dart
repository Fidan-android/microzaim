import 'package:hive/hive.dart';
import 'package:microzaim/src/data/models/loan/loan_model.dart';
import 'package:microzaim/src/domain/repository/i_loan_repository.dart';
import 'package:microzaim/src/helper/result.dart';

class LoanRepository extends ILoanRepository {
  final _loansBox = Hive.box<LoanModel>('loan_box');

  @override
  Result<List<LoanModel>> getLoans() {
    return Result.success(_loansBox.values.toList());
  }

  @override
  Future<Result<List<LoanModel>>> removeLoan(LoanModel model) async {
    await _loansBox.delete(model);
    return Result.success(_loansBox.values.toList());
  }

  @override
  Future<bool> saveLoan(LoanModel model) async {
    await _loansBox.add(model);
    return true;
  }
}
