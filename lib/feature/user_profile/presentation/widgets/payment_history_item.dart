import 'package:flutter/material.dart';
import 'package:original_vip/core/helpers/constants/constants.dart';
import 'package:original_vip/feature/user_profile/model/payment.dart';

import '../../../../core/helpers/themes/themes.dart';

class PaymentHistoryItem extends StatelessWidget {
Payment payment;
  PaymentHistoryItem(this.payment);

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        title: Text( AppConstants.balanceTXT + payment.amount.toString(),style: TextStyles.font12whiteBold ),
        subtitle: Text( AppConstants.dateTXT + payment.date,style: TextStyles.font12whiteBold ),
        leading: const Icon(Icons.check,size: 40,color: Colors.green,),
      ),
    );
  }
}
