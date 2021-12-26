import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  static const id = 'welcome_screen';

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image(
                  height: 80.0,
                  width: 80.0,
                  image: AssetImage(
                    'chatting.png',
                  ),
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Text(
                'Lets Chat',
                style: TextStyle(fontSize: 40.0),
              ),
            ],
          ),
          Material(
            color: Colors.lightBlueAccent,
            child: MaterialButton(
              onPressed: () {},
              minWidth: 300,
              height: 40,
              child: Text(
                'Login',
                style: TextStyle(color: Colors.white),
              ),
            ),
            borderRadius: BorderRadius.circular(20),
          )
        ],
      ),
    );
  }
}
