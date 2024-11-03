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
    apiKey: 'AIzaSyCAqjEJnqGKLawUO1T-cbEsEetEnkQP-f0',
    appId: '1:431751396135:web:d3c8da2091359b647bc702',
    messagingSenderId: '431751396135',
    projectId: 'netflix-4d730',
    authDomain: 'netflix-4d730.firebaseapp.com',
    storageBucket: 'netflix-4d730.firebasestorage.app',
    measurementId: 'G-Y9LHRW0N91',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCsAClnOGvGSGVKADOKx7Rcq7ItSPjbTrs',
    appId: '1:431751396135:android:a2f025a5eded45997bc702',
    messagingSenderId: '431751396135',
    projectId: 'netflix-4d730',
    storageBucket: 'netflix-4d730.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBsC8wzz5P1wRlTN4ewCfGUckXSYAB6inc',
    appId: '1:431751396135:ios:0318ed44c4a60e8b7bc702',
    messagingSenderId: '431751396135',
    projectId: 'netflix-4d730',
    storageBucket: 'netflix-4d730.firebasestorage.app',
    iosBundleId: 'com.example.netflixApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBsC8wzz5P1wRlTN4ewCfGUckXSYAB6inc',
    appId: '1:431751396135:ios:0318ed44c4a60e8b7bc702',
    messagingSenderId: '431751396135',
    projectId: 'netflix-4d730',
    storageBucket: 'netflix-4d730.firebasestorage.app',
    iosBundleId: 'com.example.netflixApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCAqjEJnqGKLawUO1T-cbEsEetEnkQP-f0',
    appId: '1:431751396135:web:95dcf7b40a35bda37bc702',
    messagingSenderId: '431751396135',
    projectId: 'netflix-4d730',
    authDomain: 'netflix-4d730.firebaseapp.com',
    storageBucket: 'netflix-4d730.firebasestorage.app',
    measurementId: 'G-TZXDHKLZ4G',
  );

}