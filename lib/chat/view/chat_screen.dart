import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../infrastructure/theme/app_color.dart';
import 'widget/image_profile.dart';
import 'widget/message_widget.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

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
          title: ProfileImage(
            image: 'assets/images/image1.png',
            name: 'Kristina',
          ),
        ),
        body: ListView(
          children: [
            MessageWidget(
              text: 'hellor',
              color: Colors.blue,
              isSender: false,
            ),
            MessageWidget(
              color: Colors.blue,
              text: 'hellor',
              isSender: true,
              tail: false,
            ),
            MessageWidget(
              text: 'hellor',
              color: Colors.blue,
              isSender: false,
            ),
            MessageWidget(
              text: 'hellor',
              color: Colors.blue,
              isSender: true,
            ),
            MessageWidget(
              text: 'hellorhellorhellorhellorhellorhellorhellor',
              color: Colors.blue,
              isSender: true,
            ),
            MessageWidget(
              text: 'hellor',
              color: Colors.blue,
              isSender: true,
            ),
            MessageWidget(
              text: 'hellor',
              color: Colors.blue,
              isSender: false,
            ),
            MessageWidget(
              text: 'hellor',
              color: Colors.blue,
              isSender: false,
              tail: false,
            ),
          ],
        ),
      );
}
