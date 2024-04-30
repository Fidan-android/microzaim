import 'package:microzaim/src/data/models/calculation/calculation_model.dart';
import 'package:microzaim/src/data/models/loan/loan_model.dart';
import 'package:microzaim/src/data/repository/lender_repository.dart';
import 'package:microzaim/src/data/repository/loan_repository.dart';
import 'package:mobx/mobx.dart';

part 'calculators_state.g.dart';

class LoanState = LoanStateBase with _$LoanState;

abstract class LoanStateBase with Store {
  LoanStateBase(this._lenderRepository, this._loanRepository);

  final LenderRepository _lenderRepository;
  final LoanRepository _loanRepository;

  @observable
  ObservableList<String> loans = ObservableList.of([]);

  @observable
  ObservableList<String> debts = ObservableList.of([]);


}
