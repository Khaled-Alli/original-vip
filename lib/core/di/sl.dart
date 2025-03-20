import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';
import 'package:original_vip/core/networking/local_cervices.dart';
import 'package:original_vip/core/networking/web_services.dart';
import 'package:original_vip/core/routing/routing.dart';
import 'package:original_vip/feature/authentication/view_model/auth_cubit.dart';

import '../../feature/cart/view_model/cart_cubit.dart';
import '../../feature/home/view_model/home_cubit.dart';


final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  //getIt.registerLazySingleton<ApiService>(() => ApiService(dio));
  getIt.registerLazySingleton<FirebaseFirestore>(() => FirebaseFirestore.instance);

  getIt.registerLazySingleton<WebServices>(() => WebServices(getIt<FirebaseFirestore>()));

  getIt.registerLazySingleton<AppRouter>(() => AppRouter());

  getIt.registerLazySingleton<LocalServices>(() => LocalServices());


}
