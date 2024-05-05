import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobs/core/constants/color.dart';
import 'package:jobs/view/widget/chat/appbar_chat_room.dart';
import 'package:jobs/view/widget/chat/bubble.dart';
import 'package:jobs/view/widget/chat/textfield_chat.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          AppBarChatRoom (),
          Expanded(
              child: Container(
            child: ListView(
              padding: EdgeInsets.zero,
              children: const [
                Bubble(
                  isSender: true,
                  text: "sssssss",
                ),
                Bubble(
                  isSender: false,
                  text: "sss sssssss",
                ),
                Bubble(
                  isSender: true,
                  text: "ssssss",
                ),
                Bubble(
                  isSender: false,
                  text: "ssss ssssss sssssss",
                ),
                Bubble(
                  isSender: true,
                  text: "sssss  aaaaaa aaaaaaaaaaa ss",
                ),
                Bubble(
                  isSender: true,
                  text: "sssssss",
                ),
              ],
            ),
          )),
       const TextFieldChatSend (),
        ],
      ),
    );
  }
}
