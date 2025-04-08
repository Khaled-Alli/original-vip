import 'package:json_annotation/json_annotation.dart';
import 'package:hive/hive.dart';

part 'payment.g.dart';


@JsonSerializable()
@HiveType(typeId: 6)
class Payment {
  @HiveField(1)
  String id;
  @HiveField(2)
  int amount;
  @HiveField(3)
  String date;
  @HiveField(4)
  String dealerID;

  Payment(
      this.id,
      this.amount,
      this.date,
      this.dealerID,
      );

  factory Payment.fromJson(Map<String, dynamic> json) =>
      _$PaymentFromJson(json);

  Map<String, dynamic> toJson() => _$PaymentToJson(this);
}
