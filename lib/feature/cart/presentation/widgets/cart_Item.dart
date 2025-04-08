import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:original_vip/feature/cart/view_model/cart_cubit.dart';

import '../../../../core/di/sl.dart';
import '../../../../core/helpers/colors/colors.dart';
import '../../../../core/helpers/constants/constants.dart';
import '../../../../core/helpers/extentions/extentions.dart';
import '../../../../core/helpers/themes/themes.dart';
import '../../../../core/networking/web_services.dart';
import '../../model/cart_item_model.dart';

class CartItemBuilder extends StatelessWidget {
  CartItem cartItem;
  CartItemBuilder({super.key,required this.cartItem});

  @override
  Widget build(BuildContext context) {
    return  Container(
     // width: 333.w,
      height: 195.h,
      // margin: EdgeInsets.symmetric(horizontal: 5.w),
      decoration: BoxDecoration(
        color: AppColors.lightBackgroundColor,
        borderRadius: BorderRadius.circular(16),

      ),
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                children: [
                  Container(
                    height: 85.h,
                    padding: EdgeInsets.all(10.w),
                    child: Row(children: [
                      SizedBox(
                        width: 160.w,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                          Text(cartItem.laptop![0].name,style: TextStyles.font13whiteBold ,maxLines: 1,overflow: TextOverflow.ellipsis,),
                          Text(cartItem.laptop![0].viga,style: TextStyles.font13whiteBold,maxLines: 1,overflow: TextOverflow.ellipsis,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                  width: 45.w,
                                  child: Text(cartItem.laptop![0].ram,style: TextStyles.font13whiteBold,maxLines: 1,overflow: TextOverflow.ellipsis,)),
                              SizedBox(
                                  width: 50.w,
                                  child: Text(cartItem.laptop![0].hard,style: TextStyles.font13whiteBold,maxLines: 1,overflow: TextOverflow.ellipsis,)),
                            ],),
                        ],),
                      ),
                      SizedBox(
                        width: 70.w,
                         child:   Column(
                          children: [
                            Text(cartItem.laptop![0].processor,style: TextStyles.font13whiteBold,maxLines: 1,overflow: TextOverflow.ellipsis,),
                            verticalSpace(4),
                            Text("${cartItem.laptop![0].price} L.E",style: TextStyles.font13mainColorBold,maxLines: 1,overflow: TextOverflow.ellipsis,),
                            Text("X",style: TextStyles.font10mainColorBold,maxLines: 1,overflow: TextOverflow.ellipsis,textAlign: TextAlign.center,),
                            Text("${cartItem.amount}",style: TextStyles.font13mainColorBold,maxLines: 1,overflow: TextOverflow.ellipsis,textAlign: TextAlign.center,),
                          ],
                        ),
                      ),
                    ],),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 3.h),
                    width: 234.w,
                    child: const Divider(color: AppColors.lightGrayColor,height: 0,),
                  ),
                  SizedBox(
                    height: 40.h,
                    width: 210.w,
                      child: Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding:  EdgeInsets.only(right: 10.w),
                              child: Text(
                                cartItem.additionals!.isEmpty
                                    ? AppConstants.noAdditionalsText
                                    : cartItem.additionals!.map((i) => "${i.name} X ${i.amount}").join(", "),
                                style: TextStyles.font13whiteBold,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                          SizedBox(height: 30.h,
                              width: 50.w,
                              child: Center(child: Text( AppConstants.additionalsTXT,style: TextStyles.font13whiteBold,maxLines: 1,overflow: TextOverflow.ellipsis,))),
              
                        ],
                      )),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 3.h),
                    width: 234.w,
                    child: const Divider(color: AppColors.lightGrayColor,height: 0,),
                  ),
                  SizedBox(
                    width: 234.w,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              SizedBox(
                                  height: 37.h,
                                  width:70.w,
                                  child: Center(child: Text(AppConstants.commissionTXT,style: TextStyles.font13whiteBold ,maxLines: 2,overflow: TextOverflow.ellipsis,textAlign: TextAlign.center,))),
                              SizedBox(
                                  width:70.w,
                                  child: Text((cartItem.totalCartItemEndUserPrice - cartItem.totalCartItemDealerPrice).toString(),style: TextStyles.font13mainColorBold ,maxLines: 1,overflow: TextOverflow.ellipsis,textAlign: TextAlign.center,)),
                            ],),
                          Column(
                            children: [
                            SizedBox(
                                width:70.w,
                                child: Text(AppConstants.totalPriceForEndUserTXT,style: TextStyles.font13whiteBold ,maxLines: 2,overflow: TextOverflow.ellipsis,textAlign: TextAlign.center,)),
                            SizedBox(
                                width:70.w,
                                child: Text(cartItem.totalCartItemEndUserPrice.toString(),style: TextStyles.font13mainColorBold ,maxLines: 1,overflow: TextOverflow.ellipsis,textAlign: TextAlign.center,)),
                          ],),
                          Column(
                            children: [
                              SizedBox(
                                  width:70.w,
                                  child: Text(AppConstants.totalPriceForDealerTXT,style: TextStyles.font13whiteBold ,maxLines: 2,overflow: TextOverflow.ellipsis,textAlign: TextAlign.center,)),
                              SizedBox(
                                  width:70.w,
                                  child: Text(cartItem.totalCartItemDealerPrice.toString(),style: TextStyles.font13mainColorBold ,maxLines: 1,overflow: TextOverflow.ellipsis,textAlign: TextAlign.center,)),
                            ],),
                        ],
                      )),
                ],
              ),
            ),
            GestureDetector(

             onTap: () {
               HapticFeedback.lightImpact();
               context.read<CartCubit>().removeFromCart(cartItem);
             },
              child: Container(
                  decoration:  const BoxDecoration(

                    color:  AppColors.darkColor,
                    borderRadius: BorderRadius.only(topRight: Radius.circular(16),bottomRight:Radius.circular(16) ),
                  ),

                  width: 80.w,
                  child: const Center(child: Icon(Icons.delete_rounded,color: AppColors.mainColor,size: 30,),)),
            ),
          ],
        ),
      ),
    );
  }
}








