// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
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
        return macos;
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
    apiKey: 'AIzaSyBey7WIK6_5cUMXhuN83OTRzsQeYTQ-PIk',
    appId: '1:678876359307:web:b0541e4bface305251828e',
    messagingSenderId: '678876359307',
    projectId: 'ecommerce-0101-29730',
    authDomain: 'ecommerce-0101-29730.firebaseapp.com',
    storageBucket: 'ecommerce-0101-29730.firebasestorage.app',
    measurementId: 'G-MPJWJPSQPQ',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA_ViO1LP-k1l-zDDVE5984lJKg19s1c_E',
    appId: '1:678876359307:android:e3562350d335fccf51828e',
    messagingSenderId: '678876359307',
    projectId: 'ecommerce-0101-29730',
    storageBucket: 'ecommerce-0101-29730.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAUtfvOBkmBIPQ7jNA1Fab2zvEmu2M-jNk',
    appId: '1:678876359307:ios:b9d59064c918550f51828e',
    messagingSenderId: '678876359307',
    projectId: 'ecommerce-0101-29730',
    storageBucket: 'ecommerce-0101-29730.firebasestorage.app',
    iosBundleId: 'com.example.ecommerce',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAUtfvOBkmBIPQ7jNA1Fab2zvEmu2M-jNk',
    appId: '1:678876359307:ios:b9d59064c918550f51828e',
    messagingSenderId: '678876359307',
    projectId: 'ecommerce-0101-29730',
    storageBucket: 'ecommerce-0101-29730.firebasestorage.app',
    iosBundleId: 'com.example.ecommerce',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBey7WIK6_5cUMXhuN83OTRzsQeYTQ-PIk',
    appId: '1:678876359307:web:b43d5356d7b5456751828e',
    messagingSenderId: '678876359307',
    projectId: 'ecommerce-0101-29730',
    authDomain: 'ecommerce-0101-29730.firebaseapp.com',
    storageBucket: 'ecommerce-0101-29730.firebasestorage.app',
    measurementId: 'G-JKHMB5V4RD',
  );

}