import 'package:hive/hive.dart';
import 'package:microzaim/src/data/models/day/day_model.dart';
import 'package:microzaim/src/data/models/month/month_model.dart';

part 'calendar_model.g.dart';

@HiveType(typeId: 4)
class CalendarModel {
  @HiveField(0)
  int totalToRefunded;

  @HiveField(1)
  List<DayModel> days;

  @HiveField(2)
  List<MonthModel> months;

  CalendarModel(
      {required this.totalToRefunded,
      this.days = const [],
      this.months = const []});
}
