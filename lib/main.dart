import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:original_vip/bloc_observer.dart';
import 'package:original_vip/core/di/sl.dart';
import 'package:original_vip/original_vip.dart';
import 'core/routing/routing.dart';
import 'feature/authentication/view_model/auth_cubit.dart';
import 'feature/cart/view_model/cart_cubit.dart';
import 'feature/home/view_model/home_cubit.dart';
import 'firebase_options.dart';

void main() async {
  Bloc.observer =AppBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform,);
  await setupGetIt();
  await  Hive.initFlutter();

  runApp(
    OriginalVIP( appRouter:getIt<AppRouter>(),),
  );
}
