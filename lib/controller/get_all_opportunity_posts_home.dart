import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:jobs/core/class/statusrequest.dart';
import 'package:jobs/core/constants/routes.dart';
import 'package:jobs/core/functions/handlingdata.dart';
import 'package:jobs/core/services/services.dart';
import 'package:jobs/data/datasource/remote/home/home.dart';
import 'package:jobs/data/datasource/remote/report_data.dart';
import 'package:jobs/data/model/post_model.dart';
import 'package:jobs/data/model/opportunity_model.dart';

abstract class GetPostsAndOpportunityController extends GetxController {
  getOpportunitesData();
  getPostsData();
  goToPageOpportunityDetails(OpportuntiyModel opportuntiyModel);
  scrollListener();
  goToPageAllOpportunities();
  goToPageAllPosts();
  // report();
}
class GetPostsAndOpportunityControllerImp
    extends GetPostsAndOpportunityController {
  late ScrollController scrollController;
  HomeData homeData = HomeData(Get.find());
  ReportData reportData = ReportData(Get.find());
  late StatusRequest statusRequest = StatusRequest.none;
  MyServices myServices = Get.find();
  var isFabVisible = true.obs;

  List dataopportuntiy = [];
  List<OpportuntiyModel> opportuntiesList = [];
  List dataposts = [];
  List<PostModel> postsList = [];
  var isExpanded = false.obs;
  late String idUserPostOwner;
  late String account;

  int reason_id = 0;
  String another_reason = '';
  void editPost() {}
  void deletePost() {}

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

  // void setReasonId(int value) {
  //   reason_id = value;
  //   update();
  // }

  @override
  goToPageOpportunityDetails(opportuntiyModel) {
    Get.toNamed(AppRoute.opportunityPage,
        arguments: {"opportuntiyModel": opportuntiyModel});
  }

  @override
  goToPageAllOpportunities() {
    Get.toNamed(AppRoute.allOpportunityPage);
  }

  @override
  goToPageAllPosts() {
    Get.toNamed(AppRoute.allPostPage);
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

  
  selecedAnOption(value) {
    switch (value) {
      case 'edit':
        editPost();
        break;
      case 'delete':
        deletePost();
        break;
      case 'report':
        // reportPost();
        break;
    }
  }

  
  @override
  void onInit() {
    super.onInit();
    getOpportunitesData();
    getPostsData();
    account = myServices.box.read("account");
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
