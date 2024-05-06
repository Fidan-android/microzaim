// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'calendar_debt.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CalendarDebtAdapter extends TypeAdapter<CalendarDebt> {
  @override
  final int typeId = 5;

  @override
  CalendarDebt read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CalendarDebt(
      debtModel: fields[0] as DebtModel,
    );
  }

  @override
  void write(BinaryWriter writer, CalendarDebt obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.debtModel);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CalendarDebtAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
