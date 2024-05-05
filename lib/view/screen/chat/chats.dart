import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobs/core/constants/imageassest.dart';
import 'package:jobs/view/screen/chat/chatcreen.dart';

import '../../widget/chat/app_bar_chats_page.dart';

class Chats extends StatelessWidget {
  const Chats({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body: Column(
        children: [
           AppBarChats(),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: 20,
              itemBuilder: (context, index) => Container(
                height: Get.width / 4.5,
                decoration: const BoxDecoration(
                    // color: Colors.amber,
                    border: Border(
                        bottom: BorderSide(
                  color: Color.fromARGB(255, 236, 232, 232),
                ))),
                child: ListTile(
                  onTap: () {
                    Get.to(() => ChatScreen());
                  },
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(80),
                    child: Image.asset(
                      AppImageAsset.onBoardingImgFour
                                    ,  fit: BoxFit.fill
                    ),
                  ),
                  title: Text(
                    "name person  ${index + 1}",
                    style: 
                     Theme.of(context).textTheme.headline1,
                    
                  ),
                  subtitle: Text(
                    "name person  ${index + 1}",
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  trailing: Chip(
                    clipBehavior: Clip.none,
                    label: Text("$index"),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

