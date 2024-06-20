import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobs/controller/company/main_screens_company/main_screen_company_controller.dart';
import 'package:jobs/core/constants/color.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:jobs/view/screen/company&seeker/save_page.dart';
import 'package:jobs/view/screen/bubbless.dart';
import 'package:jobs/view/screen/company/main_screens/home_company.dart';
import 'package:jobs/view/screen/floating.dart';
class MainScreensCompany extends GetView<MainScreenCompanyControllerImp> {
  const MainScreensCompany({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(MainScreenCompanyControllerImp());
    return Scaffold(
        //  appBar: AppBar(title: const Text('Company')),
        extendBody: true,
        bottomNavigationBar: Obx(
          () => CurvedNavigationBar(
            height: 58,
            key: controller.bottomNavigationBar,
            color: Color.fromARGB(26, 65, 63, 63),
            //color: AppColor.pink.withOpacity(0.5),
            //Colors.grey.withOpacity(0.3),
            //color:  AppColor.praimaryColor,
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
                      ? AppColor.praimaryColor
                      : AppColor.grey),
              Icon(Icons.chat_rounded,
                  size: 30,
                  color: controller.currentindex.value == 1
                      ? AppColor.praimaryColor
                      : AppColor.grey),
              Icon(Icons.person_rounded,
                  size: 30,
                  color: controller.currentindex.value == 2
                      ? AppColor.praimaryColor
                      : AppColor.grey),
              Icon(Icons.bookmark_border,
                  size: 30,
                  color: controller.currentindex.value == 3
                      ? AppColor.praimaryColor
                      : AppColor.grey),
            ],
          ),
        ),
        body: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: controller.pageController,
          children: [
            CompanyHome(),
            MyHomePagea(),
            MyAppp(),
            JobSavedScreen(),
          ],
        ));
  }
}

