import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/colors/colors.dart';
import '../../../../core/helpers/themes/themes.dart';

class EndUserPhone extends StatelessWidget {
  String title;
  String value;
   EndUserPhone(this.title,this.value);

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Text(title, style: TextStyles.font13whiteBold, textAlign: TextAlign.center),
        SizedBox(height: 5.h),
        Container(
          width: 120.w,
          height: 45.h,
          padding: EdgeInsets.symmetric(vertical: 2.h),
          decoration: BoxDecoration(
            color: AppColors.lightBackgroundColor,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: AppColors.darktGrayColor),
          ),
          child: Center(
            child: Text(value,
                style: TextStyles.font13mainColorBold,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center),
          ),
        ),
      ],
    );
  }
}
