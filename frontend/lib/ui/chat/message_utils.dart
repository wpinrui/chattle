import 'package:chattle/api/api_actions.dart';
import 'package:chattle/data/types.dart';
import 'package:chattle/model/model.dart';
import 'package:flutter/material.dart';

class MessageUtils {
  static MessageData createMessage(String message, bool isFromUser) {
    return MessageData(
      id: Model.messages.length.toString(),
      message: message,
      sender: isFromUser ? Person.user : Person.bot,
      receiver: isFromUser ? Person.bot : Person.user,
      timestamp: DateTime.now(),
    );
  }

  static Future<void> sendAndReceive(TextEditingController controller,
      ValueNotifier<List<MessageData>> messages) async {
    final message = controller.text;
    if (message.isNotEmpty) {
      controller.clear();
    }
    MessageData sentMessage = createMessage(message, true);
    messages.value = [...messages.value, sentMessage];
    final reply = await ApiActions.getReply(message);
    MessageData receivedMessage = createMessage(reply, false);
    messages.value = [...messages.value, receivedMessage];
  }
}
