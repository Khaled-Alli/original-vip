import 'package:flutter/material.dart';

import '../../../../core/helpers/colors/colors.dart';
import '../../../../core/helpers/constants/constants.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({super.key});

  @override
  Widget build(BuildContext context) {
    return  Directionality(
      textDirection: TextDirection.rtl,
      child: TextFormField(

        // controller: textFormController,
        maxLines: null,
        decoration: InputDecoration(
          fillColor: AppColors.darktGrayColor,
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
          hintText: AppConstants.enterNotesText,
          errorStyle: const TextStyle(color: AppColors.mainColor),
        ),
       // keyboardType: TextInputType.name,
        //  textDirection:TextDirection.rtl,
        // validator: (value) {
        // //  return validator(value);
        // },
      ),
    );
  }
}
