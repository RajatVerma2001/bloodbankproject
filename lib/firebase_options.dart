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
    apiKey: 'AIzaSyCxuiujsIQ3h8sTUx1d33DNmZy90sgOw1o',
    appId: '1:835001630320:web:36a48cc344d92a7df57eb5',
    messagingSenderId: '835001630320',
    projectId: 'bloodbankproject-bafce',
    authDomain: 'bloodbankproject-bafce.firebaseapp.com',
    storageBucket: 'bloodbankproject-bafce.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBv5hSVU3siRVsE6YrCHlxvRJclWop2yuo',
    appId: '1:835001630320:android:6af41f1f3497a7c0f57eb5',
    messagingSenderId: '835001630320',
    projectId: 'bloodbankproject-bafce',
    storageBucket: 'bloodbankproject-bafce.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDoeLA2X6D8NrrK-yLynlCm4mxmklNWMC4',
    appId: '1:835001630320:ios:27e83ca56d5cad77f57eb5',
    messagingSenderId: '835001630320',
    projectId: 'bloodbankproject-bafce',
    storageBucket: 'bloodbankproject-bafce.appspot.com',
    iosClientId: '835001630320-anb1na875jclpe5b8655mkpuiit2iun5.apps.googleusercontent.com',
    iosBundleId: 'com.example.bloodbankproject',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDoeLA2X6D8NrrK-yLynlCm4mxmklNWMC4',
    appId: '1:835001630320:ios:27e83ca56d5cad77f57eb5',
    messagingSenderId: '835001630320',
    projectId: 'bloodbankproject-bafce',
    storageBucket: 'bloodbankproject-bafce.appspot.com',
    iosClientId: '835001630320-anb1na875jclpe5b8655mkpuiit2iun5.apps.googleusercontent.com',
    iosBundleId: 'com.example.bloodbankproject',
  );
}