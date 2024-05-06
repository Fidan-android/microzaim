// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'import_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ImportState on ImportStateBase, Store {
  late final _$isSavedAtom =
      Atom(name: 'ImportStateBase.isSaved', context: context);

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

  late final _$ImportStateBaseActionController =
      ActionController(name: 'ImportStateBase', context: context);

  @override
  void chooseLoanToCalendar(LoanModel model) {
    final _$actionInfo = _$ImportStateBaseActionController.startAction(
        name: 'ImportStateBase.chooseLoanToCalendar');
    try {
      return super.chooseLoanToCalendar(model);
    } finally {
      _$ImportStateBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void chooseDebtToCalendar(DebtModel model) {
    final _$actionInfo = _$ImportStateBaseActionController.startAction(
        name: 'ImportStateBase.chooseDebtToCalendar');
    try {
      return super.chooseDebtToCalendar(model);
    } finally {
      _$ImportStateBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isSaved: ${isSaved}
    ''';
  }
}
