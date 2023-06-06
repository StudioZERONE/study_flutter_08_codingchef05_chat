import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:study_flutter_08_codingchef05_chat/chatting/chat/chat_bubble.dart';

class Messages extends StatelessWidget {
  const Messages({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    return StreamBuilder(
      stream: FirebaseFirestore.instance
          //.collection('chats/WEFaxXy2doedbXQkR0Q1/message')
          .collection('chat')
          .orderBy('time', descending: true)
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (snapshot.hasError) {
          return Text('데이터를 불러오는 중 오류가 발생했습니다. ${snapshot.error}');
        }

        final chatDocs = snapshot.data!.docs;

        print('message.dart - Login User: ${user!.email}');
        print('message.dart - chatDocs.length: ${chatDocs.length}');

        return ListView.builder(
          reverse: true,
          itemCount: chatDocs.length,
          itemBuilder: (context, index) {
            return ChatBubbles(
              chatDocs[index]['text'],
              //true,
              chatDocs[index]['userID'].toString() == user.uid,
            );
          },
        );
      },
    );
  }
}
