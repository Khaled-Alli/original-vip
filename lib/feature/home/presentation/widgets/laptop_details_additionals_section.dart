import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:original_vip/demo-data.dart';
import 'package:original_vip/feature/home/model/additional_model.dart';
import 'package:original_vip/feature/home/view_model/home_cubit.dart';
import 'package:original_vip/feature/home/view_model/home_state.dart';

import '../../../../core/di/sl.dart';
import '../../../../core/helpers/colors/colors.dart';
import '../../../../core/helpers/constants/constants.dart';
import '../../../../core/helpers/extentions/extentions.dart';
import '../../../../core/helpers/themes/themes.dart';

class LaptopDetailsAdditionalsSection extends StatelessWidget {
  LaptopDetailsAdditionalsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return
      BlocBuilder<HomeCubit,HomeState>(builder: (context,state)=> Container(
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
        child: Row(
          children: [
            ElevatedButton(
              onPressed:()=> context.read<HomeCubit>().showMultiSelectDialog(context),
              child: Text(
                AppConstants.additionalsText,
                style: TextStyles.font13mainColorBold,
              ),
            ),
            horizontalSpace(10.w),
            SizedBox(
              width: 220.w,
              child: Align(
                alignment: Alignment.centerRight,
                child: Text(
                  context.read<HomeCubit>().cartItemSelectedAdditionals.isEmpty
                      ? AppConstants.noAdditionalsText
                      : "${context.read<HomeCubit>().cartItemSelectedAdditionals.map((i) {
                    return "${i.name} ";
                  })}",
                  style: TextStyles.font13whiteBold,
                  textDirection: TextDirection.ltr,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ],
        ),
      ))
     ;
  }
}
