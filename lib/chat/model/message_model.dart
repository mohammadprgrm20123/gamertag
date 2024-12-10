class MessageModel {
  final String uuid;
  final String senderId;
  final String text;
  final DateTime? readMessage;
  final DateTime timeStamp;
  final DateTime? expirationTime;

  MessageModel(
      {required this.uuid,
      required this.senderId,
      required this.text,
      required this.timeStamp,
      this.readMessage,
      this.expirationTime});
}
