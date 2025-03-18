import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:original_vip/core/networking/web_services.dart';
import 'package:original_vip/feature/home/model/additional_model.dart';
import '../../../core/helpers/colors/colors.dart';
import '../../../core/helpers/constants/constants.dart';
import '../../../core/helpers/themes/themes.dart';
import '../../../demo-data.dart';
import 'home_state.dart';


class HomeCubit extends Cubit<HomeState>{
  WebServices webServices;
  HomeCubit(this.webServices) : super(HomeInitialState());
  TextEditingController userPriceController = TextEditingController();
  int cartItemQuantity=1;
  //int cartItems=0;
 int totalDealerPrice=0;
 int tempPrice=0;
  final formKey = GlobalKey<FormState>();
  List<Additional> cartItemSelectedAdditionals=[];

  void incCartItemQuantity(){
    cartItemQuantity ++;
    emit(HomeDoneState()); }
  void decCartItemQuantity(){
    if(cartItemQuantity>1)
    cartItemQuantity --;
    emit(HomeDoneState());  }

  // void decCartItems(){
  //   if(cartItems>1) {
  //     cartItems --;
  //   }
  //   emit(HomeDoneState());  }
  // void incCartItems(){
  //   cartItems ++;
  //   emit(HomeDoneState());  }


  int totalPriceForDealer({required int laptopPrice}){

    if(cartItemSelectedAdditionals.isEmpty)
    {
      totalDealerPrice = laptopPrice * cartItemQuantity;
      return totalDealerPrice;
    }else{

      tempPrice = cartItemSelectedAdditionals.fold(0, (previousValue, additional) => previousValue + additional.price);
      totalDealerPrice = tempPrice + (laptopPrice * cartItemQuantity);
      return totalDealerPrice;
    }
  }

  showMultiSelectDialog(BuildContext context) async {
    List<Additional> tempSelected = List.from(cartItemSelectedAdditionals);
    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            AppConstants.additionalsText,
            style: TextStyles.font13whiteBold,
            textDirection: TextDirection.rtl,
          ),
          content: StatefulBuilder(
            builder: (context, setState) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: demo_additional.map((item) {
                  return CheckboxListTile(
                    title: Text(item.name),
                    activeColor: AppColors.mainColor,
                    value: tempSelected.contains(item),
                    subtitle: Text(
                      item.price.toString(),
                      style: TextStyles.font13mainColorBold,
                    ),
                    onChanged: (bool? checked) {
                      setState(() {
                        if (checked == true) {
                          tempSelected.add(item);
                        } else {
                          tempSelected.remove(item);
                        }
                      });
                    },
                  );
                }).toList(),
              );
            },
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text(
                AppConstants.cancelText,
                style: TextStyles.font13mainColorBold,
                textDirection: TextDirection.rtl,
              ),
            ),
            TextButton(
              onPressed: () {
                cartItemSelectedAdditionals = tempSelected;
                Navigator.pop(context);
                emit(HomeDoneState());             },
              child: Text(
                AppConstants.saveText,
                style: TextStyles.font13mainColorBold,
                textDirection: TextDirection.rtl,
              ),
            ),
          ],
        );
      },
    );
  }

  priceValidator(value) {
    if (value == null || value.isEmpty ) {
      return AppConstants.enterEndUserPriceText;
    }else if (!RegExp(r'^\d+$').hasMatch(value)) {
      return AppConstants.enterNumbersOnlyText;
    }else if (int.parse(value) < totalDealerPrice){
      return AppConstants.priceMustBeGreaterThanDealerText;
    }
  }
}