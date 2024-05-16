import 'dart:math';

import 'package:microzaim/src/data/models/debt/debt_model.dart';
import 'package:microzaim/src/data/repository/debt_repository.dart';
import 'package:mobx/mobx.dart';

part 'debt_burden_state.g.dart';

class DebtBurdenState = DebtBurdenStateBase with _$DebtBurdenState;

abstract class DebtBurdenStateBase with Store {
  DebtBurdenStateBase(this._debtRepository);

  final DebtRepository _debtRepository;

  @observable
  String errorMessage = "";

  @observable
  String selectedTypeTerm = "Год";

  @observable
  int countOfAverageIncomes = 1;

  Map<int, int> averageIncomes = Map.of({});

  @action
  void selectTypeTerm(String type) {
    selectedTypeTerm = type;
    averageIncomes.clear();
    countOfAverageIncomes = 1;
  }

  @action
  void updateCountOfAverageIncomes(String termOfDebt) {
    clearCalculations();
    if (termOfDebt.isEmpty) {
      countOfAverageIncomes = 1;
    } else {
      if (selectedTypeTerm == "Год") {
        countOfAverageIncomes = int.parse(termOfDebt);
      } else {
        countOfAverageIncomes = (double.parse(termOfDebt) / 12).ceil();
      }
    }
  }

  void updateIncomes(int index, String value) {
    if (value.isEmpty) {
      averageIncomes.remove(index);
      return;
    }
    averageIncomes[index] = int.parse(value);
    clearCalculations();
  }

  @action
  void clearCalculations() {
    errorMessage = "";
    payment = 0;
    averageIncome = 0;
    debtBurden = 0;
    monthlyIncome = 0;
  }

  @observable
  int payment = 0;

  @observable
  int averageIncome = 0;

  @observable
  int debtBurden = 0;

  @observable
  int monthlyIncome = 0;

  @action
  void doCalculations(String amountDebt, String termOfDebt, String percentage) {
    if (amountDebt.isEmpty || percentage.isEmpty) {
      errorMessage = "Заполните все поля";
      return;
    }

    if (selectedTypeTerm == "Год") {
      if (averageIncomes.length < int.parse(termOfDebt)) {
        errorMessage = "Заполните все поля";
        return;
      }
    } else {
      if (averageIncomes.length < (int.parse(termOfDebt) / 12.0).ceil()) {
        errorMessage = "Заполните все поля";
        return;
      }
    }

    clearCalculations();

    int S = int.parse(amountDebt);
    num r = int.parse(percentage) / 12 / 100;
    int countOfPayments = selectedTypeTerm == "Год"
        ? averageIncomes.length * 12
        : int.parse(termOfDebt);

    payment = (S *
            ((r * pow(1 + r, countOfPayments)) /
                (pow(1 + r, countOfPayments) - 1)))
        .ceil();

    averageIncome = (averageIncomes.values.fold(0, (i, el) {
              return i + el;
            }) /
            averageIncomes.length)
        .ceil();

    debtBurden = (payment / averageIncome * 100).ceil();

    monthlyIncome = averageIncome - payment;
  }

  @observable
  bool isSaved = false;

  @action
  void saveCalculation() {
    if (payment == 0 ||
        averageIncome == 0 ||
        debtBurden == 0 ||
        monthlyIncome == 0) {
      errorMessage = "Вы еще не провели расчеты";
      return;
    }

    _debtRepository
        .saveDebt(DebtModel(
            payment: payment,
            averageIncome: averageIncome,
            debtBurden: debtBurden,
            monthlyIncome: monthlyIncome,
            title: "Расчет ${_debtRepository.getDebts().length + 1}",
            countOfMonth: countOfAverageIncomes * 12))
        .then((value) => isSaved = value);
  }
}
