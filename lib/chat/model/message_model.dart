class MessageModel {
  String senderId;
  String text;
  DateTime? readMessage;
  DateTime timeStamp;
  DateTime? expirationTime;

  MessageModel({required this.senderId, required this.text, this.readMessage, required this.timeStamp, this.expirationTime});
}
