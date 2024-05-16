import 'package:microzaim/src/data/models/calendar/calendar_model.dart';
import 'package:microzaim/src/data/models/day/day_model.dart';
import 'package:microzaim/src/data/models/debt/debt_model.dart';
import 'package:microzaim/src/data/models/loan/loan_model.dart';
import 'package:microzaim/src/data/models/month/month_model.dart';
import 'package:microzaim/src/data/repository/calendar_repository.dart';
import 'package:microzaim/src/data/repository/import_repository.dart';
import 'package:mobx/mobx.dart';

part 'import_state.g.dart';

class ImportState = ImportStateBase with _$ImportState;

abstract class ImportStateBase with Store {
  ImportStateBase(this._importRepository, this._calendarRepository);

  final ImportRepository _importRepository;
  final CalendarRepository _calendarRepository;

  @observable
  bool isSaved = false;

  @action
  void chooseLoanToCalendar(LoanModel model) {
    List<DayModel> days = [];
    DateTime currentDay = DateTime.now();
    CalendarModel? savedCalendar = _calendarRepository.getCalendarModel();

    if (savedCalendar == null) {
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
    } else {
      if (savedCalendar.days.isEmpty) {
        savedCalendar.totalToRefunded += model.totalToRefunded;
        for (var i = 0; i < model.calculations.length; i++) {
          days.add(DayModel(
              dateTime: currentDay.add(Duration(days: i)),
              payment: model.calculations[i].dailyPayment,
              balanceToBePaid: model.calculations[i].outstandingBalance));
        }

        savedCalendar.days = days;

        _calendarRepository
            .updateCalendarModel(savedCalendar)
            .then((value) => isSaved = value);
      } else {
        int indexOfDay = 0;
        savedCalendar.totalToRefunded += model.totalToRefunded;
        for (var i = 0; i < model.calculations.length; i++) {
          savedCalendar.days[indexOfDay].payment +=
              model.calculations[i].dailyPayment;
          savedCalendar.days[indexOfDay].balanceToBePaid +=
              model.calculations[i].outstandingBalance;
          indexOfDay++;
        }

        _calendarRepository
            .updateCalendarModel(savedCalendar)
            .then((value) => isSaved = value);
      }
    }
    _importRepository.removeImportLoan(model);
  }

  @action
  void chooseDebtToCalendar(DebtModel model) {
    List<MonthModel> months = [];
    DateTime currentDay = DateTime.now();
    CalendarModel? savedCalendar = _calendarRepository.getCalendarModel();

    if (savedCalendar == null) {
      int totalToRefunded = model.payment * model.countOfMonth;
      for (var i = 0; i < model.countOfMonth; i++) {
        months.add(MonthModel(
            dateTime:
                DateTime(currentDay.year, currentDay.month + i, currentDay.day),
            payment: model.payment,
            balanceToBePaid: totalToRefunded - model.payment * i));
      }

      CalendarModel calendarModel =
          CalendarModel(totalToRefunded: totalToRefunded, months: months);

      _calendarRepository
          .saveCalendarModel(calendarModel)
          .then((value) => isSaved = value);
    } else {
      if (savedCalendar.months.isEmpty) {
        int totalToRefunded = model.payment * model.countOfMonth;
        savedCalendar.totalToRefunded += totalToRefunded;
        for (var i = 0; i < model.countOfMonth; i++) {
          months.add(MonthModel(
              dateTime: currentDay.add(Duration(days: i)),
              payment: model.payment,
              balanceToBePaid: totalToRefunded - model.payment * i));
        }

        savedCalendar.months = months;

        _calendarRepository
            .updateCalendarModel(savedCalendar)
            .then((value) => isSaved = value);
      } else {
        int indexOfMonth = 0;
        int totalToRefunded = model.payment * model.countOfMonth;
        savedCalendar.totalToRefunded += totalToRefunded;
        for (var i = 0; i < model.countOfMonth; i++) {
          savedCalendar.months[indexOfMonth].payment += model.payment;
          savedCalendar.months[indexOfMonth].balanceToBePaid +=
              (totalToRefunded - model.payment * i);
          indexOfMonth++;
        }

        _calendarRepository
            .updateCalendarModel(savedCalendar)
            .then((value) => isSaved = value);
      }
    }
    _importRepository.removeImportDebt(model);
  }
}
