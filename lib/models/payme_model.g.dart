// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payme_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PaymeModelAdapter extends TypeAdapter<PaymeModel> {
  @override
  final int typeId = 1;

  @override
  PaymeModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PaymeModel(
      kartaraqam: fields[1] as int?,
      srok: fields[2] as int?,
      name: fields[3] as String?,
      id: fields[4] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, PaymeModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(1)
      ..write(obj.kartaraqam)
      ..writeByte(2)
      ..write(obj.srok)
      ..writeByte(3)
      ..write(obj.name)
      ..writeByte(4)
      ..write(obj.id);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PaymeModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
