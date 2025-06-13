// message_model.dart

class Message {
  final String messageId;
  final String senderId;
  final String receiverId;
  final String text;
  final DateTime timestamp;
  bool isSeen;
  final int index; // Added for sorting purposes

  Message({
    required this.messageId,
    required this.senderId,
    required this.receiverId,
    required this.text,
    required this.timestamp,
    required this.isSeen,
    required this.index,
  });

  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
      messageId: json['messageId'] ?? '',
      senderId: json['senderId'] ?? '',
      receiverId: json['receiverId'] ?? '',
      text: json['text'] ?? '',
      timestamp: DateTime.fromMillisecondsSinceEpoch(
        json['timestamp'] ?? 0,
      ),
      isSeen: json['isSeen'] ?? false,
      index: json['index'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'messageId': messageId,
      'senderId': senderId,
      'receiverId': receiverId,
      'text': text,
      'timestamp': timestamp.millisecondsSinceEpoch,
      'isSeen': isSeen,
      'index': index,
    };
  }
}
