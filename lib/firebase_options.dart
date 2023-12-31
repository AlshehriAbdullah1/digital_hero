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
        return macos;
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
    apiKey: 'AIzaSyCfNhp6okjsE2cC55KeaOaFz2IyHTFjQ_Y',
    appId: '1:114229835311:web:ebd88e1e193f9bfa99f8da',
    messagingSenderId: '114229835311',
    projectId: 'digital-hero-6dc20',
    authDomain: 'digital-hero-6dc20.firebaseapp.com',
    storageBucket: 'digital-hero-6dc20.appspot.com',
    measurementId: 'G-91M5WZEZ12',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAJbCBNwzW2KrCb03Y1ozOWJPhDZAATkr4',
    appId: '1:114229835311:android:6b10478e77bfaa2499f8da',
    messagingSenderId: '114229835311',
    projectId: 'digital-hero-6dc20',
    storageBucket: 'digital-hero-6dc20.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDC0yezkhgv5IztpKlWV3guM0qfC8mgimQ',
    appId: '1:114229835311:ios:a9eaadd333fedd6899f8da',
    messagingSenderId: '114229835311',
    projectId: 'digital-hero-6dc20',
    storageBucket: 'digital-hero-6dc20.appspot.com',
    iosBundleId: 'com.example.digitalHero',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDC0yezkhgv5IztpKlWV3guM0qfC8mgimQ',
    appId: '1:114229835311:ios:1e92ea04e0acbbfb99f8da',
    messagingSenderId: '114229835311',
    projectId: 'digital-hero-6dc20',
    storageBucket: 'digital-hero-6dc20.appspot.com',
    iosBundleId: 'com.example.digitalHero.RunnerTests',
  );
}
