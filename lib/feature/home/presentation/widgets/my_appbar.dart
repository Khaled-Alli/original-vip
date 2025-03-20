import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/constants/constants.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        height: 60.h,
     // color: AppColors.lightBackgroundColor,
        // decoration: const BoxDecoration(
        //   color: AppColors.lightBackgroundColor,
        //   borderRadius: BorderRadius.only(
        //       topLeft: Radius.circular(16), topRight: Radius.circular(16)),
        // ),
        //padding: EdgeInsets.only(left: 10.w),
        // margin: EdgeInsets.all(10.h),
        child: Row(
          children: [
            Image.asset(
              AppConstants.appLogoImagePath,
              width: 55.w,
            ),
            SizedBox(
              width: 10.w,
            ),
            Text(
              AppConstants.APP_NAME,
              style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      );
  }
}
