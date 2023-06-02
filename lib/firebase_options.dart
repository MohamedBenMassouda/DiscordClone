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
    apiKey: 'AIzaSyCjUv5ismFyNbrhxxsOw-YD-RAjyLYBZvE',
    appId: '1:640330059482:web:46584151976ae7195adfe3',
    messagingSenderId: '640330059482',
    projectId: 'discordclone-b7010',
    authDomain: 'discordclone-b7010.firebaseapp.com',
    storageBucket: 'discordclone-b7010.appspot.com',
    measurementId: 'G-C9ET6H0MES',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDS22UvU6rXqLDKBR4jahZwAwLuRZxHxMo',
    appId: '1:640330059482:android:cb1a44eee78270ed5adfe3',
    messagingSenderId: '640330059482',
    projectId: 'discordclone-b7010',
    storageBucket: 'discordclone-b7010.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBoxb9FWy08rAkMmY4CrlTOwf1I7cek6S4',
    appId: '1:640330059482:ios:7d645ea54ca0c2b25adfe3',
    messagingSenderId: '640330059482',
    projectId: 'discordclone-b7010',
    storageBucket: 'discordclone-b7010.appspot.com',
    iosBundleId: 'com.example.discordClone',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBoxb9FWy08rAkMmY4CrlTOwf1I7cek6S4',
    appId: '1:640330059482:ios:fdd622c3bc5430665adfe3',
    messagingSenderId: '640330059482',
    projectId: 'discordclone-b7010',
    storageBucket: 'discordclone-b7010.appspot.com',
    iosBundleId: 'com.example.discordClone.RunnerTests',
  );
}
