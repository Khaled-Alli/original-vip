import 'package:json_annotation/json_annotation.dart';

part 'laptop_model.g.dart';
@JsonSerializable()
class Laptop{
  int id;
  String name;
  String brand;
  String processor;
  String ram;
  String viga;
  String hard;
  String quantity;
  String screenSize;
  bool touch;
  bool camera;
  bool keyboardBackLight;
  bool acceptAdditionalHard;
  bool visibility;
  int price;

  Laptop({
     required this.id,
     required this.name,
     required this.brand,
     required this.processor,
     required this.ram,
     required this.viga,
     required this.hard,
     required this.quantity,
     required this.screenSize,
     required this.touch,
     required this.keyboardBackLight,
     required this.acceptAdditionalHard,
     required this.camera,
     required this.visibility,
     required this.price,});

  factory Laptop.fromJson(Map<String,dynamic> json)=>_$LaptopFromJson(json);

  Map<String,dynamic> toJson()=>_$LaptopToJson(this);
}