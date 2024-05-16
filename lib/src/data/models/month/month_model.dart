import 'package:hive/hive.dart';

part 'month_model.g.dart';

@HiveType(typeId: 6)
class MonthModel {
  @HiveField(0)
  final DateTime dateTime;

  @HiveField(1)
  int payment;

  @HiveField(2)
  int balanceToBePaid;

  @HiveField(3)
  bool isChecked;

  MonthModel(
      {required this.dateTime,
      required this.payment,
      this.balanceToBePaid = 0,
      this.isChecked = false});
}
