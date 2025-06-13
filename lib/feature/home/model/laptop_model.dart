import 'package:json_annotation/json_annotation.dart';
import 'package:hive/hive.dart';

part 'laptop_model.g.dart';

@JsonSerializable()
@HiveType(typeId: 2)
class Laptop {
  @HiveField(1)
  String id;
  @HiveField(2)
  String name;
  @HiveField(3)
  String brand;
  @HiveField(4)
  String processor;
  @HiveField(5)
  String ram;
  @HiveField(6)
  String viga;
  @HiveField(7)
  String hard;
  @HiveField(8)
  String quantity;
  @HiveField(9)
  String screenSize;
  @HiveField(10)
  String notes;
  @HiveField(11)
  bool touch;
  @HiveField(12)
  bool inAED;
  @HiveField(13)
  bool camera;
  @HiveField(14)
  bool keyboardBackLight;
  @HiveField(15)
  bool acceptAdditionalHard;
  @HiveField(16)
  bool visibility;
  @HiveField(17)
  int dealerPrice;
  @HiveField(18)
  int traderPrice;

  Laptop(
      this.id,
      this.name,
      this.brand,
      this.processor,
      this.ram,
      this.viga,
      this.hard,
      this.quantity,
      this.screenSize,
      this.touch,
      this.inAED,
      this.keyboardBackLight,
      this.acceptAdditionalHard,
      this.camera,
      this.visibility,
      this.notes,
      this.dealerPrice,
      this.traderPrice,
      );

  factory Laptop.fromJson(Map<String, dynamic> json) => _$LaptopFromJson(json);

  Map<String, dynamic> toJson() => _$LaptopToJson(this);
}

// Laptop _$LaptopFromJson(Map<String, dynamic> json) => Laptop(
//   json['id'] as String,
//   json['name'] as String,
//   json['brand'] as String,
//   json['processor'] as String,
//   json['ram'] as String,
//   json['viga'] as String,
//   json['hard'] as String,
//   json['quantity'] as String,
//   json['screenSize'] as String,
//   json['touch'] as bool,
//   json['inAED'] as bool,
//   json['keyboardBackLight'] as bool,
//   json['acceptAdditionalHard'] as bool,
//   json['camera'] as bool,
//   json['visibility'] as bool,
//   json['notes'] as String,
//   (json['price'] as num).toInt(),
// );
//
// Map<String, dynamic> _$LaptopToJson(Laptop instance) => <String, dynamic>{
//   'id': instance.id,
//   'name': instance.name,
//   'brand': instance.brand,
//   'processor': instance.processor,
//   'ram': instance.ram,
//   'viga': instance.viga,
//   'hard': instance.hard,
//   'quantity': instance.quantity,
//   'screenSize': instance.screenSize,
//   'notes': instance.notes,
//   'touch': instance.touch,
//   'inAED': instance.inAED,
//   'camera': instance.camera,
//   'keyboardBackLight': instance.keyboardBackLight,
//   'acceptAdditionalHard': instance.acceptAdditionalHard,
//   'visibility': instance.visibility,
//   'price': instance.price,
// };