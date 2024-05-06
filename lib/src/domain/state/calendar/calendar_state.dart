import 'package:microzaim/src/conventions/enum/shared_keys.dart';
import 'package:microzaim/src/data/models/calendar/calendar_model.dart';
import 'package:microzaim/src/data/models/day/day_model.dart';
import 'package:microzaim/src/data/repository/calendar_repository.dart';
import 'package:microzaim/src/data/repository/storage_repository.dart';
import 'package:mobx/mobx.dart';

part 'calendar_state.g.dart';

class CalendarState = CalendarStateBase with _$CalendarState;

abstract class CalendarStateBase with Store {
  CalendarStateBase(this._calendarRepository, this._storageRepository);

  final CalendarRepository _calendarRepository;
  final StorageRepository _storageRepository;

  @observable
  bool? isSubscribed;

  @action
  void checkSubscribe() {
    isSubscribed = _storageRepository.shared(SharedKeys.subscribe.key) ?? false;
  }

  @observable
  DateTime currentDateTime = DateTime.now();

  @action
  void changeCurrentMonth(int step) {
    if (DateTime(currentDateTime.year, currentDateTime.month + step, 1)
            .compareTo(
                DateTime(DateTime.now().year, DateTime.now().month, 1)) ==
        -1) {
      return;
    }
    currentDateTime = DateTime(currentDateTime.year,
        currentDateTime.month + step, currentDateTime.day);
  }

  @observable
  ObservableList<String> list = ObservableList.of([]);

  @action
  Future removeCurrentCalendar() async {
    _calendarRepository.removeCalendar().then((value) => null);
  }

  void markDailyPayment(CalendarModel calendarModel, DayModel dayModel) {
    calendarModel.days[calendarModel.days.indexOf(dayModel)].isChecked =
        !calendarModel.days[calendarModel.days.indexOf(dayModel)].isChecked;
    if (calendarModel.days[calendarModel.days.indexOf(dayModel)].isChecked) {
      calendarModel.totalToRefunded -= dayModel.payment;
    } else {
      calendarModel.totalToRefunded += dayModel.payment;
    }
    _calendarRepository.updateCalendarModel(calendarModel);
  }
}
