import 'package:microzaim/src/data/models/calendar/calendar_model.dart';

abstract class ICalendarRepository {
  CalendarModel? getCalendarModel();

  Future<bool> saveCalendarModel(CalendarModel model);

  Future updateCalendarModel(CalendarModel model);

  Future<bool> removeCalendar();
}
