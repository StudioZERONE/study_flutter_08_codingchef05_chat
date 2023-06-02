import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:study_flutter_08_codingchef05_chat/chatting/chat/message.dart';
import 'package:study_flutter_08_codingchef05_chat/chatting/chat/new_message.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _authentication = FirebaseAuth.instance;
  User? loggedUser;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() {
    try {
      final user = _authentication.currentUser;
      if (user != null) {
        loggedUser = user;
        print('chat_screen.dart - Login User: ${loggedUser!.email}');
      }
    } catch (e) {
      print('chat_screen Current User - Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat screen'),
        actions: [
          IconButton(
            onPressed: () {
              _authentication.signOut();
              //Navigator.pop(context);
            },
            icon: const Icon(
              Icons.exit_to_app_sharp,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: Container(
        child: const Column(
          children: [
            Expanded(
              //child: MessageTest(),
              child: Messages(),
            ),
            NewMessage(),
          ],
        ),
      ),
      // StreamBuilder(
      //   stream: FirebaseFirestore.instance
      //       .collection('chats/WEFaxXy2doedbXQkR0Q1/message')
      //       .snapshots(),
      //   builder: (BuildContext context,
      //       AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
      //     if (snapshot.connectionState == ConnectionState.waiting) {
      //       return const Center(
      //         child: CircularProgressIndicator(),
      //       );
      //     }

      //     final docs = snapshot.data!.docs;

      //     return ListView.builder(
      //       itemCount: docs.length,
      //       itemBuilder: (context, index) {
      //         return Container(
      //           padding: const EdgeInsets.all(8),
      //           child: Text(
      //             docs[index]['text'],
      //             style: const TextStyle(
      //               fontSize: 20,
      //             ),
      //           ),
      //         );
      //       },
      //     );
      //   },
      // ),
    );
  }
}
