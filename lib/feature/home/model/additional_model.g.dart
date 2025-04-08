// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'additional_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AdditionalAdapter extends TypeAdapter<Additional> {
  @override
  final int typeId = 3;

  @override
  Additional read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Additional(
      fields[1] as String,
      fields[2] as String,
      fields[3] as int,
      amount: fields[4] as int,
    );
  }

  @override
  void write(BinaryWriter writer, Additional obj) {
    writer
      ..writeByte(4)
      ..writeByte(1)
      ..write(obj.id)
      ..writeByte(2)
      ..write(obj.name)
      ..writeByte(3)
      ..write(obj.price)
      ..writeByte(4)
      ..write(obj.amount);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AdditionalAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Additional _$AdditionalFromJson(Map<String, dynamic> json) => Additional(
      json['id'] as String,
      json['name'] as String,
      (json['price'] as num).toInt(),
      amount: (json['amount'] as num?)?.toInt() ?? 1,
    );

Map<String, dynamic> _$AdditionalToJson(Additional instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'price': instance.price,
      'amount': instance.amount,
    };
