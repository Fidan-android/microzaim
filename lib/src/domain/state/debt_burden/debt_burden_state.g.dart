// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'debt_burden_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$DebtBurdenState on DebtBurdenStateBase, Store {
  late final _$errorMessageAtom =
      Atom(name: 'DebtBurdenStateBase.errorMessage', context: context);

  @override
  String get errorMessage {
    _$errorMessageAtom.reportRead();
    return super.errorMessage;
  }

  @override
  set errorMessage(String value) {
    _$errorMessageAtom.reportWrite(value, super.errorMessage, () {
      super.errorMessage = value;
    });
  }

  late final _$selectedTypeTermAtom =
      Atom(name: 'DebtBurdenStateBase.selectedTypeTerm', context: context);

  @override
  String get selectedTypeTerm {
    _$selectedTypeTermAtom.reportRead();
    return super.selectedTypeTerm;
  }

  @override
  set selectedTypeTerm(String value) {
    _$selectedTypeTermAtom.reportWrite(value, super.selectedTypeTerm, () {
      super.selectedTypeTerm = value;
    });
  }

  late final _$countOfAverageIncomesAtom =
      Atom(name: 'DebtBurdenStateBase.countOfAverageIncomes', context: context);

  @override
  int get countOfAverageIncomes {
    _$countOfAverageIncomesAtom.reportRead();
    return super.countOfAverageIncomes;
  }

  @override
  set countOfAverageIncomes(int value) {
    _$countOfAverageIncomesAtom.reportWrite(value, super.countOfAverageIncomes,
        () {
      super.countOfAverageIncomes = value;
    });
  }

  late final _$paymentAtom =
      Atom(name: 'DebtBurdenStateBase.payment', context: context);

  @override
  int get payment {
    _$paymentAtom.reportRead();
    return super.payment;
  }

  @override
  set payment(int value) {
    _$paymentAtom.reportWrite(value, super.payment, () {
      super.payment = value;
    });
  }

  late final _$averageIncomeAtom =
      Atom(name: 'DebtBurdenStateBase.averageIncome', context: context);

  @override
  int get averageIncome {
    _$averageIncomeAtom.reportRead();
    return super.averageIncome;
  }

  @override
  set averageIncome(int value) {
    _$averageIncomeAtom.reportWrite(value, super.averageIncome, () {
      super.averageIncome = value;
    });
  }

  late final _$debtBurdenAtom =
      Atom(name: 'DebtBurdenStateBase.debtBurden', context: context);

  @override
  int get debtBurden {
    _$debtBurdenAtom.reportRead();
    return super.debtBurden;
  }

  @override
  set debtBurden(int value) {
    _$debtBurdenAtom.reportWrite(value, super.debtBurden, () {
      super.debtBurden = value;
    });
  }

  late final _$monthlyIncomeAtom =
      Atom(name: 'DebtBurdenStateBase.monthlyIncome', context: context);

  @override
  int get monthlyIncome {
    _$monthlyIncomeAtom.reportRead();
    return super.monthlyIncome;
  }

  @override
  set monthlyIncome(int value) {
    _$monthlyIncomeAtom.reportWrite(value, super.monthlyIncome, () {
      super.monthlyIncome = value;
    });
  }

  late final _$isSavedAtom =
      Atom(name: 'DebtBurdenStateBase.isSaved', context: context);

  @override
  bool get isSaved {
    _$isSavedAtom.reportRead();
    return super.isSaved;
  }

  @override
  set isSaved(bool value) {
    _$isSavedAtom.reportWrite(value, super.isSaved, () {
      super.isSaved = value;
    });
  }

  late final _$DebtBurdenStateBaseActionController =
      ActionController(name: 'DebtBurdenStateBase', context: context);

  @override
  void selectTypeTerm(String type) {
    final _$actionInfo = _$DebtBurdenStateBaseActionController.startAction(
        name: 'DebtBurdenStateBase.selectTypeTerm');
    try {
      return super.selectTypeTerm(type);
    } finally {
      _$DebtBurdenStateBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateCountOfAverageIncomes(String termOfDebt) {
    final _$actionInfo = _$DebtBurdenStateBaseActionController.startAction(
        name: 'DebtBurdenStateBase.updateCountOfAverageIncomes');
    try {
      return super.updateCountOfAverageIncomes(termOfDebt);
    } finally {
      _$DebtBurdenStateBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clearCalculations() {
    final _$actionInfo = _$DebtBurdenStateBaseActionController.startAction(
        name: 'DebtBurdenStateBase.clearCalculations');
    try {
      return super.clearCalculations();
    } finally {
      _$DebtBurdenStateBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void doCalculations(String amountDebt, String termOfDebt, String percentage) {
    final _$actionInfo = _$DebtBurdenStateBaseActionController.startAction(
        name: 'DebtBurdenStateBase.doCalculations');
    try {
      return super.doCalculations(amountDebt, termOfDebt, percentage);
    } finally {
      _$DebtBurdenStateBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void saveCalculation() {
    final _$actionInfo = _$DebtBurdenStateBaseActionController.startAction(
        name: 'DebtBurdenStateBase.saveCalculation');
    try {
      return super.saveCalculation();
    } finally {
      _$DebtBurdenStateBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
errorMessage: ${errorMessage},
selectedTypeTerm: ${selectedTypeTerm},
countOfAverageIncomes: ${countOfAverageIncomes},
payment: ${payment},
averageIncome: ${averageIncome},
debtBurden: ${debtBurden},
monthlyIncome: ${monthlyIncome},
isSaved: ${isSaved}
    ''';
  }
}
