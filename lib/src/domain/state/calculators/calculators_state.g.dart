// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'calculators_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$LoanState on LoanStateBase, Store {
  late final _$loansAtom = Atom(name: 'LoanStateBase.loans', context: context);

  @override
  ObservableList<String> get loans {
    _$loansAtom.reportRead();
    return super.loans;
  }

  @override
  set loans(ObservableList<String> value) {
    _$loansAtom.reportWrite(value, super.loans, () {
      super.loans = value;
    });
  }

  late final _$debtsAtom = Atom(name: 'LoanStateBase.debts', context: context);

  @override
  ObservableList<String> get debts {
    _$debtsAtom.reportRead();
    return super.debts;
  }

  @override
  set debts(ObservableList<String> value) {
    _$debtsAtom.reportWrite(value, super.debts, () {
      super.debts = value;
    });
  }

  @override
  String toString() {
    return '''
loans: ${loans},
debts: ${debts}
    ''';
  }
}
