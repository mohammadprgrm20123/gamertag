import 'package:flutter/material.dart';
import 'package:swipeable_tile/swipeable_tile.dart';
import '../../../infrastructure/theme/app_color.dart';
import '../../../infrastructure/utils/utils.dart';
import '../../../share/widget/app_text.dart';
import 'mesaage_widget_custom_paint.dart';

class MessageWidget extends StatelessWidget {
  final bool isSender;
  final String text;
  final bool tail;
  final Color? color;
  final void Function() onDeleted;

  final TextStyle textStyle;
  final BoxConstraints? constraints;

  const MessageWidget({
    required this.onDeleted, required this.text, super.key,
    this.isSender = true,
    this.constraints,
    this.color,
    this.tail = true,
    this.textStyle = const TextStyle(
        color: Colors.white, fontSize: 14, fontWeight: FontWeight.w400),
  });

  @override
  Widget build(final BuildContext context) {
    bool stateTick = false;
    Icon? stateIcon;
    return SwipeableTile(
      key: UniqueKey(),
      isElevated: false,
      swipeThreshold: .2,
      confirmSwipe: (final direction) async {
        if (direction == SwipeDirection.startToEnd) {
          return true;
        }
        return false;
      },
      color: Colors.white,
      borderRadius: 0,
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
                  style: TextStyle(
                      color: Colors.red,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
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
          alignment: isSender ? Alignment.topRight : Alignment.topLeft,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
            child: CustomPaint(
              painter: MessageWidgetCustomPaint(
                  color: color ?? AppColor.appBarBackground,
                  alignment: isSender ? Alignment.topRight : Alignment.topLeft,
                  tail: tail),
              child: Container(
                constraints: constraints ??
                    BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width * .7,
                    ),
                margin: isSender
                    ? const EdgeInsets.fromLTRB(7, 7, 17, 7)
                    : const EdgeInsets.fromLTRB(17, 7, 7, 7),
                child: Stack(
                  children: <Widget>[
                    Padding(
                      padding: stateTick
                          ? const EdgeInsets.only(left: 4, right: 20)
                          : const EdgeInsets.only(left: 4, right: 4),
                      child: Text(
                        text,
                        style: !isSender
                            ? textStyle.copyWith(color: Colors.black)
                            : textStyle,
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
    );
  }
}
