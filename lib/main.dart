import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:original_vip/bloc_observer.dart';
import 'package:original_vip/core/di/sl.dart';
import 'package:original_vip/feature/cart/model/cart_item_model.dart';
import 'package:original_vip/feature/cart/model/order_model.dart';
import 'package:original_vip/feature/home/model/additional_model.dart';
import 'package:original_vip/feature/home/model/laptop_model.dart';
import 'package:original_vip/original_vip.dart';
import 'core/networking/push_notification_service.dart';
import 'core/routing/routing.dart';
import 'feature/authentication/model/user_model.dart';
import 'firebase_options.dart';
import 'feature/authentication/view_model/auth_cubit.dart';

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  await setupGetIt();
  Bloc.observer = AppBlocObserver();
  await initializeDateFormatting("ar");
  await Hive.initFlutter();
  Hive.registerAdapter(UserAdapter());
  Hive.registerAdapter(CartItemAdapter());
  Hive.registerAdapter(AdditionalAdapter());
  Hive.registerAdapter(LaptopAdapter());
  Hive.registerAdapter(OrderAdapter());
  await FirebaseMessaging.instance.requestPermission();
  await setupNotificationChannel();

  await flutterLocalNotificationsPlugin.initialize(
    const InitializationSettings(
      android: AndroidInitializationSettings('@mipmap/ic_launcher'),
    ),
  );

  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    RemoteNotification? notification = message.notification;
    AndroidNotification? android = message.notification?.android;

    if (notification != null && android != null) {
      flutterLocalNotificationsPlugin.show(
        notification.hashCode,
        notification.title,
        notification.body,
        const NotificationDetails(
          android: AndroidNotificationDetails(
            'default_channel',
            'Default Notifications',
            channelDescription: 'This channel is used for default notifications',
            importance: Importance.max,
            priority: Priority.high,
            icon: '@mipmap/launcher_icon',
          ),
        ),
      );
    }
  });



  final isAuthenticated = await getIt<AuthCubit>().isUserAuthenticable();

  runApp(OriginalVIP(
    appRouter: getIt<AppRouter>(),
    isAuthenticated: isAuthenticated,
  ));
}
