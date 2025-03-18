import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:original_vip/core/helpers/constants/constants.dart';

import '../../../../core/helpers/colors/colors.dart';
import '../../../authentication/presentation/widgets/app_Button.dart';
import '../../../authentication/presentation/widgets/app_text_form_field.dart';
import '../../view_model/home_cubit.dart';
import '../../view_model/home_state.dart';

class LaptopDetailsLastSection extends StatelessWidget {
  const LaptopDetailsLastSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit,HomeState>(builder: (context,state)=>
      Row(
      children: [
        SizedBox(
          width: 150.w,
          child: Form(
            key: context.read<HomeCubit>().formKey,
            child: AppTextFormField(
              textFormController:context.read<HomeCubit>().userPriceController,
              prefixIcon: const Icon(Icons.attach_money_rounded),
              hintText: AppConstants.priceForEndUserText,
              keyboardType: TextInputType.number,
              validator:(value)=> context.read<HomeCubit>().priceValidator(value),
            ),
          ),
        ),
        Spacer(),
        SizedBox(
          width: 150.w,
          child: AppTextButton(
            buttonText: AppConstants.addToCartText,
            textStyle: TextStyle(
              fontWeight: FontWeight.normal,
              color: AppColors.appWhiteColor,
              fontSize: 16.sp,
            ),
            onPressed: ()  {context.read<HomeCubit>().formKey.currentState!.validate();},
          ),
        ),
      ],
    ),);
  }
}
