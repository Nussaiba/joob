import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobs/controller/settings/check_password_controller.dart';
import 'package:jobs/core/class/handlingdataview.dart';
import 'package:jobs/core/constants/color.dart';
import 'package:jobs/core/constants/imageassest.dart';
import 'package:jobs/core/functions/validinput.dart';
import 'package:jobs/view/widget/general/custom_text_body.dart';
import 'package:jobs/view/widget/auth/customtextformauth.dart';
import 'package:jobs/view/widget/general/custom_text_title.dart';
import 'package:jobs/view/widget/general/fade_animation.dart';
import 'package:lottie/lottie.dart';
import '../../widget/auth/custombuttomauth.dart';

class CheckPassword extends StatelessWidget {
  const CheckPassword({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(CheckPasswordControllerImp());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.praimaryColor,
        elevation: 0.0,
        title: Text(
          "165".tr,
          style: Theme.of(context)
              .textTheme
              .headline1!
              .copyWith(color: AppColor.grey),
        ),
      ),
      body: GetBuilder<CheckPasswordControllerImp>(
        builder: (controller) => HandlingDataRequest(
          statusRequest: controller.statusRequest,
          widget: Container(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              child: Form(
                key: controller.formstate,
                child: ListView(children: [
                  FadeAnimation(
                      CustomTextTitle(
                        text: "165".tr,
                      ),
                      0.2),
                  const SizedBox(
                    height: 10,
                  ),
                  Lottie.asset(AppImageAsset.passowrd,
                      width: 280, height: 260, repeat: false
                      //  fit : BoxFit.cover
                      ),
                  FadeAnimation(CustomTextBody(text: "166".tr), 0.4),
                  const SizedBox(
                    height: 15,
                  ),
                  FadeAnimation(
                      CustomTextFormAuth(
                        valid: (value) {
                          return isPasswordCompliant(value!);
                        },
                        mycontroller: controller.password,
                        hinttext: "14".tr,
                        labeltext: "15".tr,
                        iconData: controller.isShowPassword
                            ? Icons.visibility
                            : Icons.visibility_off,
                        obscureText: controller.isShowPassword,
                        onTapIcon: () {
                          controller.showPassWord();
                        },
                      ),
                      0.7),
                  const SizedBox(
                    height: 10,
                  ),
                  FadeAnimation(
                      CustomButtomAuth(
                          color: AppColor.praimaryColor,
                          text: "165".tr,
                          onPressed: () {
                            controller.checkPassword();
                          }),
                      1.0),
                ]),
              )),
        ),
      ),
    );
  }
}
