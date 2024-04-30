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

  DebtModel(
      {required this.payment,
      required this.averageIncome,
      required this.debtBurden,
      required this.monthlyIncome});
}
