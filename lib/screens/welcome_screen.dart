import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:lets_chat/components/rounded_button.dart';
import 'package:lets_chat/screens/registration_screen.dart';

import 'login_screen.dart';

class WelcomeScreen extends StatefulWidget {
  static const id = 'welcome_screen';

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  AnimationController? controller;
  Animation? animation;
  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1300),
    );
    animation =
        ColorTween(begin: Colors.blue, end: Colors.white).animate(controller!);
    controller!.forward();
    controller!.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation!.value,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Hero(
                    tag: 'chatting_logo',
                    child: Image.asset(
                      'assets/chatting.png',
                      height: 70,
                      width: 70.0,
                    ),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Container(
                  child: DefaultTextStyle(
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    child: AnimatedTextKit(
                      totalRepeatCount: 2,
                      pause: Duration(milliseconds: 1000),
                      animatedTexts: [
                        TyperAnimatedText(
                          'Lets Chat',
                          speed: Duration(milliseconds: 100),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          RoundedButton(
            title: 'Login',
            colors: Colors.lightBlueAccent,
            onPressed: () {
              Navigator.pushNamed(context, LoginScreen.id);
            },
          ),
          RoundedButton(
            onPressed: () {
              Navigator.pushNamed(context, RegistrationScreen.id);
            },
            title: 'Register',
            colors: Colors.lightBlueAccent,
          )
        ],
      ),
    );
  }
}
