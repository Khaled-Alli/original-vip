import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:original_vip/core/di/sl.dart';
import 'package:original_vip/core/helpers/colors/colors.dart';
import 'package:original_vip/core/networking/local_cervices.dart';
import 'package:original_vip/core/networking/web_constants.dart';
import 'package:original_vip/core/networking/web_services.dart';

import 'core/helpers/constants/constants.dart';
import 'core/routing/routing.dart';
import 'feature/authentication/model/user_model.dart';
import 'feature/authentication/view_model/auth_cubit.dart';
import 'feature/cart/view_model/cart_cubit.dart';
import 'feature/home/view_model/home_cubit.dart';


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
        minTextAdapt: true,
        builder: (context, child) {
          return FutureBuilder(
              future: getIt<LocalServices>().getData(
                boxName: ServicesConstants.USER_TEXT,
                key: ServicesConstants.USER_TEXT,
              ),
              builder: (context, AsyncSnapshot<dynamic> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                      child: CircularProgressIndicator(
                    color: AppColors.mainColor,
                  ));
                }
                if (snapshot.hasData && snapshot.data != null) {
                  user = User(
                    snapshot.data["id"],
                    snapshot.data["name"],
                    snapshot.data["commission"],
                    snapshot.data["orderID"],
                    snapshot.data["phone"],
                    snapshot.data["role"],
                  );
                }
                return
                  MultiBlocProvider(
                  providers: [
                    BlocProvider<AuthCubit>(create: (context) => AuthCubit(getIt<WebServices>()),),
                    BlocProvider<CartCubit>(create: (context) => CartCubit(getIt<WebServices>()),),
                    BlocProvider<HomeCubit>(create: (context) => HomeCubit(getIt<WebServices>())),
                    // BlocProvider<LaptopDetailsCubit>(create: (context) => LaptopDetailsCubit(getIt<WebServices>(),CartCubit.get(context)),),

                    // Provide CartCubit
                  ],
                  child:
                Directionality(
                    textDirection: TextDirection.rtl,
                    child: MaterialApp(
                      debugShowCheckedModeBanner: false,
                      title: AppConstants.APP_NAME,
                      theme: ThemeData.dark(),
                      initialRoute:
                          user != null ? Routes.homeScreen : Routes.loginScreen,
                      onGenerateRoute: appRouter.generateRoute,
                    ),
                  ),
                );
              });
        });
  }
}
