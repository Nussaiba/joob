import 'dart:async';

import 'package:get/get.dart';
import 'package:jobs/core/class/statusrequest.dart';
import 'package:jobs/core/constants/routes.dart';
import 'package:jobs/data/datasource/remote/forgetpassword/verifycode.dart';
import 'package:jobs/core/functions/handlingdata.dart';
import 'package:jobs/core/functions/handlingdata.dart';

abstract class VerifyCodeController extends GetxController {
  goToResetPassword(verfiyCodePassWordreset);
  resendCode();
}

class VerifyCodeControllerImp extends VerifyCodeController {
  VerifyCodeForgetPasswordData verifyCodeForgetPasswordData =
      VerifyCodeForgetPasswordData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;
  @override
  goToResetPassword(verfiyCodePassWordreset) async {
    statusRequest = StatusRequest.loading;
    update();
    print("=111111111111111111  Controller");

    var response =
        await verifyCodeForgetPasswordData.postdata(verfiyCodePassWordreset);
    print("================$response  Controller");
    statusRequest = handlingData(response);
    print(statusRequest);

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 200) {
        print("2222222222 $verfiyCodePassWordreset");
        Get.offNamed(AppRoute.resetPassword,
            arguments: {"verfiyCodePassWordreset": verfiyCodePassWordreset});
      } else if (response['status'] == 400) {
        Get.defaultDialog(
            title: "Warning", middleText: "The selected code is invalid.");
      }
    }
    update();
  }
 Timer? timer;
  int remainingTime =  5; // 10 دقائق بالثواني
  String get timerText =>
      '${(remainingTime ~/ 60).toString().padLeft(2, '0')}:${(remainingTime % 60).toString().padLeft(2, '0')}';

  @override
  void onInit() {
    super.onInit();
    startTimer();
  }

  void startTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (_) {
      if (remainingTime > 0) {
        remainingTime--;
        update();
      } else {
        timer?.cancel();
      }
    });
  }

  void resendCode() {
    if (remainingTime == 0) {
      remainingTime = 10 ;
      startTimer();
      // إضافة منطق إعادة إرسال الكود هنا
    }
  }

  @override
  void onClose() {
    timer?.cancel();
    super.onClose();
  }
}