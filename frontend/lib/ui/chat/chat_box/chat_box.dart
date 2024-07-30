import 'package:chattle/ui/chat/chat_box/chat_box_send_button.dart';
import 'package:chattle/ui/chat/chat_box/chat_box_text_field';
import 'package:flutter/material.dart';

class ChatBox extends StatelessWidget {
  final TextEditingController controller;
  final Future<void> Function() sendAndReceiveNotify;
  const ChatBox({super.key, required this.controller, required this.sendAndReceiveNotify});


  @override
Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: ChatBoxTextField(controller: controller),
            ),
          ),
          ChatBoxSendButton(
            sendAndReceive: sendAndReceiveNotify,
          ),
        ],
      ),
    );
  }
}
