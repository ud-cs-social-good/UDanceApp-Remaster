// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'dart:io' show Platform;  //at the top
//
// class PushNotificationService {
//   final FirebaseMessaging _fcm;
//
//   PushNotificationService(this._fcm);
//
//   Future initialise() async {
//     if (Platform.isIOS) {
//       _fcm.requestNotificationPermissions(IosNotificationSettings());
//     }
//
//     // If you want to test the push notification locally,
//     // you need to get the token and input to the Firebase console
//     // https://console.firebase.google.com/project/YOUR_PROJECT_ID/notification/compose
//     String token = await _fcm.getToken();
//     print("FirebaseMessaging token: $token");
//
//     _fcm.configure(
//       //called when app is in foreground
//       onMessage: (Map<String, dynamic> message) async {
//         print("onMessage: $message");
//       },
//       //when app has been closed completely and it's opened from the
//       //push notification
//       onLaunch: (Map<String, dynamic> message) async {
//         print("onLaunch: $message");
//       },
//       //when app is in background and opened from the
//       //push notification
//       onResume: (Map<String, dynamic> message) async {
//         print("onResume: $message");
//       },
//     );
//   }
// }