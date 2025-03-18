import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:original_vip/core/helpers/colors/colors.dart';
import 'package:original_vip/core/helpers/extentions/extentions.dart';
import 'package:original_vip/feature/home/model/laptop_model.dart';
import 'package:original_vip/feature/home/presentation/widgets/laptop_details_additionals_section.dart';
import 'package:original_vip/feature/home/presentation/widgets/laptop_details_checkbox.dart';
import 'package:original_vip/feature/home/presentation/widgets/laptop_details_checkbox_section.dart';
import 'package:original_vip/feature/home/presentation/widgets/laptop_details_first_section.dart';
import 'package:original_vip/feature/home/presentation/widgets/laptop_details_last_section.dart';
import 'package:original_vip/feature/home/presentation/widgets/laptop_details_needed_quantity_section.dart';
import 'package:original_vip/feature/home/presentation/widgets/laptop_details_notes_section.dart';
import 'package:original_vip/feature/home/presentation/widgets/laptop_details_one_col.dart';
import 'package:original_vip/feature/home/presentation/widgets/laptop_details_total_price_section.dart';
import 'package:original_vip/feature/home/presentation/widgets/my_appbar.dart';

import '../../../core/helpers/constants/constants.dart';
import '../../../core/helpers/themes/themes.dart';
import '../../authentication/presentation/widgets/app_Button.dart';
import '../../authentication/presentation/widgets/app_text_form_field.dart';

class LaptopDetailsScreen extends StatelessWidget {
  Laptop laptop;

  LaptopDetailsScreen(this.laptop, {super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.black,
          statusBarIconBrightness: Brightness.light,
          statusBarBrightness: Brightness.light,
        ),
        backgroundColor: AppColors.lightBackgroundColor,
        title: const MyAppBar(),
        toolbarHeight: 60.h,
        leading: GestureDetector(
          child: const Icon(
            Icons.arrow_back_outlined,
            color: AppColors.mainColor,
          ),
          onTap: () {
            context.pop();
          },
        ),
      ),
      body: SafeArea(
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: SingleChildScrollView(
            child: Container(
                height: 750.h,
                width: 360.w,
                margin: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                     LaptopDetailsFirstSection(laptop),
                    verticalSpace(10),
                    LaptopDetailsCheckboxSection(laptop),
                    verticalSpace(10),
                    LaptopDetailsAdditionalsSection(),
                    verticalSpace(10),
                    const LaptopDetailsNeededQuantitySection(),
                    verticalSpace(10),
                    LaptopDetailsNotesSection(laptop),
                    verticalSpace(10),
                     LaptopDetailsTotalPriceSection(laptop),
                    verticalSpace(30),
                    const LaptopDetailsLastSection(),
                  ],
                )),
          ),
        ),
      ),
    );
  }
}
