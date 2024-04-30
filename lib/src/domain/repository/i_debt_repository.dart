import 'package:microzaim/src/data/models/debt/debt_model.dart';
import 'package:microzaim/src/helper/result.dart';

abstract class IDebtRepository {
  Result<List<DebtModel>> getDebts();

  Future<bool> saveDebt(DebtModel model);

  Future<Result<List<DebtModel>>> removeDebt(DebtModel model);
}
