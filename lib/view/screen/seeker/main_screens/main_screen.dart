import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobs/controller/seeker/mainscreen/main_scrren_controller.dart';
import 'package:jobs/core/constants/color.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:jobs/view/screen/company&seeker/save_page.dart';
import 'package:jobs/view/screen/floating.dart';
import 'package:jobs/view/screen/company&seeker/notifications.dart';
import 'package:jobs/view/screen/seeker/main_screens/seeker_home.dart';
import 'package:jobs/view/screen/seeker/main_screens/proposed_page.dart';

class MainScreens extends GetView<MainScreenControllerImp> {
  const MainScreens({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(MainScreenControllerImp());

    return Scaffold(
        extendBody: true,
        bottomNavigationBar: Obx(
          () => CurvedNavigationBar(
            height: 60,
            key: controller.bottomNavigationBar,
            color: AppColor.PraimaryColor(),
            index: controller.page.value,
            animationDuration: const Duration(milliseconds: 300),
            backgroundColor: Colors.transparent,
            onTap: (index) {
              controller.onItemClick(index);
            },
            items: [
              Icon(Icons.home_rounded,
                  size: 25,
                  color: controller.currentindex.value == 0
                      ? AppColor.white
                      : AppColor.grey),
              Icon(Icons.add_business,
                  size: 25,
                  color: controller.currentindex.value == 1
                      ? AppColor.white
                      : AppColor.grey),
              Icon(Icons.notifications,
                  size: 25,
                  color: controller.currentindex.value == 2
                      ? AppColor.white
                      : AppColor.grey),
              Icon(Icons.bookmark_border,
                  size: 25,
                  color: controller.currentindex.value == 3
                      ? AppColor.white
                      : AppColor.grey),
              Icon(Icons.chat_rounded,
                  size: 25,
                  color: controller.currentindex.value == 4
                      ? AppColor.white
                      : AppColor.grey),
            ],
          ),
        ),
        body: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: controller.pageController,
          children: [
            SeekerHome(),
            ProposedPage(),
            NotificationPage(),
            JobSavedScreen(),
            MyHomePagea(),
          ],
        ));
  }
}
