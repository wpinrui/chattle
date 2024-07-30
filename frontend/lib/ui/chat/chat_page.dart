import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chattle'),
      ),
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
