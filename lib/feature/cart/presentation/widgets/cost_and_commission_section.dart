import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/helpers/colors/colors.dart';
import '../../../../core/helpers/themes/themes.dart';
import '../../../../core/helpers/constants/constants.dart';
import '../../model/cart_item_model.dart';
import '../../view_model/cart_cubit.dart';

class CostAndCommissionSection extends StatelessWidget {
  const CostAndCommissionSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, List<CartItem>>(
      builder: (context, state) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: AppColors.darktGrayColor),
          ),
          padding: EdgeInsets.all(10.w),
          height: 100.h,
          width: 340.w,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildRow(AppConstants.totalDealerPriceText, context.read<CartCubit>().totalCartItemDealerPrice()),
              _buildRow(AppConstants.totalEndUserPriceText, context.read<CartCubit>().totalCartItemEndUserPrice()),
              _buildRow(AppConstants.commissionText, context.read<CartCubit>().commission()),
            ],
          ),
        );
      },
    );
  }

  Widget _buildRow(String label, int value) {
    return Row(
      children: [
        Text(label, style: TextStyles.font14whiteBold),
        const Spacer(),
        Text(value.toString(), style: TextStyles.font13mainColorBold),
      ],
    );
  }
}
