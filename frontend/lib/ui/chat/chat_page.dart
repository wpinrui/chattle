import 'package:chattle/ui/chat/chat_box/chat_box.dart';
import 'package:chattle/ui/chat/chat_page_appbar.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  final String name;

  const ChatPage({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: ChatPageAppbar(name: name),
        body: const Column(
          children: <Widget>[
            Expanded(child: Placeholder()),
            ChatBox(),
          ],
        ),
      ),
    );
  }
}
