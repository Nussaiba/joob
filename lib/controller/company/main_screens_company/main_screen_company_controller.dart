import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobs/core/class/statusrequest.dart';
import 'package:jobs/core/services/services.dart';
import 'package:jobs/data/datasource/remote/home/home.dart';
import 'package:jobs/data/model/opportunity_model.dart';

abstract class MainScreenCompanyController extends GetxController {
  initialData();
  
}

class MainScreenCompanyControllerImp extends MainScreenCompanyController {
  late PageController pageController;
  GlobalKey bottomNavigationBar = GlobalKey();
  MyServices myServices = Get.find();
  HomeData homeData = HomeData(Get.find());

  List data = [];
  List<OpportuntiyModel> opportuntiesList = [];
  late StatusRequest statusRequest = StatusRequest.none;
  var currentindex = 0.obs;
  var page = RxInt(0);

  @override
  void onInit() {
    super.onInit();
    // getData();

    pageController = PageController();
  }

  void onItemClick(index) {
    if (index != page.value) {
      page(index);
      currentindex.value = index;
      //update();
    }
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }

  @override
  initialData() {}

 
}
