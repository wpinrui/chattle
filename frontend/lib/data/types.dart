class MessageData {
  final String id;
  String message;
  final Person sender;
  final String receiver;
  final DateTime timestamp;

  MessageData({
    required this.id,
    required this.message,
    required this.sender,
    required this.receiver,
    required this.timestamp,
  });
}

enum Person { user, gpt2 }
