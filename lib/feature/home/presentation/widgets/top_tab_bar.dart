import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:original_vip/core/helpers/constants/constants.dart';

import '../../../../core/helpers/colors/colors.dart';
import 'my_tab.dart';

class TopTabBar extends StatelessWidget {
  const TopTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return   Material(
      child: TabBar(
          padding: EdgeInsets.all(10.w),
          physics: const ClampingScrollPhysics(),
          indicator: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: AppColors.mainColor,
          ),
          splashBorderRadius: BorderRadius.circular(25),
          dividerHeight: 0,
          tabs: [
            MyTab(text: AppConstants.allLaptopsText,),
            MyTab(text: AppConstants.inEgText,),
            MyTab(text: AppConstants.inAUDText,),
          ]),
    );
  }
}
