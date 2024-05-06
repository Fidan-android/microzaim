import 'package:microzaim/src/data/models/calendar/calendar_model.dart';
import 'package:microzaim/src/data/models/day/day_model.dart';
import 'package:microzaim/src/data/models/debt/debt_model.dart';
import 'package:microzaim/src/data/models/loan/loan_model.dart';
import 'package:microzaim/src/data/repository/calendar_repository.dart';
import 'package:mobx/mobx.dart';

part 'import_state.g.dart';

class ImportState = ImportStateBase with _$ImportState;

abstract class ImportStateBase with Store {
  ImportStateBase(this._calendarRepository);

  final CalendarRepository _calendarRepository;

  @observable
  bool isSaved = false;

  @action
  void chooseLoanToCalendar(LoanModel model) {
    List<DayModel> days = [];

    DateTime currentDay = DateTime.now();

    for (var i = 0; i < model.calculations.length; i++) {
      days.add(DayModel(
          dateTime: currentDay.add(Duration(days: i)),
          payment: model.calculations[i].dailyPayment,
          balanceToBePaid: model.calculations[i].outstandingBalance));
    }

    CalendarModel calendarModel =
        CalendarModel(totalToRefunded: model.totalToRefunded, days: days);

    _calendarRepository
        .saveCalendarModel(calendarModel)
        .then((value) => isSaved = value);
  }

  @action
  void chooseDebtToCalendar(DebtModel model) {
    List<DayModel> days = [];

    DateTime currentDay = DateTime.now();

    int totalToRefunded = model.payment * model.countOfMonth;
    for (var i = 0; i < model.countOfMonth; i++) {
      days.add(DayModel(
          dateTime:
              DateTime(currentDay.year, currentDay.month + i, currentDay.day),
          payment: model.payment,
          balanceToBePaid: totalToRefunded - model.payment * i));
    }

    CalendarModel calendarModel =
        CalendarModel(totalToRefunded: totalToRefunded, days: days, type: 1);

    _calendarRepository
        .saveCalendarModel(calendarModel)
        .then((value) => isSaved = value);
  }
}
