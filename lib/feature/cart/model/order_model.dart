import 'package:json_annotation/json_annotation.dart';

part 'order_model.g.dart';
@JsonSerializable()
class Order{
  String id;
  List<String> additionalsID;
  List<String> laptopsID;
  String dealerID;
  String endUserName;
  String endUserPhone;
  String endUserAddress;
  String notes;
  int endUserPrice;
  int commission;


  Order(
      this.id,
      this.laptopsID,
      this.additionalsID,
      this.dealerID,
      this.commission,
      this.notes,
      this.endUserName,
      this.endUserPhone,
      this.endUserAddress,
      this.endUserPrice,
      );

  factory Order.fromJson(Map<String,dynamic> json)=>_$OrderFromJson(json);

  Map<String,dynamic> toJson()=>_$OrderToJson(this);
}