// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model_task.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ModelTaskAdapter extends TypeAdapter<ModelTask> {
  @override
  final int typeId = 0;

  @override
  ModelTask read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ModelTask(
      id: fields[0] as String?,
      title: fields[1] as String?,
      description: fields[2] as String?,
      date: fields[3] as String?,
      startTime: fields[4] as String?,
      endTime: fields[5] as String?,
      color: fields[6] as int?,
      iscompleted: fields[7] as bool?,
    );
  }

  @override
  void write(BinaryWriter writer, ModelTask obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.description)
      ..writeByte(3)
      ..write(obj.date)
      ..writeByte(4)
      ..write(obj.startTime)
      ..writeByte(5)
      ..write(obj.endTime)
      ..writeByte(6)
      ..write(obj.color)
      ..writeByte(7)
      ..write(obj.iscompleted);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ModelTaskAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
