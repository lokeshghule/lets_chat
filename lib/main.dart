import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:lets_chat/screens/chat_screen.dart';
import 'package:lets_chat/screens/login_screen.dart';
import 'package:lets_chat/screens/registration_screen.dart';
import 'package:lets_chat/screens/welcome_screen.dart';
//import 'package:firebase_auth/firebase_auth.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Firebase.initializeApp();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        RegistrationScreen.id: (context) => RegistrationScreen(),
        WelcomeScreen.id: (context) => WelcomeScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        ChatScreen.id: (context) => ChatScreen(),
      },
      initialRoute: WelcomeScreen.id,
    );
  }
}
