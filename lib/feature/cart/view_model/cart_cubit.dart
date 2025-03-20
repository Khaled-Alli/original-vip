import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:original_vip/core/networking/web_services.dart';
import 'package:original_vip/feature/cart/model/cart_item_model.dart';
import 'package:original_vip/feature/home/view_model/home_cubit.dart';
import 'cart_state.dart';


class CartCubit extends Cubit<CartState>{
  WebServices webServices;
  CartCubit(this.webServices) : super(CartInitialState());
  List<CartItem> cartItems=[];
  static CartCubit get(context)=>BlocProvider.of(context);
  int x =10;
  void addToCart(CartItem cartItem){
    cartItems.add(cartItem);
    emit(CartDoneState());
  }

// priceValidator(value) {
//   if (value == null || value.isEmpty) {
//     return AppConstants.enterEndUserPriceText;
//   } else if (!RegExp(r'^\d+$').hasMatch(value)) {
//     return AppConstants.enterNumbersOnlyText;
//   } else if (int.parse(value) < totalCartItemDealerPrice) {
//     return AppConstants.priceMustBeGreaterThanDealerText;
//   }
// }
}