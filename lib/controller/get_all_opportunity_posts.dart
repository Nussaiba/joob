import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:jobs/core/class/statusrequest.dart';
import 'package:jobs/core/constants/routes.dart';
import 'package:jobs/core/functions/handlingdata.dart';
import 'package:jobs/core/services/services.dart';
import 'package:jobs/data/datasource/remote/home/home.dart';
import 'package:jobs/data/model/post_model.dart';
import 'package:jobs/data/model/opportunity_model.dart';

abstract class GetPostsAndOpportunityController extends GetxController {
  getOpportunitesData();
  getPostsData();
  goToPageOpportunityDetails(OpportuntiyModel opportuntiyModel);
  scrollListener();
}

class GetPostsAndOpportunityControllerImp
    extends GetPostsAndOpportunityController {
  var isFabVisible = true.obs;
  late ScrollController scrollController;
  HomeData homeData = HomeData(Get.find());
  List dataopportuntiy = [];
  List<OpportuntiyModel> opportuntiesList = [];
  List dataposts = [];
  List<PostModel> postsList = [];
  late StatusRequest statusRequest = StatusRequest.none;
  MyServices myServices = Get.find();
  var has = true.obs;
  var isExpanded = false.obs;
  late String idUserPostOwner;
 

  void editPost() {}
  void deletePost() {}
  void reportPost() {}

  @override
  getOpportunitesData() async {
    statusRequest = StatusRequest.loading;
    var response = await homeData.getAllOppData();
    print("================$response  Controller");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 200) {
        print("${dataopportuntiy.length}lllllllmmmmmmmmmmlllll");
        dataopportuntiy.addAll(response['data']);
        dataopportuntiy.isEmpty
            ? statusRequest = StatusRequest.failure
            : statusRequest = StatusRequest.none;
        print("lll ${dataopportuntiy.length}");
        for (int i = 0; i < dataopportuntiy.length; i++) {
          opportuntiesList.add(
            OpportuntiyModel.fromJson(dataopportuntiy[i]),
          );
        }
        update();
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
  }

  void toggleExpanded() {
    isExpanded.value = !isExpanded.value;
    update();
  }

  @override
  getPostsData() async {
    statusRequest = StatusRequest.loading;
    var response = await homeData.getAllPostsData();
    print("================$response  Controller");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 200) {
        print("${dataposts.length}lllllllmmmmmmmmmmlllll");
        dataposts.addAll(response['data']);
        dataposts.isEmpty
            ? statusRequest = StatusRequest.failure
            : statusRequest = StatusRequest.none;
        print("lll ${dataposts.length}");
        for (int i = 0; i < dataposts.length; i++) {
          postsList.add(
            PostModel.fromJson(dataposts[i]),
          );
        }
        update();
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
  }

  void showReport(context) {
    Get.bottomSheet(
      Container(),
      // BottomSheetOpportunity(
      // image: file,
      // title: title.text,
      // body: body.text,
      // location: location.text,
      // jobType: selectedJobType,
      // workPlaceType: selectedWorkPlaceType,
      // jobHours: jophours.text,
      // qualifications: qualifications,
      // skills: skills,
      // salary: salary.text,
      // vacant: isVacant.toString(),
      // onPressedBack: () {
      //   Get.back();
      // },
      // onPressedPublish: () {
      //   addOpportunity();
      // },
      // ),
      isScrollControlled: true,
    );
  }

  @override
  goToPageOpportunityDetails(opportuntiyModel) {
    Get.toNamed(AppRoute.opportunityPage,
        arguments: {"opportuntiyModel": opportuntiyModel});
  }

  @override
  void scrollListener() {
    final direction = scrollController.position.userScrollDirection;

    if (direction == ScrollDirection.reverse && isFabVisible.value) {
      isFabVisible.value = false;
      update();
    } else if (direction == ScrollDirection.forward && !isFabVisible.value) {
      isFabVisible.value = true;
      update();
    }
  }

  @override
  void onInit() {
    super.onInit();
    getOpportunitesData();
    getPostsData();
    idUserPostOwner = myServices.box.read("id");
    scrollController = ScrollController();
    scrollController.addListener(scrollListener);
  }

  @override
  void onClose() {
    scrollController.removeListener(scrollListener);
    scrollController.dispose();
    super.onClose();
  }
}
