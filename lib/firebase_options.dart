
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        return windows;
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyDiiE7-sj7tPEZIephQE_fnLtGBTLi9N6Q',
    appId: '1:204770528130:web:80cce11f3a286bd1071d9b',
    messagingSenderId: '204770528130',
    projectId: 'original-vip',
    authDomain: 'original-vip.firebaseapp.com',
    storageBucket: 'original-vip.firebasestorage.app',
    measurementId: 'G-T4SK9JE3F7',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyADUlfMcwX8WDJDnCX5mj09X0qCFI3b6Ps',
    appId: '1:204770528130:android:a8c8415912f71926071d9b',
    messagingSenderId: '204770528130',
    projectId: 'original-vip',
    storageBucket: 'original-vip.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDILxJF7OeOV-K0Drvc7EwIRKhsyTVYjtc',
    appId: '1:204770528130:ios:e43a449ac3385dfb071d9b',
    messagingSenderId: '204770528130',
    projectId: 'original-vip',
    storageBucket: 'original-vip.firebasestorage.app',
    iosBundleId: 'com.originalvip.originalVip',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDiiE7-sj7tPEZIephQE_fnLtGBTLi9N6Q',
    appId: '1:204770528130:web:06f5b999b5e8c10c071d9b',
    messagingSenderId: '204770528130',
    projectId: 'original-vip',
    authDomain: 'original-vip.firebaseapp.com',
    storageBucket: 'original-vip.firebasestorage.app',
    measurementId: 'G-XCDYSCHR3P',
  );
}
