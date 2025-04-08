import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:original_vip/bloc_observer.dart';
import 'package:original_vip/core/di/sl.dart';
import 'package:original_vip/feature/cart/model/cart_item_model.dart';
import 'package:original_vip/feature/cart/model/order_model.dart';
import 'package:original_vip/feature/home/model/additional_model.dart';
import 'package:original_vip/feature/home/model/laptop_model.dart';
import 'package:original_vip/original_vip.dart';
import 'core/routing/routing.dart';
import 'feature/authentication/model/user_model.dart';
import 'firebase_options.dart';
import 'feature/authentication/view_model/auth_cubit.dart';

void main() async {
  await setupGetIt();
  Bloc.observer = AppBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await initializeDateFormatting("ar");
  await Hive.initFlutter();
  Hive.registerAdapter(UserAdapter());
  Hive.registerAdapter(CartItemAdapter());
  Hive.registerAdapter(AdditionalAdapter());
  Hive.registerAdapter(LaptopAdapter());
  Hive.registerAdapter(OrderAdapter());

  final isAuthenticated = await getIt<AuthCubit>().isUserAuthenticable();

  runApp(OriginalVIP(
    appRouter: getIt<AppRouter>(),
    isAuthenticated: isAuthenticated,
  ));
}
