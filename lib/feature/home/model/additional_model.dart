import 'package:json_annotation/json_annotation.dart';
import 'package:hive/hive.dart';

part 'additional_model.g.dart';

@JsonSerializable()
@HiveType(typeId: 3)
class Additional{
  @HiveField(1)
  String id;
  @HiveField(2)
  String name;
  @HiveField(3)
  int price;

  Additional(
      this.id,
      this.name,
      this.price,);

  factory Additional.fromJson(Map<String,dynamic> json)=>_$AdditionalFromJson(json);

  Map<String,dynamic> toJson()=>_$AdditionalToJson(this);
}