import 'package:flutter/material.dart';
import 'package:jobs/core/constants/color.dart';

class Bubble extends StatelessWidget {
  const Bubble(
      {super.key,
      required this.isSender,
      required this.text,
      required this.time});
  final bool isSender;
  final String text;
  final String time;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      alignment: isSender ? Alignment.centerRight : Alignment.centerLeft,
      // color: isSender ? Colors.grey : Colors.white,
      child: Column(
        crossAxisAlignment:
            isSender ? CrossAxisAlignment.start : CrossAxisAlignment.end,
        children: [
          Container(
              margin: EdgeInsets.symmetric(vertical: 2),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25),
                    bottomLeft: isSender ? Radius.circular(25) : Radius.zero,
                    bottomRight: isSender ? Radius.zero : Radius.circular(25)),
                color: isSender ? AppColor.pink : AppColor.grey,
              ),
              padding: EdgeInsets.all(6),
              child: Column(
                crossAxisAlignment: isSender
                    ? CrossAxisAlignment.start
                    : CrossAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(2),
                    child: Text(
                      text,
                      style: const TextStyle(color: Colors.white, height: 1.5),
                    ),
                  ),
                  Text(
                    time,
                    style: TextStyle(
                      fontSize: 10,
                      color: Colors.white,
                    ),
                  ),
                 // textAlign: isSender ? TextAlign.end : TextAlign.start, ),
                ],
              )),
        ],
      ),
    );
  }
}