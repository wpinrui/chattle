import 'package:chattle/ui/chat/chat_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const ChattleMain());
}

class ChattleMain extends StatelessWidget {
  const ChattleMain({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    debugPrintRebuildDirtyWidgets = true;
    return MaterialApp(
      title: 'Chattle',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
        useMaterial3: true,
      ),
      home: const ChatPage(
        name: 'Janet',
      ),
      initialRoute: '/',
    );
  }
}
