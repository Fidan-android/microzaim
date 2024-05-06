import 'package:hive/hive.dart';
import 'package:microzaim/src/data/models/day/day_model.dart';

part 'calendar_loan.g.dart';

@HiveType(typeId: 6)
class CalendarLoan {
  @HiveField(0)
  int totalToRefunded;

  @HiveField(1)
  final List<DayModel> days;

  CalendarLoan({required this.totalToRefunded, required this.days});
}
