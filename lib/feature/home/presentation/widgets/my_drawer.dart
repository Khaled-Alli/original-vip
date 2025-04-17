import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:original_vip/core/di/sl.dart';
import 'package:original_vip/core/helpers/extentions/extentions.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/helpers/colors/colors.dart';
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
          GestureDetector(
            onTap: () async {
              HapticFeedback.lightImpact();
              launchUrl(Uri.parse(AppConstants.whatsappURLText), mode: LaunchMode.externalApplication);
            },
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewPadding.bottom + 20.h,
              ),
              margin: EdgeInsets.all(12.w),
              child: Center(
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: AppConstants.contactDeveloperText,
                        style: TextStyles.font13whiteBold,
                      ),
                      WidgetSpan(
                        alignment: PlaceholderAlignment.middle,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              AppConstants.myWhatsappText,
                              style: TextStyles.font13whiteBold,
                            ),
                            SizedBox(width: 8.w),
                            FaIcon(
                              FontAwesomeIcons.whatsapp,
                              color: Colors.green,
                              size: 16.sp,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

}
