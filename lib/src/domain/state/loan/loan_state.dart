import 'package:microzaim/src/data/models/calculation/calculation_model.dart';
import 'package:microzaim/src/data/models/loan/loan_model.dart';
import 'package:microzaim/src/data/repository/lender_repository.dart';
import 'package:microzaim/src/data/repository/loan_repository.dart';
import 'package:mobx/mobx.dart';

part 'loan_state.g.dart';

class LoanState = LoanStateBase with _$LoanState;

abstract class LoanStateBase with Store {
  LoanStateBase(this._lenderRepository, this._loanRepository);

  final LenderRepository _lenderRepository;
  final LoanRepository _loanRepository;

  @observable
  ObservableList<String> lenders = ObservableList.of([]);

  @action
  void searchLender(String query) {
    if (query.isNotEmpty) {
      lenders.clear();
      lenders.addAll(_lenderRepository.getLendersByQuery(query));
    } else {
      lenders.clear();
    }
  }

  @action
  void onChangeItem(int index) {
    lenders.clear();
  }

  @observable
  double totalToRefunded = 0;

  @observable
  double overpayment = 0;

  @observable
  String errorMessage = "";

  @observable
  ObservableList<CalculationModel> calculations = ObservableList.of([]);

  @action
  void doCalculations(String selectedLender, String amountLoan, String termLoan,
      String percentagePerDay) {
    if (selectedLender.isEmpty ||
        amountLoan.isEmpty ||
        termLoan.isEmpty ||
        percentagePerDay.isEmpty) {
      errorMessage = "Заполните все поля";
      return;
    }

    errorMessage = "";
    calculations.clear();

    overpayment = (double.parse(amountLoan) * double.parse(percentagePerDay)) /
        100 *
        int.parse(termLoan);
    totalToRefunded = double.parse(amountLoan) + overpayment;

    for (var i = 1; i <= int.parse(termLoan); i++) {
      calculations.add(CalculationModel(
          day: i,
          dailyPayment: (totalToRefunded / double.parse(termLoan)).round(),
          percent: (double.parse(percentagePerDay) * 100).round(),
          mainDebt: (double.parse(amountLoan) / double.parse(termLoan)).round(),
          outstandingBalance: (totalToRefunded -
                  (totalToRefunded / double.parse(termLoan)).round() * i)
              .round()));
    }
  }

  @observable
  bool isSaved = false;

  @action
  void saveCalculation(String selectedLender) {
    if (calculations.isEmpty) {
      errorMessage = "Вы не выполнили расчеты";
      return;
    }

    _loanRepository
        .saveLoan(LoanModel(
            lender: selectedLender,
            totalToRefunded: totalToRefunded.ceil(),
            overpayment: overpayment.ceil(),
            calculations: calculations))
        .then((value) => isSaved = value);
  }
}
