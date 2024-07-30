import 'package:chattle/ui/chat/chat_box/chat_box_send_button.dart';
import 'package:chattle/ui/chat/chat_box/chat_box_text_field.dart';
import 'package:chattle/ui/pretty/frosted.dart';
import 'package:flutter/material.dart';

class ChatBox extends StatelessWidget {
  final TextEditingController controller;
  final Future<void> Function() sendAndReceiveNotify;
  const ChatBox(
      {super.key,
      required this.controller,
      required this.sendAndReceiveNotify});

  @override
  Widget build(BuildContext context) {
    return Frosted(
      child: Container(
        color: Colors.white.withOpacity(0.2),
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                child: ChatBoxTextField(
                  controller: controller,
                ),
              ),
            ),
            ChatBoxSendButton(
              sendAndReceive: sendAndReceiveNotify,
            ),
          ],
        ),
      ),
    );
  }
}
