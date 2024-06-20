import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:jobs/core/localization/changelocal.dart';
import 'package:sidebarx/sidebarx.dart';

class SideBarController extends GetxController {
  final RxBool isSidebarExtended = false.obs;
  final RxBool isShow = false.obs;

  SidebarXController sidebarXController = SidebarXController(
    selectedIndex: 0,
    extended: false,
  );

  LocalController langCon = Get.find();

  void toggleSidebar() {
    isSidebarExtended.value = !isSidebarExtended.value;
    sidebarXController.setExtended(isSidebarExtended.value);
    sidebarXController.toggleExtended();
  }

  void toggleShow() {
    isShow.value = !isShow.value;
    // isSidebarExtended.value = !isSidebarExtended.value;
    // sidebarXController.setExtended(isSidebarExtended.value);
    //sidebarXController.toggleExtended();
  }

  final GetStorage _storage = GetStorage();
  final _key = 'isDarkMode';

  bool get isDarkMode => _storage.read(_key) ?? false;

  void toggleDarkMode() {
    bool newIsDarkMode = !isDarkMode;
    _storage.write(_key, newIsDarkMode);
    update();
  }

  setDarkMode() {
    Get.changeThemeMode(isDarkMode ? ThemeMode.dark : ThemeMode.light);
  }

  setLang() {
    Get.dialog(AlertDialog(
      title: Text('100'.tr),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            title: Text('English'),
            onTap: () {
              langCon.changeLanguage("en");
            },
          ),
          ListTile(
            title: Text('عربي'),
            onTap: () {
              langCon.changeLanguage("ar");
            },
          ),
        ],
      ),
    ));
  }

  logout() {}
}
