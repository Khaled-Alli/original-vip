// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'laptop_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Laptop _$LaptopFromJson(Map<String, dynamic> json) => Laptop(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      brand: json['brand'] as String,
      processor: json['processor'] as String,
      ram: json['ram'] as String,
      viga: json['viga'] as String,
      hard: json['hard'] as String,
      quantity: json['quantity'] as String,
      screenSize: json['screenSize'] as String,
      touch: json['touch'] as bool,
      keyboardBackLight: json['keyboardBackLight'] as bool,
      acceptAdditionalHard: json['acceptAdditionalHard'] as bool,
      camera: json['camera'] as bool,
      visibility: json['visibility'] as bool,
      price: (json['price'] as num).toInt(),
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
      'touch': instance.touch,
      'camera': instance.camera,
      'keyboardBackLight': instance.keyboardBackLight,
      'acceptAdditionalHard': instance.acceptAdditionalHard,
      'visibility': instance.visibility,
      'price': instance.price,
    };
