// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'statistics_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class StatisticsModelAdapter extends TypeAdapter<StatisticsModel> {
  @override
  final int typeId = 3;

  @override
  StatisticsModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return StatisticsModel(
      numberOfMatches: fields[0] as int,
      numberOfWins: fields[1] as int,
      longestSequence: fields[2] as int,
      currentSequence: fields[3] as int,
      attempts: (fields[4] as Map).cast<int, int>(),
    );
  }

  @override
  void write(BinaryWriter writer, StatisticsModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.numberOfMatches)
      ..writeByte(1)
      ..write(obj.numberOfWins)
      ..writeByte(2)
      ..write(obj.longestSequence)
      ..writeByte(3)
      ..write(obj.currentSequence)
      ..writeByte(4)
      ..write(obj.attempts);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StatisticsModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
