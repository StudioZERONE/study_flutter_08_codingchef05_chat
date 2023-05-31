import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  const ChatBubble(this.message, this.isMe, {super.key});

  final String message;
  final bool isMe;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
            color: isMe ? Colors.grey[300] : Colors.blue,
            borderRadius: BorderRadius.circular(12),
          ),
          width: 145,
          padding: const EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 16,
          ),
          margin: const EdgeInsets.symmetric(
            vertical: 4,
            horizontal: 8,
          ),
          child: Text(
            message,
            style: TextStyle(
              color: isMe ? Colors.black : Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
