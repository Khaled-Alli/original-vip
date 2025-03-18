import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:original_vip/feature/home/model/laptop_model.dart';

import '../../../../core/helpers/colors/colors.dart';
import '../../../../core/helpers/constants/constants.dart';
import 'laptop_details_checkbox.dart';

class LaptopDetailsCheckboxSection extends StatelessWidget {
  Laptop laptop;
  LaptopDetailsCheckboxSection(this.laptop,{super.key});

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
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              LaptopDetailsCheckbox(
                  txt: AppConstants.cameraText,
                  value: laptop.camera,
                  onChange: (bool? x) {}),
              LaptopDetailsCheckbox(
                  txt: AppConstants.touchScreenText,
                  value: laptop.touch,
                  onChange: (bool? x) {}),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              LaptopDetailsCheckbox(
                  txt: AppConstants.keyboardBacklightText,
                  value: laptop.keyboardBackLight,
                  onChange: (bool? x) {}),
              LaptopDetailsCheckbox(
                  txt: AppConstants.acceptAdditionalHardText,
                  value: !laptop.acceptAdditionalHard,
                  onChange: (bool? x) {}),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(right: 4.w),
            child: LaptopDetailsCheckbox(
                txt: AppConstants.inEgyptText,
                value: !laptop.inAED,
                onChange: (bool? x) {}),
          ),
        ],
      ),
    );
  }
}
