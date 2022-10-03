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
    apiKey: 'AIzaSyA3_5VZ2tbko0Pj8RqiHAN860qykculzOM',
    appId: '1:769961254578:web:0a22f3c6e0753ac29773ab',
    messagingSenderId: '769961254578',
    projectId: 'protalent-eksad',
    authDomain: 'protalent-eksad.firebaseapp.com',
    storageBucket: 'protalent-eksad.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBOiiXi2_qHMiH88OQQRG-oTqVAg5BtgMU',
    appId: '1:769961254578:android:2fca61719a0db4ae9773ab',
    messagingSenderId: '769961254578',
    projectId: 'protalent-eksad',
    storageBucket: 'protalent-eksad.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCPueW22pLSKiqaZXw0QliUnRvZCVbJV0I',
    appId: '1:769961254578:ios:05fbc46c3c895bce9773ab',
    messagingSenderId: '769961254578',
    projectId: 'protalent-eksad',
    storageBucket: 'protalent-eksad.appspot.com',
    iosClientId:
        '769961254578-i92cdp99g9u1kpbni5g1fbu8rrd121og.apps.googleusercontent.com',
    iosBundleId: 'eksad.com.protalentEksad',
  );
}
