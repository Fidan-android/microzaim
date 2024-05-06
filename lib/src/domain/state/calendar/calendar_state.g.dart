// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'calendar_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CalendarState on CalendarStateBase, Store {
  late final _$isSubscribedAtom =
      Atom(name: 'CalendarStateBase.isSubscribed', context: context);

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

  late final _$currentDateTimeAtom =
      Atom(name: 'CalendarStateBase.currentDateTime', context: context);

  @override
  DateTime get currentDateTime {
    _$currentDateTimeAtom.reportRead();
    return super.currentDateTime;
  }

  @override
  set currentDateTime(DateTime value) {
    _$currentDateTimeAtom.reportWrite(value, super.currentDateTime, () {
      super.currentDateTime = value;
    });
  }

  late final _$listAtom =
      Atom(name: 'CalendarStateBase.list', context: context);

  @override
  ObservableList<String> get list {
    _$listAtom.reportRead();
    return super.list;
  }

  @override
  set list(ObservableList<String> value) {
    _$listAtom.reportWrite(value, super.list, () {
      super.list = value;
    });
  }

  late final _$removeCurrentCalendarAsyncAction =
      AsyncAction('CalendarStateBase.removeCurrentCalendar', context: context);

  @override
  Future<dynamic> removeCurrentCalendar() {
    return _$removeCurrentCalendarAsyncAction
        .run(() => super.removeCurrentCalendar());
  }

  late final _$CalendarStateBaseActionController =
      ActionController(name: 'CalendarStateBase', context: context);

  @override
  void checkSubscribe() {
    final _$actionInfo = _$CalendarStateBaseActionController.startAction(
        name: 'CalendarStateBase.checkSubscribe');
    try {
      return super.checkSubscribe();
    } finally {
      _$CalendarStateBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeCurrentMonth(int step) {
    final _$actionInfo = _$CalendarStateBaseActionController.startAction(
        name: 'CalendarStateBase.changeCurrentMonth');
    try {
      return super.changeCurrentMonth(step);
    } finally {
      _$CalendarStateBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isSubscribed: ${isSubscribed},
currentDateTime: ${currentDateTime},
list: ${list}
    ''';
  }
}
