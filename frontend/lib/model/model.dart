import 'package:chattle/data/types.dart';

class Model {
  static final List<MessageData> _messages = []; // assume always sorted by timestamp

  static void init() async {
    // Load messages from storage
    // TODO: Implement this. For now, just add a welcome message
    _messages.add(
      MessageData(
        id: '0',
        message: 'Hello! I\'m Janet. What can I do for you?',
        sender: Person.bot,
        receiver: Person.user,
        timestamp: DateTime.now(),
      )
    );
  }

  static List<MessageData> get messages => _messages;

  static void addMessage(MessageData message) {
    _messages.add(message);
  }

  static void clearMessages() {
    _messages.clear();
  }
}
