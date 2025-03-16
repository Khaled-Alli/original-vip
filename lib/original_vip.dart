import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:original_vip/core/di/sl.dart';
import 'package:original_vip/core/helpers/colors/colors.dart';
import 'package:original_vip/core/networking/local_cervices.dart';
import 'package:original_vip/core/networking/web_constants.dart';

import 'core/helpers/constants/constants.dart';
import 'core/routing/routing.dart';
import 'feature/authentication/model/user_model.dart';

class OriginalVIP extends StatelessWidget {
  final AppRouter appRouter;
    OriginalVIP({
    super.key,
    required this.appRouter,
  });

  User? user;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        builder: (context, child) {
          return
            FutureBuilder(future: getIt<LocalServices>().getData(
              boxName: ServicesConstants.USER_TEXT,
              key: ServicesConstants.USER_TEXT,),
                builder: (context, AsyncSnapshot<dynamic> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator(color: AppColors.mainColor,));
                  }
                  if (snapshot.hasData && snapshot.data != null) {
                    user = User(
                      name: snapshot.data["name"],
                      id: snapshot.data["id"],
                      phone: snapshot.data["phone"],
                      role: snapshot.data["role"],
                      orderID: snapshot.data["orderID"],
                      commission: snapshot.data["commission"],
                    );
                  }
                  return  Directionality(
                      textDirection: TextDirection.rtl,
                      child: MaterialApp(
                        debugShowCheckedModeBanner: false,
                        title: AppConstants.APP_NAME,
                        theme: ThemeData.dark(),
                        initialRoute: user != null ? Routes.homeScreen :
                        Routes.loginScreen,
                        onGenerateRoute: appRouter.generateRoute,
                      ),
                    );
                });
        }
    );
  }
}
