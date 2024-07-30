import 'package:chattle/ui/chat/chat_page_appbar.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  final String name;

  const ChatPage({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ChatPageAppbar(name: name),
      body: const Column(
        children: <Widget>[
          Expanded(
            child: Placeholder(), // TODO: add message pane
          ),
          Placeholder() // TODO: add input pane
        ],
      ),
    );
  }
}
