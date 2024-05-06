import 'package:microzaim/src/data/models/debt/debt_model.dart';
import 'package:microzaim/src/data/models/loan/loan_model.dart';
import 'package:microzaim/src/data/repository/import_repository.dart';
import 'package:mobx/mobx.dart';

part 'calculations_state.g.dart';

class CalculationsState = CalculationsStateBase with _$CalculationsState;

abstract class CalculationsStateBase with Store {
  CalculationsStateBase(this._importRepository);

  final ImportRepository _importRepository;

  @observable
  bool isSaved = false;

  @action
  void saveLoanToImport(LoanModel model) {
    _importRepository.saveImportLoan(model).then((value) => isSaved = value);
  }

  @action
  void saveDebtToImport(DebtModel model) {
    _importRepository.saveImportDebt(model).then((value) => isSaved = value);
  }
}
