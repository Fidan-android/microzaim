// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'calculations_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CalculationsState on CalculationsStateBase, Store {
  late final _$isSavedAtom =
      Atom(name: 'CalculationsStateBase.isSaved', context: context);

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

  late final _$CalculationsStateBaseActionController =
      ActionController(name: 'CalculationsStateBase', context: context);

  @override
  void saveLoanToImport(LoanModel model) {
    final _$actionInfo = _$CalculationsStateBaseActionController.startAction(
        name: 'CalculationsStateBase.saveLoanToImport');
    try {
      return super.saveLoanToImport(model);
    } finally {
      _$CalculationsStateBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void saveDebtToImport(DebtModel model) {
    final _$actionInfo = _$CalculationsStateBaseActionController.startAction(
        name: 'CalculationsStateBase.saveDebtToImport');
    try {
      return super.saveDebtToImport(model);
    } finally {
      _$CalculationsStateBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isSaved: ${isSaved}
    ''';
  }
}
