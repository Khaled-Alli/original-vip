import 'package:flutter/material.dart';

import '../../../../core/helpers/themes/themes.dart';

class AmountInfo extends StatelessWidget {
  String title;
  int amount;
   AmountInfo(this.title,this.amount);

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
        Text(title, style: TextStyles.font14whiteBold),
    Text(amount.toString(), style: TextStyles.font13mainColorBold),
    ]);
  }
}
