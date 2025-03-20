import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/constants/constants.dart';
import 'drawer_item.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return  ListView(
        // padding: EdgeInsets.zero,
        children: [
          GestureDetector(
            child: DrawerHeader(
              margin: EdgeInsets.all(10.w),
              child:Image.asset(AppConstants.userImagePath),
            ),
            onTap: (){},
          ),
          DrawerItem(text: "المكان ومواعيد العمل",onTap:(){} ,),
          DrawerItem(text: "تفاصيل الشحن",onTap: (){},),
          DrawerItem(text: "أسعار الإضافات",onTap: (){},),
        ],
      )
    ;
  }
}
