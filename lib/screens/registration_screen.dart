import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:lets_chat/components/constants.dart';
import 'package:lets_chat/components/rounded_button.dart';
import 'package:lets_chat/screens/chat_screen.dart';

class RegistrationScreen extends StatefulWidget {
  static const id = 'registration_screen';

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _auth = FirebaseAuth.instance;

  String email = "";
  String password = "";

  @override
  void initState() {
    super.initState();
    Firebase.initializeApp();
  }

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
              decoration: kInputTextFieldDecoration.copyWith(
                hintText: 'email',
              ),
              keyboardType: TextInputType.emailAddress,
              textAlign: TextAlign.center,
              onChanged: (val) {
                email = val;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(70, 0, 70, 0),
            child: TextField(
              decoration: kInputTextFieldDecoration.copyWith(
                hintText: 'password',
              ),
              textAlign: TextAlign.center,
              obscureText: true,
              onChanged: (val) {
                password = val;
              },
            ),
          ),
          SizedBox(
            height: 40,
          ),
          RoundedButton(
            onPressed: () async {
              // print(email);
              // print(password);
              try {
                final newUser = await _auth.createUserWithEmailAndPassword(
                    email: email, password: password);
                if (newUser != null) {
                  Navigator.pushNamed(context, ChatScreen.id);
                }
              } catch (e) {
                print(e);
              }
            },
            title: 'Register',
            colors: Colors.lightBlueAccent,
          )
        ],
      ),
    );
  }
}
