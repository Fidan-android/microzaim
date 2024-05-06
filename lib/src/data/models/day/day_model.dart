import 'package:hive/hive.dart';

part 'day_model.g.dart';

@HiveType(typeId: 5)
class DayModel {
  @HiveField(0)
  final DateTime dateTime;

  @HiveField(1)
  final int payment;

  @HiveField(2)
  final int balanceToBePaid;

  @HiveField(3)
  bool isChecked;

  DayModel(
      {required this.dateTime,
      required this.payment,
      this.balanceToBePaid = 0,
      this.isChecked = false});
}
