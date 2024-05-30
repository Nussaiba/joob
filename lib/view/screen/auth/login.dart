import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobs/controller/auth/login_controller.dart';
import 'package:jobs/core/class/handlingdataview.dart';
import 'package:jobs/core/constants/color.dart';
import 'package:jobs/core/constants/routes.dart';
import 'package:jobs/core/functions/alert_exit.dart';
import 'package:jobs/core/functions/validinput.dart';
import 'package:jobs/view/fade_animation.dart';
import 'package:jobs/view/widget/auth/customtextbodyauth.dart';
import 'package:jobs/view/widget/auth/customtextformauth.dart';
import 'package:jobs/view/widget/auth/customtexttitleauth.dart';
import 'package:jobs/view/widget/auth/logoauth.dart';
import 'package:jobs/view/widget/auth/textsignup.dart';

import '../../widget/auth/custombuttomauth.dart';

class Login extends StatelessWidget {
  const Login({Key? key});
  @override
  Widget build(BuildContext context) {
    Get.put(LoginControllerImp());
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColor.praimaryColor,
          elevation: 0.0,
          title: Text(
            "9".tr,
            style: Theme.of(context)
                .textTheme
                .headline1!
                .copyWith(color: AppColor.grey),
          ),
        ),
        body: GetBuilder<LoginControllerImp>(
            builder: (controller) => HandlingDataRequest(
                statusRequest: controller.statusRequest,
                widget: WillPopScope(
                  onWillPop: alertExitApp,
                  child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 30),
                      child: Form(
                        key: controller.formstate,
                        child: ListView(children: [
                          const LogoAuth(),
                          CustomTextTitleAuth(
                            text: "10".tr,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          FadeAnimation(CustomTextBodyAuth(text: "11".tr), 0.5),
                          const SizedBox(
                            height: 15,
                          ),
                          FadeAnimation(
                              CustomTextFormAuth(
                                valid: (val) {
                                  return validInput(val!, 5, 50, "email");
                                },
                                mycontroller: controller.email,
                                hinttext: "12".tr,
                                labeltext: "13".tr,
                                iconData: Icons.email_outlined,
                              ),
                              1),
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
                              1.5),
                          FadeAnimation(
                              InkWell(
                                onTap: () {
                                  controller.goToForgetPassword();
                                },
                                child: Text(
                                  "16".tr,
                                  textAlign: TextAlign.end,
                                ),
                              ),
                              2),
                          FadeAnimation(
                              CustomButtomAuth(
                                  text: "9".tr,
                                  onPressed: () {
                                    //  Get.offNamed(AppRoute.log);
                                    controller.login();
                                  }),
                              2.5),
                          const SizedBox(
                            height: 30,
                          ),
                          FadeAnimation(
                              CustomTextSignUpOrSignIn(
                                  textone: "17".tr,
                                  texttwo: "18".tr,
                                  onTap: () {
                                    controller.goToSignUp();
                                  }),
                              3),
                        ]),
                      )),
                ))));
  }
}
