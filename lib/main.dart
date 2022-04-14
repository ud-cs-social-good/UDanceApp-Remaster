import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'constants.dart';
import 'pages/home_page_1.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // static final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

  @override
  Widget build(BuildContext context) {
    // final pushNotificationService = PushNotificationService(_firebaseMessaging);
    // pushNotificationService.initialise();
    // _firebaseMessaging.subscribeToTopic('allUsers');
    return MaterialApp(
      title: 'UDance 2021',
      theme: ThemeData(
        primaryColor: Colors.white,
        accentColor: Palette.udanceBlue,
        fontFamily: GoogleFonts.poppins().fontFamily,
        textTheme: TextTheme(
            headline2: GoogleFonts.poppins(
                color: Palette.udanceBlue,
                fontWeight: FontWeight.w500),
            headline3: GoogleFonts.poppins(
                color: Colors.white, fontWeight: FontWeight.w500),
            bodyText1:
            GoogleFonts.poppins(fontSize: 15, fontWeight: FontWeight.w300)),
      ),
      home: HomePage1(),
    );
  }
}