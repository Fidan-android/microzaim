// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'calendar_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CalendarModeAdapter extends TypeAdapter<CalendarMode> {
  @override
  final int typeId = 4;

  @override
  CalendarMode read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CalendarMode(
      dateTime: fields[0] as DateTime,
      totalToRefunded: fields[3] as double,
      payment: fields[1] as double,
      balanceToBePaid: fields[4] as double,
    );
  }

  @override
  void write(BinaryWriter writer, CalendarMode obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.dateTime)
      ..writeByte(3)
      ..write(obj.totalToRefunded)
      ..writeByte(1)
      ..write(obj.payment)
      ..writeByte(4)
      ..write(obj.balanceToBePaid);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CalendarModeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
