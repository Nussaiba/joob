import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobs/controller/mainscreens/mainscreen.dart';
import 'package:jobs/view/widget/mainscreen/mainscreen_widgets/bottom_appbar.dart';
import 'package:jobs/view/widget/mainscreen/mainscreen_widgets/customclipper_bottom_bar.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    NavigationController controller = Get.put(NavigationController());

    return Scaffold(
        body: Obx(() => IndexedStack(
              index: controller.tabIndex.value,
              children: [
                HomeScreen(),
                Favorite(),
                SettingsScreen(),
                ProfileScreen(),
              ],
            )),
        bottomNavigationBar: ClipPath(
          clipper: MyCustomClipper(),
          child: const CustomBottomAppBar(),
        ));
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Home Page1'));
  }
}

class Favorite extends StatelessWidget {
  const Favorite({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Fav Page1'));
  }
}

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Settings Page'));
  }
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Profile Page'));
  }
}
