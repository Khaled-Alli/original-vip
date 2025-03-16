import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:original_vip/feature/authentication/presentation/login_screen.dart';

import '../../feature/authentication/view_model/auth_cubit.dart';
import '../../feature/home/presentation/home_screen.dart';
import '../di/sl.dart';

class Routes {
  static const homeScreen = '/home';
  static const loginScreen = '/login';
  static const registerScreen = '/register';
  //static const home = '/home';
}


class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    //this arguments to be passed in any screen like this ( arguments as ClassName )
    final arguments = settings.arguments;

    switch (settings.name) {
      case Routes.loginScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<AuthCubit>(),
            child: const LoginScreen(),
          ),
        );
        case Routes.homeScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<AuthCubit>(),
            child: const HomeScreen(),
          ),
        );
      default:
        return null;
    }
  }
}


// class AppRouter {
//   AppRouter();
//
//   static GoRouter router = GoRouter(
//     routes: [
//       GoRoute(
//         path: Routes.home,
//         builder: (context, state) => BlocProvider<AuthCubit>(
//           create: (context) => getIt<AuthCubit>(),
//           child: const LoginScreen(),
//         ),
//       ),
//       // GoRoute(
//       //   path: Routes.home,
//       //   builder: (context, state) => Layout(),
//       // ),
//
//       // GoRoute(
//       //   path: Routes.playListDownloadScreenRout,
//       //   builder: (context, state) => PlayListDownloadScreen(playListModel:state.extra as PlayListModel,),
//       // ),
//     ],
//   );
// }
