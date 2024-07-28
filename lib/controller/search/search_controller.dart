import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobs/core/class/statusrequest.dart';
import 'package:jobs/core/functions/handlingdata.dart';
import 'package:jobs/data/datasource/remote/search/search_data.dart';

abstract class SearchController extends GetxController {
  searchUser(String username);
}

class SearchControllerImp extends SearchController {
  //List<Map<String, dynamic>> searchResults = [];
  List data = [];
  late TextEditingController searchControllerText;

  StatusRequest statusRequest = StatusRequest.none;
  SearchUserData searchUserData = SearchUserData(Get.find());

  @override
  searchUser(String username) async {
    data.clear();

    statusRequest = StatusRequest.loading;
    update();

    var response = await searchUserData.searchUser(username);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == 200) {
        print(response);
        data.clear();
        data.addAll(response['data']);

        data.isEmpty
            ? statusRequest = StatusRequest.failure
            : statusRequest = StatusRequest.none;
      } else {
        statusRequest = StatusRequest.failure;
        Get.snackbar("Error", response["message"]);
      }
    }
    update();
  }

  @override
  void onInit() {
    // searchUserData = Get.put(SearchUserData());
    searchControllerText = TextEditingController();
    //  followData = Get.find<FollowData>();
    super.onInit();
  }

  @override
  void dispose() {
    searchControllerText.dispose();
    super.dispose();
  }
}
