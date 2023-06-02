import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MessageTest extends StatelessWidget {
  const MessageTest({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          //.collection('chats/WEFaxXy2doedbXQkR0Q1/message')
          .collection('chat')
          .orderBy('time', descending: true)
          .snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return const Text('데이터를 불러오는 중 오류가 발생했습니다.');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
          return const Text('데이터가 없습니다.');
        }

        // 데이터가 있다면 ListView 등을 사용하여 UI에 표시할 수 있습니다.
        return ListView.builder(
          itemCount: snapshot.data!.docs.length,
          itemBuilder: (BuildContext context, int index) {
            DocumentSnapshot document = snapshot.data!.docs[index];
            // 데이터 활용 예시: document['field_name']
            return ListTile(
              title: Text(document['title']),
              subtitle: Text(document['subtitle']),
            );
          },
        );
      },
    );
  }
}
