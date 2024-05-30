import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobs/core/class/statusrequest.dart';
import 'package:jobs/core/constants/routes.dart';
import 'package:jobs/core/functions/dialiog.dart';
import 'package:jobs/core/functions/handlingdata.dart';
import 'package:jobs/core/services/services.dart';
import 'package:jobs/data/datasource/remote/auth/signupdata.dart';

abstract class SinUpController extends GetxController {
  SignUp();
  goToSignIn();
  showPassWord();
}

class SignUpControllerImp extends SinUpController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  late TextEditingController username;
  late TextEditingController email;
  late TextEditingController password;
  bool isShowPassword = true;

  StatusRequest statusRequest = StatusRequest.none;
  SignUpData signUpData = SignUpData(Get.find());
  MyServices myServices = Get.find();

  String? selectedAccountType;

  @override
  goToSignIn() {
    Get.offNamed(AppRoute.login);
  }

  @override
  showPassWord() {
    isShowPassword = isShowPassword == true ? false : true;

    update();
  }

  @override
  SignUp() async {
    if (formstate.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      print("=111111111111111111  Controller");

      var response = await signUpData.postdata(
          username.text, password.text, email.text, selectedAccountType!);
      print("================$response  Controller");
      statusRequest = handlingData(response);
      print(statusRequest);
      print(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == 200) {
          Get.offNamed(AppRoute.verifyCodeRegister,
              arguments: {"email": email.text});

          getSnakBar(
              "success", "Verification Code sent to\n ${email.text} ", 3);
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
    selectedAccountType = myServices.box.read("account");

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
