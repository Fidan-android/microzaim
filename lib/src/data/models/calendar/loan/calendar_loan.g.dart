// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'calendar_loan.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CalendarLoanAdapter extends TypeAdapter<CalendarLoan> {
  @override
  final int typeId = 6;

  @override
  CalendarLoan read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CalendarLoan(
      totalToRefunded: fields[0] as int,
      days: (fields[1] as List).cast<DayModel>(),
    );
  }

  @override
  void write(BinaryWriter writer, CalendarLoan obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.totalToRefunded)
      ..writeByte(1)
      ..write(obj.days);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CalendarLoanAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
