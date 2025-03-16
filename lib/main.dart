import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:original_vip/core/di/sl.dart';
import 'package:original_vip/original_vip.dart';
import 'core/routing/routing.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform,);
  await setupGetIt();
  await  Hive.initFlutter();

  runApp(OriginalVIP( appRouter:getIt<AppRouter>(),));
}
