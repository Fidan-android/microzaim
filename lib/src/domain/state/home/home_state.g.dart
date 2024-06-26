// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeState on HomeStateBase, Store {
  late final _$isSubscribedAtom =
      Atom(name: 'HomeStateBase.isSubscribed', context: context);

  @override
  bool? get isSubscribed {
    _$isSubscribedAtom.reportRead();
    return super.isSubscribed;
  }

  @override
  set isSubscribed(bool? value) {
    _$isSubscribedAtom.reportWrite(value, super.isSubscribed, () {
      super.isSubscribed = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: 'HomeStateBase.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$currentIndexAtom =
      Atom(name: 'HomeStateBase.currentIndex', context: context);

  @override
  int get currentIndex {
    _$currentIndexAtom.reportRead();
    return super.currentIndex;
  }

  @override
  set currentIndex(int value) {
    _$currentIndexAtom.reportWrite(value, super.currentIndex, () {
      super.currentIndex = value;
    });
  }

  late final _$doSubscribeAsyncAction =
      AsyncAction('HomeStateBase.doSubscribe', context: context);

  @override
  Future<dynamic> doSubscribe() {
    return _$doSubscribeAsyncAction.run(() => super.doSubscribe());
  }

  late final _$HomeStateBaseActionController =
      ActionController(name: 'HomeStateBase', context: context);

  @override
  bool? checkSubscribe() {
    final _$actionInfo = _$HomeStateBaseActionController.startAction(
        name: 'HomeStateBase.checkSubscribe');
    try {
      return super.checkSubscribe();
    } finally {
      _$HomeStateBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeIndex(int index) {
    final _$actionInfo = _$HomeStateBaseActionController.startAction(
        name: 'HomeStateBase.changeIndex');
    try {
      return super.changeIndex(index);
    } finally {
      _$HomeStateBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isSubscribed: ${isSubscribed},
isLoading: ${isLoading},
currentIndex: ${currentIndex}
    ''';
  }
}
