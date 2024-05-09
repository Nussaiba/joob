import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobs/controller/auth/google_sign_in_controller.dart';
import 'package:jobs/controller/chats/chat_room_controller.dart';
import 'package:jobs/controller/chats/chats_controller.dart';
import 'package:jobs/core/constants/color.dart';
import 'package:jobs/view/widget/chat/appbar_chat_room.dart';
import 'package:jobs/view/widget/chat/bubble.dart';
import 'package:jobs/view/widget/chat/textfield_chat.dart';

class ChatScreen extends StatelessWidget {
  final auth = Get.put(AuthWithGoogle());
  // final String chatid = (Get.arguments as Map<String, dynamic>)["chat_id"];

  @override
  Widget build(BuildContext context) {
    ChatRoomController controller = Get.put(ChatRoomController());

    return Scaffold(
      body: Column(
        children: [
          AppBarChatRoom(),
          Expanded(
              child: Container(
            child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
              stream: controller.streamChats(controller.chatid),
              builder: (context, snapshot) {
                print("${controller.chatid}mmmmmmmmmmmmmmmmm");
                print(snapshot.data!.docs);
                var alldata = snapshot.data!.docs;
                Timer(
                  Duration.zero,
                  () => controller.scrollController.jumpTo(
                      controller.scrollController.position.maxScrollExtent),
                );
                if (snapshot.connectionState == ConnectionState.active) {
                  return ListView.builder(
                    controller: controller.scrollController,
                    padding: EdgeInsets.zero,
                    itemCount: alldata.length,
                    itemBuilder: (context, index) => Bubble(
                      isSender: alldata[index][
                          "pengirim" == auth.userModel.value.email!
                              ? true
                              : false],
                      text: "${alldata[index]["msg"]}",
                      time: "${alldata[index]["time"]}",
                    ),
                  );
                }
                return Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          )),
          TextFieldChatSend(
            c:controller.chatC,
            onTap: () {
              print("${auth.userModel.value.email!}");
              print("${Get.arguments as Map<String, dynamic>}");
              print("${controller.chatC.text}");
              controller.newChat(auth.userModel.value.email!,
                  Get.arguments as Map<String, dynamic>, controller.chatC.text);
            },
          ),
        ],
      ),
    );
  }
}
