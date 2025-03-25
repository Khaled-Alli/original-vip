import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/colors/colors.dart';
import '../../../../core/helpers/constants/constants.dart';
import '../../../../core/helpers/extentions/extentions.dart';
import '../../../../core/helpers/themes/themes.dart';
import '../../view_model/quantity_cubit.dart';

class LaptopDetailsNeededQuantitySection extends StatelessWidget {
  const LaptopDetailsNeededQuantitySection({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
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
      child:

      Row(
        children: [
          Text(
            AppConstants.neededQuantityText,
            style: TextStyles.font13whiteBold,
          ),
          const Spacer(),
          ElevatedButton(
            onPressed:() {
              HapticFeedback.lightImpact();
              context.read<QuantityCubit>().incQuantity();
            },
            child: const Icon(
              Icons.add,
              size: 20,
              color: AppColors.mainColor,
            ),
          ),
          horizontalSpace(15.w),
    BlocBuilder<QuantityCubit,int>(builder: (context,state)=>

          Text(
            state.toString(),
            style: TextStyles.font13whiteBold,
          ),

      ),
          horizontalSpace(15.w),
          ElevatedButton(
            onPressed:() {
              HapticFeedback.lightImpact();
              context.read<QuantityCubit>().decQuantity();
            },
            child: Text(
              "-",
              style: TextStyles.font25mainColorBold,
            ),
          ),
        ],
      ),
    );
  }
}
