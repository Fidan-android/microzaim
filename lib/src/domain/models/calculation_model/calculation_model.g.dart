// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'calculation_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CalculationModel _$CalculationModelFromJson(Map<String, dynamic> json) =>
    CalculationModel(
      day: json['day'] as int,
      dailyPayment: json['dailyPayment'] as int,
      percent: json['percent'] as int,
      mainDebt: json['mainDebt'] as int,
      outstandingBalance: json['outstandingBalance'] as int,
    );

Map<String, dynamic> _$CalculationModelToJson(CalculationModel instance) =>
    <String, dynamic>{
      'day': instance.day,
      'dailyPayment': instance.dailyPayment,
      'percent': instance.percent,
      'mainDebt': instance.mainDebt,
      'outstandingBalance': instance.outstandingBalance,
    };
