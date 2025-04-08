import 'package:json_annotation/json_annotation.dart';
import 'package:original_vip/feature/home/model/additional_model.dart';
import 'package:original_vip/feature/home/model/laptop_model.dart';
import 'package:hive/hive.dart';

part 'cart_item_model.g.dart';


@JsonSerializable()
@HiveType(typeId: 4)
class CartItem {
  @HiveField(1)
  String id;
  @HiveField(2)
  int amount;
  @HiveField(3)
  int totalCartItemDealerPrice;
  @HiveField(4)
  int totalCartItemEndUserPrice;
  @HiveField(5)
  List<Laptop>? laptop;
  @HiveField(6)
  List<Additional>? additionals;

  CartItem(
    this.id,
    this.amount,
    this.totalCartItemDealerPrice,
    this.totalCartItemEndUserPrice,
    this.laptop,
    this.additionals,
  );

  factory CartItem.fromJson(Map<String, dynamic> json) =>
      _$CartItemFromJson(json);

  Map<String, dynamic> toJson() => _$CartItemToJson(this);
}
