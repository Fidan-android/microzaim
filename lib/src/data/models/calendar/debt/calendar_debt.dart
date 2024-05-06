import 'package:hive/hive.dart';
import 'package:microzaim/src/data/models/debt/debt_model.dart';

part 'calendar_debt.g.dart';

@HiveType(typeId: 5)
class CalendarDebt {
  @HiveField(0)
  final DebtModel debtModel;

  CalendarDebt({required this.debtModel});
}
