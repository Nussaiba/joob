import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobs/controller/auth/google_sign_in_controller.dart';
import 'package:jobs/controller/auth/signup_controller.dart';
import 'package:jobs/controller/testlog.dart';
import 'package:jobs/core/class/handlingdataview.dart';
import 'package:jobs/core/constants/color.dart';
import 'package:jobs/core/functions/alert_exit.dart';
import 'package:jobs/core/functions/validinput.dart';
import 'package:jobs/view/widget/auth/customtextbodyauth.dart';
import 'package:jobs/view/widget/auth/customtextformauth.dart';
import 'package:jobs/view/widget/auth/customtexttitleauth.dart';
import 'package:jobs/view/widget/auth/textsignup.dart';
import 'package:jobs/view/widget/auth/togalbutton.dart';
import '../../widget/auth/custombuttomauth.dart';

class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(SignUpControllerImp());
    Get.put(AuthWithGoogle());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.praimaryColor,
        elevation: 0.0,
        title: Text(
          "18".tr,
          style: Theme.of(context)
              .textTheme
              .headline1!
              .copyWith(color: AppColor.grey),
        ),
      ),
      body: GetBuilder<SignUpControllerImp>(
        builder: (controller) => HandlingDataRequest(
          statusRequest: controller.statusRequest,
          widget: WillPopScope(
            onWillPop: alertExitApp,
            child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                child: Form(
                  key: controller.formstate,
                  child: ListView(children: [
                    CustomTextTitleAuth(
                      text: "10".tr,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTextBodyAuth(text: "19".tr),
                    const SizedBox(
                      height: 15,
                    ),
                    CustomTextFormAuth(
                      valid: (val) {
                        return validInput(val!, 5, 20, "username");
                      },
                      mycontroller: controller.username,
                      hinttext: "20".tr,
                      labeltext: "21".tr,
                      iconData: Icons.person_outline,
                    ),
                    CustomTextFormAuth(
                      valid: (val) {
                        return validInput(val!, 5, 50, "email");
                      },
                      mycontroller: controller.email,
                      hinttext: "12".tr,
                      labeltext: "13".tr,
                      iconData: Icons.email_outlined,
                    ),
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
                  
                    // AnimatedContainer(
                    //   duration: Duration(milliseconds: 300),
                    //  // height: 45,
                    //   decoration: BoxDecoration(
                    //     color: AppColor.white,
                    //     borderRadius: BorderRadius.circular(30),
                    //   ),
                      // child: Row(
                      //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      //   children: [
                          // ToggleButton(
                          //   title: 'Seeker',
                          //   isActive:
                          //     //  controller.accountType.value == 'jobSeeker',
                          //   onTap: () {
                          //    // controller.setAccountType('jobSeeker');
                          //   },
                          // ),
                          // ToggleButton(
                          //   title: 'Company',
                          // //  isActive: controller.accountType.value == 'company',
                          //   onTap: () {
                          //   //  controller.setAccountType('company');
                          //  },
                    //       ),
                    //     ],
                    //   ),
                    // ),

                     const SizedBox(
                      height: 30,
                    ),
                    CustomButtomAuth(
                        text: "18".tr,
                        onPressed: () {
                          controller.changeAccountType();
                        }),
                          const SizedBox(
                      height: 10,
                    ),
                    GetBuilder<AuthWithGoogle>(
                      builder: (controller) => CustomButtomAuth(
                          text: "Google",
                          onPressed: () async {
                            print("llllllll");
                            await controller
                                .loginWithGoogle()
                                .whenComplete(() => debugPrint('DONE'));
                          }),
                    ),
                      const SizedBox(
                      height: 5,
                    ),
                    CustomTextSignUpOrSignIn(
                      textone: "22".tr,
                      texttwo: "9".tr,
                      onTap: () {
                        controller.goToSignIn();
                      },
                    ),
                  ]),
                )),
          ),
        ),
      ),
    );
  }
}
