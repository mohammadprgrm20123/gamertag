import 'package:flutter/material.dart';
import '../../../infrastructure/theme/app_color.dart';

class MessageWidget extends StatelessWidget {
  final bool isSender;
  final String text;
  final bool tail;
  final Color? color;

  final TextStyle textStyle;
  final BoxConstraints? constraints;

  const MessageWidget({
    super.key,
    this.isSender = true,
    this.constraints,
    required this.text,
    this.color,
    this.tail = true,
    this.textStyle = const TextStyle(
      color: Colors.white,
      fontSize: 14,
      fontWeight: FontWeight.w400
    ),
  });

  ///chat bubble builder method
  @override
  Widget build(final BuildContext context) {
    bool stateTick = false;
    Icon? stateIcon;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Align(
        alignment: isSender ? Alignment.topRight : Alignment.topLeft,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
          child: CustomPaint(
            painter: SpecialChatBubbleThree(color: color ?? AppColor.appBarBackground, alignment: isSender ? Alignment.topRight : Alignment.topLeft, tail: tail),
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
                    padding: stateTick ? const EdgeInsets.only(left: 4, right: 20) : const EdgeInsets.only(left: 4, right: 4),
                    child: Text(
                      text,
                      style: !isSender ? textStyle.copyWith(color: Colors.black) : textStyle,
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
}

///custom painter use to create the shape of the chat bubble
///
/// [color],[alignment] and [tail] can be changed

class SpecialChatBubbleThree extends CustomPainter {
  final Color color;
  final Alignment alignment;
  final bool tail;

  SpecialChatBubbleThree({
    required this.color,
    required this.alignment,
    required this.tail,
  });

  final double _radius = 12.0;

  @override
  void paint(final Canvas canvas, final Size size) {
    final h = size.height;
    final w = size.width;
    if (alignment == Alignment.topRight) {
      if (tail) {
        final path = Path();

        /// starting point
        path.moveTo(_radius * 2, 0);

        /// top-left corner
        path.quadraticBezierTo(0, 0, 0, _radius * 1.5);

        /// left line
        path.lineTo(0, h - _radius * 1.5);

        /// bottom-left corner
        path.quadraticBezierTo(0, h, _radius * 2, h);

        /// bottom line
        path.lineTo(w - _radius * 3, h);

        /// bottom-right bubble curve
        path.quadraticBezierTo(w - _radius * 1, h, w - _radius * 1.5, h - _radius * 0.8);

        /// bottom-right tail curve 1
        path.quadraticBezierTo(w - 4 - _radius * 1, h, w - 5, h);

        /// bottom-right tail curve 2
        path.quadraticBezierTo(w - _radius * .7, h, w - _radius, h - _radius * 1.2);

        /// right line
        path.lineTo(w - _radius, _radius * 1.5);

        /// top-right curve
        path.quadraticBezierTo(w - _radius, 0, w - _radius * 3, 0);

        canvas.clipPath(path);
        canvas.drawRRect(
            RRect.fromLTRBR(0, 0, w, h, Radius.zero),
            Paint()
              ..color = color
              ..style = PaintingStyle.fill);
      } else {
        final path = Path();

        /// starting point
        path.moveTo(_radius * 2, 0);

        /// top-left corner
        path.quadraticBezierTo(0, 0, 0, _radius * 1.5);

        /// left line
        path.lineTo(0, h - _radius * 1.5);

        /// bottom-left corner
        path.quadraticBezierTo(0, h, _radius * 2, h);

        /// bottom line
        path.lineTo(w - _radius * 3, h);

        /// bottom-right curve
        path.quadraticBezierTo(w - _radius, h, w - _radius, h - _radius * 1.5);

        /// right line
        path.lineTo(w - _radius, _radius * 1.5);

        /// top-right curve
        path.quadraticBezierTo(w - _radius, 0, w - _radius * 3, 0);

        canvas.clipPath(path);
        canvas.drawRRect(
            RRect.fromLTRBR(0, 0, w, h, Radius.zero),
            Paint()
              ..color = color
              ..style = PaintingStyle.fill);
      }
    } else {
      if (tail) {
        final path = Path();

        /// starting point
        path.moveTo(_radius * 3, 0);

        /// top-left corner
        path.quadraticBezierTo(_radius, 0, _radius, _radius * 1.5);

        /// left line
        path.lineTo(_radius, h - _radius * 1.5);
        // bottom-right tail curve 1
        path.quadraticBezierTo(_radius * .7, h, 4, h);

        /// bottom-right tail curve 2
        path.quadraticBezierTo(_radius * 1, h, _radius * 1.3, h - 1 - _radius * 0.4);

        /// bottom-left bubble curve
        path.quadraticBezierTo(_radius * 1.5, h, _radius * 3, h);

        /// bottom line
        path.lineTo(w - _radius * 2, h);

        /// bottom-right curve
        path.quadraticBezierTo(w, h, w, h - _radius * 1.5);

        /// right line
        path.lineTo(w, _radius * 1.5);

        /// top-right curve
        path.quadraticBezierTo(w, 0, w - _radius * 2, 0);
        canvas.clipPath(path);
        canvas.drawRRect(
            RRect.fromLTRBR(0, 0, w, h, Radius.circular(1)),
            Paint()
              ..color = color
              ..style = PaintingStyle.fill);
      } else {
        final path = Path();

        /// starting point
        path.moveTo(_radius * 3, 0);

        /// top-left corner
        path.quadraticBezierTo(_radius, 0, _radius, _radius * 1.5);

        /// left line
        path.lineTo(_radius, h - _radius * 1.5);

        /// bottom-left curve
        path.quadraticBezierTo(_radius, h, _radius * 3, h);

        /// bottom line
        path.lineTo(w - _radius * 2, h);

        /// bottom-right curve
        path.quadraticBezierTo(w, h, w, h - _radius * 1.5);

        /// right line
        path.lineTo(w, _radius * 1.5);

        /// top-right curve
        path.quadraticBezierTo(w, 0, w - _radius * 2, 0);
        canvas.clipPath(path);
        canvas.drawRRect(
            RRect.fromLTRBR(0, 0, w, h, Radius.zero),
            Paint()
              ..color = color
              ..style = PaintingStyle.fill);
      }
    }
  }

  @override
  bool shouldRepaint(final CustomPainter oldDelegate) => true;
}
