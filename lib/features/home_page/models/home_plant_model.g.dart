// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_plant_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HomePlantModelAdapter extends TypeAdapter<HomePlantModel> {
  @override
  final int typeId = 0;

  @override
  HomePlantModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HomePlantModel(
      id: fields[3] as String?,
      name: fields[0] as String,
      description: fields[1] as String,
      location: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, HomePlantModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.description)
      ..writeByte(2)
      ..write(obj.location)
      ..writeByte(3)
      ..write(obj.id);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HomePlantModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
