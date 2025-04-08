// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_item_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CartItemAdapter extends TypeAdapter<CartItem> {
  @override
  final int typeId = 4;

  @override
  CartItem read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CartItem(
      fields[1] as String,
      fields[2] as int,
      fields[3] as int,
      fields[4] as int,
      (fields[5] as List?)?.cast<Laptop>(),
      (fields[6] as List?)?.cast<Additional>(),
    );
  }

  @override
  void write(BinaryWriter writer, CartItem obj) {
    writer
      ..writeByte(6)
      ..writeByte(1)
      ..write(obj.id)
      ..writeByte(2)
      ..write(obj.amount)
      ..writeByte(3)
      ..write(obj.totalCartItemDealerPrice)
      ..writeByte(4)
      ..write(obj.totalCartItemEndUserPrice)
      ..writeByte(5)
      ..write(obj.laptop)
      ..writeByte(6)
      ..write(obj.additionals);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CartItemAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CartItem _$CartItemFromJson(Map<String, dynamic> json) => CartItem(
      json['id'] as String,
      (json['amount'] as num).toInt(),
      (json['totalCartItemDealerPrice'] as num).toInt(),
      (json['totalCartItemEndUserPrice'] as num).toInt(),
      (json['laptop'] as List<dynamic>?)
          ?.map((e) => Laptop.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['additionals'] as List<dynamic>?)
          ?.map((e) => Additional.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CartItemToJson(CartItem instance) => <String, dynamic>{
      'id': instance.id,
      'amount': instance.amount,
      'totalCartItemDealerPrice': instance.totalCartItemDealerPrice,
      'totalCartItemEndUserPrice': instance.totalCartItemEndUserPrice,
      //'laptop': instance.laptop?.map((laptop) => laptop.toJson()).toList() ?? [],
      // 'additionals': instance.additionals?.map((additionals) => additionals.toJson()).toList() ?? [],
    };
