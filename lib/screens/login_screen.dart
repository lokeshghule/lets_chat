import 'package:flutter/material.dart';
import 'package:lets_chat/components/constants.dart';
import 'package:lets_chat/components/rounded_button.dart';

class LoginScreen extends StatefulWidget {
  static const id = 'login_screen';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String email = "";
  String password = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Hero(
              tag: 'chatting_logo',
              child: Image.asset(
                'assets/chatting.png',
                height: 90,
                width: 90,
              )),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 70),
            child: TextField(
              decoration: kInputTextFieldDecoration.copyWith(hintText: 'email'),
              textAlign: TextAlign.center,
              keyboardType: TextInputType.emailAddress,
              onChanged: (val) {
                email = val;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(70, 0, 70, 0),
            child: TextField(
                decoration:
                    kInputTextFieldDecoration.copyWith(hintText: 'password'),
                textAlign: TextAlign.center,
                obscureText: true,
                onChanged: (val) {
                  password = val;
                }),
          ),
          SizedBox(
            height: 40,
          ),
          RoundedButton(
            onPressed: () {},
            title: 'Login',
            colors: Colors.lightBlueAccent,
          ),
        ],
      ),
    );
  }
}
