import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:original_vip/feature/authentication/presentation/login_screen.dart';
import 'package:original_vip/feature/cart/presentation/cart_screen.dart';
import 'package:original_vip/feature/laptop_details/presentation/laptop_details_screen.dart';

import '../../feature/authentication/model/user_model.dart';
import '../../feature/authentication/view_model/auth_cubit.dart';
import '../../feature/home/model/laptop_model.dart';
import '../../feature/home/presentation/home_screen.dart';
import '../../feature/home/view_model/home_cubit.dart';
import '../../original_vip.dart';
import '../di/sl.dart';

class Routes {
  static const homeScreen = '/home';
  static const loginScreen = '/login';
  static const registerScreen = '/register';
  static const laptopDetailsScreen = '/laptopDetails';
  static const CartScreen = '/cart';
  //static const home = '/home';
}


class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    //this arguments to be passed in any screen like this ( arguments as ClassName )
    final arguments = settings.arguments;

    switch (settings.name) {
      case Routes.loginScreen:
        return MaterialPageRoute(
          builder: (_) => const LoginScreen(),
        );
        case Routes.homeScreen:
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
        );
        case Routes.laptopDetailsScreen:
        return MaterialPageRoute(
          builder: (_) => LaptopDetailsScreen(arguments as Laptop),
        );
        case Routes.CartScreen:
        return MaterialPageRoute(
          builder: (_) => const CartScreen(),
        );
      default:
        return null;
    }
  }
}


// class AppRouterr {
//   AppRouterr();
//   static GoRouter router = GoRouter(
//     initialLocation: context.read<AuthCubit>().user != null ? Routes.homeScreen : Routes.loginScreen,
//     routes: [
//       GoRoute(
//       path:  Routes.loginScreen,
//       builder: (context, state) =>  const LoginScreen(),
//     ),
//       GoRoute(
//         path: Routes.homeScreen,
//         builder: (context, state) => const HomeScreen(),
//       ),
//       GoRoute(
//         path: Routes.laptopDetailsScreen,
//         builder: (context, state) =>LaptopDetailsScreen(state.extra as Laptop)
//       ),
//     ],
//   );
// }
