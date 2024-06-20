import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobs/controller/apply/get_apply_controller.dart';
import 'package:jobs/core/class/statusrequest.dart';
import 'package:jobs/core/constants/routes.dart';
import 'package:jobs/core/functions/dialiog.dart';
import 'package:jobs/core/functions/handlingdata.dart';
import 'package:jobs/core/services/services.dart';
import 'package:jobs/data/datasource/remote/apply/apply_data.dart';

abstract class ApplyController extends GetxController {
  apply(int id);
  updateApply(int id);
  deleteApply(int id);
  updateStatusApply(int id);
}

class ApplyControllerImp extends ApplyController {
  AppliesData appliesData = AppliesData(Get.find());
  late StatusRequest statusRequest = StatusRequest.none;
  MyServices myServices = Get.find();
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  String selectedApplyStaus = 'waiting';
  final List<String> applystatus = ['waiting', 'accepted', 'rejected'];
  void Function(String?)? setSelectedStatus(type) {
    selectedApplyStaus = type;
    update();
    return null;
  }

  apply(int id) async {
    if (formstate.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      print("111111111111111111  Controller");
      var response = await appliesData.apply(id);
      statusRequest = handlingData(response);

      if (StatusRequest.success == statusRequest) {
        if (response["status"] == 201) {
          //Get.offNamed(AppRoute.createProfile);
          var update1 = Get.lazyPut<GetApplyControllerImp>;
          update();
          getSnakBar("success", "The apply has been sent successfully", 3);
          //Get.offAllNamed(AppRoute.);
        } else {
          getDialog("Warning", "...");
        }
      }
    }
  }

  updateApply(int id) async {
    if (formstate.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      print("111111111111111111  Controller");
      var response = await appliesData.updateApply(id);
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response["status"] == 201) {
          //Get.offNamed(AppRoute.createProfile);
          var update1 = Get.lazyPut<GetApplyControllerImp>;
          update();
          getSnakBar("success", "The apply has been update successfully", 3);
          //Get.offAllNamed(AppRoute.);
        } else {
          getDialog("Warning", "...");
        }
      }
    }
  }

  deleteApply(int id) async {
    if (formstate.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      print("111111111111111111  Controller");
      var response = await appliesData.deleteApply(id);
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response["status"] == 201) {
          //Get.offNamed(AppRoute.createProfile);
          var update1 = Get.lazyPut<GetApplyControllerImp>;
          update();
          getSnakBar("success", "The apply has been update successfully", 3);
          //Get.offAllNamed(AppRoute.);
        } else {
          getDialog("Warning", "...");
        }
      }
    }
  }

  updateStatusApply(int id) async {
    if (formstate.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      print("111111111111111111  Controller");
      var response =
          await appliesData.updateStatusApply(id, selectedApplyStaus);
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response["status"] == 201) {
          //Get.offNamed(AppRoute.createProfile);
          var update1 = Get.lazyPut<GetApplyControllerImp>;
          update();
          getSnakBar("success", "The apply has been update successfully", 3);
          //Get.offAllNamed(AppRoute.);
        } else {
          getDialog("Warning", "...");
        }
      }
    }
  }

  @override
  void onInit() {
    super.onInit();
  }
}
