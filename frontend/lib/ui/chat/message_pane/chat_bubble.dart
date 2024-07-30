import 'package:chattle/data/types.dart';
import 'package:flutter/material.dart';
import 'package:chat_bubbles/chat_bubbles.dart';

class ChatBubble extends StatelessWidget {
  final MessageData message;
  const ChatBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    bool isUserMessage = message.sender == Person.user;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 2.0),
      child: BubbleSpecialOne(
        text: message.message,
        isSender: isUserMessage,
        color: isUserMessage ? Colors.green.shade100 : Colors.blue.shade100,
        textStyle: const TextStyle(
          color: Colors.black,
          fontSize: 18,
        ),
        tail: true,
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.8,
        ),
      ),
    );
  }
}
