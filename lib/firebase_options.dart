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
    apiKey: 'AIzaSyD-Ws_V6HyuHL38kJXzOdzYeHcJQ2MXYps',
    appId: '1:505144859927:web:fcc7c5eb1a49c04016ab52',
    messagingSenderId: '505144859927',
    projectId: 'days-f31cb',
    authDomain: 'days-f31cb.firebaseapp.com',
    storageBucket: 'days-f31cb.appspot.com',
    measurementId: 'G-PDCD7J0NFY',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAAl8KAwv5ibH1FYv-ourGabAgfjj9VCRc',
    appId: '1:505144859927:android:317baa088a39ec4a16ab52',
    messagingSenderId: '505144859927',
    projectId: 'days-f31cb',
    storageBucket: 'days-f31cb.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCHQoh1LBupzr5gWE4YyGsbFa40ECwW6jM',
    appId: '1:505144859927:ios:9f0ccedbc89418c216ab52',
    messagingSenderId: '505144859927',
    projectId: 'days-f31cb',
    storageBucket: 'days-f31cb.appspot.com',
    iosBundleId: 'com.example.todofirebase',
  );
}
