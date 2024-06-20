import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobs/core/class/statusrequest.dart';
import 'package:jobs/core/functions/handlingdata.dart';
import 'package:jobs/core/services/services.dart';
import 'package:jobs/data/datasource/remote/report_data.dart';
import 'package:jobs/view/screen/company&seeker/report_page.dart';

class ReportController extends GetxController {

    ReportData reportData = ReportData(Get.find());
  late StatusRequest statusRequest = StatusRequest.none;
  MyServices myServices = Get.find();
  
  int reason_id = 0;
  String another_reason = '';
  var currentPage = 0.obs;
  void resetPage() {
    currentPage.value = 0;
  }

  void changePage(int index) {
    currentPage.value = index;
  }

  showReportSheet() {
    Get.bottomSheet(
      ReportSheet(),
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
      ),
      backgroundColor: Colors.white,
    );
  }
void setReasonId(int value) {
    reason_id = value;
    update();
  }

 
  reportPost() async {
    // if (formstate.currentState!.validate()) {
    statusRequest = StatusRequest.loading;
    var response = await reportData.postData(reason_id, another_reason);
    print("================$response  Controller");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 201) {
        print("yessssssssssssssssssssssssss200sss");
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
    //  }
  }
}
