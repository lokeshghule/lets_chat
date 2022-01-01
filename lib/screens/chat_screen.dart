import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lets_chat/components/constants.dart';

class ChatScreen extends StatefulWidget {
  static const id = 'chat_screen';

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

User? loggedInUser;

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController textEditingController = TextEditingController();
  final _auth = FirebaseAuth.instance;

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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: MessageStreamBuilder(
              firstore: _firstore,
            ),
          ),
          Divider(thickness: 2, color: Colors.lightBlueAccent),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16.0, 5, 16, 16),
                  child: TextField(
                      controller: textEditingController,
                      style: TextStyle(height: 0.5),
                      decoration: kInputTextFieldDecoration.copyWith(
                        hintText: 'type your message here',
                      ),
                      textAlign: TextAlign.left,
                      onChanged: (val) {
                        message = val;
                      }),
                ),
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16.0, 5, 16, 16),
                  child: ElevatedButton(
                    onPressed: () {
                      textEditingController.clear();
                      _firstore.collection('messages').add(
                          {'sender': loggedInUser!.email, 'message': message});
                    },
                    child: Icon(Icons.send),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class MessageStreamBuilder extends StatelessWidget {
  const MessageStreamBuilder({
    Key? key,
    required FirebaseFirestore firstore,
  })  : _firstore = firstore,
        super(key: key);

  final FirebaseFirestore _firstore;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: _firstore.collection('messages').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.lightBlueAccent,
              ),
            );
          }

          final messages = snapshot.data!.docs.reversed;
          List<MessageBubble> messageWidgets = [];
          for (var message in messages) {
            final messageText = message.get('message');
            final messageSender = message.get('sender');
            final currentUser = loggedInUser!.email;
            final messageWidget = MessageBubble(
              messageText: messageText,
              messageSender: messageSender,
              isME: currentUser == messageSender,
            );
            messageWidgets.add(messageWidget);
          }
          return ListView(
            reverse: true,
            children: messageWidgets,
          );
        });
  }
}

class MessageBubble extends StatelessWidget {
  const MessageBubble({
    required this.messageText,
    required this.messageSender,
    required this.isME,
  });

  final String messageText;
  final String messageSender;
  final bool isME;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      child: Column(
        crossAxisAlignment:
            isME ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Text(
            messageSender,
            style: TextStyle(color: Colors.black54, fontSize: 12.5),
          ),
          Material(
            elevation: 10,
            borderRadius: isME
                ? BorderRadius.only(
                    topLeft: Radius.circular(30),
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30))
                : BorderRadius.only(
                    topRight: Radius.circular(30),
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30)),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Text(
                messageText,
                style: TextStyle(
                  fontSize: 17,
                  color: isME ? Colors.white : Colors.black54,
                ),
              ),
            ),
            color: isME ? Colors.blueAccent : Colors.white,
          ),
        ],
      ),
    );
  }
}
