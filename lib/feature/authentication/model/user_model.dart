
import 'package:json_annotation/json_annotation.dart';
import 'package:hive/hive.dart';

part 'user_model.g.dart';

@JsonSerializable()
@HiveType(typeId: 1)
class User {
  @HiveField(1)
  int id;
  @HiveField(2)
  String name;
  @HiveField(3)
  String phone;
  @HiveField(4)
  List<String> orderID;
  @HiveField(5)
  int commission;
  @HiveField(6)
  String role;

  User(
     this.id,
     this.name,
     this.commission,
     this.orderID,
     this.phone,
     this.role,
  );
  factory User.fromJson(Map<String,dynamic> json)=>_$UserFromJson(json);

  Map<String,dynamic> toJson()=>_$UserToJson(this);

}
