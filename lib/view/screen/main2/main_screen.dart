import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobs/controller/mainscreen/main_scrren_controller.dart';
import 'package:jobs/core/constants/color.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:jobs/view/screen/chat/chats.dart';
import 'package:jobs/view/screen/main2/home.dart';

class MainScreen2 extends GetView<MainScreenController> {
  const MainScreen2({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(MainScreenController());

    return Scaffold(
        extendBody: true,
        bottomNavigationBar: Obx(
          () => CurvedNavigationBar(
            height: 60,
            key: controller.bottomNavigationBar,
            color: AppColor.praimaryColor,
            index: controller.page.value,
            animationDuration: const Duration(milliseconds: 300),
            backgroundColor: Colors.transparent,
            onTap: (index) {
              controller.onItemClick(index);
              controller.pageController.jumpToPage(index);
            },
            items: [
              Icon(Icons.home_rounded,
                  size: 30,
                  color: controller.currentindex.value == 0
                      ? AppColor.white
                      : AppColor.grey),
              Icon(Icons.chat_rounded,
                  size: 30,
                  color: controller.currentindex.value == 1
                      ? AppColor.white
                      : AppColor.grey),
              Icon(Icons.person_rounded,
                  size: 30,
                  color: controller.currentindex.value == 2
                      ? AppColor.white
                      : AppColor.grey),
              Icon(Icons.bookmark_border,
                  size: 30,
                  color: controller.currentindex.value == 3
                      ? AppColor.white
                      : AppColor.grey),
            ],
          ),
        ),
        // backgroundColor: AppColor.praimaryColor,
        body: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: controller.pageController,
          children: [
            HomeScreen(),
           // Chats(),
           // ChatScreen2(),
            //ChatScreen2(),
          ],
        ));
  }
}

// class ChatScreen1 extends StatelessWidget {
//   const ChatScreen1({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const Center(
//       child: Text("ch777777tttt"),
//     );
//   }
// }

// class ChatScreen2 extends StatelessWidget {
//   const ChatScreen2({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const Center(
//       child: Text("chattttttttttttt"),
//     );
//   }
// }
