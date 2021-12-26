import 'package:flutter/material.dart';

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
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Hero(
            tag: 'chatting_logo',
            child: Image(
              image: AssetImage('chatting.png'),
              height: 100,
              width: 100,
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 70),
            child: TextField(
              decoration: InputDecoration(
                fillColor: Colors.lightBlueAccent[50],
                filled: true,
                hintText: 'username',
                border: InputBorder.none,
                focusedBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: Colors.lightBlueAccent, width: 3),
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(70, 0, 70, 0),
            child: TextField(
              decoration: InputDecoration(
                fillColor: Colors.lightBlueAccent[50],
                filled: true,
                hintText: 'password',
                border: InputBorder.none,
                focusedBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: Colors.lightBlueAccent, width: 3),
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 100),
            child: Material(
              color: Colors.lightBlueAccent,
              child: MaterialButton(
                onPressed: () {},
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
