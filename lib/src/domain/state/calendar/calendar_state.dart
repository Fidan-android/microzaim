import 'package:microzaim/src/data/models/calculation/calculation_model.dart';
import 'package:microzaim/src/data/models/loan/loan_model.dart';
import 'package:microzaim/src/data/repository/lender_repository.dart';
import 'package:microzaim/src/data/repository/loan_repository.dart';
import 'package:mobx/mobx.dart';

part 'calendar_state.g.dart';

class CalendarState = CalendarStateBase with _$CalendarState;

abstract class CalendarStateBase with Store {

  @observable
  ObservableList<String> list = ObservableList.of([]);
}
