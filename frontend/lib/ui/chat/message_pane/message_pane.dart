import 'package:chattle/data/types.dart';
import 'package:flutter/material.dart';

class MessagePane extends StatefulWidget {
  final ValueNotifier<List<MessageData>> messagesNotifier;
  const MessagePane({super.key, required this.messagesNotifier});

  @override
  State<MessagePane> createState() => _MessagePaneState();
}

class _MessagePaneState extends State<MessagePane> {

  late ScrollController _scrollController;

  void scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    widget.messagesNotifier.addListener(scrollToBottom);
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: widget.messagesNotifier,
      builder:
          (BuildContext context, List<MessageData> messages, Widget? child) {
        return ListView.builder(
          controller: _scrollController,
          itemCount: messages.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text(messages[index].message),
            );
          },
        );
      },
    );
  }

  @override
  void dispose() {
    widget.messagesNotifier.removeListener(scrollToBottom);
    super.dispose();
  }
}
