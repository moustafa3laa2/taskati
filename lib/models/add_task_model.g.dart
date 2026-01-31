// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_task_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AddTaskModelAdapter extends TypeAdapter<AddTaskModel> {
  @override
  final int typeId = 1;

  @override
  AddTaskModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AddTaskModel(
      title: fields[0] as String,
      startTime: fields[1] as String,
      endTime: fields[2] as String,
      description: fields[3] as String,
      date: fields[4] as String,
      color: fields[6] as int,
      status: fields[5] as String,
    );
  }

  @override
  void write(BinaryWriter writer, AddTaskModel obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.startTime)
      ..writeByte(2)
      ..write(obj.endTime)
      ..writeByte(3)
      ..write(obj.description)
      ..writeByte(4)
      ..write(obj.date)
      ..writeByte(5)
      ..write(obj.status)
      ..writeByte(6)
      ..write(obj.color);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AddTaskModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
