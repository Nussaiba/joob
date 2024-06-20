import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobs/core/class/statusrequest.dart';
import 'package:jobs/core/functions/handlingdata.dart';
import 'package:jobs/data/datasource/remote/settings/check_password.dart';

abstract class CheckPasswordController extends GetxController {
  showPassWord();
  checkPassword();
}

class CheckPasswordControllerImp extends CheckPasswordController {
  checkPasswordData checkpasswordData = checkPasswordData(Get.find());
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  late StatusRequest statusRequest;
  late TextEditingController password;

  bool isShowPassword = true;
  @override
  showPassWord() {
    isShowPassword = isShowPassword == true ? false : true;

    update();
  }

  @override
  checkPassword() async {
    if (formstate.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      var response = await checkpasswordData.postData(password.text);
      print("================$response  Controller");
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == 200) {
          print("yessssssssssssssssssssssssss200sss");
        } else {
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    }
  }

  @override
  void onInit() {
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    password.dispose();
    super.dispose();
  }
}
