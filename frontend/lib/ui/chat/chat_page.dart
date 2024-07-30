import 'package:chattle/data/types.dart';
import 'package:chattle/model/mock_model.dart';
import 'package:chattle/ui/chat/chat_box/chat_box.dart';
import 'package:chattle/ui/chat/chat_page_appbar.dart';
import 'package:chattle/ui/chat/message_pane/message_pane.dart';
import 'package:chattle/ui/chat/message_utils.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  final String name;
  const ChatPage({super.key, required this.name});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final ValueNotifier<List<MessageData>> _messages =
      ValueNotifier(MockModel.messages);

  final TextEditingController chatBoxController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    sendAndReceiveNotify() =>
        MessageUtils.sendAndReceive(chatBoxController, _messages);
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/bg.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          extendBodyBehindAppBar: true,
          appBar: ChatPageAppbar(name: widget.name),
          body: Stack(
            alignment: AlignmentDirectional.bottomCenter,
            children: <Widget>[
              Expanded(
                child: MessagePane(messagesNotifier: _messages),
              ),
              ChatBox(
                  controller: chatBoxController,
                  sendAndReceiveNotify: sendAndReceiveNotify),
            ],
          ),
        ),
      ),
    );
  }
}
