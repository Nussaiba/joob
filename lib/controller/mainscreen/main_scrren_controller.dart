import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainScreenController extends GetxController {
  late PageController pageController;
  GlobalKey bottomNavigationBar = GlobalKey();

  var currentindex = 0.obs;
  var page = RxInt(0);
  @override
  void onInit() {
    super.onInit();
    pageController = PageController();
  }

  void onItemClick(index) {
    if (index != page.value) {
      page(index);
      currentindex.value = index;
      update();
    }
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}
