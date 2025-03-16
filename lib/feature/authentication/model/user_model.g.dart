// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      (json['id'] as num).toInt(),
      json['name'] as String,
      (json['commission'] as num).toInt(),
      (json['orderID'] as List<dynamic>).map((e) => e as String).toList(),
      json['phone'] as String,
      json['role'] as String,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'phone': instance.phone,
      'orderID': instance.orderID,
      'commission': instance.commission,
      'role': instance.role,
    };
