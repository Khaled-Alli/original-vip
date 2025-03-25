import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/colors/colors.dart';
import '../../../../core/helpers/constants/constants.dart';
import '../../../../core/helpers/extentions/extentions.dart';
import '../../../../core/helpers/themes/themes.dart';
import '../../view_model/cart_cubit.dart';
import 'custom_text_form_field.dart';

class NotesSection extends StatelessWidget {

  const NotesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(

      width: 340.w,
      height: 100.h,
      padding: EdgeInsets.all(10.w),
      decoration: BoxDecoration(
          color: AppColors.lightBackgroundColor,
        borderRadius: BorderRadius.circular(
          16,
        ),
        border: Border.all(
          color: AppColors.darktGrayColor,
        ),
      ),
      child:
      TextFormField(
    controller: context.read<CartCubit>().endUserOrderNotesController,
    keyboardType: TextInputType.multiline,
    maxLines: null,
    minLines: 4,
    textInputAction: TextInputAction.newline,
    decoration: const InputDecoration(
    hintText:AppConstants.enterNotesText,
    border: InputBorder.none,
      ),),
    );
  }
}
