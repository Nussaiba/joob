import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobs/controller/mainscreens/mainscreen.dart';
import 'package:jobs/core/constants/color.dart';
import 'package:jobs/view/widget/mainscreen/mainscreen_widgets/bottom_bar_item.dart';

class CustomBottomAppBar extends StatelessWidget {
  const CustomBottomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    NavigationController controller = Get.put(NavigationController());

    return
     Obx(()=> BottomAppBar(
              height: 60,
              color: AppColor.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: List.generate(4, (index) {
                  return InkWell(
                    onTap: () => controller.changeTabIndex(index),
                    child: CustamTapBottomItem(
                      index: index,
                      icon: index == 0
                          ? Icons.home
                          : index == 1
                              ? Icons.favorite
                              : index == 2
                                  ? Icons.settings
                                  : Icons.person,
                      isSelected: controller.tabIndex.value == index,
                    ),
                  );
                }),
              ),)
            );
  }
}