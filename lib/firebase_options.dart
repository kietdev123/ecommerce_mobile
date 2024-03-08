// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyABIQi4bH_Jcr-A2riZ-2HftfQuq5qXtkE',
    appId: '1:549490562302:web:7f90a0934a89c7f93cc1af',
    messagingSenderId: '549490562302',
    projectId: 'ecommerce-75ab1',
    authDomain: 'ecommerce-75ab1.firebaseapp.com',
    storageBucket: 'ecommerce-75ab1.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCrWLAYrQXRCadmaYY2fnr8OCMqNXd8Uik',
    appId: '1:549490562302:android:06cd37b5aa7f44d83cc1af',
    messagingSenderId: '549490562302',
    projectId: 'ecommerce-75ab1',
    storageBucket: 'ecommerce-75ab1.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD9kMHw449urvU8RjiARQQ8Csnm1a6-n-g',
    appId: '1:549490562302:ios:a2a40b4bc8545f233cc1af',
    messagingSenderId: '549490562302',
    projectId: 'ecommerce-75ab1',
    storageBucket: 'ecommerce-75ab1.appspot.com',
    iosBundleId: 'com.example.ecommerceMobile',
  );
}
