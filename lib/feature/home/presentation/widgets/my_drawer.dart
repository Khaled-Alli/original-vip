import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/constants/constants.dart';
import '../../../../core/helpers/themes/themes.dart';
import 'drawer_item.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Expanded( // Use Expanded to take available space
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                DrawerHeader(
                  margin: EdgeInsets.all(10.w),
                  child: Image.asset(AppConstants.appLogoImagePath),
                ),
                DrawerItem(
                  text: AppConstants.profileText,
                  onTap: () {
                    HapticFeedback.lightImpact();
                  },
                ),
              ],
            ),
          ),
          Container(
            width: double.infinity,
          //  height: 40.h,
            //padding: EdgeInsets.all(16.w),
            margin:  EdgeInsets.all(12.w),
            child:
            Text( 'تواصل مع مطور التطبيق \n'
                'واتساب 01021204207 ',
                style: TextStyles.font13whiteBold,
                textAlign: TextAlign.center,
              ),

          ),
        ],
      ),
    );
  }

}
