import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lets_chat/components/constants.dart';

class ChatScreen extends StatefulWidget {
  static const id = 'chat_screen';

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _auth = FirebaseAuth.instance;
  User? loggedInUser;
  final _firstore = FirebaseFirestore.instance;
  String message = '';

  void getCurrentUser() async {
    try {
      final user = await _auth.currentUser;
      if (user != null) {
        loggedInUser = user;
        print(user.email);
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chats'),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextButton(
              child: Icon(
                Icons.logout,
                color: Colors.white,
              ),
              onPressed: () {
                _auth.signOut();

                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                  style: TextStyle(height: 0.5),
                  cursorHeight: 20,
                  decoration: kInputTextFieldDecoration.copyWith(
                    hintText: '',
                  ),
                  textAlign: TextAlign.center,
                  onChanged: (val) {
                    message = val;
                  }),
            ),
          ),
          // TextField(
          //   decoration: kInputTextFieldDecoration,
          // )
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  _firstore
                      .collection('messages')
                      .add({'sender': loggedInUser!.email, 'message': message});
                },
                child: Icon(Icons.send),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
