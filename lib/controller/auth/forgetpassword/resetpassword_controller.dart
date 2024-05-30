import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobs/core/class/statusrequest.dart';
import 'package:jobs/core/constants/routes.dart';
import 'package:jobs/core/functions/handlingdata.dart';
import 'package:jobs/data/datasource/remote/auth/forgetpassword/resetpassword.dart';

abstract class ResetPasswordController extends GetxController {
  goToSuccessResetPassword();
}

class ResetPasswordControllerImp extends ResetPasswordController {

    GlobalKey<FormState> formstate = GlobalKey<FormState>();

  late TextEditingController password;
  late TextEditingController repassword;
  bool isShowPassword = true;
    bool isShowRePassword = true;



  String? verfiyCodePassWordreset;

  StatusRequest statusRequest = StatusRequest.none;

  showPassWord() {
    isShowPassword = isShowPassword == true ? false : true;
    isShowRePassword = isShowRePassword == true ? false : true;

    update();
  }


  showRePassWord() {
    isShowRePassword = isShowRePassword == true ? false : true;


    update();
  }
  ResetPasswordData resetPasswordData = ResetPasswordData(Get.find());
  @override
  goToSuccessResetPassword() async {
    if (password.text != repassword.text) {
      Get.defaultDialog(title: "Warning", middleText: "PassWord Not match");
      statusRequest = StatusRequest.failure;
    } else {
    if (formstate.currentState!.validate()) {

      statusRequest = StatusRequest.loading;
      update();
      print("=111111111111111111  Controller");

      var response = await resetPasswordData.postdata(
          verfiyCodePassWordreset!, password.text, repassword.text);
      print("================$response  Controller");
      statusRequest = handlingData(response);
      print(statusRequest);

      if (StatusRequest.success == statusRequest) {
        if (response['status'] == 200) {

      print("333333333 successssssssss $verfiyCodePassWordreset");
      Get.offNamed(AppRoute.successResetpassword);
        } else  if (response['status'] == 400) {
          Get.defaultDialog(title: "Warning", middleText: "The selected code is invalid.");
        }
        else  if (response['status'] == 422) {
          Get.defaultDialog(title: "Warning", middleText: "code has expired !");
        }
      }
      update();

 }else{

 }
    }
  
  }

  @override
  void onInit() {
    password = TextEditingController();
    repassword = TextEditingController();
    verfiyCodePassWordreset = Get.arguments['verfiyCodePassWordreset'];
    super.onInit();
  }

  @override
  void dispose() {
    password.dispose();
    repassword.dispose();
    super.dispose();
  }
}
