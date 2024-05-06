import 'package:microzaim/src/data/models/debt/debt_model.dart';

abstract class IDebtRepository {
  List<DebtModel> getDebts();

  Future<bool> saveDebt(DebtModel model);

  Future<List<DebtModel>> removeDebt(DebtModel model);
}
