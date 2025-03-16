
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
