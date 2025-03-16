
import 'package:json_annotation/json_annotation.dart';
part 'user_model.g.dart';
@JsonSerializable()
class User {
  int id;
  String name;
  String phone;
  List<String> orderID;
  int commission;
  String role;

  User({
    required this.id,
    required this.name,
    required this.commission,
    required this.orderID,
    required this.phone,
    required this.role,
  });
  factory User.fromJson(Map<String,dynamic> json)=>_$UserFromJson(json);

  Map<String,dynamic> toJson()=>_$UserToJson(this);

}
