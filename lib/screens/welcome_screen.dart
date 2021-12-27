import 'package:flutter/material.dart';
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

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
      upperBound: 100,
    );

    controller!.forward();

    controller!.addListener(() {
      setState(() {});
      print(controller!.value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.red.withOpacity(controller!.value),
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
                    child: Image(
                      height: 80.0,
                      width: 80.0,
                      image: AssetImage(
                        'chatting.png',
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  '${controller!.value.toInt()}%',
                  style: TextStyle(fontSize: 40.0),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Material(
              color: Colors.lightBlueAccent,
              child: MaterialButton(
                onPressed: () {
                  Navigator.pushNamed(context, LoginScreen.id);
                },
                minWidth: 300,
                height: 40,
                child: Text(
                  'Login',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Material(
              color: Colors.lightBlueAccent,
              child: MaterialButton(
                onPressed: () {
                  Navigator.pushNamed(context, RegistrationScreen.id);
                },
                minWidth: 300,
                height: 40,
                child: Text(
                  'Register',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ],
      ),
    );
  }
}
