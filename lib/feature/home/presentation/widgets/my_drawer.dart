import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:original_vip/core/di/sl.dart';
import 'package:original_vip/core/helpers/extentions/extentions.dart';

import '../../../../core/helpers/constants/constants.dart';
import '../../../../core/helpers/themes/themes.dart';
import '../../../../core/networking/local_cervices.dart';
import '../../../../core/routing/routing.dart';
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
                    context.pushNamed(Routes.userProfile);
                  },
                ),
              ],
            ),
          ),
          ListTile(
            title: Center(
              child: Text(
                AppConstants.logOutText,textDirection: TextDirection.rtl,style: TextStyles.font13mainColorBold,
              ),
            ),
            onTap:   () async{
              HapticFeedback.lightImpact();
              await getIt<LocalServices>().deleteUserBox();
              context.pushReplacementNamed(Routes.loginScreen);
            },
          ),
          Container(
            width: double.infinity,
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewPadding.bottom + 20.h,
            ),
          //  height: 40.h,
            //padding: EdgeInsets.all(16.w),
            margin:  EdgeInsets.all(12.w),
            child:
            SelectableText( 'تواصل مع مطور التطبيق \n'
                'واتساب 207 204 21 010',
                style: TextStyles.font13whiteBold,
                textAlign: TextAlign.center,
              ),

          ),
        ],
      ),
    );
  }

}
