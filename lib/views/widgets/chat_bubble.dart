import 'package:bloom_app/utils/fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ChatBubble extends StatelessWidget {
  final bool isSender;
  final String text;
  final String bottomText;
  final bool tail;
  final Color color;
  final bool sent;
  final bool delivered;
  final bool seen;
  final TextStyle textStyle;
  final BoxConstraints? constraints;

  const ChatBubble({
    super.key,
    this.isSender = true,
    this.constraints,
    required this.text,
    this.color = Colors.white70,
    this.tail = true,
    this.sent = false,
    this.delivered = false,
    this.seen = false,
    this.textStyle = const TextStyle(
      color: Colors.black87,
      fontSize: 16,
    ),
    required this.bottomText,
  });

  ///chat bubble builder method
  @override
  Widget build(BuildContext context) {
    bool stateTick = false;
    // ignore: unused_local_variable
    Icon? stateIcon;
    if (sent) {
      stateTick = true;
      stateIcon = const Icon(
        Icons.done,
        size: 18,
        color: Color(0xFF97AD8E),
      );
    }
    if (delivered) {
      stateTick = true;
      stateIcon = const Icon(
        Icons.done_all,
        size: 18,
        color: Color(0xFF97AD8E),
      );
    }
    if (seen) {
      stateTick = true;
      stateIcon = const Icon(
        Icons.done_all,
        size: 18,
        color: Color(0xFF92DEDA),
      );
    }

    return Align(
      alignment: isSender ? Alignment.topRight : Alignment.topLeft,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
        child: Column(
          crossAxisAlignment:
              isSender ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: [
            CustomPaint(
              painter: ChatBubblePainter(
                  color: color,
                  alignment: isSender ? Alignment.topRight : Alignment.topLeft,
                  tail: tail),
              child: Container(
                constraints: constraints ??
                    BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width * .7,
                    ),
                margin: isSender
                    ? stateTick
                        ? const EdgeInsets.fromLTRB(7, 7, 14, 7)
                        : const EdgeInsets.fromLTRB(18, 7, 25, 7)
                    : const EdgeInsets.fromLTRB(20, 7, 18, 7),
                child: Padding(
                  padding: stateTick
                      ? const EdgeInsets.only(right: 20)
                      : const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                  child: Text(
                    text,
                    style: textStyle,
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
            ),
            Text(
              bottomText,
              style: Fonts.noto(
                context,
                const Color(0xFF666666),
                10,
                FontWeight.w500,
              ),
              textAlign: TextAlign.right,
            ).paddingOnly(
                right: isSender ? 10.w : 0, left: isSender ? 0 : 10.w),
          ],
        ),
      ),
    );
  }
}

///custom painter use to create the shape of the chat bubble
///
/// [color],[alignment] and [tail] can be changed

class ChatBubblePainter extends CustomPainter {
  final Color color;
  final Alignment alignment;
  final bool tail;

  ChatBubblePainter({
    required this.color,
    required this.alignment,
    required this.tail,
  });

  final double _radius = 15.0;
  final double _x = 10.0;
// latest
  @override
  void paint(Canvas canvas, Size size) {
    if (alignment == Alignment.topRight) {
      if (tail) {
        canvas.drawRRect(
            RRect.fromLTRBAndCorners(
              0,
              0,
              size.width - _x,
              size.height,
              bottomLeft: Radius.circular(_radius),
              bottomRight: Radius.circular(_radius),
              topLeft: Radius.circular(_radius),
            ),
            Paint()
              ..color = color
              ..style = PaintingStyle.fill);
        var path = Path();
        path.moveTo(size.width - _x, 0);
        path.lineTo(size.width - _x, 10);
        path.lineTo(size.width, 0);
        canvas.clipPath(path);
        canvas.drawRRect(
            RRect.fromLTRBAndCorners(
              size.width - _x,
              0.0,
              size.width,
              size.height,
              topRight: const Radius.circular(3),
            ),
            Paint()
              ..color = color
              ..style = PaintingStyle.fill);
      } else {
        canvas.drawRRect(
            RRect.fromLTRBAndCorners(
              0,
              0,
              size.width - _x,
              size.height,
              bottomLeft: Radius.circular(_radius),
              bottomRight: Radius.circular(_radius),
              topLeft: Radius.circular(_radius),
              topRight: Radius.circular(_radius),
            ),
            Paint()
              ..color = color
              ..style = PaintingStyle.fill);
      }
    } else {
      if (tail) {
        canvas.drawRRect(
            RRect.fromLTRBAndCorners(
              _x,
              0,
              size.width,
              size.height,
              bottomRight: Radius.circular(_radius),
              topRight: Radius.circular(_radius),
              bottomLeft: Radius.circular(_radius),
            ),
            Paint()
              ..color = color
              ..style = PaintingStyle.fill);
        var path = Path();
        path.moveTo(_x, 0);
        path.lineTo(_x, 10);
        path.lineTo(0, 0);
        canvas.clipPath(path);
        canvas.drawRRect(
            RRect.fromLTRBAndCorners(
              0,
              0.0,
              _x,
              size.height,
              topLeft: const Radius.circular(3),
            ),
            Paint()
              ..color = color
              ..style = PaintingStyle.fill);
      } else {
        canvas.drawRRect(
            RRect.fromLTRBAndCorners(
              _x,
              0,
              size.width,
              size.height,
              bottomRight: Radius.circular(_radius),
              topRight: Radius.circular(_radius),
              bottomLeft: Radius.circular(_radius),
              topLeft: Radius.circular(_radius),
            ),
            Paint()
              ..color = color
              ..style = PaintingStyle.fill);
      }
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
