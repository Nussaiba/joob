import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobs/controller/settings/check_password_controller.dart';
import 'package:jobs/core/class/handlingdataview.dart';
import 'package:jobs/core/constants/color.dart';
import 'package:jobs/core/functions/alert_exit.dart';
import 'package:jobs/core/functions/validinput.dart';
import 'package:jobs/view/widget/auth/customtextbodyauth.dart';
import 'package:jobs/view/widget/auth/customtextformauth.dart';
import 'package:jobs/view/widget/auth/customtexttitleauth.dart';
import 'package:jobs/view/widget/general/fade_animation.dart';
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
          "check Password ",
          style: Theme.of(context)
              .textTheme
              .headline1!
              .copyWith(color: AppColor.grey),
        ),
      ),
      body: GetBuilder<CheckPasswordControllerImp>(
        builder: (controller) => HandlingDataRequest(
          statusRequest: controller.statusRequest,
          widget: WillPopScope(
            onWillPop: alertExitApp,
            child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                child: Form(
                  key: controller.formstate,
                  child: ListView(children: [
                    //const LogoAuth(),
                    FadeAnimation(
                        CustomTextTitleAuth(
                          text: "Check Password",
                        ),
                        0.2),
                    const SizedBox(
                      height: 10,
                    ),
                    FadeAnimation(
                        CustomTextBodyAuth(
                            text:
                                "To change your password ,/n please enter your current password"),
                        0.4),
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
                            text: "Check Password",
                            onPressed: () {
                              controller.checkPassword();
                            }),
                        1.0),
                  ]),
                )),
          ),
        ),
      ),
    );
  }
}
