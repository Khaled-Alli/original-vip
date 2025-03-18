import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/colors/colors.dart';
import '../../../../core/helpers/themes/themes.dart';

class LaptopDetailsCheckbox extends StatelessWidget {
  String txt;
  bool value;
  Function(bool?) onChange;
   LaptopDetailsCheckbox({super.key,required this.txt,required this.value,required this.onChange});

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      width: 155.w,
      child: Row(children: [
        Text(txt,style: TextStyles.font13whiteBold,),
        Spacer(),
        Checkbox(
          activeColor:AppColors.mainColor ,
          visualDensity: VisualDensity.compact,
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          value: value,
          onChanged: (bool? value) {
            onChange(value);
          },
        ),
      ],),
    );
  }
}
