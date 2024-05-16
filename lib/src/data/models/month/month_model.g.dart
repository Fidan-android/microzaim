// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'month_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MonthModelAdapter extends TypeAdapter<MonthModel> {
  @override
  final int typeId = 6;

  @override
  MonthModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MonthModel(
      dateTime: fields[0] as DateTime,
      payment: fields[1] as int,
      balanceToBePaid: fields[2] as int,
      isChecked: fields[3] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, MonthModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.dateTime)
      ..writeByte(1)
      ..write(obj.payment)
      ..writeByte(2)
      ..write(obj.balanceToBePaid)
      ..writeByte(3)
      ..write(obj.isChecked);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MonthModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
