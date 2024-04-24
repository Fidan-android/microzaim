import 'package:json_annotation/json_annotation.dart';

part 'calculation_model.g.dart';

@JsonSerializable()
class CalculationModel {
  final int day;
  final int dailyPayment;
  final int percent;
  final int mainDebt;
  final int outstandingBalance;

  CalculationModel({required this.day, required this.dailyPayment, required this.percent, required this.mainDebt, required this.outstandingBalance});

  factory CalculationModel.fromJson(final Map<String, dynamic> json) {
    return _$CalculationModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CalculationModelToJson(this);
}
