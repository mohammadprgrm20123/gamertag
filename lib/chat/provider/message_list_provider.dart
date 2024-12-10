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
        senderId: userId!,
        text: 'hello',
        timeStamp: DateTime.now().copyWith(day: -1),
        uuid: const Uuid().v1(),
      ),
      MessageModel(
        senderId: userId!,
        text: 'hello',
        timeStamp: DateTime.now().copyWith(day: -2),
        uuid: const Uuid().v1(),
      ),
      MessageModel(
        uuid: const Uuid().v1(),
        senderId: userId!,
        text: 'hello',
        timeStamp: DateTime.now().copyWith(day: -3),
      ),
      MessageModel(
        uuid: const Uuid().v1(),
        senderId: '0',
        text: 'hello',
        timeStamp: DateTime.now().copyWith(hour: -2),
      ),
      MessageModel(
        uuid: const Uuid().v1(),
        senderId: userId!,
        text: 'hello',
        timeStamp: DateTime.now().copyWith(hour: -3),
      ),
      MessageModel(
        uuid: const Uuid().v1(),
        senderId: '0',
        text: 'hello',
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
        text: 'hello',
        timeStamp: DateTime.now().copyWith(minute: -14),
      ),
      MessageModel(
        uuid: const Uuid().v1(),
        senderId: '0',
        text: 'hello',
        timeStamp: DateTime.now().copyWith(minute: -15),
      ),
      MessageModel(
        uuid: const Uuid().v1(),
        senderId: '0',
        text: 'hello',
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
        text: 'hello',
        timeStamp: DateTime.now().copyWith(minute: -18),
      ),
      MessageModel(
        uuid: const Uuid().v1(),
        senderId: '0',
        text: 'hello',
        timeStamp: DateTime.now().copyWith(minute: -15),
      ),
      MessageModel(
        uuid: const Uuid().v1(),
        senderId: '0',
        text: 'hello',
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
        text: 'hello',
        timeStamp: DateTime.now().copyWith(minute: -14),
      ),
      MessageModel(
        uuid: const Uuid().v1(),
        senderId: '0',
        text: 'hello',
        timeStamp: DateTime.now().copyWith(minute: -15),
      ),
      MessageModel(
        uuid: const Uuid().v1(),
        senderId: '0',
        text: 'hello',
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
        text: 'hello',
        timeStamp: DateTime.now().copyWith(minute: -14),
      ),
      MessageModel(
        uuid: const Uuid().v1(),
        senderId: '0',
        text: 'hello',
        timeStamp: DateTime.now().copyWith(minute: -15),
      ),
      MessageModel(
        uuid: const Uuid().v1(),
        senderId: '0',
        text: 'hello',
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
        senderId: '1',
        text: 'hello',
        timeStamp: DateTime.now().copyWith(minute: -14),
      ),
      MessageModel(
        uuid: const Uuid().v1(),
        senderId: '0',
        text: 'hello',
        timeStamp: DateTime.now().copyWith(minute: -15),
      ),
      MessageModel(
        uuid: const Uuid().v1(),
        senderId: userId!,
        text: 'hello',
        timeStamp: DateTime.now().copyWith(minute: -5),
      ),
      MessageModel(
        uuid: const Uuid().v1(),
        senderId: '0',
        text: 'hello',
        timeStamp: DateTime.now().copyWith(minute: -9),
      ),
      MessageModel(
        uuid: const Uuid().v1(),
        senderId: userId!,
        text: 'hello',
        timeStamp: DateTime.now().copyWith(minute: -7),
      ),
      MessageModel(
        uuid: const Uuid().v1(),
        senderId: '0',
        text: 'hello',
        timeStamp: DateTime.now().copyWith(hour: -8),
      ),
    ];
    sortMessagesByDateTime(messages);
    return AsyncValue.data(messages);
  }

  void sortMessagesByDateTime(final List<MessageModel> messages) {
    messages.sort((final a, final b) => a.timeStamp.millisecondsSinceEpoch
        .compareTo(b.timeStamp.millisecondsSinceEpoch));
  }

  void deleteMessage({required final String uuid}) {
    final List<MessageModel>? models = state.valueOrNull;

    if (models != null) {
      models.removeWhere((final e) => e.uuid == uuid);
      state = AsyncData([...models]);
    }
  }
}
