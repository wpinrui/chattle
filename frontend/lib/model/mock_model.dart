import 'package:chattle/data/types.dart';
import 'package:chattle/model/model.dart';

class MockModel implements Model {
  static final List<MessageData> _messages = [
    msg1,
    msg2,
    msg3,
    msg4,
    msg5,
    msg6,
    msg7,
    msg8,
    msg9,
    msg10,
    msg11,
    msg12,
    msg13,
    msg14,
    msg15,
    msg16,
    msg17,
    msg18,
  ]; // assume always sorted by timestamp

  static void addMessage(MessageData message) {
    _messages.add(message);
  }

  static void clearMessages() {
    _messages.clear();
  }

  static List<MessageData> get messages {
    return _messages;
  }

}

MessageData msg1 = MessageData(
  id: '1',
  message: 'Hello',
  sender: Person.user,
  receiver: Person.gpt2,
  timestamp: DateTime.now().subtract(const Duration(hours: 19)),
);

MessageData msg2 = MessageData(
  id: '2',
  message: 'Hi',
  sender: Person.gpt2,
  receiver: Person.user,
  timestamp: DateTime.now().subtract(const Duration(hours: 18)),
);

MessageData msg3 = MessageData(
  id: '3',
  message: 'How are you?',
  sender: Person.user,
  receiver: Person.gpt2,
  timestamp: DateTime.now().subtract(const Duration(hours: 16)),
);

MessageData msg4 = MessageData(
  id: '4',
  message: 'I am fine',
  sender: Person.gpt2,
  receiver: Person.user,
  timestamp: DateTime.now().subtract(const Duration(hours: 15)),
);

MessageData msg5 = MessageData(
  id: '5',
  message: 'What are you doing?',
  sender: Person.user,
  receiver: Person.gpt2,
  timestamp: DateTime.now().subtract(const Duration(hours: 14)),
);

MessageData msg6 = MessageData(
  id: '6',
  message: 'I am chatting with you',
  sender: Person.gpt2,
  receiver: Person.user,
  timestamp: DateTime.now().subtract(const Duration(hours: 13)),
);

MessageData msg7 = MessageData(
  id: '7',
  message: 'What is your name?',
  sender: Person.user,
  receiver: Person.gpt2,
  timestamp: DateTime.now().subtract(const Duration(hours: 12)),
);

MessageData msg8 = MessageData(
  id: '8',
  message: 'I am GPT-2',
  sender: Person.gpt2,
  receiver: Person.user,
  timestamp: DateTime.now().subtract(const Duration(hours: 11)),
);

MessageData msg9 = MessageData(
  id: '9',
  message: 'What is your favorite color?',
  sender: Person.user,
  receiver: Person.gpt2,
  timestamp: DateTime.now().subtract(const Duration(hours: 10)),
);

MessageData msg10 = MessageData(
  id: '10',
  message: 'I do not have a favorite color',
  sender: Person.gpt2,
  receiver: Person.user,
  timestamp: DateTime.now().subtract(const Duration(hours: 9)),
);

MessageData msg11 = MessageData(
  id: '11',
  message: 'What is your favorite food?',
  sender: Person.user,
  receiver: Person.gpt2,
  timestamp: DateTime.now().subtract(const Duration(hours: 8)),
);

MessageData msg12 = MessageData(
  id: '12',
  message: 'I do not eat food',
  sender: Person.gpt2,
  receiver: Person.user,
  timestamp: DateTime.now().subtract(const Duration(hours: 7)),
);

MessageData msg13 = MessageData(
  id: '13',
  message: 'What do you do for fun?',
  sender: Person.user,
  receiver: Person.gpt2,
  timestamp: DateTime.now().subtract(const Duration(hours: 6)),
);

MessageData msg14 = MessageData(
  id: '14',
  message: 'I chat with you',
  sender: Person.gpt2,
  receiver: Person.user,
  timestamp: DateTime.now().subtract(const Duration(hours: 5)),
);

MessageData msg15 = MessageData(
  id: '15',
  message: 'What is your favorite movie?',
  sender: Person.user,
  receiver: Person.gpt2,
  timestamp: DateTime.now().subtract(const Duration(hours: 4)),
);

MessageData msg16 = MessageData(
  id: '16',
  message: 'I do not watch movies',
  sender: Person.gpt2,
  receiver: Person.user,
  timestamp: DateTime.now().subtract(const Duration(hours: 3)),
);

MessageData msg17 = MessageData(
  id: '17',
  message: 'What is your favorite book?',
  sender: Person.user,
  receiver: Person.gpt2,
  timestamp: DateTime.now().subtract(const Duration(hours: 2)),
);

MessageData msg18 = MessageData(
  id: '18',
  message: 'I do not read books',
  sender: Person.gpt2,
  receiver: Person.user,
  timestamp: DateTime.now().subtract(const Duration(hours: 1)),
);
