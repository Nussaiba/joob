import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobs/core/class/statusrequest.dart';
import 'package:jobs/core/functions/handlingdata.dart';
import 'package:jobs/data/datasource/remote/settings/change_password.dart';

abstract class ChangePasswordController extends GetxController {
  showPassWord();
  changePassword();
}

class ChangePasswordControllerImp extends ChangePasswordController {
  changePasswordData changepasswordData = changePasswordData(Get.find());
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  late StatusRequest statusRequest;
  late TextEditingController password;
  late TextEditingController password_confirmation;

  bool isShowPassword = true;
  @override
  showPassWord() {
    isShowPassword = isShowPassword == true ? false : true;

    update();
  }

  changePassword() async {
    if (formstate.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      var response = await changepasswordData.postData(
          password.text, password_confirmation.text);
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
    // account = myServices.box.read("account");
    password = TextEditingController();
    password_confirmation = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    password.dispose();
    password_confirmation.dispose();
    super.dispose();
  }
}
