import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:original_vip/core/helpers/constants/constants.dart';
import 'package:original_vip/feature/cart/model/cart_item_model.dart';
import 'package:original_vip/feature/home/model/laptop_model.dart';
import 'package:original_vip/feature/laptop_details/view_model/additional_section_cubit.dart';
import 'package:original_vip/feature/laptop_details/view_model/quantity_cubit.dart';

import '../../../../core/helpers/colors/colors.dart';
import '../../../../core/helpers/extentions/extentions.dart';
import '../../../../core/routing/routing.dart';
import '../../../authentication/presentation/widgets/app_Button.dart';
import '../../../authentication/presentation/widgets/app_text_form_field.dart';
import '../../../cart/view_model/cart_cubit.dart';

class LaptopDetailsLastSection extends StatefulWidget {
  final Laptop laptop;

  const LaptopDetailsLastSection(this.laptop, {super.key});

  @override
  State<LaptopDetailsLastSection> createState() => _LaptopDetailsLastSectionState();
}

class _LaptopDetailsLastSectionState extends State<LaptopDetailsLastSection> {
  final TextEditingController userPriceController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    userPriceController.dispose();
    super.dispose();
  }

  String? priceValidator(value) {
    if (value == null || value.isEmpty) {
      return AppConstants.enterEndUserPriceText;
    } else if (!RegExp(r'^\d+$').hasMatch(value)) {
      return AppConstants.enterNumbersOnlyText;
    } else if (int.parse(value) <
        context.read<QuantityCubit>().totalCartItemDealerPrice) {
      return AppConstants.priceMustBeGreaterThanDealerText;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 150.w,
          child: Form(
            key: formKey,
            child: AppTextFormField(
              textFormController: userPriceController,
              prefixIcon: const Icon(Icons.attach_money_rounded),
              hintText: AppConstants.priceForEndUserText,
              keyboardType: TextInputType.number,
              validator: priceValidator,
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
            onPressed: () {
              HapticFeedback.lightImpact();
              if (formKey.currentState!.validate()) {
                if (!context.read<CartCubit>().isLaptopInCart(widget.laptop.id)) {
                  context.read<CartCubit>().addToCart(CartItem(
                    generateUuid(),
                    context.read<QuantityCubit>().state,
                    context.read<QuantityCubit>().totalCartItemDealerPrice,
                    int.parse(userPriceController.text),
                    [widget.laptop],
                    context.read<AdditionalSectionCubit>().state.selectedAdditionals,
                  ));
                  context.pushNamedAndRemoveUntil(Routes.homeScreen);
                } else {
                  Fluttertoast.showToast(
                    msg: AppConstants.laptopInCartText,
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    backgroundColor: AppColors.whiteColor,
                    textColor: AppColors.mainColor,
                    fontSize: 16.0,
                  );
                }
              } else {
                Fluttertoast.showToast(
                  msg: AppConstants.enterPriceForUserText,
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  backgroundColor: AppColors.whiteColor,
                  textColor: AppColors.mainColor,
                  fontSize: 16.0,
                );
              }
            },
          ),
        ),
      ],
    );
  }
}
