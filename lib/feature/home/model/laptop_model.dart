import 'package:json_annotation/json_annotation.dart';

part 'laptop_model.g.dart';
@JsonSerializable()
class Laptop{
  String id;
  String name;
  String brand;
  String processor;
  String ram;
  String viga;
  String hard;
  String quantity;
  String screenSize;
  String notes;
  bool touch;
  bool inAED;
  bool camera;
  bool keyboardBackLight;
  bool acceptAdditionalHard;
  bool visibility;
  int price;

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
      this.price,);

  factory Laptop.fromJson(Map<String,dynamic> json)=>_$LaptopFromJson(json);

  Map<String,dynamic> toJson()=>_$LaptopToJson(this);
}