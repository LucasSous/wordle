// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_data_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class GameDataModelAdapter extends TypeAdapter<GameDataModel> {
  @override
  final int typeId = 0;

  @override
  GameDataModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return GameDataModel(
      words: (fields[0] as List).cast<TextBoxModel>(),
      secretWord: fields[1] as String,
      activeRow: fields[2] as int,
    );
  }

  @override
  void write(BinaryWriter writer, GameDataModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.words)
      ..writeByte(1)
      ..write(obj.secretWord)
      ..writeByte(2)
      ..write(obj.activeRow);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GameDataModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
