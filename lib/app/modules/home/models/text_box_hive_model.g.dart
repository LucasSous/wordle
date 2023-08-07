// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'text_box_hive_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TextBoxHiveModelAdapter extends TypeAdapter<TextBoxHiveModel> {
  @override
  final int typeId = 1;

  @override
  TextBoxHiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TextBoxHiveModel(
      value: fields[0] as String,
      status: fields[1] as Status,
    );
  }

  @override
  void write(BinaryWriter writer, TextBoxHiveModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.value)
      ..writeByte(1)
      ..write(obj.status);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TextBoxHiveModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
