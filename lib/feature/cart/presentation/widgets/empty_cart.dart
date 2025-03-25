import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:original_vip/core/helpers/colors/colors.dart';
import 'package:original_vip/core/helpers/constants/constants.dart';
import 'package:original_vip/core/helpers/extentions/extentions.dart';

import '../../../../core/helpers/themes/themes.dart';

class EmptyCart extends StatelessWidget {
  const EmptyCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
            width: 200.w,
            decoration: BoxDecoration(color: AppColors.mainColor, borderRadius: BorderRadius.circular(500.w),),
            padding: EdgeInsets.all(50.w),
            child: Image.asset(AppConstants.emptyCartImagePath)),
        verticalSpace(20.h),
        Text(AppConstants.noProductOnCart,style: TextStyles.font25mainColorBold,),
      ],
    );
  }
}
