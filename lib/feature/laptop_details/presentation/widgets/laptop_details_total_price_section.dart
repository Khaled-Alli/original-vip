import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:original_vip/core/helpers/constants/constants.dart';
import 'package:original_vip/feature/laptop_details/view_model/additional_section_cubit.dart';
import 'package:original_vip/feature/laptop_details/view_model/additional_section_state.dart';
import 'package:original_vip/feature/laptop_details/view_model/quantity_cubit.dart';

import '../../../../core/helpers/colors/colors.dart';
import '../../../../core/helpers/themes/themes.dart';
import '../../../authentication/view_model/auth_cubit.dart';
import '../../../home/model/laptop_model.dart';

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
        children: [
          Text(
           AppConstants.totalPriceForDealerText,
            style: TextStyles.font13whiteBold,
          ),
          const Spacer(),
          BlocBuilder<AdditionalSectionCubit,AdditionalSectionState>(builder: (context,state)=>
          BlocBuilder<QuantityCubit,int>(builder: (context,state)=>

              Text(
            context.read<QuantityCubit>().totalPriceForDealer(laptopPrice:context.read<AuthCubit>().user!.role == "trader"? laptop.traderPrice: laptop.dealerPrice,cartItemSelectedAdditionals: context.read<AdditionalSectionCubit>().state.selectedAdditionals).toString(),
            style: TextStyles.font13whiteBold,
          ),

          ),
          ),
        ],
      ),
    );
  }
}
