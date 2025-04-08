import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:original_vip/core/helpers/constants/constants.dart';
import 'package:original_vip/core/networking/web_constants.dart';
import 'package:original_vip/feature/home/model/additional_model.dart';
import 'package:original_vip/feature/user_profile/model/payment.dart';

import '../../feature/authentication/model/user_model.dart';
import '../../feature/cart/model/cart_item_model.dart';
import '../../feature/cart/model/order_model.dart' as MyOrders;
import '../../feature/home/model/laptop_model.dart';

class WebServices {
  FirebaseFirestore firebaseFirestore;

  WebServices(this.firebaseFirestore);

  Future<Either<String, User>> getUser(String phone, String password) async {
    try {
      final snapshot = (await firebaseFirestore.collection(ServicesConstants.USERS_TEXT)
          .where(ServicesConstants.PHONE_FIELD_TEXT, isEqualTo: phone.trim())
          .where(ServicesConstants.PASSWORD_FIELD_TEXT, isEqualTo: password.trim())
          .get());
      if (snapshot.docs.isNotEmpty) {
        final userData = snapshot.docs.first.data();
        return Right(User.fromJson(userData as Map<String, dynamic>));
      } else {
        return const Left(AppConstants.userNotFoundText);
      }
    } catch (error) {
      print(error.toString()+"******************************");
      return Left(AppConstants.ensureInternetConnection.toString());
    }
  }

  Future<Either<String, List<Laptop>>> getLaptops() async {
    try {
      final snapshot = (await firebaseFirestore
          .collection(ServicesConstants.LAPTOPS_TEXT)
          .where(ServicesConstants.VISIBILITY_TEXT, isEqualTo: true)
          .get());
      if (snapshot.docs.isNotEmpty) {
        List<Laptop> laptops = snapshot.docs.map((doc) => Laptop.fromJson(doc.data() as Map<String, dynamic>)).toList();
        return Right(laptops );
      } else {
        return const Left(AppConstants.noAvailableLaptopsTXT);
      }
    } catch (error) {
      print(error);
      return Left(AppConstants.ensureInternetConnection.toString());
    }
  }

  Future<Either<String, List<Additional>>> getAdditionals() async {
    try {
      final snapshot = (await firebaseFirestore
          .collection(ServicesConstants.ADDITIONALS_TEXT)
          .get());
      if (snapshot.docs.isNotEmpty) {
        final additionals = snapshot.docs.map((doc) => Additional.fromJson(doc.data() as Map<String, dynamic>)).toList();
        return Right(additionals);
      } else {
        return const Left(AppConstants.noAvailableAdditionalsTXT);
      }
    } catch (error) {
      print(error);
      return Left(AppConstants.ensureInternetConnection.toString());
    }
  }

  Future<Either<String, List<Payment>>> getPayments(String dealerID) async {
    try {
      final snapshot = (await firebaseFirestore
          .collection(ServicesConstants.PAYMENTS_TEXT)
          .where(ServicesConstants.DEALER_ID_TEXT, isEqualTo: dealerID)
          .get());
      if (snapshot.docs.isNotEmpty) {
        final payments = snapshot.docs.map((doc) => Payment.fromJson(doc.data() as Map<String, dynamic>)).toList();
        return Right(payments);
      } else {
        return const Left(AppConstants.noAvailablePaymentsTXT);
      }
    } catch (error) {
      return Left(AppConstants.ensureInternetConnection.toString());
    }
  }

  Future<Either<String, List<MyOrders.Order>>> getOrders(String dealerID) async {
    try {
      final snapshot = await firebaseFirestore.collection(ServicesConstants.ORDERS_TEXT)
          .where(ServicesConstants.DEALER_ID_TEXT, isEqualTo: dealerID)
          .get();

      if (snapshot.docs.isEmpty) {
        return const Left(AppConstants.noAvailableOrdersTXT);
      }

      List<MyOrders.Order> orders = [];

      for (var doc in snapshot.docs) {
        Map<String, dynamic> orderData = doc.data() as Map<String, dynamic>;
        List<CartItem> cartItems = [];

        final cartSnapshot = await firebaseFirestore
            .collection(ServicesConstants.ORDERS_TEXT)
            .doc(doc.id)
            .collection(ServicesConstants.CART_ITEMS_TEXT)
            .get();

        for (var cartDoc in cartSnapshot.docs) {
          Map<String, dynamic> cartData = cartDoc.data();
          List<Additional> additionals = [];
          List<Laptop> laptops = [];

          final additionalsSnapshot = await firebaseFirestore
              .collection(ServicesConstants.ORDERS_TEXT)
              .doc(doc.id)
              .collection(ServicesConstants.CART_ITEMS_TEXT)
              .doc(cartDoc.id)
              .collection(ServicesConstants.ADDITIONALS_TEXT)
              .get();

          if (additionalsSnapshot.docs.isNotEmpty) {
            additionals = additionalsSnapshot.docs
                .map((addDoc) => Additional.fromJson(addDoc.data()))
                .toList();
          }

          final laptopsSnapshot = await firebaseFirestore
              .collection(ServicesConstants.ORDERS_TEXT)
              .doc(doc.id)
              .collection(ServicesConstants.CART_ITEMS_TEXT)
              .doc(cartDoc.id)
              .collection(ServicesConstants.LAPTOP_TEXT)
              .get();

          if (laptopsSnapshot.docs.isNotEmpty) {
            laptops = laptopsSnapshot.docs
                .map((lapDoc) => Laptop.fromJson(lapDoc.data()))
                .toList();
          }

          CartItem cartItem = CartItem.fromJson(cartData);
          cartItem.additionals = additionals;
          cartItem.laptop = laptops ;

          cartItems.add(cartItem);
        }

        // Convert order
        MyOrders.Order order = MyOrders.Order.fromJson(orderData);
        order.cartItems = cartItems;

        orders.add(order);
      }

      return Right(orders);
    } catch (error) {
      print(error);
      return Left(AppConstants.ensureInternetConnection.toString());
    }
  }

  Future<Either<String, String>> createOrder(MyOrders.Order order) async {

    try {
      DocumentReference orderRef = firebaseFirestore
          .collection(ServicesConstants.ORDERS_TEXT)
          .doc(order.id);

      print(order.toJson().toString());

      await orderRef.set(order.toJson());


      for (var cartItem in order.cartItems ?? []) {
        DocumentReference cartItemRef = orderRef
            .collection(ServicesConstants.CART_ITEMS_TEXT)
            .doc(cartItem.id);

        await cartItemRef.set(cartItem.toJson());

        for (var additional in cartItem.additionals ?? []) {
          await cartItemRef
              .collection(ServicesConstants.ADDITIONALS_TEXT)
              .doc(additional.id)
              .set(additional.toJson());
        }

        for (var laptop in cartItem.laptop ?? []) {
          await cartItemRef
              .collection(ServicesConstants.LAPTOP_TEXT)
              .doc(laptop.id)
              .set(laptop.toJson());
        }
      }

      return const Right(AppConstants.orderCreatedSuccessfullyText);
    } catch (error, stackTrace) {
      print("❌ Error creating order: ${error.toString()}");
      print("🔴 StackTrace: $stackTrace");
      return const Left(AppConstants.ensureInternetConnection);
    }
  }

}
