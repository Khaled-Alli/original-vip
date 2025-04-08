import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/colors/colors.dart';
import '../../../../core/helpers/themes/themes.dart';

class EndUserAddress extends StatelessWidget {
  String title;
  String value;
  EndUserAddress(this.title,this.value);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(title, style: TextStyles.font13whiteBold, textAlign: TextAlign.center),
        SizedBox(height: 5.h),
        Container(
          height: 45.h,
          width: 190.w,
          padding: EdgeInsets.symmetric(vertical: 2.h),
          decoration: BoxDecoration(
            color: AppColors.lightBackgroundColor,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: AppColors.darktGrayColor),
          ),
          child: Center(
            child: Text(value,
                style: TextStyles.font13mainColorBold,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center),
          ),
        ),
      ],
    );
  }
}
