import 'package:flutter/material.dart';
import 'package:lets_chat/components/constants.dart';
import 'package:lets_chat/components/rounded_button.dart';

class RegistrationScreen extends StatefulWidget {
  static const id = 'registration_screen';

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        //crossAxisAlignment: CrossAxisAlignment.stretch,
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
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(70, 0, 70, 0),
            child: TextField(
              decoration: kInputTextFieldDecoration.copyWith(
                hintText: 'password',
              ),
            ),
          ),
          SizedBox(
            height: 40,
          ),
          RoundedButton(
            onPressed: () {},
            title: 'Register',
            colors: Colors.lightBlueAccent,
          )
        ],
      ),
    );
  }
}
