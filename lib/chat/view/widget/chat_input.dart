import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

import '../../../infrastructure/theme/app_color.dart';
import '../../../infrastructure/utils/utils.dart';
import '../../provider/message_sender_button_provider.dart';

class ChatInput extends ConsumerStatefulWidget {
  final void Function(String value) onSendMessage;
  final void Function() onClickInput;

  const ChatInput({
    required this.onClickInput,
    required this.onSendMessage,
    super.key,
  });

  @override
  ConsumerState<ChatInput> createState() => _ChatInputState();
}

class _ChatInputState extends ConsumerState<ChatInput> {
  TextEditingController messageTextController = TextEditingController();

  @override
  void dispose() {
    messageTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(final BuildContext context) => DecoratedBox(
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
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
                onTap: widget.onClickInput,
                controller: messageTextController,
                onChanged: (final value) {
                  if (value.isNotEmpty) {
                    ref.read(messageSenderButtonProvider.notifier).state = true;
                  } else {
                    ref.read(messageSenderButtonProvider.notifier).state =
                        false;
                  }
                },
                decoration: InputDecoration(
                    suffixIcon: Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: SizedBox(
                    height: 25,
                    width: 25,
                    child: Consumer(
                      builder: (final context, final ref, final child) =>
                          AnimatedScale(
                        duration: const Duration(milliseconds: 100),
                        scale: ref.watch(messageSenderButtonProvider) ? 1 : 0,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                              color: AppColor.primeryColor,
                              shape: BoxShape.circle),
                          child: Center(
                              child: GestureDetector(
                            onTap: () {
                              widget.onSendMessage
                                  .call(messageTextController.text);
                            },
                            child:
                                SvgPicture.asset('assets/images/arrow_up.svg'),
                          )),
                        ),
                      ),
                    ),
                  ),
                )),
              ))
            ],
          ),
        ),
      );
}
