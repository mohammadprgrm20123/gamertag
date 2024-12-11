import 'dart:async';

import 'package:flutter/material.dart';
import 'package:swipeable_tile/swipeable_tile.dart';
import '../../../infrastructure/theme/app_color.dart';
import '../../../infrastructure/utils/utils.dart';
import '../../../share/widget/app_text.dart';
import 'mesaage_widget_custom_paint.dart';

class MessageWidget extends StatefulWidget {
  final bool isSender;
  final String text;
  final bool tail;
  final Color? color;
  final DateTime? expiretionTime;
  final bool deleteAble;
  final void Function() onDeleted;

  final TextStyle textStyle;
  final BoxConstraints? constraints;

  const MessageWidget({
    required this.deleteAble,
    this.expiretionTime,
    required this.onDeleted,
    required this.text,
    super.key,
    this.isSender = true,
    this.constraints,
    this.color,
    this.tail = true,
    this.textStyle = const TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w400),
  });

  @override
  State<MessageWidget> createState() => _MessageWidgetState();
}

class _MessageWidgetState extends State<MessageWidget> with TickerProviderStateMixin {
  late Timer timer;
  ValueNotifier<bool> hideMessage = ValueNotifier(false);
  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    if (widget.expiretionTime != null) {
      timer = Timer.periodic(const Duration(seconds: 1), (final tick) async {
        if (widget.expiretionTime!.difference(DateTime.now()).inSeconds <= 0) {
          await _controller.forward(from: 0).then((final _) async {
            widget.onDeleted();
          });
          timer.cancel();
        }
      });
    }
    super.initState();
  }


  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

  }

  @override
  void dispose() {
    _controller.dispose(); // Dispose the controller unconditionally
    super.dispose();
  }

  @override
  Widget build(final BuildContext context) =>
      widget.deleteAble
          ? SizeTransition(
        sizeFactor: Tween<double>(
          begin: 1,
          end: 0,
        ).animate(_controller),
        child: SwipeableTile(
          key: UniqueKey(),
          isElevated: false,
          confirmSwipe: (final direction) async {
            if (direction == SwipeDirection.startToEnd) {
              return true;
            }
            return false;
          },
          color: Colors.white,
          borderRadius: 16,
          direction: SwipeDirection.horizontal,
          backgroundBuilder: (final context, final direction, final progress) {
            if (direction == SwipeDirection.startToEnd) {
              return DecoratedBox(
                decoration: BoxDecoration(color: Colors.red.withOpacity(.2)),
                child: const Row(
                  children: [
                    Utils.mediumGap,
                    AppText(
                      'Delete',
                      style: TextStyle(color: Colors.red, fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              );
            }

            return const SizedBox();
          },
          onSwiped: (final direction) {},
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 2),
            child: Align(
              alignment: widget.isSender ? Alignment.topRight : Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                child: CustomPaint(
                  painter: MessageWidgetCustomPaint(
                    textLength: widget.text.length,
                      color: widget.color ?? AppColor.appBarBackground,
                      alignment: widget.isSender ? Alignment.topRight : Alignment.topLeft,
                      tail: widget.tail),
                  child: Container(
                    constraints: widget.constraints ??
                        BoxConstraints(
                          maxWidth: MediaQuery
                              .of(context)
                              .size
                              .width * .7,
                        ),
                    margin: widget.isSender ? const EdgeInsets.fromLTRB(7, 7, 17, 7) : const EdgeInsets.fromLTRB(17, 7, 7, 7),
                    child: Stack(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(left: 4, right: 4),
                          child: Text(
                            widget.text,
                            style: !widget.isSender ? widget.textStyle.copyWith(color: Colors.black) : widget.textStyle,
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      )
          : Padding(
        padding: const EdgeInsets.symmetric(vertical: 2),
        child: Align(
          alignment: widget.isSender ? Alignment.topRight : Alignment.topLeft,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
            child: CustomPaint(
              painter: MessageWidgetCustomPaint(
                textLength: widget.text.length,
                  color: widget.color ?? AppColor.appBarBackground, alignment: widget.isSender ? Alignment.topRight : Alignment.topLeft, tail: widget.tail),
              child: Container(
                constraints: widget.constraints ??
                    BoxConstraints(
                      maxWidth: MediaQuery
                          .of(context)
                          .size
                          .width * .7,
                    ),
                margin: widget.isSender ? const EdgeInsets.fromLTRB(7, 7, 17, 7) : const EdgeInsets.fromLTRB(17, 7, 7, 7),
                child: Stack(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 4, right: 4),
                      child: Text(
                        widget.text,
                        style: !widget.isSender ? widget.textStyle.copyWith(color: Colors.black) : widget.textStyle,
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
}