// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      commission: (json['commission'] as num).toInt(),
      orderID:
          (json['orderID'] as List<dynamic>).map((e) => e as String).toList(),
      phone: json['phone'] as String,
      role: json['role'] as String,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'phone': instance.phone,
      'orderID': instance.orderID,
      'commission': instance.commission,
      'role': instance.role,
    };
