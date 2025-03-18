import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/colors/colors.dart';
import '../../../../core/helpers/constants/constants.dart';
import '../../../../core/helpers/extentions/extentions.dart';
import '../../model/laptop_model.dart';
import 'laptop_details_one_col.dart';

class LaptopDetailsFirstSection extends StatelessWidget {
  Laptop laptop;
   LaptopDetailsFirstSection(this.laptop,{super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: 340.w,
      padding: EdgeInsets.all(10.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          16,
        ),
        border: Border.all(
          color: AppColors.darktGrayColor,
        ),
      ),
      child: Column(
        children: [
          LaptopDetailsOneCol(
            static:AppConstants.nameText,
            detail: laptop.name,
          ),
          verticalSpace(10),
          LaptopDetailsOneCol(
            static: AppConstants.processorText,
            detail: laptop.processor,
          ),
          verticalSpace(10),
          LaptopDetailsOneCol(
            static: AppConstants.vigaText,
            detail: laptop.viga,
          ),
          verticalSpace(10),
          LaptopDetailsOneCol(
            static: AppConstants.ramText,
            detail: laptop.ram,
          ),
          verticalSpace(10),
          LaptopDetailsOneCol(
            static:AppConstants.hardText,
            detail: laptop.hard,
          ),
          verticalSpace(10),
          LaptopDetailsOneCol(
            static: AppConstants.screenText,
            detail: laptop.screenSize,
          ),
          verticalSpace(10),
          LaptopDetailsOneCol(
            static: AppConstants.quantityText,
            detail: laptop.quantity,
          ),
          verticalSpace(10),
          LaptopDetailsOneCol(
            static: AppConstants.priceText,
            detail: laptop.price.toString(),
          ),
        ],
      ),
    );
  }
}
