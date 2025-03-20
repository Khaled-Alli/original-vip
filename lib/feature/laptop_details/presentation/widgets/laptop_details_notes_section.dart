import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:original_vip/core/helpers/constants/constants.dart';
import 'package:original_vip/feature/home/model/laptop_model.dart';

import '../../../../../core/helpers/colors/colors.dart';
import '../../../../../core/helpers/extentions/extentions.dart';
import '../../../../../core/helpers/themes/themes.dart';

class LaptopDetailsNotesSection extends StatelessWidget {
   LaptopDetailsNotesSection(this.laptop,{super.key});
Laptop laptop;
  @override
  Widget build(BuildContext context) {
    return  Container(
      //  height: 90.h,
      width: 340.w,
      padding: EdgeInsets.all(10.w),
      decoration: BoxDecoration(
        //  color: AppColors.lightBackgroundColor,
        borderRadius: BorderRadius.circular(
          16,
        ),
        border: Border.all(
          color: AppColors.darktGrayColor,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
           AppConstants.notesText,
            style: TextStyles.font13whiteBold,
          ),
          verticalSpace(10),
          SingleChildScrollView(
            child: SizedBox(
                width: 340.w,
                height: 100.h,
                child: SelectableText(
                  laptop.notes,
                  style: TextStyles.font13whiteBold,
                )),
          ),
        ],
      ),
    );
  }
}
