import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:original_vip/feature/cart/view_model/order_cubit.dart';
import 'package:original_vip/feature/user_profile/presentation/widgets/amount_info.dart';
import 'package:original_vip/feature/user_profile/presentation/widgets/payment_history.dart';
import 'package:original_vip/feature/user_profile/presentation/widgets/payment_history_alert_dialog.dart';
import 'package:original_vip/feature/user_profile/view_model/payment_cubit.dart';

import '../../../../core/helpers/colors/colors.dart';
import '../../../../core/helpers/constants/constants.dart';
import '../../../../core/helpers/extentions/extentions.dart';
import '../../../../core/helpers/themes/themes.dart';
import '../../../cart/view_model/order_state.dart';
import '../../view_model/payment_state.dart';

class ProfileSection extends StatelessWidget {
  const ProfileSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          16,
        ),
        border: Border.all(
          color: AppColors.darktGrayColor,
        ),
      ),
      child: Column(
        children: [
          const CircleAvatar(
            radius: 35,
            backgroundColor: AppColors.mainColor,
            child: Icon(Icons.person, size: 40),
          ),
          verticalSpace(15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              AmountInfo(
                  AppConstants.availableBalanceTXT,
                  context.read<OrderCubit>().getAvailableBalance(
                      context.read<OrderCubit>().orders??[],
                      context.read<PaymentCubit>().payments??[])),
              AmountInfo(
                  AppConstants.pendingBalanceTXT,
                  context.read<OrderCubit>().getPendingBalance(
                      context.read<OrderCubit>().orders??[],
                      context.read<PaymentCubit>().payments??[])),
              GestureDetector(
                onTap: () {
                  HapticFeedback.lightImpact();
                  showDialog(
                    context: context,
                    builder: (dialogContext) => PaymentHistoryAlertDialog(
                        context.read<PaymentCubit>().payments??[]),
                  );
                },
                child: const PaymentHistory(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
