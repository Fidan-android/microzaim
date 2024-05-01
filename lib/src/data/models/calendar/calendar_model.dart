import 'package:hive/hive.dart';

part 'calendar_model.g.dart';

@HiveType(typeId: 4)
class CalendarMode {
  @HiveField(0)
  final DateTime dateTime;

  @HiveField(3)
  final double totalToRefunded;

  @HiveField(1)
  final double payment;

  @HiveField(4)
  final double balanceToBePaid;

  CalendarMode(
      {required this.dateTime,
      required this.totalToRefunded,
      required this.payment,
      required this.balanceToBePaid});
}
