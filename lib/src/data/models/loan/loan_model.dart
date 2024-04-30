import 'package:hive/hive.dart';
import 'package:microzaim/src/data/models/calculation/calculation_model.dart';

part 'loan_model.g.dart';

@HiveType(typeId: 1)
class LoanModel {
  @HiveField(0)
  final String lender;

  @HiveField(1)
  final double totalToRefunded;

  @HiveField(2)
  final double overpayment;

  @HiveField(3)
  final List<CalculationModel> calculations;

  LoanModel(
      {required this.lender,
      required this.totalToRefunded,
      required this.overpayment,
      required this.calculations});
}
