import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:jobs/controller/auth/forgetpassword/verifycode_forgetpassword_controller.dart';
import 'package:jobs/core/class/handlingdataview.dart';
import 'package:jobs/core/constants/color.dart';
import 'package:jobs/core/constants/routes.dart';
import 'package:jobs/view/widget/auth/customtextbodyauth.dart';
import 'package:jobs/view/widget/auth/customtexttitleauth.dart';

class VerfiyCode extends StatelessWidget {
  const VerfiyCode({Key? key});
  @override
  Widget build(BuildContext context) {
    Get.put(VerifyCodeControllerImp());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.praimaryColor,
        elevation: 0.0,
        title: Text(
          "34".tr,
          style: Theme.of(context)
              .textTheme
              .headline1!
              .copyWith(color: AppColor.grey),
        ),
      ),
      body: GetBuilder<VerifyCodeControllerImp>(
          builder: (controller) => HandlingDataRequest(
              statusRequest: controller.statusRequest,
              widget: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                  child: ListView(children: [
                    CustomTextTitleAuth(
                      text: "35".tr,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTextBodyAuth(
                        text: " ${"36".tr} \n ${controller.email} "),
                    const SizedBox(
                      height: 30,
                    ),
                    OtpTextField(
                      borderRadius: BorderRadius.circular(20),
                      cursorColor: AppColor.grey,
                      focusedBorderColor: AppColor.praimaryColor,
                      fieldWidth: 42.0,
                      numberOfFields: 6,
                      borderColor: AppColor.praimaryColor,
                      showFieldAsBox: true,
                      onCodeChanged: (String code) {
                      },
                      onSubmit: (String verificationCode) {
                        print("11111  $verificationCode");
                        Get.offNamed(AppRoute.resetPassword, arguments: {
                          "verfiyCodePassWordreset": verificationCode
                        });

                        //  controller.goToResetPassword(verificationCode);
                      }, 
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    GetBuilder<VerifyCodeControllerImp>(
                      builder: (controller) => InkWell(
                        onTap: controller.remainingTime == 0
                            ? controller.resendCode
                            : null,
                        child: Text(
                          textAlign: TextAlign.end,
                          controller.remainingTime > 0
                              ? ' ${"30".tr} ${controller.timerText}'
                              : "31" ,
                          style: TextStyle(
                              color: controller.remainingTime > 0
                                  ? AppColor.grey
                                  : AppColor.praimaryColor,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ])))),
    );
  }
}
