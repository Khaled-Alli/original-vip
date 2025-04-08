import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:original_vip/core/networking/local_cervices.dart';
import 'package:original_vip/core/networking/web_services.dart';
import 'package:original_vip/feature/cart/model/cart_item_model.dart';
import 'package:original_vip/feature/home/view_model/laptop_cubit.dart';
import '../../../core/helpers/constants/constants.dart';
import '../../../core/helpers/extentions/extentions.dart';
import '../../home/model/additional_model.dart';
import '../../home/model/laptop_model.dart';
import 'cart_state.dart';

class CartCubit extends Cubit<List<CartItem>> {
  WebServices webServices;
  LocalServices localServices;

  CartCubit(this.webServices, this.localServices) : super([]) {
    _loadCartItems();
  }

  TextEditingController endUserNameController = TextEditingController();
  TextEditingController endUserPhoneController = TextEditingController();
  TextEditingController endUserAddressController = TextEditingController();
  TextEditingController endUserOrderNotesController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  List<CartItem> cartItems = [];

  Future<void> _loadCartItems() async {
    cartItems = await localServices.getAllCartItems();
    if (!isClosed) {
      emit([...cartItems]);
    }
  }

  void addToCart(CartItem cartItem) async {
    cartItems.add(cartItem);
    await localServices.saveCartItems(cartItems);
    emit([...cartItems]);
  }

  void removeFromCart(CartItem cartItem) async {
    cartItems.remove(cartItem);
    await localServices.removeCartItem(cartItem.id);
    emit([...cartItems]);
  }

  bool isLaptopInCart(String laptopID) {
    return cartItems.any((item) => item.laptop![0].id == laptopID);
  }

  int totalCartItemDealerPrice() {
    return state.fold(
        0,
        (previousValue, cartItem) =>
            (previousValue + cartItem.totalCartItemDealerPrice).toInt());
  }

  int totalCartItemEndUserPrice() {
    return state.fold(
        0,
        (previousValue, cartItem) =>
            (previousValue + cartItem.totalCartItemEndUserPrice).toInt());
  }

  int commission() {
    return totalCartItemEndUserPrice() - totalCartItemDealerPrice();
  }

  Future<void> afterCreateOrder() async {
    await localServices.deleteCartBox();
    endUserNameController.text = "";
    endUserPhoneController.text = "";
    endUserAddressController.text = "";
    endUserOrderNotesController.text = "";
    cartItems = [];
    emit([]);
  }

  phoneValidator(value) {
    if (value == null || value.isEmpty || value.toString().length < 11) {
      return AppConstants.enterValidPhoneText;
    }
  }

  genericValidator(value) {
    if (value == null || value.isEmpty) {
      return AppConstants.enterThisInfo;
    }
  }

  void validateOrderInfo() {
    if (formKey.currentState!.validate()) {
      // await context.read<AuthCubit>().login();
      formKey.currentState!.save();
      // print(endUserPhoneController.text);
      // print(endUserOrderNotesController.text);
      print("context.read<CartCubit>().endUserNameController.text");
    }
  }
}
