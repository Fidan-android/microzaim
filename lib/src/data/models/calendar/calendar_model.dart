import 'package:hive/hive.dart';
import 'package:microzaim/src/data/models/day/day_model.dart';

part 'calendar_model.g.dart';

@HiveType(typeId: 4)
class CalendarModel {
  @HiveField(0)
  int totalToRefunded;

  @HiveField(1)
  final List<DayModel> days;

  // type = 0 - it's Loan, type = 1 it's Debt
  @HiveField(2)
  int type;

  CalendarModel({required this.totalToRefunded, required this.days, this.type = 0});
}
