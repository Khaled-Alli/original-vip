import 'package:flutter_bloc/flutter_bloc.dart';

import '../../home/model/additional_model.dart';

class QuantityCubit extends Cubit<int>{
  QuantityCubit():super(1);
  int tempPrice = 0;
  int totalCartItemDealerPrice = 0;

  void incQuantity() {
    emit(state + 1);
  }

  void decQuantity() {
    if (state > 1) {
      emit(state -1);
    }
  }


  int totalPriceForDealer({required int laptopPrice,required List<Additional> cartItemSelectedAdditionals}) {
    if (cartItemSelectedAdditionals.isEmpty) {
      totalCartItemDealerPrice = laptopPrice * state;
      return totalCartItemDealerPrice;
    } else {
      tempPrice = cartItemSelectedAdditionals.fold(
          0, (previousValue, additional) => previousValue + additional.price);
      totalCartItemDealerPrice = tempPrice + (laptopPrice * state);
      return totalCartItemDealerPrice;
    }
  }
}