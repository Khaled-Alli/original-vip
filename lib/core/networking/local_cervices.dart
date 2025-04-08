import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:original_vip/core/helpers/constants/constants.dart';
import 'package:original_vip/core/networking/web_constants.dart';
import 'package:original_vip/feature/cart/model/cart_item_model.dart';

import '../../feature/authentication/model/user_model.dart';


class LocalServices {

  Future<void> saveUser(User user) async {
    var box = await Hive.openBox<User>(ServicesConstants.userBox);
    await box.put(ServicesConstants.USER_TEXT, user);
  }

  Future<User?> getUser(String id) async{
    var box = await Hive.openBox<User>(ServicesConstants.userBox);
    return box.get(id);
  }

  Future<void> deleteUser(String id) async {
    var box = await Hive.openBox<User>(ServicesConstants.userBox);
    await box.delete(id);
  }

  Future<void> deleteUserBox() async {
    await Hive.deleteBoxFromDisk(ServicesConstants.userBox);
  }

  Future<void> deleteCartBox() async {
    await Hive.deleteBoxFromDisk(ServicesConstants.cartItemBox);
  }

  Future<void> saveCartItems(List<CartItem> cartItems) async {
    var box = await Hive.openBox<CartItem>(ServicesConstants.cartItemBox);
    for (var cartItem in cartItems) {
      await box.put(cartItem.id, cartItem);
    }
  }

  Future<void> removeCartItem(String cartItemId) async {
    var box = await Hive.openBox<CartItem>(ServicesConstants.cartItemBox);

    if (box.containsKey(cartItemId)) {
      await box.delete(cartItemId);
    }
  }

  Future<CartItem?> getCartItem(String id) async {
    var box = await Hive.openBox<CartItem>(ServicesConstants.cartItemBox);
    return box.get(id);
  }

  Future<List<CartItem>> getAllCartItems() async {
    var box = await Hive.openBox<CartItem>(ServicesConstants.cartItemBox);
    return box.values.toList();
  }


}
