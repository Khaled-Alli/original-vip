import 'package:flutter/cupertino.dart';

import '../../../../core/helpers/themes/themes.dart';


class LaptopDetailsOneCol extends StatelessWidget {
  String static ;
  String detail ;
  LaptopDetailsOneCol({super.key,required this.static,required this.detail});

  @override
  Widget build(BuildContext context) {
    return  Row(children: [
      Text(static,style: TextStyles.font13whiteBold,),
      const Spacer(),
      Text(detail,style: TextStyles.font13whiteBold,),
    ],);
  }
}
