
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:original_vip/feature/home/view_model/laptop_cubit.dart';
import 'package:original_vip/feature/home/view_model/laptop_cubit.dart';

import 'core/di/sl.dart';
import 'core/helpers/colors/colors.dart';
import 'core/helpers/constants/constants.dart';
import 'core/networking/local_cervices.dart';
import 'core/networking/web_services.dart';
import 'core/routing/routing.dart';
import 'feature/authentication/view_model/auth_cubit.dart';
import 'feature/cart/view_model/cart_cubit.dart';
import 'feature/cart/view_model/order_cubit.dart';
import 'feature/home/view_model/additional_cubit.dart';
import 'feature/user_profile/view_model/payment_cubit.dart';

class OriginalVIP extends StatelessWidget {
  final AppRouter appRouter;
  final bool isAuthenticated;

  const OriginalVIP(
      {super.key, required this.appRouter, required this.isAuthenticated});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthCubit>(  lazy: false,
          create: (context) => getIt<AuthCubit>(),
        ),
        BlocProvider<CartCubit>(
          create: (context) => getIt<CartCubit>(),
        ),
        BlocProvider<LaptopCubit>(
          create: (context) => getIt<LaptopCubit>()..getLaptops(),
        ),
        BlocProvider<AdditionalCubit>(
          create: (context) => getIt<AdditionalCubit>()..getAdditionals(),
        ),
        BlocProvider<OrderCubit>(
          create: (context) {
            final authCubit = context.read<AuthCubit>();
            final userId = authCubit.user?.id ?? '';
           return getIt<OrderCubit>()..getOrders(userId);
          },
        ),
        BlocProvider<PaymentCubit>(
          create: (context) {
            final authCubit = context.read<AuthCubit>();
            final userId = authCubit.user?.id ?? '';
            return getIt<PaymentCubit>()..getPayments(userId);
          },
        ),
      ],
      child: ScreenUtilInit(
        minTextAdapt: true,
        builder: (context, child) {
          return Directionality(
            textDirection: TextDirection.rtl,
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              title: AppConstants.APP_NAME,
              theme: ThemeData.dark(),
              initialRoute:
                  isAuthenticated ? Routes.homeScreen : Routes.loginScreen,
              onGenerateRoute: appRouter.generateRoute,
            ),
          );
        },
      ),
    );
  }
}
