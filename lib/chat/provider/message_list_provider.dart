import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';
import '../model/message_model.dart';

final getAllMessagesProvider = NotifierProvider.family<GetMessagesProvider, AsyncValue<List<MessageModel>>, String>(
        GetMessagesProvider.new);

class GetMessagesProvider
    extends FamilyNotifier<AsyncValue<List<MessageModel>>, String> {
  String? userId;

  @override
  AsyncValue<List<MessageModel>> build(final String arg) {
    userId = arg;

    final List<MessageModel> messages = [
      MessageModel(
        uuid: const Uuid().v1(),
        senderId: userId!,
        text: "Hey! What's up?",
        timeStamp: DateTime.now().copyWith(day: -3),
      ),
      MessageModel(
        senderId: userId!,
        text: 'Not much, just chilling. What about you?',
        timeStamp: DateTime.now().copyWith(day: -2),
        uuid: const Uuid().v1(),
      ),
      MessageModel(
        senderId: userId!,
        text: "Same old, same old. Work's been crazy, but other than that, it's alright.",
        timeStamp: DateTime.now().copyWith(day: -1),
        uuid: const Uuid().v1(),
      ),
      MessageModel(
        uuid: const Uuid().v1(),
        senderId: '0',
        text: 'Yeah, work can be a drag sometimes. Hey, did you see that new movie that just came out?',
        timeStamp: DateTime.now().copyWith(hour: -8),
      ),
      MessageModel(
        uuid: const Uuid().v1(),
        senderId: '0',
        text: 'Yeah, work can be a drag sometimes. Hey, did you see that new movie that just came out?',
        timeStamp: DateTime.now().copyWith(hour: -8),
      ),
      MessageModel(
        uuid: const Uuid().v1(),
        senderId: userId!,
        text: 'Which one? The sci-fi one?',
        timeStamp: DateTime.now().copyWith(hour: -3),
      ),
      MessageModel(
        uuid: const Uuid().v1(),
        senderId: '0',
        text: " Yeah, that one! I heard it's pretty good.",
        timeStamp: DateTime.now().copyWith(hour: -2),
      ),

      MessageModel(
        uuid: const Uuid().v1(),
        senderId: '0',
        text: "I haven't seen it yet, but I've been wanting to. Maybe we could check it out this weekend?",
        timeStamp: DateTime.now().copyWith(minute: -10),
      ),
      MessageModel(
        uuid: const Uuid().v1(),
        senderId: userId!,
        text: 'hello',
        timeStamp: DateTime.now().copyWith(minute: -12),
      ),
      MessageModel(
        uuid: const Uuid().v1(),
        senderId: userId!,
        text: 'Sounds good to me! We could grab dinner beforehand.',
        timeStamp: DateTime.now().copyWith(minute: -14),
      ),
      MessageModel(
        uuid: const Uuid().v1(),
        senderId: '0',
        text:"Perfect! I'll text you later to figure out the details.",
        timeStamp: DateTime.now().copyWith(minute: -15),
      ),
      MessageModel(
        uuid: const Uuid().v1(),
        senderId: '0',
        text: 'Cool, see you then.',
        timeStamp: DateTime.now().copyWith(minute: -10),
      ),
    ];
    sortMessagesByDateTime(messages);
    return AsyncValue.data(messages);
  }

  void sortMessagesByDateTime(final List<MessageModel> messages) {
    messages.sort((final a, final b) => a.timeStamp.millisecondsSinceEpoch
        .compareTo(b.timeStamp.millisecondsSinceEpoch));
  }

  void sendMessage({required final  MessageModel model,required void Function() onCompleted}) {
    final List<MessageModel>? models = state.valueOrNull;

    if (models != null) {
      models.add(model);
      state = AsyncData([...models]);
      onCompleted.call();
    }
  }

  void deleteMessage({required final String uuid}) {
    final List<MessageModel>? models = state.valueOrNull;

    if (models != null) {
      models.removeWhere((final e) => e.uuid == uuid);
      state = AsyncData([...models]);
    }
  }
}
