class MessageData {
  final String id;
  final String message;
  final Person sender;
  final Person receiver;
  final DateTime timestamp;

  const MessageData({
    required this.id,
    required this.message,
    required this.sender,
    required this.receiver,
    required this.timestamp,
  });
}

enum Person { user, gpt2 }
