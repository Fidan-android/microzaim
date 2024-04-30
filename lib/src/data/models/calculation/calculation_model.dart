import 'package:hive/hive.dart';

part 'calculation_model.g.dart';

@HiveType(typeId: 2)
class CalculationModel {
  @HiveField(0)
  final int day;

  @HiveField(1)
  final int dailyPayment;

  @HiveField(2)
  final int percent;

  @HiveField(3)
  final int mainDebt;

  @HiveField(4)
  final int outstandingBalance;

  CalculationModel(
      {required this.day,
      required this.dailyPayment,
      required this.percent,
      required this.mainDebt,
      required this.outstandingBalance});
}
