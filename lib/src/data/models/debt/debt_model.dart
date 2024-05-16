import 'package:hive/hive.dart';

part 'debt_model.g.dart';

@HiveType(typeId: 3)
class DebtModel {
  @HiveField(0)
  final int payment;

  @HiveField(1)
  final int averageIncome;

  @HiveField(2)
  final int debtBurden;

  @HiveField(3)
  final int monthlyIncome;

  @HiveField(4)
  final String title;

  @HiveField(5)
  final int countOfMonth;

  @HiveField(6)
  bool imported = false;

  DebtModel(
      {required this.payment,
      required this.averageIncome,
      required this.debtBurden,
      required this.monthlyIncome,
      required this.title,
      required this.countOfMonth});
}
