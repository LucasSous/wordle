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
      words: (fields[0] as List)
          .map((dynamic e) => (e as List).cast<TextBoxHiveModel>())
          .toList(),
      secretWord: fields[1] as String,
      activeRow: fields[2] as int,
      finalized: fields[3] as bool,
      hasVictory: fields[4] as bool,
      correctLetters: (fields[5] as List).cast<String>(),
      incorrectLetters: (fields[6] as List).cast<String>(),
      nearbyLetters: (fields[7] as List).cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, GameDataModel obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.words)
      ..writeByte(1)
      ..write(obj.secretWord)
      ..writeByte(2)
      ..write(obj.activeRow)
      ..writeByte(3)
      ..write(obj.finalized)
      ..writeByte(4)
      ..write(obj.hasVictory)
      ..writeByte(5)
      ..write(obj.correctLetters)
      ..writeByte(6)
      ..write(obj.incorrectLetters)
      ..writeByte(7)
      ..write(obj.nearbyLetters);
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
