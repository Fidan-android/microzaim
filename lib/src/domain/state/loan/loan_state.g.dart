// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'loan_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$LoanState on LoanStateBase, Store {
  late final _$lendersAtom =
      Atom(name: 'LoanStateBase.lenders', context: context);

  @override
  ObservableList<String> get lenders {
    _$lendersAtom.reportRead();
    return super.lenders;
  }

  @override
  set lenders(ObservableList<String> value) {
    _$lendersAtom.reportWrite(value, super.lenders, () {
      super.lenders = value;
    });
  }

  late final _$totalToRefundedAtom =
      Atom(name: 'LoanStateBase.totalToRefunded', context: context);

  @override
  double get totalToRefunded {
    _$totalToRefundedAtom.reportRead();
    return super.totalToRefunded;
  }

  @override
  set totalToRefunded(double value) {
    _$totalToRefundedAtom.reportWrite(value, super.totalToRefunded, () {
      super.totalToRefunded = value;
    });
  }

  late final _$overpaymentAtom =
      Atom(name: 'LoanStateBase.overpayment', context: context);

  @override
  double get overpayment {
    _$overpaymentAtom.reportRead();
    return super.overpayment;
  }

  @override
  set overpayment(double value) {
    _$overpaymentAtom.reportWrite(value, super.overpayment, () {
      super.overpayment = value;
    });
  }

  late final _$errorMessageAtom =
      Atom(name: 'LoanStateBase.errorMessage', context: context);

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

  late final _$calculationsAtom =
      Atom(name: 'LoanStateBase.calculations', context: context);

  @override
  ObservableList<CalculationModel> get calculations {
    _$calculationsAtom.reportRead();
    return super.calculations;
  }

  @override
  set calculations(ObservableList<CalculationModel> value) {
    _$calculationsAtom.reportWrite(value, super.calculations, () {
      super.calculations = value;
    });
  }

  late final _$isSavedAtom =
      Atom(name: 'LoanStateBase.isSaved', context: context);

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

  late final _$LoanStateBaseActionController =
      ActionController(name: 'LoanStateBase', context: context);

  @override
  void searchLender(String query) {
    final _$actionInfo = _$LoanStateBaseActionController.startAction(
        name: 'LoanStateBase.searchLender');
    try {
      return super.searchLender(query);
    } finally {
      _$LoanStateBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void onChangeItem(int index) {
    final _$actionInfo = _$LoanStateBaseActionController.startAction(
        name: 'LoanStateBase.onChangeItem');
    try {
      return super.onChangeItem(index);
    } finally {
      _$LoanStateBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void doCalculations(String selectedLender, String amountLoan, String termLoan,
      String percentagePerDay) {
    final _$actionInfo = _$LoanStateBaseActionController.startAction(
        name: 'LoanStateBase.doCalculations');
    try {
      return super.doCalculations(
          selectedLender, amountLoan, termLoan, percentagePerDay);
    } finally {
      _$LoanStateBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void saveCalculation(String selectedLender) {
    final _$actionInfo = _$LoanStateBaseActionController.startAction(
        name: 'LoanStateBase.saveCalculation');
    try {
      return super.saveCalculation(selectedLender);
    } finally {
      _$LoanStateBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
lenders: ${lenders},
totalToRefunded: ${totalToRefunded},
overpayment: ${overpayment},
errorMessage: ${errorMessage},
calculations: ${calculations},
isSaved: ${isSaved}
    ''';
  }
}
