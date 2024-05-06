import 'package:hive/hive.dart';
import 'package:microzaim/src/data/models/calendar/calendar_model.dart';
import 'package:microzaim/src/data/models/calendar/debt/calendar_debt.dart';
import 'package:microzaim/src/data/models/calendar/loan/calendar_loan.dart';
import 'package:microzaim/src/domain/repository/i_calendar_repository.dart';
import 'package:microzaim/src/helper/result.dart';

class CalendarRepository extends ICalendarRepository {
  final _calendarBox = Hive.box<CalendarModel>('calendar_box');

  @override
  Result<List<CalendarModel>> getCalendarModel() {
    return Result.success(_calendarBox.values.toList());
  }

  @override
  Future<bool> saveCalendarModel(CalendarModel model) async {
    await _calendarBox.add(model);
    return true;
  }

  @override
  Future updateCalendarModel(CalendarModel model) async {
    await _calendarBox.clear();
    await _calendarBox.add(model);
  }

  @override
  Future<bool> removeCalendar() async {
    await _calendarBox.clear();
    return true;
  }
}
