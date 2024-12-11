import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:uuid/uuid.dart';

import '../../infrastructure/theme/app_color.dart';
import '../model/message_model.dart';
import '../provider/message_list_provider.dart';
import '../provider/message_with_timer_provider.dart';
import 'widget/chat_input.dart';
import 'widget/date_widget.dart';
import 'widget/image_profile.dart';
import 'widget/message_widget.dart';

class ChatScreen extends ConsumerStatefulWidget {
  final String userId;

  const ChatScreen({
    required this.userId,
    super.key,
  });

  @override
  ConsumerState<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends ConsumerState<ChatScreen> {
  TextEditingController messageTextController = TextEditingController();
  late ScrollController scrollController = ScrollController();

  @override
  void initState() {
    ref.read(getAllMessagesProvider(widget.userId));
    super.initState();
  }

  @override
  void dispose() {
    messageTextController.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  Future<void> _scrollToEnd({required final double scrollExtent}) async {
    await scrollController.animateTo(
      scrollController.position.maxScrollExtent + scrollExtent,
      duration: const Duration(milliseconds: 500),
      curve: Curves.ease,
    );
  }

  @override
  Widget build(final BuildContext context) => Scaffold(
        appBar: AppBar(
          bottom: PreferredSize(
              preferredSize: const Size.fromHeight(4.0),
              child: Container(
                color: AppColor.dividerColor,
                height: .8,
              )),
          toolbarHeight: 70,
          leading: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.arrow_back_ios_outlined),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: SvgPicture.asset('assets/images/video.svg'),
            ),
          ],
          centerTitle: true,
          title: const ProfileImage(
            image: 'assets/images/image1.png',
            name: 'Kristina',
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: Consumer(
                builder: (final context, final ref, final child) {
                  final list = groupBy(ref.watch(_getMessagesProvider).value ?? <MessageModel>[], (final messageModel) => messageModel.timeStamp.day);

                  return ListView.builder(
                    controller: scrollController,
                    physics: const BouncingScrollPhysics(),
                    itemCount: list.values.length,
                    itemBuilder: (final c, final index) {
                      final dayMessages = list.values.toList()[index];
                      final date = dayMessages.first.timeStamp;
                      return Column(
                        children: [
                          MessageDateWidget(
                            dateTime: date,
                          ),
                          ...dayMessages.mapIndexed((final index, final e) => MessageWidget(
                                key: UniqueKey(),
                                expiretionTime: e.expirationTime,
                                deleteAble: e.senderId == '0',
                                isSender: e.senderId == '0',
                                color: e.expirationTime != null
                                    ? AppColor.accent
                                    : e.senderId == '0'
                                        ? AppColor.primeryColor
                                        : AppColor.appBarBackground,
                                text: e.text,
                                tail: !((index != dayMessages.length - 1) && dayMessages.iterator.moveNext() && dayMessages[index + 1].senderId == e.senderId),
                                onDeleted: () {
                                  ref.read(_getMessagesProvider.notifier).deleteMessage(uuid: e.uuid);
                                },
                              ))
                        ],
                      );
                    },
                  );
                },
              ),
            ),
            ChatInput(
              onClickInput: () {
                _scrollToEnd(scrollExtent: 400);
              },
              onSendMessage: (final value) {
                ref.read(_getMessagesProvider.notifier).sendMessage(
                    onCompleted: () => _scrollToEnd(scrollExtent: 40),
                    model: MessageModel(
                        uuid: const Uuid().v1(),
                        senderId: '0',
                        text: value,
                        expirationTime: ref.read(messageWithTimerProvider) ? DateTime.now().add(const Duration(seconds: 3)) : null,
                        timeStamp: DateTime.now()));
              },
            ),
          ],
        ),
      );

  NotifierFamilyProvider<GetMessagesProvider, AsyncValue<List<MessageModel>>, String> get _getMessagesProvider => getAllMessagesProvider(widget.userId);
}
