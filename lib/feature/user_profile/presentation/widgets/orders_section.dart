import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:original_vip/feature/user_profile/presentation/widgets/order_item.dart';

import '../../../../core/helpers/colors/colors.dart';
import '../../../../core/helpers/extentions/extentions.dart';
import '../../../../core/helpers/themes/themes.dart';
import '../../../cart/model/order_model.dart';

class OrdersSection extends StatelessWidget {
  String title;
  List<Order> orders;
   OrdersSection(this.title,this.orders, {super.key});

  @override
  Widget build(BuildContext context) {
    return    Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.darktGrayColor),
      ),
      child: ExpansionTile(
        shape:  const Border(),
        collapsedShape: const Border(),
        title: Row(
          children: [
            Text(title, style: TextStyles.font15mainColorBold),
            horizontalSpace(10),
            Text(orders.length.toString(), style: TextStyles.font14whiteBold),
          ],
        ),
        children: [
          Container(
            padding: EdgeInsets.all(10.w),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16,),
              border: Border.all(color: AppColors.darktGrayColor,),
            ),
            height: 350.h,
            child:
            ListView.separated(
              itemBuilder: (context, index) => OrderItem(orders[index]),
              separatorBuilder: (context, index) => verticalSpace(10),
              itemCount:orders.length,
            )
            ,


          ),
        ],
      ),
    );
  }
}
