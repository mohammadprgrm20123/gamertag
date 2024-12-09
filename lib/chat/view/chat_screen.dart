import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gamertag_3/chat/view/widget/date_widget.dart';
import '../../infrastructure/theme/app_color.dart';
import '../../infrastructure/utils/utils.dart';
import '../../share/widget/app_text.dart';
import '../model/message_model.dart';
import 'widget/image_profile.dart';
import 'widget/message_widget.dart';
import 'package:collection/collection.dart';

List<MessageModel> messages = [
  MessageModel(
    senderId: '1',
    text: 'hello',
    timeStamp: DateTime.now().copyWith(day: -1),
  ),
  MessageModel(
    senderId: '1',
    text: 'hello',
    timeStamp: DateTime.now().copyWith(day: -1),
  ),
  MessageModel(
    senderId: '1',
    text: 'hello',
    timeStamp: DateTime.now().copyWith(day: -1),
  ),
  MessageModel(
    senderId: '0',
    text: 'hello',
    timeStamp: DateTime.now().copyWith(hour: -2),
  ),
  MessageModel(
    senderId: '1',
    text: 'hello',
    timeStamp: DateTime.now().copyWith(hour: -3),
  ),
  MessageModel(
    senderId: '0',
    text: 'hello',
    timeStamp: DateTime.now().copyWith(minute: -10),
  ),
  MessageModel(
    senderId: '1',
    text: 'hello',
    timeStamp: DateTime.now().copyWith(minute: -12),
  ),
  MessageModel(
    senderId: '1',
    text: 'hello',
    timeStamp: DateTime.now().copyWith(minute: -14),
  ),
  MessageModel(
    senderId: '0',
    text: 'hello',
    timeStamp: DateTime.now().copyWith(minute: -15),
  ),
  MessageModel(
    senderId: '0',
    text: 'hello',
    timeStamp: DateTime.now().copyWith(minute: -10),
  ),
  MessageModel(
    senderId: '1',
    text: 'hello',
    timeStamp: DateTime.now().copyWith(minute: -12),
  ),
  MessageModel(
    senderId: '1',
    text: 'hello',
    timeStamp: DateTime.now().copyWith(minute: -14),
  ),
  MessageModel(
    senderId: '0',
    text: 'hello',
    timeStamp: DateTime.now().copyWith(minute: -15),
  ),
  MessageModel(
    senderId: '0',
    text: 'hello',
    timeStamp: DateTime.now().copyWith(minute: -10),
  ),
  MessageModel(
    senderId: '1',
    text: 'hello',
    timeStamp: DateTime.now().copyWith(minute: -12),
  ),
  MessageModel(
    senderId: '1',
    text: 'hello',
    timeStamp: DateTime.now().copyWith(minute: -14),
  ),
  MessageModel(
    senderId: '0',
    text: 'hello',
    timeStamp: DateTime.now().copyWith(minute: -15),
  ),
  MessageModel(
    senderId: '0',
    text: 'hello',
    timeStamp: DateTime.now().copyWith(minute: -10),
  ),
  MessageModel(
    senderId: '1',
    text: 'hello',
    timeStamp: DateTime.now().copyWith(minute: -12),
  ),
  MessageModel(
    senderId: '1',
    text: 'hello',
    timeStamp: DateTime.now().copyWith(minute: -14),
  ),
  MessageModel(
    senderId: '0',
    text: 'hello',
    timeStamp: DateTime.now().copyWith(minute: -15),
  ),
  MessageModel(
    senderId: '0',
    text: 'hello',
    timeStamp: DateTime.now().copyWith(minute: -10),
  ),
  MessageModel(
    senderId: '1',
    text: 'hello',
    timeStamp: DateTime.now().copyWith(minute: -12),
  ),
  MessageModel(
    senderId: '1',
    text: 'hello',
    timeStamp: DateTime.now().copyWith(minute: -14),
  ),
  MessageModel(
    senderId: '0',
    text: 'hello',
    timeStamp: DateTime.now().copyWith(minute: -15),
  ),
  MessageModel(
    senderId: '1',
    text: 'hello',
    timeStamp: DateTime.now().copyWith(minute: -5),
  ),
  MessageModel(
    senderId: '0',
    text: 'hello',
    timeStamp: DateTime.now().copyWith(minute: -9),
  ),
  MessageModel(
    senderId: '1',
    text: 'hello',
    timeStamp: DateTime.now().copyWith(minute: -7),
  ),
  MessageModel(
    senderId: '0',
    text: 'hello',
    timeStamp: DateTime.now().copyWith(hour: -8),
  ),
];

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(final BuildContext context) {
    messages.sort((final a, final b) => a.timeStamp.millisecondsSinceEpoch
        .compareTo(b.timeStamp.millisecondsSinceEpoch));

    final list = groupBy(messages, (final p0) => '${p0.timeStamp.day}');

    print(list);

    return Scaffold(
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
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: list.length,
              itemBuilder: (final c, final index) {
                final dayMessages = list.values.toList()[index];
                final date = dayMessages.first.timeStamp;
                return Column(
                  children: [
                    MessageDateWidget(
                      dateTime: date,
                    ),
                    ...dayMessages
                        .mapIndexed((final index, final e) => MessageWidget(
                              isSender: e.senderId == '0',
                              color: e.senderId == '0'
                                  ? AppColor.primeryColor
                                  : AppColor.appBarBackground,
                              text: e.timeStamp.toString(),
                              tail: (index != dayMessages.length - 1) &&
                                  dayMessages.iterator.moveNext() &&
                                  dayMessages[index + 1].senderId == e.senderId,
                              onDeleted: () {},
                            ))
                  ],
                );
              },
            ),
          ),
          DecoratedBox(
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
              child: Row(
                children: [
                  SvgPicture.asset(
                    'assets/images/stopwatch.svg',
                    height: 25,
                    width: 25,
                  ),
                  Utils.smallGap,
                  Expanded(
                      child: TextFormField(
                    decoration: InputDecoration(
                        suffixIcon: Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: SizedBox(
                        height: 25,
                        width: 25,
                        child: DecoratedBox(
                            decoration: BoxDecoration(
                                color: AppColor.primeryColor,
                                shape: BoxShape.circle),
                            child: Center(
                                child: SvgPicture.asset(
                                    'assets/images/arrow_up.svg'))),
                      ),
                    )),
                  ))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
