import 'package:flutter/material.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';

class ChatBubbles extends StatelessWidget {
  const ChatBubbles(this.message, this.isMe, {super.key});

  final String message;
  final bool isMe;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        // Container(
        //   decoration: BoxDecoration(
        //     color: isMe ? Colors.grey[300] : Colors.blue,
        //     borderRadius: BorderRadius.only(
        //       topRight: const Radius.circular(12),
        //       topLeft: const Radius.circular(12),
        //       bottomRight:
        //           isMe ? const Radius.circular(0) : const Radius.circular(12),
        //       bottomLeft:
        //           isMe ? const Radius.circular(12) : const Radius.circular(0),
        //     ),
        //   ),
        //   width: 145,
        //   padding: const EdgeInsets.symmetric(
        //     vertical: 10,
        //     horizontal: 16,
        //   ),
        //   margin: const EdgeInsets.symmetric(
        //     vertical: 4,
        //     horizontal: 8,
        //   ),
        //   child: Text(
        //     message,
        //     style: TextStyle(
        //       color: isMe ? Colors.black : Colors.white,
        //     ),
        //   ),
        // ),
        if (isMe)
          ChatBubble(
            clipper: ChatBubbleClipper8(type: BubbleType.sendBubble),
            alignment: Alignment.topRight,
            margin: const EdgeInsets.only(top: 20),
            backGroundColor: Colors.blue,
            child: Container(
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width * 0.7,
              ),
              child: Text(
                message,
                style: const TextStyle(color: Colors.white),
              ),
            ),
          )
        else
          ChatBubble(
            clipper: ChatBubbleClipper8(type: BubbleType.receiverBubble),
            backGroundColor: const Color(0xffE7E7ED),
            margin: const EdgeInsets.only(top: 20),
            child: Container(
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width * 0.7,
              ),
              child: Text(
                message,
                style: const TextStyle(color: Colors.black),
              ),
            ),
          )
      ],
    );
  }
}
