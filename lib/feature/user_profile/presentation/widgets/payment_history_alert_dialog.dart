import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:original_vip/core/helpers/constants/constants.dart';
import 'package:original_vip/feature/user_profile/presentation/widgets/payment_history_item.dart';

import '../../../../core/helpers/themes/themes.dart';
import '../../model/payment.dart';

class PaymentHistoryAlertDialog extends StatelessWidget {
  final List<Payment> payments;
  const PaymentHistoryAlertDialog(this.payments, {super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: AlertDialog(
        scrollable: true,
        title: Text(
          AppConstants.paymentHistoryTXT,
          style: TextStyles.font13whiteBold,
        ),
        content: SizedBox(
          width: 250.w,
          height: 300.h,
          child: ListView.separated(
            shrinkWrap: true,
            itemCount: payments.length,
            itemBuilder: (context, index) => PaymentHistoryItem(payments[index]),
            separatorBuilder: (_, __) => Divider(color: Colors.grey.shade700),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              AppConstants.closeTXT,
              style: TextStyles.font13mainColorBold,
              textDirection: TextDirection.rtl,
            ),
          ),
        ],
      ),
    );
  }
}

