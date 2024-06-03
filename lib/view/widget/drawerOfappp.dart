import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sidebarx/sidebarx.dart';
import '../../controller/settings/logout_controller.dart';
import '../screen/deletAccount (2).dart';


class DrawerOfApp extends StatelessWidget {
  final SidebarXController sidebarController =
      SidebarXController(selectedIndex: 0);
  final DarkModeController darkModeController = Get.put(DarkModeController());
  DrawerOfApp({super.key});
  @override
  Widget build(BuildContext context) {
 final LogoutController controller = Get.find<LogoutControllerImp>();
    return Directionality(
        textDirection: TextDirection.ltr,
      
        child: Container(
          width: 80,
          child: Drawer(
            backgroundColor: Colors.white,
            child: Align(
              // heightFactor: 20,
              alignment: Alignment.bottomLeft,
              child: Container(
                width: 80,
                height: 600,
                child: SidebarX(
                  controller: sidebarController,
                  items: [
                    SidebarXItem(
                        icon: Icons.person_add,
                        label: '  My Profile',
                        onTap: () {
                         // Get.off(ProfilePage(followData: Get.find<FollowData>(), profileUserId: Get.find<FollowControllerImp>().userId!));
                        }),
                    SidebarXItem(
                        icon: Icons.wb_sunny_outlined,
                        label: ' Dark Mode',
                        onTap: () {
                          darkModeController.toggleDarkMode();
                         Get.changeThemeMode(darkModeController.isDarkMode
                              ? ThemeMode.dark
                              : ThemeMode.light);
                        }),
                    SidebarXItem(
                        icon: Icons.g_translate_outlined, label: 'Language'),
                    SidebarXItem(
                      icon: Icons.logout,
                      label: 'Logout',
                      onTap: () {
                        controller.logout();
                      },
                    ),
                    SidebarXItem(
                        icon: Icons.delete,
                        label: '  My account',
                        onTap: () {
                          Get.off(DeleteAccountPage());
                        }),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}

class DarkModeController extends GetxController {
  final GetStorage _storage = GetStorage();
  final _key = 'isDarkMode';

  bool get isDarkMode => _storage.read(_key) ?? false;

  void toggleDarkMode() {
    bool newIsDarkMode = !isDarkMode;
    _storage.write(_key, newIsDarkMode);
    update();
  }
}
