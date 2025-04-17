// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class OrderAdapter extends TypeAdapter<Order> {
  @override
  final int typeId = 5;

  @override
  Order read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Order(
      fields[1] as String,
      fields[2] as String,
      fields[9] as int,
      fields[6] as String,
      fields[3] as String,
      fields[4] as String,
      fields[5] as String,
      fields[7] as int,
      (fields[11] as List?)?.cast<CartItem>(),
      fields[10] as String,
      fields[8] as int,
      fields[12] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Order obj) {
    writer
      ..writeByte(12)
      ..writeByte(1)
      ..write(obj.id)
      ..writeByte(2)
      ..write(obj.dealerID)
      ..writeByte(3)
      ..write(obj.endUserName)
      ..writeByte(4)
      ..write(obj.endUserPhone)
      ..writeByte(5)
      ..write(obj.endUserAddress)
      ..writeByte(6)
      ..write(obj.notes)
      ..writeByte(7)
      ..write(obj.totalOrderDealerPrice)
      ..writeByte(8)
      ..write(obj.totalOrderEndUserPrice)
      ..writeByte(9)
      ..write(obj.commission)
      ..writeByte(10)
      ..write(obj.orderStatus)
      ..writeByte(11)
      ..write(obj.cartItems)
      ..writeByte(12)
      ..write(obj.date);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OrderAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Order _$OrderFromJson(Map<String, dynamic> json) => Order(
      json['id'] as String,
      json['dealerID'] as String,
      (json['commission'] as num).toInt(),
      json['notes'] as String,
      json['endUserName'] as String,
      json['endUserPhone'] as String,
      json['endUserAddress'] as String,
      (json['totalDealerPrice'] as num).toInt(),
      (json['cartItems'] as List<dynamic>?)
          ?.map((e) => CartItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['orderStatus'] as String,
      (json['totalEndUserPrice'] as num).toInt(),
      json['date'] as String,
    );

Map<String, dynamic> _$OrderToJson(Order instance) => <String, dynamic>{
      'id': instance.id,
      'dealerID': instance.dealerID,
      'endUserName': instance.endUserName,
      'endUserPhone': instance.endUserPhone,
      'endUserAddress': instance.endUserAddress,
      'notes': instance.notes,
      'totalDealerPrice': instance.totalOrderDealerPrice,
      'totalEndUserPrice': instance.totalOrderEndUserPrice,
      'commission': instance.commission,
      'orderStatus': instance.orderStatus,
    //  'cartItems': instance.cartItems,
      'date': instance.date,
    };
