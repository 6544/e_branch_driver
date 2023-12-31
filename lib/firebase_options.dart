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
    apiKey: 'AIzaSyB4XKb-KsYuHuDyQDPBSWS1MuWe2ZjNPJU',
    appId: '1:840333503259:web:8d961cfec5f604ba8501be',
    messagingSenderId: '840333503259',
    projectId: 'e-branch-804fb',
    authDomain: 'e-branch-804fb.firebaseapp.com',
    storageBucket: 'e-branch-804fb.appspot.com',
    measurementId: 'G-29DCD53TBP',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDUfhU5hrH_lGxAO__x6a_-IohYrFHglrI',
    appId: '1:840333503259:android:daf33edc695368ca8501be',
    messagingSenderId: '840333503259',
    projectId: 'e-branch-804fb',
    storageBucket: 'e-branch-804fb.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCeGsOXeebRZMj8K-QNRXJJq9CCWfpifvs',
    appId: '1:840333503259:ios:e960fefa3277946d8501be',
    messagingSenderId: '840333503259',
    projectId: 'e-branch-804fb',
    storageBucket: 'e-branch-804fb.appspot.com',
    iosClientId: '840333503259-a4d9846gsqabr2fnpu0dvcb8gq7oeva7.apps.googleusercontent.com',
    iosBundleId: 'com.example.eBranch',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCeGsOXeebRZMj8K-QNRXJJq9CCWfpifvs',
    appId: '1:840333503259:ios:a4546dca6ee54f338501be',
    messagingSenderId: '840333503259',
    projectId: 'e-branch-804fb',
    storageBucket: 'e-branch-804fb.appspot.com',
    iosClientId: '840333503259-16sutoe1lk9c0tgrj5h6o1ltafurspa7.apps.googleusercontent.com',
    iosBundleId: 'com.example.eBranch.RunnerTests',
  );
}
