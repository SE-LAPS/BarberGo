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
    apiKey: 'AIzaSyA5_vPM5bvedklqnWYDadEu1tEvFso6HYs',
    appId: '1:760336803621:web:1c07c563dd299a308edccc',
    messagingSenderId: '760336803621',
    projectId: 'toymingle',
    authDomain: 'toymingle.firebaseapp.com',
    storageBucket: 'toymingle.firebasestorage.app',
    measurementId: 'G-F1HE4CP12Y',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAxhXRO9BxMOaLMn8O-slJnOX3fUCtb13Y',
    appId: '1:760336803621:android:d684414f3c06bc1e8edccc',
    messagingSenderId: '760336803621',
    projectId: 'toymingle',
    storageBucket: 'toymingle.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDGp_q0HQu5bfmx8K8mrPAGoHMosWfC_E8',
    appId: '1:760336803621:ios:f4cc8af487c207958edccc',
    messagingSenderId: '760336803621',
    projectId: 'toymingle',
    storageBucket: 'toymingle.firebasestorage.app',
    iosBundleId: 'com.toymingle.app',
  );
}
