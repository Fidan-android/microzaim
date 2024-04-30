// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'loan_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LoanModelAdapter extends TypeAdapter<LoanModel> {
  @override
  final int typeId = 1;

  @override
  LoanModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LoanModel(
      lender: fields[0] as String,
      totalToRefunded: fields[1] as double,
      overpayment: fields[2] as double,
      calculations: (fields[3] as List).cast<CalculationModel>(),
    );
  }

  @override
  void write(BinaryWriter writer, LoanModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.lender)
      ..writeByte(1)
      ..write(obj.totalToRefunded)
      ..writeByte(2)
      ..write(obj.overpayment)
      ..writeByte(3)
      ..write(obj.calculations);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LoanModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
