import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lets_chat/components/constants.dart';
import 'package:lets_chat/components/rounded_button.dart';
import 'package:lets_chat/screens/chat_screen.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginScreen extends StatefulWidget {
  static const id = 'login_screen';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _auth = FirebaseAuth.instance;
  String email = "";
  String password = "";
  bool showSpinner = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Flexible(
              child: Hero(
                  tag: 'chatting_logo',
                  child: Image.asset(
                    'assets/chatting.png',
                    height: 90,
                    width: 90,
                  )),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 70),
              child: TextField(
                decoration:
                    kInputTextFieldDecoration.copyWith(hintText: 'email'),
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
                  decoration: kInputTextFieldDecoration.copyWith(
                    hintText: 'password',
                  ),
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
              onPressed: () async {
                setState(() {
                  showSpinner = true;
                });
                try {
                  final user = await _auth.signInWithEmailAndPassword(
                      email: email, password: password);
                  if (user != null) {
                    Navigator.pushNamed(context, ChatScreen.id);
                  }
                } catch (e) {
                  print(e);
                }
                setState(() {
                  showSpinner = false;
                });
              },
              title: 'Login',
              colors: Colors.lightBlueAccent,
            ),
          ],
        ),
      ),
    );
  }
}
