import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobs/controller/settings/change_password_controller.dart';
import 'package:jobs/core/class/handlingdataview.dart';
import 'package:jobs/core/constants/color.dart';
import 'package:jobs/core/functions/alert_exit.dart';
import 'package:jobs/core/functions/validinput.dart';
import 'package:jobs/view/widget/auth/customtextbodyauth.dart';
import 'package:jobs/view/widget/auth/customtextformauth.dart';
import 'package:jobs/view/widget/auth/customtexttitleauth.dart';
import 'package:jobs/view/widget/auth/logoauth.dart';
import 'package:jobs/view/widget/auth/textsignup.dart';
import 'package:jobs/view/widget/general/fade_animation.dart';
import '../../widget/auth/custombuttomauth.dart';

class ChangePassword extends StatelessWidget {
  const ChangePassword({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(ChangePasswordControllerImp());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.praimaryColor,
        elevation: 0.0,
        title: Text(
          "change Password ",
          style: Theme.of(context)
              .textTheme
              .headline1!
              .copyWith(color: AppColor.grey),
        ),
      ),
      body: GetBuilder<ChangePasswordControllerImp>(
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
                          text: "Change Password",
                        ),
                        0.2),
                    const SizedBox(
                      height: 10,
                    ),
                    FadeAnimation(CustomTextBodyAuth(
                      
                text: "you can change your password ,/n please fill these fields"), 0.4),
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
                        0.8),
                    const SizedBox(
                      height: 10,
                    ),
                      FadeAnimation(
                        CustomTextFormAuth(
                          valid: (value) {
                            return isPasswordCompliant(value!);
                          },
                          mycontroller: controller.password_confirmation,
                          hinttext: "re enter password",
                          labeltext: "password_confirmation",
                          iconData: controller.isShowPassword
                              ? Icons.visibility
                              : Icons.visibility_off,
                          obscureText: controller.isShowPassword,
                          onTapIcon: () {
                            controller.showPassWord();
                          },
                        ),
                        1.2),
                    FadeAnimation(
                        CustomButtomAuth(
                            text: "Change Password",
                            onPressed: () {
                              controller.changePassword();
                            }),
                        1.5),
                    const SizedBox(
                      height: 5,
                    ),
                    
                   
                  ]),
                )),
          ),
        ),
      ),
    );
  }
}
