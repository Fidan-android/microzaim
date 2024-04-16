// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'init_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$InitState on InitStateBase, Store {
  late final _$isFirstLaunchAtom =
      Atom(name: 'InitStateBase.isFirstLaunch', context: context);

  @override
  bool? get isFirstLaunch {
    _$isFirstLaunchAtom.reportRead();
    return super.isFirstLaunch;
  }

  @override
  set isFirstLaunch(bool? value) {
    _$isFirstLaunchAtom.reportWrite(value, super.isFirstLaunch, () {
      super.isFirstLaunch = value;
    });
  }

  late final _$checkingTheFirstLaunchAsyncAction =
      AsyncAction('InitStateBase.checkingTheFirstLaunch', context: context);

  @override
  Future<dynamic> checkingTheFirstLaunch() {
    return _$checkingTheFirstLaunchAsyncAction
        .run(() => super.checkingTheFirstLaunch());
  }

  @override
  String toString() {
    return '''
isFirstLaunch: ${isFirstLaunch}
    ''';
  }
}
