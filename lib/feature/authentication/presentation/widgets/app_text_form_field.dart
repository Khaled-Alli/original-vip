import 'package:flutter/material.dart';

import '../../../../core/helpers/colors/colors.dart';

class AppTextFormField extends StatelessWidget {
  AppTextFormField({
    super.key,
    required this.textFormController,
    required this.prefixIcon,
    required this.hintText,
    required this.keyboardType,
    required this.validator,
    this.filledColor,
  });

  TextEditingController textFormController;
  Widget prefixIcon;
  String hintText;
  TextInputType keyboardType;
  Function(String?) validator;
  Color? filledColor;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: TextFormField(
        controller: textFormController,
        decoration: InputDecoration(
          fillColor: filledColor ?? AppColors.darktGrayColor,
          filled: true,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(
              color: AppColors.darktGrayColor,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(
              color: AppColors.lightGrayColor,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(
              color: AppColors.mainColor,
            ),
          ),
          focusedErrorBorder:OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(
              color: AppColors.mainColor,
            ),
          ),
          prefixIcon: prefixIcon,
          hintText: hintText,
          errorStyle: const TextStyle(color: AppColors.mainColor),
        ),
        keyboardType: keyboardType,
        //  textDirection:TextDirection.rtl,
        validator: (value) {
          return validator(value);
        },
      ),
    );
  }
}
