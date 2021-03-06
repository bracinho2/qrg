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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for ios - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyDdS2PwlAEBkZgkW23O6yHa0h4hTPxreC0',
    appId: '1:363214088128:web:28baf34d512ce5b63aca25',
    messagingSenderId: '363214088128',
    projectId: 'hamhelper-991c1',
    authDomain: 'hamhelper-991c1.firebaseapp.com',
    storageBucket: 'hamhelper-991c1.appspot.com',
    measurementId: 'G-L1CG1VL5XT',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA7JpV-KTCrr5yM3S1QewHoErJvWEEw9uQ',
    appId: '1:363214088128:android:f11e275130bfa2a63aca25',
    messagingSenderId: '363214088128',
    projectId: 'hamhelper-991c1',
    storageBucket: 'hamhelper-991c1.appspot.com',
  );
}
