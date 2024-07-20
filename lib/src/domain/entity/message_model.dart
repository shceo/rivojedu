class MessageModel {
  final String messageId;
  final String senderId;
  final String senderName;
  final String message;
  final DateTime timestamp;
  final bool admin;

  MessageModel({
    required this.admin,
    required this.messageId,
    required this.senderId,
    required this.senderName,
    required this.message,
    required this.timestamp,
  });

  factory MessageModel.fromJson(Map<String, dynamic> json) {
    return MessageModel(
      messageId: json['messageId'] ?? '',
      admin: json['admin'] ?? '',
      senderId: json['senderId'] ?? '',
      senderName: json['senderName'] ?? '',
      message: json['message'] ?? '',
      timestamp: json['timestamp'] != null
          ? DateTime.parse(json['timestamp'])
          : DateTime.now(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "admin": admin,
      'messageId': messageId,
      'senderId': senderId,
      'senderName': senderName,
      'message': message,
      'timestamp': timestamp.toIso8601String(),
    };
  }
}
