import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:original_vip/feature/laptop_details/view_model/additional_section_cubit.dart';

import '../../../../core/helpers/colors/colors.dart';
import '../../../../core/helpers/constants/constants.dart';
import '../../../../core/helpers/themes/themes.dart';
import '../../../../demo-data.dart';
import '../../../home/model/additional_model.dart';
import '../../view_model/additional_section_state.dart';

class LaptopDetailsAlertDialog extends StatelessWidget {
  const LaptopDetailsAlertDialog({super.key});

  @override
  Widget build(BuildContext context) {
   // List<Additional> tempSelected = context.read<AdditionalSectionCubit>().selectedAdditional;
    return BlocBuilder<AdditionalSectionCubit,AdditionalSectionState>(
      builder:(context,state)=>
          AlertDialog(
        title: Text(
          AppConstants.additionalsText,
          style: TextStyles.font13whiteBold,
          textDirection: TextDirection.rtl,
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: demo_additional.map((item) {
            return CheckboxListTile(
              title: Text(item.name),
              activeColor: AppColors.mainColor,
              value: context.read<AdditionalSectionCubit>().state.tempList.contains(item),
              subtitle: Text(
                item.price.toString(),
                style: TextStyles.font13mainColorBold,
              ),
              onChanged: (bool? checked) {
                  if (checked == true) {
                    context.read<AdditionalSectionCubit>().addToTempAdditionalList(item);
                  } else {
                    context.read<AdditionalSectionCubit>().removeFromTempAdditionalList(item);
                  }
              },
            );
          }).toList(),
        ),
        actions: [
          TextButton(
            onPressed: () {
              HapticFeedback.lightImpact();
              context.read<AdditionalSectionCubit>().cancelSelectedAdditionalList();
              Navigator.pop(context);
            },
            child: Text(
              AppConstants.cancelText,
              style: TextStyles.font13mainColorBold,
              textDirection: TextDirection.rtl,
            ),
          ),
          TextButton(
            onPressed: () {
              HapticFeedback.lightImpact();
              context.read<AdditionalSectionCubit>().updateSelectedAdditionalList() ;
              Navigator.pop(context);
            },
            child: Text(
              AppConstants.saveText,
              style: TextStyles.font13mainColorBold,
              textDirection: TextDirection.rtl,
            ),
          ),
        ],
      ),
    );
  }
}
