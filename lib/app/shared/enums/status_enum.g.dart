// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'status_enum.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class StatusAdapter extends TypeAdapter<Status> {
  @override
  final int typeId = 2;

  @override
  Status read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return Status.correct;
      case 1:
        return Status.incorrect;
      case 2:
        return Status.near;
      case 3:
        return Status.standard;
      default:
        return Status.correct;
    }
  }

  @override
  void write(BinaryWriter writer, Status obj) {
    switch (obj) {
      case Status.correct:
        writer.writeByte(0);
        break;
      case Status.incorrect:
        writer.writeByte(1);
        break;
      case Status.near:
        writer.writeByte(2);
        break;
      case Status.standard:
        writer.writeByte(3);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StatusAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
