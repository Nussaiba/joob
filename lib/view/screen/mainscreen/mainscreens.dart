import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobs/controller/mainscreens/mainscreen.dart';
import 'package:jobs/view/widget/mainscreen/mainscreen/bottomappbar.dart';
import 'package:jobs/view/widget/mainscreen/mainscreen/customclipperbottombar.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(NavigationController());

    return Scaffold(
      body: GetBuilder<NavigationController>(
          builder: (controller) => IndexedStack(
                index: controller.tabIndex.value,
                children: const [
                  HomeScreen(),
                  SettingsScreen(),
                  HomeScreen1(),
                  SettingsScreen1(),
                ],
              )),
      bottomNavigationBar:  ClipPath(
            clipper: MyCustomClipper(),
            child:const CustomBottomAppBar(),
          )
    );
  }

}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Home Screen'));
  }
}

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Settings Screen'));
  }
}

class HomeScreen1 extends StatelessWidget {
  const HomeScreen1({super.key});
  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Home Screen11'));
  }
}

class SettingsScreen1 extends StatelessWidget {
  const SettingsScreen1({super.key});
  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Settings Screen1'));
  }
}
