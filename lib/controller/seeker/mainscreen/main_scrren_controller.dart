import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobs/core/class/statusrequest.dart';
import 'package:jobs/core/constants/routes.dart';
import 'package:jobs/core/functions/handlingdata.dart';
import 'package:jobs/core/services/services.dart';
import 'package:jobs/data/datasource/remote/home/home.dart';
import 'package:jobs/data/model/opportunity_model.dart';

abstract class MainScreenController extends GetxController {
  initialData();
  getData();
  goToPageOpportunityDetails(OpportuntiyModel opportuntiyModel);
}

class MainScreenControllerImp extends MainScreenController {
  late PageController pageController;
  GlobalKey bottomNavigationBar = GlobalKey();
  MyServices myServices = Get.find();
  HomeData homeData = HomeData(Get.find());

  List data = [];
  late StatusRequest statusRequest = StatusRequest.none;
  var currentindex = 0.obs;
  var page = RxInt(0);
  @override
  void onInit() {
    super.onInit();
    getData();

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

  @override
  getData() async {
    statusRequest = StatusRequest.loading;
    var response = await homeData.getAllOppData();
    print("================$response  Controller");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  goToPageOpportunityDetails(  opportuntiyModel) {
    Get.toNamed(AppRoute.opportunityPage, arguments: {

      "opportuntiyModel"  : opportuntiyModel
    });
  }
}
