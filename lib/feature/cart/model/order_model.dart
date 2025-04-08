import 'package:json_annotation/json_annotation.dart';
import 'package:hive/hive.dart';

import 'cart_item_model.dart';
part 'order_model.g.dart';
//instance.cartItems?.map((cartItem) => cartItem.toJson()).toList() ?? [],
@JsonSerializable()
@HiveType(typeId: 5)
class Order {
  @HiveField(1)
  String id;
  @HiveField(2)
  String dealerID;
  @HiveField(3)
  String endUserName;
  @HiveField(4)
  String endUserPhone;
  @HiveField(5)
  String endUserAddress;
  @HiveField(6)
  String notes;
  @HiveField(7)
  @JsonKey(name: "totalDealerPrice")
  int totalOrderDealerPrice;
  @HiveField(8)
  @JsonKey(name: "totalEndUserPrice")
  int totalOrderEndUserPrice;
  @HiveField(9)
  int commission;
  @HiveField(10)
  String orderStatus;
  @HiveField(11)
  List<CartItem>? cartItems;
  @HiveField(12)
  String date;

  Order(
      this.id,
      this.dealerID,
      this.commission,
      this.notes,
      this.endUserName,
      this.endUserPhone,
      this.endUserAddress,
      this.totalOrderDealerPrice,
      this.cartItems,
      this.orderStatus,
      this.totalOrderEndUserPrice,
      this.date,
      );

  factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);

  Map<String, dynamic> toJson() => _$OrderToJson(this);
}
