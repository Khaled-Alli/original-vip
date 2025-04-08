import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:original_vip/core/helpers/constants/constants.dart';
import 'package:original_vip/demo-data.dart';
import 'package:original_vip/feature/user_profile/presentation/widgets/payment_history_item.dart';

import '../../../../core/helpers/themes/themes.dart';
import '../../model/payment.dart';

class PaymentHistoryAlertDialog extends StatelessWidget {
 final List<Payment> payments;
  const PaymentHistoryAlertDialog(this.payments);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: AlertDialog(
        title: const Text(AppConstants.paymentHistoryTXT),
        scrollable: true,
        content: SizedBox(
          height: 250.h,
          child: SingleChildScrollView(
            child: Column(
              children: List.generate(payments.length, (index) =>
                  PaymentHistoryItem(payments[index],),)
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(AppConstants.closeTXT,style: TextStyles.font13mainColorBold,),
          ),
        ],
      ),
    );
  }
}
