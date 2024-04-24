import 'package:microzaim/src/data/repository/lender_repository.dart';
import 'package:microzaim/src/domain/models/calculation_model/calculation_model.dart';
import 'package:mobx/mobx.dart';

part 'loan_state.g.dart';

class LoanState = LoanStateBase with _$LoanState;

abstract class LoanStateBase with Store {
  LoanStateBase(this._lenderRepository);

  final LenderRepository _lenderRepository;

  @observable
  ObservableList<String> lenders = ObservableList.of([]);

  @observable
  String selectedLender = "";

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
    selectedLender = lenders[index];
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
  void doCalculations(
      String amountLoan, String termLoan, String percentagePerDay) {
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
}
