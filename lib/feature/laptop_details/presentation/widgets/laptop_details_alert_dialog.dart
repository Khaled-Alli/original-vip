import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:original_vip/feature/laptop_details/view_model/additional_section_cubit.dart';
import '../../../../core/helpers/colors/colors.dart';
import '../../../../core/helpers/constants/constants.dart';
import '../../../../core/helpers/themes/themes.dart';
import '../../../home/view_model/additional_cubit.dart';
import '../../../home/view_model/additional_state.dart';
import '../../view_model/additional_section_state.dart';

class LaptopDetailsAlertDialog extends StatelessWidget {
  const LaptopDetailsAlertDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AdditionalSectionCubit, AdditionalSectionState>(
      builder: (context, additionalSectionState) =>
          AlertDialog(
            title: Text(
              AppConstants.additionalsText,
              style: TextStyles.font13whiteBold,
              textDirection: TextDirection.rtl,
            ),
            content:
            SizedBox(
              child: BlocBuilder<AdditionalCubit, AdditionalState>(
                builder: (context, additionalState) {
                  if (additionalState is AdditionalLoadedState) {
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: additionalState.additionals.map((item) {
                        bool isSelected = additionalSectionState.tempList
                            .contains(item);
                        int selectedAmount = additionalSectionState
                            .tempAmounts[item.id] ??
                            1;

                        return Column(
                          children: [
                            CheckboxListTile(
                              title: Text(item.name),
                              activeColor: AppColors.mainColor,
                              value: isSelected,
                              subtitle: Text(
                                "${item.price} L.E",
                                style: TextStyles.font13mainColorBold,
                              ),
                              onChanged: (bool? checked) {
                                if (checked == true) {
                                  context.read<AdditionalSectionCubit>()
                                      .addToTempAdditionalList(item);
                                } else {
                                  context.read<AdditionalSectionCubit>()
                                      .removeFromTempAdditionalList(item);
                                }
                              },
                            ),
                            if (isSelected)
                              Row(
                                mainAxisAlignment: MainAxisAlignment
                                    .spaceBetween,
                                children: [
                                  Text(AppConstants.amountTXT,
                                    style: TextStyles.font13whiteBold,
                                  ),
                                  DropdownButton<int>(
                                    value: selectedAmount,
                                    dropdownColor: AppColors
                                        .lightBackgroundColor,
                                    style: TextStyles.font13mainColorBold,
                                    items: List.generate(
                                        10, (index) => index + 1)
                                        .map((value) =>
                                        DropdownMenuItem<int>(
                                          value: value,
                                          child: Text(value.toString()),
                                        ))
                                        .toList(),
                                    onChanged: (newValue) {
                                      context.read<AdditionalSectionCubit>()
                                          .updateAdditionalAmount(
                                          item, newValue!);
                                    },
                                  ),
                                ],
                              ),
                            Divider(color: Colors.grey.shade700),
                          ],
                        );
                      }).toList(),
                    );
                  } else if (additionalState is AdditionalErrorState) {
                    return Center(
                      child: Text(
                        additionalState.errorMessage,
                        style: TextStyles.font15mainColorBold,
                      ),
                    );
                  }
                  else {
                    return const Center(
                        child: CircularProgressIndicator(
                          color: AppColors.mainColor,
                        ));
                  }
                },
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  HapticFeedback.lightImpact();
                  context.read<AdditionalSectionCubit>()
                      .cancelSelectedAdditionalList();
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
                  context.read<AdditionalSectionCubit>()
                      .updateSelectedAdditionalList();
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
