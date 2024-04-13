import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobs/core/class/statusrequest.dart';
import 'package:jobs/core/constants/routes.dart';
import 'package:jobs/core/functions/handlingdata.dart';
import 'package:jobs/data/datasource/remote/auth/login.dart';
import 'package:jobs/core/services/services.dart';

abstract class LoginController extends GetxController {
  login();
  goToSignUp();
  goToForgetPassword();
}

class LoginControllerImp extends LoginController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  late TextEditingController email;
  late TextEditingController password;
  bool isShowPassword = true;
  StatusRequest statusRequest = StatusRequest.none;
  LoginData loginData = LoginData(Get.find());
  MyServices myServices = Get.find();

  showPassWord() {
    isShowPassword = isShowPassword == true ? false : true;

    update();
  }

  @override
  login() async {
    if (formstate.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      print("=111111111111111111  Controller");
      var response = await loginData.postdata(email.text, password.text);
      print("================$response  Controller");
      statusRequest = handlingData(response);
      print(statusRequest);

      if (StatusRequest.success == statusRequest) {
        if (response["status"] == 200) {
          myServices.box.write("token", "${response["data"]["token"]}");
          print("token ${response["data"]["token"]}");
          Get.offNamed(AppRoute.log);
        } else if (response['status'] == 401) {
          Get.defaultDialog(
              title: "Warning",
              middleText: "Email & password does not match with our record.");
        }
      }
      update();
    } else {}
  }

  @override
  goToForgetPassword() {
    Get.toNamed(AppRoute.forgetPassword);
  }

  @override
  goToSignUp() {
    Get.offNamed(AppRoute.signUp);
  }

  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }
}
