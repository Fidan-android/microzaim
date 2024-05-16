import 'package:hive/hive.dart';
import 'package:microzaim/src/data/models/calendar/calendar_model.dart';
import 'package:microzaim/src/domain/repository/i_calendar_repository.dart';

class CalendarRepository extends ICalendarRepository {
  final _calendarBox = Hive.box<CalendarModel>('calendar_box');

  @override
  CalendarModel? getCalendarModel() {
    return _calendarBox.values.firstOrNull;
  }

  @override
  Future<bool> saveCalendarModel(CalendarModel model) async {
    await _calendarBox.add(model);
    return true;
  }

  @override
  Future<bool> updateCalendarModel(CalendarModel model) async {
    await _calendarBox.clear();
    await _calendarBox.add(model);
    return true;
  }

  @override
  Future<bool> removeCalendar() async {
    await _calendarBox.clear();
    return true;
  }
}
