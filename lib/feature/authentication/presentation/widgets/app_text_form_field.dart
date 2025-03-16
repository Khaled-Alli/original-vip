import 'package:flutter/cupertino.dart';
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
  });

  TextEditingController textFormController;
  Widget prefixIcon;
  String hintText;
  TextInputType keyboardType;
  Function(String?) validator;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: TextFormField(
        controller: textFormController,
        decoration: InputDecoration(
          fillColor: AppColors.darktGrayColor,
          filled: true,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(
              width: 1,
              color: AppColors.darktGrayColor,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(
              width: 1,
              color: AppColors.lightGrayColor,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(
              width: 1,
              color: AppColors.mainColor,
            ),
          ),
          focusedErrorBorder:OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(
              width: 1,
              color: AppColors.mainColor,
            ),
          ),
          prefixIcon: prefixIcon,
          hintText: hintText,
          errorStyle: TextStyle(color: AppColors.mainColor),
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
