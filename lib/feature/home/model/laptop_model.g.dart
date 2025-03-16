// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'laptop_model.dart';

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
