import 'package:json_annotation/json_annotation.dart';
import 'package:hive/hive.dart';

part 'additional_model.g.dart';

@JsonSerializable()
@HiveType(typeId: 3)
class Additional {
  @HiveField(1)
  String id;
  @HiveField(2)
  String name;
  @HiveField(3)
  int price;
  @HiveField(4)
  int amount;

  Additional(
    this.id,
    this.name,
    this.price, {
    this.amount = 1,
  });

  factory Additional.fromJson(Map<String, dynamic> json) =>
      _$AdditionalFromJson(json);

  Map<String, dynamic> toJson() => _$AdditionalToJson(this);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is Additional &&
              runtimeType == other.runtimeType &&
              id == other.id;

  @override
  int get hashCode => id.hashCode;

}
