import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobs/controller/mainscreen/main_scrren_controller.dart';
import 'package:jobs/core/constants/color.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:jobs/view/screen/bubbless.dart';
import 'package:jobs/view/screen/auth/signup.dart';
import 'package:jobs/view/screen/chat/chats.dart';
import 'package:jobs/view/screen/floating.dart';
import 'package:jobs/view/screen/list.dart';
import 'package:jobs/view/screen/zz.dart';

class MainScreens extends GetView<MainScreenController> {
  const MainScreens({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(MainScreenController());

    return Scaffold(
        extendBody: true,
        bottomNavigationBar: Obx(
          () => CurvedNavigationBar(
            height: 58,
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
              Icon(Icons.chat_rounded, size: 30,  color: controller.currentindex.value == 1
                      ? AppColor.white
                      : AppColor.grey),
              Icon(Icons.person_rounded, size: 30, color: controller.currentindex.value == 2
                      ? AppColor.white
                      : AppColor.grey),
              Icon(Icons.bookmark_border, size: 30,  color: controller.currentindex.value == 3
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
            MyHomePagea(),

            //  Homeq(),
            SignUp(),
        //  HomeScreenA(),
             MyAppp (),
            ImageDropdown()
          ],
        ));
  }
}

class Homeq extends StatelessWidget {
  const Homeq({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: Text("chat"),
      ),
    );
  }
}

class Homeq2 extends StatelessWidget {
  const Homeq2({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("chatttttttttttttb"),
    );
  }
}
