// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'debt_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DebtModelAdapter extends TypeAdapter<DebtModel> {
  @override
  final int typeId = 3;

  @override
  DebtModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DebtModel(
      payment: fields[0] as int,
      averageIncome: fields[1] as int,
      debtBurden: fields[2] as int,
      monthlyIncome: fields[3] as int,
      title: fields[4] as String,
      countOfMonth: fields[5] as int,
    )..imported = fields[6] as bool;
  }

  @override
  void write(BinaryWriter writer, DebtModel obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.payment)
      ..writeByte(1)
      ..write(obj.averageIncome)
      ..writeByte(2)
      ..write(obj.debtBurden)
      ..writeByte(3)
      ..write(obj.monthlyIncome)
      ..writeByte(4)
      ..write(obj.title)
      ..writeByte(5)
      ..write(obj.countOfMonth)
      ..writeByte(6)
      ..write(obj.imported);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DebtModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
