// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'laptop_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LaptopAdapter extends TypeAdapter<Laptop> {
  @override
  final int typeId = 2;

  @override
  Laptop read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Laptop(
      fields[1] as String,
      fields[2] as String,
      fields[3] as String,
      fields[4] as String,
      fields[5] as String,
      fields[6] as String,
      fields[7] as String,
      fields[8] as String,
      fields[9] as String,
      fields[11] as bool,
      fields[12] as bool,
      fields[14] as bool,
      fields[15] as bool,
      fields[13] as bool,
      fields[16] as bool,
      fields[10] as String,
      fields[17] as int,
    );
  }

  @override
  void write(BinaryWriter writer, Laptop obj) {
    writer
      ..writeByte(17)
      ..writeByte(1)
      ..write(obj.id)
      ..writeByte(2)
      ..write(obj.name)
      ..writeByte(3)
      ..write(obj.brand)
      ..writeByte(4)
      ..write(obj.processor)
      ..writeByte(5)
      ..write(obj.ram)
      ..writeByte(6)
      ..write(obj.viga)
      ..writeByte(7)
      ..write(obj.hard)
      ..writeByte(8)
      ..write(obj.quantity)
      ..writeByte(9)
      ..write(obj.screenSize)
      ..writeByte(10)
      ..write(obj.notes)
      ..writeByte(11)
      ..write(obj.touch)
      ..writeByte(12)
      ..write(obj.inAED)
      ..writeByte(13)
      ..write(obj.camera)
      ..writeByte(14)
      ..write(obj.keyboardBackLight)
      ..writeByte(15)
      ..write(obj.acceptAdditionalHard)
      ..writeByte(16)
      ..write(obj.visibility)
      ..writeByte(17)
      ..write(obj.price);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LaptopAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Laptop _$LaptopFromJson(Map<String, dynamic> json) => Laptop(
      json['id'] as String,
      json['name'] as String,
      json['brand'] as String,
      json['processor'] as String,
      json['ram'] as String,
      json['viga'] as String,
      json['hard'] as String,
      json['quantity'] as String,
      json['screenSize'] as String,
      json['touch'] as bool,
      json['inAED'] as bool,
      json['keyboardBackLight'] as bool,
      json['acceptAdditionalHard'] as bool,
      json['camera'] as bool,
      json['visibility'] as bool,
      json['notes'] as String,
      (json['price'] as num).toInt(),
    );

Map<String, dynamic> _$LaptopToJson(Laptop instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'brand': instance.brand,
      'processor': instance.processor,
      'ram': instance.ram,
      'viga': instance.viga,
      'hard': instance.hard,
      'quantity': instance.quantity,
      'screenSize': instance.screenSize,
      'notes': instance.notes,
      'touch': instance.touch,
      'inAED': instance.inAED,
      'camera': instance.camera,
      'keyboardBackLight': instance.keyboardBackLight,
      'acceptAdditionalHard': instance.acceptAdditionalHard,
      'visibility': instance.visibility,
      'price': instance.price,
    };
