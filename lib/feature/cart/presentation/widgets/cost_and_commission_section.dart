import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:original_vip/core/helpers/constants/constants.dart';
import 'package:original_vip/feature/cart/model/cart_item_model.dart';

import '../../../../core/di/sl.dart';
import '../../../../core/helpers/colors/colors.dart';
import '../../../../core/helpers/themes/themes.dart';
import '../../../../core/networking/web_services.dart';
import '../../view_model/cart_cubit.dart';

class CostAndCommissionSection extends StatelessWidget {
  const CostAndCommissionSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit,List<CartItem>>(builder: (context,state)=>  Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(16,), border: Border.all(color: AppColors.darktGrayColor,),),
            padding: EdgeInsets.all(10.w),
            height: 100.h,
            width: 340.w,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      AppConstants.totalDealerPriceText,
                      style: TextStyles.font14whiteBold,
                    ),
                    const Spacer(),
                    Text(
                      context.read<CartCubit>().totalCartItemDealerPrice().toString(),
                      style: TextStyles.font13mainColorBold,
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      AppConstants.totalEndUserPriceText,
                      style: TextStyles.font14whiteBold,
                    ),
                    const Spacer(),
                    Text(
                      context.read<CartCubit>().totalCartItemEndUserPrice().toString(),
                      style: TextStyles.font13mainColorBold,
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      AppConstants.commissionText,
                      style: TextStyles.font14whiteBold,
                    ),
                    const Spacer(),
                    Text(
                      context.read<CartCubit>().commission().toString(),
                      style: TextStyles.font13mainColorBold,
                    ),
                  ],
                ),
              ],
            )),
      );
  }
}
