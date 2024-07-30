import 'package:chattle/data/types.dart';
import 'package:chattle/ui/chat/message_pane/chat_bubble.dart';
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
          _scrollController.position.minScrollExtent, // listview is reversed
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
          reverse: true,
          controller: _scrollController,
          itemCount: messages.length + 1,
          itemBuilder: (BuildContext context, int index) {
            if (index == 0) {
              return const SizedBox(height: 80);
            }
            return ChatBubble(message: messages[messages.length - index]);
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
