import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobs/controller/general/side_bar_controller.dart';
import 'package:jobs/core/constants/color.dart';
import 'package:jobs/view/screen/settings_pages/deletAccount.dart';
import 'package:sidebarx/sidebarx.dart';

class CustomSidebarX extends StatelessWidget {
  final SidebarXController controller;
  CustomSidebarX({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    final sidebarcontroller = Get.put(SideBarController());

    return SidebarX(
      controller: controller,
      extendedTheme: SidebarXTheme(
        decoration: BoxDecoration(
          color: AppColor.white,
          borderRadius: BorderRadius.circular(10),
        ),
        textStyle: const TextStyle(color: Colors.black),
        iconTheme: const IconThemeData(color: Colors.black),
        itemTextPadding: const EdgeInsets.only(right: 15),
        width: 150,
      ),
      theme: SidebarXTheme(
        decoration: BoxDecoration(
          color: AppColor.pink,
          borderRadius: BorderRadius.circular(10),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
        width: 55,
      ),
      items: [
        const SidebarXItem(icon: Icons.home, label: 'Home'),

        // const SidebarXItem(icon: Icons.favorite, label: 'saved'),
        const SidebarXItem(
          icon: Icons.person_add,
          label: 'My Profile',
        ),
        SidebarXItem(
          icon: Icons.wb_sunny_outlined,
          label: ' Dark Mode',
          onTap: () {
            sidebarcontroller.toggleDarkMode();
            sidebarcontroller.setDarkMode();
          },
        ),
        SidebarXItem(
            icon: Icons.g_translate_outlined,
            label: 'Language',
            onTap: () {
              sidebarcontroller.setLang();
            }),

             SidebarXItem(
            icon: Icons.settings,
            label: 'Settings',
            onTap: () {
              
            }),
        SidebarXItem(
          icon: Icons.logout,
          label: 'Logout',
          onTap: () {
sidebarcontroller.logout();
          },
        ),
        SidebarXItem(
            icon: Icons.delete,
            label: 'My account',
            onTap: () {
              Get.off(DeleteAccountPage());
            }),
      ],
    );
  }
}
