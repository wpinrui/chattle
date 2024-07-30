import 'package:chattle/data/types.dart';

abstract class Model {
  static final List<MessageData> _messages = []; // assume always sorted by timestamp

  static void addMessage(MessageData message) {
    _messages.add(message);
  }

  static void clearMessages() {
    _messages.clear();
  }
}
