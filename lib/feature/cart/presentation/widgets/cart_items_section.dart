import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:original_vip/feature/cart/model/cart_item_model.dart';
import 'package:original_vip/feature/cart/view_model/cart_cubit.dart';

import '../../../../core/di/sl.dart';
import '../../../../core/helpers/colors/colors.dart';
import '../../../../core/helpers/extentions/extentions.dart';
import '../../../../core/networking/web_services.dart';
import '../../../../demo-data.dart';
import 'cart_Item.dart';

class CartItemsSection extends StatelessWidget {
  const CartItemsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return
      ClipRRect(
        borderRadius: BorderRadius.circular(16,),
        child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(16,),
          border: Border.all(color: AppColors.darktGrayColor,),
        ),
          padding: const EdgeInsets.all(2),
          height: 220.h,
          child:
          BlocBuilder<CartCubit,List<CartItem>>(builder: (context,state)=>ListView.separated(
            itemBuilder: (context, index) => CartItemBuilder(
              cartItem: context.read<CartCubit>().cartItems[index],
            ),
            separatorBuilder: (context, index) =>
                verticalSpace(10),
            itemCount: context.read<CartCubit>().cartItems.length,
          ))
          ,


        ),
      );
  }
}
