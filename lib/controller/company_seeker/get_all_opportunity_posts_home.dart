import 'dart:io';
import 'package:open_file/open_file.dart';
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
  goToPageOpportunityDetails(OpportunityModel opportuntiyModel);
  scrollListener();
  goToPageAllOpportunities();
  goToPageAllPosts();
  
}

class GetPostsAndOpportunityControllerImp
    extends GetPostsAndOpportunityController {
  late ScrollController scrollController;
  HomeData homeData = HomeData(Get.find());

  late StatusRequest statusRequestPosts = StatusRequest.none;
    late StatusRequest statusRequestOpportunity = StatusRequest.none;

  MyServices myServices = Get.find();
  var isFabVisible = true.obs;

  List dataopportuntiy = [];
  List<OpportunityModel> opportuntiesList = [];
  List dataposts = [];
  List<PostModel> postsList = [];
  var isExpanded = false.obs;
  late String idUserPostOwner;
  late String account;

  int reason_id = 0;
  String another_reason = '';
  void editPost() {}
  void deletePost() {}
  //late String lang;
  @override
  getOpportunitesData() async {
    dataopportuntiy.clear();
    opportuntiesList.clear();
    statusRequestOpportunity = StatusRequest.loading;
    var response = await homeData.getAllOppData();
    print("================$response  Controller");
    statusRequestOpportunity = handlingData(response);
    if (StatusRequest.success == statusRequestOpportunity) {
      if (response['status'] == 200) {
        print("${dataopportuntiy.length}lllllllmmmmmmmmmmlllll");
        dataopportuntiy.addAll(response['data']);
        dataopportuntiy.isEmpty
            ? statusRequestOpportunity = StatusRequest.failure
            : statusRequestOpportunity = StatusRequest.none;
        print("lll ${dataopportuntiy.length}");
        for (int i = 0; i < dataopportuntiy.length; i++) {
          opportuntiesList.add(
            OpportunityModel.fromJson(dataopportuntiy[i]),
          );
        }
        update();
      } else {
       // statusRequest = StatusRequest.failure;
      }
    }
  }

  void toggleExpanded() {
    isExpanded.value = !isExpanded.value;
    update();
  }

  @override
  getPostsData() async {
    dataposts.clear();
    postsList.clear();
    statusRequestPosts = StatusRequest.loading;
    var response = await homeData.getAllPostsData();
    print("================$response  Controller");
    statusRequestPosts = handlingData(response);
    if (StatusRequest.success == statusRequestPosts) {
      if (response['status'] == 200) {
        print("${dataposts.length}lllllllmmmmmmmmmmlllll");
        dataposts.addAll(response['data']);
        dataposts.isEmpty
            ? statusRequestPosts = StatusRequest.failure
            : statusRequestPosts = StatusRequest.none;
        print("lll ${dataposts.length}");
        for (int i = 0; i < dataposts.length; i++) {
          postsList.add(
            PostModel.fromJson(dataposts[i]),
          );
        }
        update();
      } else {
       // statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

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

 
  goToPageAddOpportunity() {
    Get.toNamed(AppRoute.addOpportunity);
  }

  goToPageAddPosts() {
    Get.toNamed(AppRoute.postpage);
  }




  Future download(String url, String fileName) async {
    //isLoading[pdfurl] = true;
    update();
    File file = await homeData.getFile(url, fileName);
    await Future.delayed(Duration(seconds: 2));
    //isLoading[pdfurl] = false;
    update();
     
    await OpenFile.open(file.path);
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
    account = myServices.box.read("account");
    idUserPostOwner = myServices.box.read("id");
    print(
        "$idUserPostOwner idUserPostOwnerlllllllllllllllllllllllllllllllllllllllllll");
    scrollController = ScrollController();
    scrollController.addListener(scrollListener);
  }

  @override
  void onClose() {
    // scrollController.removeListener(scrollListener);
    //  scrollController.dispose();
    super.onClose();
  }
}
