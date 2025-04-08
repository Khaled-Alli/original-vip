import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:original_vip/feature/laptop_details/presentation/widgets/laptop_details_alert_dialog.dart';

import '../../../../../core/helpers/colors/colors.dart';
import '../../../../../core/helpers/constants/constants.dart';
import '../../../../../core/helpers/extentions/extentions.dart';
import '../../../../../core/helpers/themes/themes.dart';
import '../../view_model/additional_section_cubit.dart';
import '../../view_model/additional_section_state.dart';


class LaptopDetailsAdditionalsSection extends StatelessWidget {
  const LaptopDetailsAdditionalsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 340.w,
        padding: EdgeInsets.all(10.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            16,
          ),
          border: Border.all(
            color: AppColors.darktGrayColor,
          ),
        ),
        child: Row(
          children: [
            ElevatedButton(
              onPressed:(){
                HapticFeedback.lightImpact();
                showDialog(
                    context: context,
                    builder: (dialogContext)=> BlocProvider.value(
                        value: BlocProvider.of<AdditionalSectionCubit>(context),
                        child:  const LaptopDetailsAlertDialog())

                );
              },


              child: Text(
                AppConstants.additionalsText,
                style: TextStyles.font13mainColorBold,
              ),
            ),
            horizontalSpace(10.w),
            SizedBox(
              width: 220.w,
              child: Align(
                alignment: Alignment.centerRight,
                child:
                BlocBuilder<AdditionalSectionCubit,AdditionalSectionState>(
                  builder:(context,state)=>
                      Text(
                        state.selectedAdditionals.isEmpty
                            ? AppConstants.noAdditionalsText
                            : state.selectedAdditionals.map((i) => "${i.name} X ${state.tempAmounts[i.id] ?? 1}").join(", "),
                        style: TextStyles.font13whiteBold,
                        textDirection: TextDirection.ltr,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),),


              ),
            ),
          ],
        ),
      )
     ;
  }
}
