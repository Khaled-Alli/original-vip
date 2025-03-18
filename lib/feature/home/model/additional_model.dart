import 'package:json_annotation/json_annotation.dart';

part 'additional_model.g.dart';
@JsonSerializable()
class Additional{
  String id;
  String name;
  int price;

  Additional(
      this.id,
      this.name,
      this.price,);

  factory Additional.fromJson(Map<String,dynamic> json)=>_$AdditionalFromJson(json);

  Map<String,dynamic> toJson()=>_$AdditionalToJson(this);
}