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
    apiKey: 'AIzaSyA74JFmb3eKgSNSoGR-gmt0JwKn1EWzQfE',
    appId: '1:807826933891:web:afb543d4a5ddfb91edf3b6',
    messagingSenderId: '807826933891',
    projectId: 'kedi-oto-aksesuar',
    authDomain: 'kedi-oto-aksesuar.firebaseapp.com',
    databaseURL: 'https://kedi-oto-aksesuar-default-rtdb.firebaseio.com',
    storageBucket: 'kedi-oto-aksesuar.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBrhbLtEM9omR45bz07heLYKFaMJaOulgU',
    appId: '1:807826933891:android:d4bccdfa5b515053edf3b6',
    messagingSenderId: '807826933891',
    projectId: 'kedi-oto-aksesuar',
    databaseURL: 'https://kedi-oto-aksesuar-default-rtdb.firebaseio.com',
    storageBucket: 'kedi-oto-aksesuar.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBNbhWP39nrJDNfmiDlS9qlm3aO2hONFxU',
    appId: '1:807826933891:ios:c9fd9a6ff8b88c94edf3b6',
    messagingSenderId: '807826933891',
    projectId: 'kedi-oto-aksesuar',
    databaseURL: 'https://kedi-oto-aksesuar-default-rtdb.firebaseio.com',
    storageBucket: 'kedi-oto-aksesuar.appspot.com',
    iosBundleId: 'com.example.kediOtoAksesuarr',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBNbhWP39nrJDNfmiDlS9qlm3aO2hONFxU',
    appId: '1:807826933891:ios:6c59567a07c44a47edf3b6',
    messagingSenderId: '807826933891',
    projectId: 'kedi-oto-aksesuar',
    databaseURL: 'https://kedi-oto-aksesuar-default-rtdb.firebaseio.com',
    storageBucket: 'kedi-oto-aksesuar.appspot.com',
    iosBundleId: 'com.example.kediOtoAksesuarr.RunnerTests',
  );
}
