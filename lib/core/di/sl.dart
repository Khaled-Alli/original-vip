import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';
import 'package:original_vip/core/networking/local_cervices.dart';
import 'package:original_vip/core/networking/web_services.dart';
import 'package:original_vip/core/routing/routing.dart';
import 'package:original_vip/feature/authentication/view_model/auth_cubit.dart';

import '../../feature/cart/view_model/cart_cubit.dart';
import '../../feature/cart/view_model/order_cubit.dart';
import '../../feature/home/view_model/additional_cubit.dart';
import '../../feature/home/view_model/laptop_cubit.dart';
import '../../feature/user_profile/view_model/payment_cubit.dart';


final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  getIt.registerLazySingleton<FirebaseFirestore>(() => FirebaseFirestore.instance);

  getIt.registerLazySingleton<WebServices>(() => WebServices(getIt<FirebaseFirestore>()));

  getIt.registerLazySingleton<AppRouter>(() => AppRouter());

  getIt.registerLazySingleton<LocalServices>(() => LocalServices());

  getIt.registerLazySingleton<AuthCubit>(() => AuthCubit(getIt<WebServices>(), getIt<LocalServices>()));
  getIt.registerFactory<CartCubit>(() => CartCubit(getIt<WebServices>(), getIt<LocalServices>()));
  getIt.registerFactory<LaptopCubit>(() => LaptopCubit(getIt<WebServices>()));
  getIt.registerFactory<AdditionalCubit>(() => AdditionalCubit(getIt<WebServices>()));
  getIt.registerFactory<OrderCubit>(() => OrderCubit(getIt<WebServices>()));
  getIt.registerFactory<PaymentCubit>(() => PaymentCubit(getIt<WebServices>()));

}
