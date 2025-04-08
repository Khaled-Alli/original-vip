import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/colors/colors.dart';
import '../../../../core/helpers/constants/constants.dart';
import '../../../../core/helpers/themes/themes.dart';

class PaymentHistory extends StatelessWidget {
  const PaymentHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 80.w,
        height: 42.h,
        padding: EdgeInsets.all(2.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16,),
          border: Border.all(color: Colors.white38,
          ),
          color: AppColors.darktGrayColor,
        ),
        child: Text(AppConstants.paymentHistory_separated_TXT,style: TextStyles.font14whiteBold,textAlign: TextAlign.center,));
  }
}
