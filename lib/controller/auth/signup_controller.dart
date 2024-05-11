import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobs/core/class/statusrequest.dart';
import 'package:jobs/core/constants/routes.dart';
import 'package:jobs/core/functions/handlingdata.dart';
import 'package:jobs/data/datasource/remote/auth/signupdata.dart';

abstract class SinUpController extends GetxController {
  SignUp();
  goToSignIn();
}

class SignUpControllerImp extends SinUpController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  late TextEditingController username;
  late TextEditingController email;
  late TextEditingController password;
  bool isShowPassword = true;

  StatusRequest statusRequest = StatusRequest.none;

  SignUpData signUpData = SignUpData(Get.find());

  showPassWord() {
    isShowPassword = isShowPassword == true ? false : true;

    update();
  }

  var accountType = 'jobSeeker'.obs;

  void setAccountType(String type) {
    accountType.value = type;
    update();
  }

  @override
  goToSignIn() {
    Get.offNamed(AppRoute.login);
  }

  @override
  SignUp() async {
    if (formstate.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      print("=111111111111111111  Controller");

      var response =
          await signUpData.postdata(username.text, password.text, email.text);
      print("================$response  Controller");
      statusRequest = handlingData(response);
      print(statusRequest);
      print(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == 200) {
          Get.offNamed(AppRoute.verifyCodeRegister,
              arguments: {"email": email.text});
        } else if (response['status'] == 422) {
          Get.defaultDialog(
              title: "Warning",
              middleText: "Email or UserName Already Exists .");
          statusRequest = StatusRequest.failure;
        } else if (response['status'] == 400) {
          Get.defaultDialog(
              title: "Warning",
              middleText: "The email field must be a valid email address.");
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    } else {}
  }

  @override
  void onInit() {
    username = TextEditingController();
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    username.dispose();
    email.dispose();
    password.dispose();
    super.dispose();
  }
}
