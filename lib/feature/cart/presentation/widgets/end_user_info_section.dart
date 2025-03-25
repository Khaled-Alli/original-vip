import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:original_vip/core/helpers/constants/constants.dart';
import 'package:original_vip/feature/cart/view_model/cart_cubit.dart';

import '../../../../core/helpers/colors/colors.dart';
import '../../../../core/helpers/extentions/extentions.dart';
import '../../../../core/helpers/themes/themes.dart';
import '../../../authentication/presentation/widgets/app_text_form_field.dart';

class EndUserInfoSection extends StatelessWidget {
 const EndUserInfoSection({super.key,});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 340.w,
      padding: EdgeInsets.all(10.w),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(16,), border: Border.all(color: AppColors.darktGrayColor,),),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
           AppConstants.userInfoText,
            style: TextStyles.font13whiteBold,
          ),
          verticalSpace(10),
          AppTextFormField(
            textFormController: context.read<CartCubit>().endUserNameController,
            prefixIcon: const Icon(Icons.person),
            hintText: AppConstants.nameText,
            keyboardType: TextInputType.text,
              validator: context.read<CartCubit>().genericValidator,
            filledColor: AppColors.lightBackgroundColor,
          ),
          verticalSpace(10),
          AppTextFormField(
            textFormController: context.read<CartCubit>().endUserPhoneController,
            prefixIcon: const Icon(Icons.phone),
            hintText: AppConstants.phoneNumberText,
            keyboardType: TextInputType.phone,
            validator:  context.read<CartCubit>().phoneValidator,
            filledColor: AppColors.lightBackgroundColor,
          ),
          verticalSpace(10),
          AppTextFormField(
            textFormController: context.read<CartCubit>().endUserAddressController,
            prefixIcon: const Icon(Icons.home),
            hintText: AppConstants.addressText,
            keyboardType: TextInputType.text,
            validator:  context.read<CartCubit>().genericValidator,
            filledColor: AppColors.lightBackgroundColor,
          ),
        ],
      ),
    );
  }
}
