import 'package:flutter/material.dart';

class ChatBoxSendButton extends StatelessWidget {
  final Future<String> Function() _sendAndReceive;
  const ChatBoxSendButton(
      {super.key, required Future<String> Function() sendAndReceive})
      : _sendAndReceive = sendAndReceive;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        Icons.send,
        color: Colors.blue.shade600,
        size: 30,
      ),
      onPressed: () {
        _sendAndReceive();
      },
    );
  }
}
