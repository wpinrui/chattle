import 'package:chattle/api/reply.dart';
import 'package:chattle/ui/chat/chat_box/chat_box_send_button.dart';
import 'package:chattle/ui/chat/chat_box/chat_box_text_field';
import 'package:flutter/material.dart';

class ChatBox extends StatefulWidget {
  const ChatBox({super.key});

  @override
  State<ChatBox> createState() => _ChatBoxState();
}

class _ChatBoxState extends State<ChatBox> {
  final TextEditingController _controller = TextEditingController();

  Future<String> sendAndReceive() async {
    final message = _controller.text;
    if (message.isNotEmpty) {
      _controller.clear();
    }
    return await Reply.reply(message);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: ChatBoxTextField(controller: _controller),
            ),
          ),
          ChatBoxSendButton(
            sendAndReceive: sendAndReceive,
          ),
        ],
      ),
    );
  }
}

