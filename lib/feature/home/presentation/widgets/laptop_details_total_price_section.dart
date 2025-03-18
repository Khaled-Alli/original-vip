import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:original_vip/core/helpers/constants/constants.dart';

import '../../../../core/helpers/colors/colors.dart';
import '../../../../core/helpers/themes/themes.dart';
import '../../model/laptop_model.dart';
import '../../view_model/home_cubit.dart';
import '../../view_model/home_state.dart';

class LaptopDetailsTotalPriceSection extends StatelessWidget {
  Laptop laptop;
   LaptopDetailsTotalPriceSection(this.laptop,{super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 340.w,
      padding: EdgeInsets.all(10.w),
      decoration: BoxDecoration(
        color: AppColors.lightBackgroundColor,
        borderRadius: BorderRadius.circular(
          16,
        ),
        border: Border.all(
          color: AppColors.mainColor,
          //AppColors.darktGrayColor,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
           AppConstants.totalPriceForDealerText,
            style: TextStyles.font13whiteBold,
          ),
          Spacer(),
          BlocBuilder<HomeCubit,HomeState>(builder: (context,state)=>
          Text(
            context.read<HomeCubit>().totalPriceForDealer(laptopPrice: laptop.price).toString(),
            style: TextStyles.font13whiteBold,
          ),),
        ],
      ),
    );
  }
}
