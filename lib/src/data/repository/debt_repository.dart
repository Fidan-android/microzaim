import 'package:hive/hive.dart';
import 'package:microzaim/src/data/models/debt/debt_model.dart';
import 'package:microzaim/src/data/models/loan/loan_model.dart';
import 'package:microzaim/src/domain/repository/i_debt_repository.dart';
import 'package:microzaim/src/domain/repository/i_loan_repository.dart';
import 'package:microzaim/src/helper/result.dart';

class DebtRepository extends IDebtRepository {
  final _debtsBox = Hive.box<DebtModel>('debt_box');

  @override
  Result<List<DebtModel>> getDebts() {
    return Result.success(_debtsBox.values.toList());
  }

  @override
  Future<bool> saveDebt(DebtModel model) async {
    await _debtsBox.add(model);
    return true;
  }

  @override
  Future<Result<List<DebtModel>>> removeDebt(DebtModel model) async {
    await _debtsBox.delete(model);
    return Result.success(_debtsBox.values.toList());
  }
}
