import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:original_vip/core/helpers/constants/constants.dart';
import 'package:original_vip/feature/home/model/laptop_model.dart';
import 'package:original_vip/feature/laptop_details/view_model/quantity_cubit.dart';

import '../../../../core/helpers/colors/colors.dart';
import '../../../authentication/presentation/widgets/app_Button.dart';
import '../../../authentication/presentation/widgets/app_text_form_field.dart';

class LaptopDetailsLastSection extends StatelessWidget {
  Laptop laptop;
   LaptopDetailsLastSection(this.laptop,{super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController userPriceController = TextEditingController();
    final formKey = GlobalKey<FormState>();
    priceValidator(value) {
      if (value == null || value.isEmpty) {
        return AppConstants.enterEndUserPriceText;
      } else if (!RegExp(r'^\d+$').hasMatch(value)) {
        return AppConstants.enterNumbersOnlyText;
      } else if (int.parse(value) <context.read<QuantityCubit>().totalCartItemDealerPrice) {
        return AppConstants.priceMustBeGreaterThanDealerText;
      }
    }
    return Row(
      children: [
        SizedBox(
          width: 150.w,
          child: Form(
            key: formKey,
            child: AppTextFormField(
              textFormController:userPriceController,
              prefixIcon: const Icon(Icons.attach_money_rounded),
              hintText: AppConstants.priceForEndUserText,
              keyboardType: TextInputType.number,
              validator:(value)=> priceValidator(value),
            ),
          ),
        ),
        const Spacer(),
        SizedBox(
          width: 150.w,
          child: AppTextButton(
            buttonText: AppConstants.addToCartText,
            textStyle: TextStyle(
              fontWeight: FontWeight.normal,
              color: AppColors.appWhiteColor,
              fontSize: 16.sp,
            ),
            onPressed: ()  {
              if(formKey.currentState!.validate()){
                //context.read<LaptopDetailsCubit>().addToCart(laptop);
              }
              },
          ),
        ),
      ],
    );

  }

}
