import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobs/controller/forgetpassword/resetpassword_controller.dart';
import 'package:jobs/core/class/handlingdataview.dart';
import 'package:jobs/core/constants/color.dart';
import 'package:jobs/core/functions/validinput.dart';
import 'package:jobs/view/widget/auth/custombuttomauth.dart';
import 'package:jobs/view/widget/auth/customtextbodyauth.dart';
import 'package:jobs/view/widget/auth/customtextformauth.dart';
import 'package:jobs/view/widget/auth/customtexttitleauth.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});
  @override
  Widget build(BuildContext context) {
        Get.put(ResetPasswordControllerImp());
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColor.praimaryColor,
          title: Text(
            'ResetPassword',
            style: Theme.of(context)
                .textTheme
                .headline1!
                .copyWith(color: AppColor.grey),
          ),
        ),
        body:
        
        GetBuilder<  ResetPasswordControllerImp  >(builder: (controller)=>
        HandlingDataRequest(statusRequest: controller.statusRequest, widget:Container(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
            child: Form(
              key: controller.formstate,
              child: ListView(children: [
                const CustomTextTitleAuth(
                  text: "New Password",
                ),
                const SizedBox(
                  height: 10,
                ),
                const CustomTextBodyAuth(text: "Please Enter new Password"),
                const SizedBox(
                  height: 15,
                ),
                CustomTextFormAuth(
                 valid: (value) {
                              return isPasswordCompliant(value!);
                            },
                  mycontroller: controller.password,
                  hinttext: "Enter Your Password",
                  labeltext: "Password",
                  iconData: controller.isShowPassword
                                ? Icons.visibility
                                : Icons.visibility_off,
                            obscureText: controller.isShowPassword,
                            onTapIcon: () {
                              controller.showPassWord();
                            },
                ),
                CustomTextFormAuth(
                  valid: (val) {
                    return validInput(val!, 8, 20, "password");
                  },
                  mycontroller: controller.repassword,
                  hinttext: "Re Enter Your Password",
                  labeltext: "Password",
                  iconData: controller.isShowRePassword
                                ? Icons.visibility
                                : Icons.visibility_off,
                            obscureText: controller.isShowRePassword,
                            onTapIcon: () {
                              controller.showRePassWord();
                            },
                ),
                CustomButtomAuth(
                    text: "save",
                    onPressed: () {
                    //  Get.toNamed(AppRoute.successResetpassword);
                      controller.goToSuccessResetPassword();
                    }),
                const SizedBox(
                  height: 30,
                ),
              ]),
            ))
            )));
  }
}
