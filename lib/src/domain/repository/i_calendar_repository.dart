import 'package:microzaim/src/data/models/calendar/calendar_model.dart';
import 'package:microzaim/src/helper/result.dart';

abstract class ICalendarRepository {
  Result<List<CalendarModel>> getCalendarModel();

  Future<bool> saveCalendarModel(CalendarModel model);

  Future updateCalendarModel(CalendarModel model);

  Future<bool> removeCalendar();
}
